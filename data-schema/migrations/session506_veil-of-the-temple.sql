-- =====================================================================
-- Session 503c migration — summaries sweep — thread 24 `veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross`: title + summary rewritten (slug kept); 12 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- merged read-back S506 for `veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross` from canon__luke (2), canon__mark (3), canon__matthew (9). Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session506_veil-of-the-temple.sql
-- =====================================================================
\echo 'session503c — veil-of-the-temple starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
INSERT INTO s503c_cards VALUES
(3148,'canon','matthew',27,51,$n$And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;$n$,'canon','mark',15,38,$n$The Markan-parallel.$n$,$n$Mark 15:38 — *And the veil of the temple was rent in twain from the top to the bottom.* *And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* (Matthew 27:51) Mark gives the same tearing in fewer words. The veil goes *in twain from the top to the bottom*, and Mark sets it right after Yahusha (Jesus) gives up the ghost. A tear that starts at the top is the Father answering the death, not a man's hand.$n$,24,$n$The Markan-parallel.$n$,$n$Mark 15:38 — *the veil of the temple was rent in twain from the top to the bottom.* Mark tells the same tearing, from the top to the bottom, so the opening comes from above.$n$),
(3149,'canon','matthew',27,51,$n$And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;$n$,'canon','luke',23,45,$n$The Lukan-parallel.$n$,$n$Luke 23:45 — *And the sun was darkened, and the veil of the temple was rent in the midst.* *And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* (Matthew 27:51) Luke tells it with the darkness first, *the sun was darkened*, and then the veil torn *in the midst*. Matthew says from the top, Luke says the middle. Either way the covering that kept the holiest shut is split open at the death of Yahusha (Jesus).$n$,24,$n$The Lukan-parallel.$n$,$n$Luke 23:45 — *the sun was darkened, and the veil of the temple was rent in the midst.* Luke sets the darkness and the torn veil together, the veil split in the midst at the hour of the death.$n$),
(3150,'canon','matthew',27,51,$n$And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;$n$,'canon','exodus',26,31,$n$The Tanakh-veil.$n$,$n$Exodus 26:31 — *And thou shalt make a vail of blue, and purple, and scarlet, and fine twined linen of cunning work: with cherubims shall it be made:* *And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* (Matthew 27:51) Here is the veil that tore. Moses was told to weave it in blue, purple and scarlet, and it hung between the holy place and the most holy. It was made *with cherubims*, and Matthew's tear runs through that very hanging. What Moses hung, the Father opens, and the Torah's house is entered, not thrown out.$n$,24,$n$The Tanakh-veil-substance.$n$,$n$Exodus 26:31 — *a vail of blue, and purple, and scarlet, and fine twined linen of cunning work.* This is the woven veil of blue, purple and scarlet that Matthew's tearing runs through.$n$),
(3151,'canon','matthew',27,51,$n$And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;$n$,'canon','leviticus',16,1,$n$The Yom Kippur architecture.$n$,$n$Leviticus 16:1 — *And Yahuah (LORD) spake unto Moses after the death of the two sons of Aaron, when they offered before Yahuah (LORD), and died;* *And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* (Matthew 27:51) The rule of the veil begins with a death. Aaron's two sons *offered before Yahuah (LORD), and died*, and the way behind the veil was fenced from then on. Then Yahusha (Jesus) dies and that same veil is torn from the top. The fence that death guarded is opened by a death.$n$,24,$n$The substantial-Yom Kippur-architecture.$n$,$n$Leviticus 16:1 — *after the death of the two sons of Aaron, when they offered before Yahuah (LORD), and died.* The veil's rule begins with two sons of Aaron dead, which is why the way behind it was fenced.$n$),
(3152,'canon','matthew',27,51,$n$And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;$n$,'canon','hebrews',10,19,$n$The substantial-access-to-the-Father.$n$,$n$Hebrews 10:19 — *Having therefore, brethren, boldness to enter into the holiest by the blood of Yahusha (Jesus),* *And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* (Matthew 27:51) Hebrews reads the tearing for us. The way into the holiest is *by the blood of Yahusha (Jesus)*, and the same writer goes on to call the veil his flesh. So the tear from the top is the way to the Father laid open, not the temple dismissed.$n$,24,$n$*Boldness to enter into the holiest by the blood of Yahusha.*$n$,$n$Hebrews 10:19 — *boldness to enter into the holiest by the blood of Yahusha (Jesus).* Hebrews says the torn veil opens boldness to enter the holiest by the blood of Yahusha (Jesus).$n$),
(3153,'canon','matthew',27,51,$n$And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;$n$,'canon','hebrews',9,11,$n$*By his own blood he entered in once into the holy place.*$n$,$n$Hebrews 9:11 — *But Messiah (Christ) being come an high priest of good things to come, by a greater and more perfect tabernacle, not made with hands, that is to say, not of this building;* *And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* (Matthew 27:51) Hebrews names the one who goes through. Messiah (Christ) comes as high priest to a place *not made with hands*, and the veil torn from the top fits that, since no man's hand tore it. The way he takes leads into the Father's own presence.$n$,24,$n$*By his own blood he entered in once into the holy place.*$n$,$n$Hebrews 9:11 — *by a greater and more perfect tabernacle, not made with hands.* The tabernacle not made with hands is the place the torn veil opens toward, entered by Messiah (Christ).$n$),
(3154,'canon','matthew',27,51,$n$And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;$n$,'canon','hebrews',6,19,$n$The substantial-anchor-of-the-soul-within-the-veil.$n$,$n$Hebrews 6:19 — *Which hope we have as an anchor of the soul, both sure and stedfast, and which entereth into that within the veil;* *And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* (Matthew 27:51) Hope reaches *that within the veil*, the very place the veil hid, where the ark stood. Yahusha (Jesus) went in there first as forerunner. When the veil tears from the top, that inner place is what lies open to the ones who follow.$n$,24,$n$The substantial-anchor-of-the-soul-within-the-veil.$n$,$n$Hebrews 6:19 — *which entereth into that within the veil.* Hope enters the inner place behind the veil, the place the tearing lays open.$n$),
(3155,'canon','matthew',27,51,$n$And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;$n$,'canon','hebrews',4,16,$n$*Come boldly unto the throne of grace.*$n$,$n$Hebrews 4:16 — *Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need.* *And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* (Matthew 27:51) Because the veil is torn, the throne is near. *Come boldly unto the throne of grace* is said to a people whose high priest once went in alone, once a year, on pain of death. Now mercy is asked for at the very place the veil guarded.$n$,24,$n$*Come boldly unto the throne of grace.*$n$,$n$Hebrews 4:16 — *come boldly unto the throne of grace, that we may obtain mercy.* The call to come boldly to the throne of grace is spoken at the place the veil once fenced off.$n$),
(3156,'canon','matthew',27,51,$n$And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;$n$,'canon','leviticus',16,2,$n$The Tanakh-substance the high-priest-substance entered-once-a-year.$n$,$n$Leviticus 16:2 — *And Yahuah (LORD) said unto Moses, Speak unto Aaron thy brother, that he come not at all times into the holy place within the vail before the mercy seat, which is upon the ark; that he die not: for I will appear in the cloud upon the mercy seat.* *And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* (Matthew 27:51) This is the fence the tearing answers. Aaron could not *come not at all times into the holy place* behind the veil, or he would die, because Yahuah (LORD) would appear in the cloud on the mercy seat. The torn veil opens that same place through the death of Yahusha (Jesus), and the Torah that set the fence still stands.$n$,24,$n$The Tanakh-substance the high-priest-substance entered-once-a-year.$n$,$n$Leviticus 16:2 — *that he come not at all times into the holy place within the vail before the mercy seat.* Only Aaron, and not at all times, could go within the vail, and this is the closed way the tearing opens.$n$),
(7120,'canon','luke',23,45,$n$And the sun was darkened, and the veil of the temple was rent in the midst.$n$,'canon','matthew',27,51,$n$thread:veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross | Luke carries the veil-of-the-temple-rent-in-the-midst — the same substantial-access-through-the-cross substance, though Luke places the veil-rending *before* the King's last cry rather than after, and uses the *in the midst* (eis meson) rather than Matt/Mark's *from the top to the bottom* — the framework substance unchanged.$n$,$n$Matthew 27:51 — *And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* *And the sun was darkened, and the veil of the temple was rent in the midst.* (Luke 23:45) Luke has the veil torn *in the midst*. Matthew says from the top to the bottom, and adds the quake. Side by side, the tear starts high and runs the whole way down, so no hand of man made it. The earth and the rocks answer the death of Yahusha (Jesus).$n$,24,$n$Luke carries the veil-of-the-temple-rent-in-the-midst — the same substantial-access-through-the-cross substance, though Luke places the veil-rending *before* the King's last cry rather than after, and uses the *in the midst* (eis meson) rather than Matt/Mark's *from the top to the bottom* — the framework substance unchanged.$n$,$n$Matthew 27:51 — *the veil of the temple was rent in twain from the top to the bottom.* Matthew shows the tear running from the top to the bottom, with the earth and rocks answering it.$n$),
(5354,'canon','mark',15,38,$n$And the veil of the temple was rent in twain from the top to the bottom.$n$,'canon','exodus',26,31,$n$thread:veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross | The Shemot (Exodus) 26:31-33 tabernacle-veil architecture.$n$,$n$Exodus 26:31 — *And thou shalt make a vail of blue, and purple, and scarlet, and fine twined linen of cunning work: with cherubims shall it be made:* *And the veil of the temple was rent in twain from the top to the bottom.* (Mark 15:38) Mark's torn veil is the one Moses was told to weave. Exodus tells how it was made, in blue, purple and scarlet, *with cherubims shall it be made*. That is the hanging that shut the holiest. Torn from the top, the door it guarded stands open.$n$,24,$n$The Shemot (Exodus) 26:31-33 tabernacle-veil architecture.$n$,$n$Exodus 26:31 — *fine twined linen of cunning work: with cherubims shall it be made.* The woven veil with cherubims is the one Mark says was torn from the top to the bottom.$n$),
(5353,'canon','mark',15,38,$n$And the veil of the temple was rent in twain from the top to the bottom.$n$,'canon','hebrews',10,19,$n$thread:veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross | *The veil of the temple was rent in twain from the top to the bottom.* The substantial access the typological Day of Atonement was always pointing to (Hebrews 10:19-22).$n$,$n$Hebrews 10:19 — *Having therefore, brethren, boldness to enter into the holiest by the blood of Yahusha (Jesus),* *And the veil of the temple was rent in twain from the top to the bottom.* (Mark 15:38) Mark gives the tear and Hebrews says what it let in. *Boldness to enter into the holiest* belongs to those who come by the blood of Yahusha (Jesus), and a veil torn from the top shows whose hand opened the way to the Father.$n$,24,$n$*The veil of the temple was rent in twain from the top to the bottom.* The substantial access the typological Day of Atonement was always pointing to (Hebrews 10:19-22).$n$,$n$Hebrews 10:19 — *Having therefore, brethren, boldness to enter into the holiest.* Hebrews gives boldness to enter the holiest as what the torn veil opened.$n$);
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (24, 'veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross', $n$The veil of the temple rent from the top to the bottom — the way into the holiest opened, and the Sabbath still kept (Exodus 26; Leviticus 16; Hebrews 10)$n$, $n$The veil of the temple rent from the top to the bottom — the way into the holiest opened, and the Sabbath still kept (Exodus 26; Leviticus 16; Hebrews 10)$n$, $n$It ain't new. At his death the veil tore, and it tore from the top:

*And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* (Matthew 27:51)

*And the sun was darkened, and the veil of the temple was rent in the midst.* (Luke 23:45)

The veil was Moses' veil, hung to divide the holy from the most holy where the ark stood:

*And thou shalt hang up the vail under the taches, that thou mayest bring in thither within the vail the ark of the testimony: and the vail shall divide unto you between the holy place and the most holy.* (Exodus 26:33)

And behind it only one man came, once a year, on pain of death:

*And Yahuah (LORD) said unto Moses, Speak unto Aaron thy brother, that he come not at all times into the holy place within the vail before the mercy seat, which is upon the ark; that he die not: for I will appear in the cloud upon the mercy seat.* (Leviticus 16:2)

The letter to the Hebrews says what the tearing opened, and names the veil for what it stood for:

*Having therefore, brethren, boldness to enter into the holiest by the blood of Yahusha (Jesus),* (Hebrews 10:19)

*By a new and living way, which he hath consecrated for us, through the veil, that is to say, his flesh;* (Hebrews 10:20)

His flesh torn, the way in laid open, and the tearing from the top down because it was the Father's hand and not a man's. Isaiah had set a torn covering on the same mountain where the feast is spread:

*And he will destroy in this mountain the face of the covering cast over all people, and the vail that is spread over all nations.* (Isaiah 25:7)

What the torn veil does not mean is that the house or its service was done away. The women who watched him die kept the Sabbath that same week according to the commandment, and the apostles went on going up to the temple:

*And they returned, and prepared spices and ointments; and rested the sabbath day according to the commandment.* (Luke 23:56)

The veil opened the way to the Father through the Son's flesh. It did not close the Torah. The same afternoon that tore the veil kept the commandment about the body on the tree, and the next day was a Sabbath kept.$n$, $n$It ain't new. At his death the veil tore, and it tore from the top:

*And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* (Matthew 27:51)

*And the sun was darkened, and the veil of the temple was rent in the midst.* (Luke 23:45)

The veil was Moses' veil, hung to divide the holy from the most holy where the ark stood:

*And thou shalt hang up the vail under the taches, that thou mayest bring in thither within the vail the ark of the testimony: and the vail shall divide unto you between the holy place and the most holy.* (Exodus 26:33)

And behind it only one man came, once a year, on pain of death:

*And Yahuah (LORD) said unto Moses, Speak unto Aaron thy brother, that he come not at all times into the holy place within the vail before the mercy seat, which is upon the ark; that he die not: for I will appear in the cloud upon the mercy seat.* (Leviticus 16:2)

The letter to the Hebrews says what the tearing opened, and names the veil for what it stood for:

*Having therefore, brethren, boldness to enter into the holiest by the blood of Yahusha (Jesus),* (Hebrews 10:19)

*By a new and living way, which he hath consecrated for us, through the veil, that is to say, his flesh;* (Hebrews 10:20)

His flesh torn, the way in laid open, and the tearing from the top down because it was the Father's hand and not a man's. Isaiah had set a torn covering on the same mountain where the feast is spread:

*And he will destroy in this mountain the face of the covering cast over all people, and the vail that is spread over all nations.* (Isaiah 25:7)

What the torn veil does not mean is that the house or its service was done away. The women who watched him die kept the Sabbath that same week according to the commandment, and the apostles went on going up to the temple:

*And they returned, and prepared spices and ointments; and rested the sabbath day according to the commandment.* (Luke 23:56)

The veil opened the way to the Father through the Son's flesh. It did not close the Torah. The same afternoon that tore the veil kept the commandment about the body on the tree, and the next day was a Sabbath kept.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 24 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 24 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (veil-of-the-temple) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — veil-of-the-temple done.'
