-- =====================================================================
-- Session 503c migration — summaries sweep — thread 229 `effort-over-accomplishment`: title + summary rewritten (slug kept); 3 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- merged read-back S506 for `effort-over-accomplishment` from apocrypha__2-esdras (2), apocrypha__baruch-with-the-letter-of-jeremiah (1), apocrypha__ecclesiasticus (1), apocrypha__the-prayer-of-manasseh (2), apocrypha__the-wisdom-of-solomon (2), canon__1-john (1), canon__1-kings (2), canon__1-peter (0), canon__1-samuel (1), canon__1-thessalonians (0), canon__2-timothy (0), canon__acts (4), canon__daniel (4), canon__deuteronomy (0), canon__ecclesiastes (1), canon__exodus (2), canon__ezekiel (12), canon__galatians (1), canon__genesis (0), canon__hosea (1), canon__isaiah (9), canon__james (2), canon__jeremiah (1), canon__job (0), canon__john (4), canon__joshua (0), canon__leviticus (0), canon__luke (2), canon__mark (11), canon__matthew (1), canon__micah (1), canon__numbers (0), canon__proverbs (5), canon__psalms (4), canon__revelation (0), canon__romans (0), canon__zechariah (0), enoch__1-enoch (0), pseudepigrapha__2-baruch (0), pseudepigrapha__testaments-xii (0). Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session507_effort-over-accomplishment.sql
-- =====================================================================
\echo 'session503c — effort-over-accomplishment starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
INSERT INTO s503c_cards VALUES
(2519,'apocrypha','baruch-with-the-letter-of-jeremiah',1,15,$n$And you shall say, To Yahuah (God), our Elohim (God) belongeth righteousness, but to us the confusion of faces, as it is come to pass this day, to them of Juda, and to the inhabitants of Jerusalem,$n$,'canon','daniel',9,7,$n$Daniel 9:7 — *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day; to the men of Yahudah (Judah), and to the inhabitants of Jerusalem, and unto all Yashar'el (Israel), that are near, and that are far off, through all the countries whither thou hast driven them, because of their trespass that they have trespassed against thee.* *And you shall say, To Yahuah (God), our Elohim (God) belongeth righteousness, but to us the confusion of faces, as it is come to pass this day, to them of Juda, and to the inhabitants of Jerusalem,* (baruch-with-the-letter-of-jeremiah 1:15) Both prayers put righteousness on one side and shame on the other. Daniel spreads it over *all Yashar'el (Israel)*, near and far, scattered through the countries where they were driven. The shame is owned and not argued away. That is the head going lower, not the ears stopping.$n$,$n$Daniel 9:7 — *O Yahuah (Lord), righteousness belongeth unto thee, but unto us confusion of faces, as at this day; to the men of Yahudah (Judah), and to the inhabitants of Jerusalem, and unto all Yashar'el (Israel), that are near, and that are far off, through all the countries whither thou hast driven them, because of their trespass that they have trespassed against thee.* *And you shall say, To Yahuah (God), our Elohim (God) belongeth righteousness, but to us the confusion of faces, as it is come to pass this day, to them of Juda, and to the inhabitants of Jerusalem,* (Baruch 1:15) Both prayers put righteousness on one side and shame on the other. Daniel spreads it over *all Yashar'el (Israel)*, near and far, scattered through the countries where they were driven. The shame is owned and not argued away. That is the head going lower, not the ears stopping.$n$,229,$n$Daniel 9:7 — *righteousness belongeth unto thee, but unto us confusion of faces, as at this day.* Righteousness is his and the confusion of faces is ours, the loathing of the new heart said aloud.$n$,$n$Daniel 9:7 — *righteousness belongeth unto thee, but unto us confusion of faces, as at this day.* Righteousness is his and the confusion of faces is ours, the loathing of the new heart said aloud.$n$),
(2521,'apocrypha','the-prayer-of-manasseh',1,11,$n$Now therefore I bow the knee of my heart, beseeching you of grace.$n$,'canon','ezekiel',36,31,$n$Ezekiel 36:31 — *Then shall ye remember your own evil ways, and your doings that were not good, and shall lothe yourselves in your own sight for your iniquities and for your abominations.* *Now therefore I bow the knee of my heart, beseeching you of grace.* (the-prayer-of-manasseh 1:11) A knee that bows in the heart and begs for grace is the new heart Ezekiel names. It remembers *your own evil ways* and does not argue. The prayer asks, and the promise says what the heart will do once it is given. Mercy and loathing arrive together.$n$,$n$Ezekiel 36:31 — *Then shall ye remember your own evil ways, and your doings that were not good, and shall lothe yourselves in your own sight for your iniquities and for your abominations.* *Now therefore I bow the knee of my heart, beseeching you of grace.* (Prayer of Manasseh 1:11) A knee that bows in the heart and begs for grace is the new heart Ezekiel names. It remembers *your own evil ways* and does not argue. The prayer asks, and the promise says what the heart will do once it is given. Mercy and loathing arrive together.$n$,229,$n$Ezekiel 36:31 — *shall lothe yourselves in your own sight for your iniquities and for your abominations.* The new heart's first act is to remember its own ways and loathe itself, which is the bowed knee in a promise.$n$,$n$Ezekiel 36:31 — *shall lothe yourselves in your own sight for your iniquities and for your abominations.* The new heart's first act is to remember its own ways and loathe itself, which is the bowed knee in a promise.$n$),
(2520,'apocrypha','the-prayer-of-manasseh',1,12,$n$I have sinned, O Yahuah (God), I have sinned, and I acknowledge my iniquities:$n$,'canon','daniel',9,5,$n$Daniel 9:5 — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments:* *I have sinned, O Yahuah (God), I have sinned, and I acknowledge my iniquities:* (the-prayer-of-manasseh 1:12) Both prayers confess in the first person and hold nothing back. Daniel's cry, *We have sinned*, is a whole people on its knees, and the other prayer says *I have sinned* for one man. Neither pleads that it did enough. That is the loathing of the new heart, in words.$n$,$n$Daniel 9:5 — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments:* *I have sinned, O Yahuah (God), I have sinned, and I acknowledge my iniquities:* (Prayer of Manasseh 1:12) Both prayers confess in the first person and hold nothing back. Daniel's cry, *We have sinned*, is a whole people on its knees, and the other prayer says *I have sinned* for one man. Neither pleads that it did enough. That is the loathing of the new heart, in words.$n$,229,$n$Daniel 9:5 — *even by departing from thy precepts and from thy judgments.* The confession names the departure from precepts and judgments and pleads no accomplishment, only the turning back.$n$,$n$Daniel 9:5 — *even by departing from thy precepts and from thy judgments.* The confession names the departure from precepts and judgments and pleads no accomplishment, only the turning back.$n$);
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (229, 'effort-over-accomplishment', $n$Effort over accomplishment — the just man falls seven times and rises, and the one who gives the new heart says both halves (Proverbs 24; Ezekiel 36; Ephesians 2; Isaiah 46)$n$, $n$Effort over accomplishment — the just man falls seven times and rises, and the one who gives the new heart says both halves (Proverbs 24; Ezekiel 36; Ephesians 2; Isaiah 46)$n$, $n$It ain't new. The one who says *I do not this for your sakes* is the same one who says *depart from me, ye that work iniquity*, and the one who promises a new heart is the same one who says that heart will loathe itself for what it did. Both are in the same book, often in the same chapter, and they were never two voices. Proverbs puts the whole of it in one line:

*For a just man falleth seven times, and riseth up again: but the wicked shall fall into mischief.* (Proverbs 24:16)

The just man is not the man who never fell. Nobody is that man:

*For there is not a just man upon earth, that doeth good, and sinneth not.* (Ecclesiastes 7:20)

*If they sin against thee, (for there is no man that sinneth not,) and thou be angry with them, and deliver them to the enemy, so that they carry them away captives unto the land of the enemy, far or near;* (1 Kings 8:46)

*For all have sinned, and come short of the glory of Elohim (God);* (Romans 3:23)

So the line between the just and the wicked is not drawn at the fall. It is drawn at what the man does after it. The just rises. The wicked stops his ears:

*He that turneth away his ear from hearing the law, even his prayer shall be abomination.* (Proverbs 28:9)

*But they refused to hearken, and pulled away the shoulder, and stopped their ears, that they should not hear.* (Zechariah 7:11)

Hear what is done for the house, and for whose sake:

*Therefore say unto the house of Yashar'el (Israel), Thus saith Adonai Yahuah (the Lord GOD); I do not this for your sakes, O house of Yashar'el (Israel), but for mine holy name’s sake, which ye have profaned among the heathen, whither ye went.* (Ezekiel 36:22)

*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26)

*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27)

And read what the new heart does first, in the very same chapter:

*Then shall ye remember your own evil ways, and your doings that were not good, and shall lothe yourselves in your own sight for your iniquities and for your abominations.* (Ezekiel 36:31)

That is the sign of the new heart: not a head held high because it is saved, and not a head held high because it is righteous, but a head that goes lower the more mercy it sees. Job, Isaiah and Daniel all have it:

*I have heard of thee by the hearing of the ear: but now mine eye seeth thee.* (Job 42:5)

*Wherefore I abhor myself, and repent in dust and ashes.* (Job 42:6)

*Then said I, Woe is me! for I am undone; because I am a man of unclean lips, and I dwell in the midst of a people of unclean lips: for mine eyes have seen the King, Yahuah Tseva'ot (LORD of hosts).* (Isaiah 6:5)

*We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments:* (Daniel 9:5)

The one who gives the heart for his own name's sake is the one who also says a name can be blotted out, and that a righteous man who turns away is not carried by what he did before:

*And Yahuah (LORD) said unto Moses, Whosoever hath sinned against me, him will I blot out of my book.* (Exodus 32:33)

*But when the righteous turneth away from his righteousness, and committeth iniquity, and doeth according to all the abominations that the wicked man doeth, shall he live? All his righteousness that he hath done shall not be mentioned: in his trespass that he hath trespassed, and in his sin that he hath sinned, in them shall he die.* (Ezekiel 18:24)

*And then will I profess unto them, I never knew you: depart from me, ye that work iniquity.* (Matthew 7:23)

*He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* (Revelation 3:5)

Paul holds both halves in three verses, and the pulpit usually stops reading after the second:

*For by grace are ye saved through faith; and that not of yourselves: it is the gift of Elohim (God):* (Ephesians 2:8)

*Not of works, lest any man should boast.* (Ephesians 2:9)

*For we are his workmanship, created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained that we should walk in them.* (Ephesians 2:10)

The gift is for his name's sake, and the walk is the works he ordained. The one who keeps the first half and drops the second has put a period where there was a colon. The one who keeps the second half and drops the first builds a righteousness of the flesh and holds his head up for it. Scripture holds both, because it is one voice. Yahusha (Jesus) sets the measure for a brother at seven times in a day, the proverb's own number:

*And if he trespass against thee seven times in a day, and seven times in a day turn again to thee, saying, I repent; thou shalt forgive him.* (Luke 17:4)

And the whole of it is sealed by the end he declared before any of it began:

*Remember the former things of old: for I am Elohim (God), and there is none else; I am Elohim (God), and there is none like me,* (Isaiah 46:9)

*Declaring the end from the beginning, and from ancient times the things that are not yet done, saying, My counsel shall stand, and I will do all my pleasure:* (Isaiah 46:10)

The end is the gathering: the twelve tribes home, the new heart given, the statutes walked in. The man who falls and rises is on that road. The man who stops his ears has left it, whatever he accomplished. Effort over accomplishment is not a loophole. It is the shape of the whole book.$n$, $n$It ain't new. The one who says *I do not this for your sakes* is the same one who says *depart from me, ye that work iniquity*, and the one who promises a new heart is the same one who says that heart will loathe itself for what it did. Both are in the same book, often in the same chapter, and they were never two voices. Proverbs puts the whole of it in one line:

*For a just man falleth seven times, and riseth up again: but the wicked shall fall into mischief.* (Proverbs 24:16)

The just man is not the man who never fell. Nobody is that man:

*For there is not a just man upon earth, that doeth good, and sinneth not.* (Ecclesiastes 7:20)

*If they sin against thee, (for there is no man that sinneth not,) and thou be angry with them, and deliver them to the enemy, so that they carry them away captives unto the land of the enemy, far or near;* (1 Kings 8:46)

*For all have sinned, and come short of the glory of Elohim (God);* (Romans 3:23)

So the line between the just and the wicked is not drawn at the fall. It is drawn at what the man does after it. The just rises. The wicked stops his ears:

*He that turneth away his ear from hearing the law, even his prayer shall be abomination.* (Proverbs 28:9)

*But they refused to hearken, and pulled away the shoulder, and stopped their ears, that they should not hear.* (Zechariah 7:11)

Hear what is done for the house, and for whose sake:

*Therefore say unto the house of Yashar'el (Israel), Thus saith Adonai Yahuah (the Lord GOD); I do not this for your sakes, O house of Yashar'el (Israel), but for mine holy name’s sake, which ye have profaned among the heathen, whither ye went.* (Ezekiel 36:22)

*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* (Ezekiel 36:26)

*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:27)

And read what the new heart does first, in the very same chapter:

*Then shall ye remember your own evil ways, and your doings that were not good, and shall lothe yourselves in your own sight for your iniquities and for your abominations.* (Ezekiel 36:31)

That is the sign of the new heart: not a head held high because it is saved, and not a head held high because it is righteous, but a head that goes lower the more mercy it sees. Job, Isaiah and Daniel all have it:

*I have heard of thee by the hearing of the ear: but now mine eye seeth thee.* (Job 42:5)

*Wherefore I abhor myself, and repent in dust and ashes.* (Job 42:6)

*Then said I, Woe is me! for I am undone; because I am a man of unclean lips, and I dwell in the midst of a people of unclean lips: for mine eyes have seen the King, Yahuah Tseva'ot (LORD of hosts).* (Isaiah 6:5)

*We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments:* (Daniel 9:5)

The one who gives the heart for his own name's sake is the one who also says a name can be blotted out, and that a righteous man who turns away is not carried by what he did before:

*And Yahuah (LORD) said unto Moses, Whosoever hath sinned against me, him will I blot out of my book.* (Exodus 32:33)

*But when the righteous turneth away from his righteousness, and committeth iniquity, and doeth according to all the abominations that the wicked man doeth, shall he live? All his righteousness that he hath done shall not be mentioned: in his trespass that he hath trespassed, and in his sin that he hath sinned, in them shall he die.* (Ezekiel 18:24)

*And then will I profess unto them, I never knew you: depart from me, ye that work iniquity.* (Matthew 7:23)

*He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* (Revelation 3:5)

Paul holds both halves in three verses, and the pulpit usually stops reading after the second:

*For by grace are ye saved through faith; and that not of yourselves: it is the gift of Elohim (God):* (Ephesians 2:8)

*Not of works, lest any man should boast.* (Ephesians 2:9)

*For we are his workmanship, created in HaMashiach Yahusha (Christ Jesus) unto good works, which Elohim (God) hath before ordained that we should walk in them.* (Ephesians 2:10)

The gift is for his name's sake, and the walk is the works he ordained. The one who keeps the first half and drops the second has put a period where there was a colon. The one who keeps the second half and drops the first builds a righteousness of the flesh and holds his head up for it. Scripture holds both, because it is one voice. Yahusha (Jesus) sets the measure for a brother at seven times in a day, the proverb's own number:

*And if he trespass against thee seven times in a day, and seven times in a day turn again to thee, saying, I repent; thou shalt forgive him.* (Luke 17:4)

And the whole of it is sealed by the end he declared before any of it began:

*Remember the former things of old: for I am Elohim (God), and there is none else; I am Elohim (God), and there is none like me,* (Isaiah 46:9)

*Declaring the end from the beginning, and from ancient times the things that are not yet done, saying, My counsel shall stand, and I will do all my pleasure:* (Isaiah 46:10)

The end is the gathering: the twelve tribes home, the new heart given, the statutes walked in. The man who falls and rises is on that road. The man who stops his ears has left it, whatever he accomplished. Effort over accomplishment is not a loophole. It is the shape of the whole book.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 229 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 229 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (effort-over-accomplishment) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — effort-over-accomplishment done.'
