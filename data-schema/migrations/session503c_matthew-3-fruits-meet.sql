-- =====================================================================
-- Session 503c migration — summaries sweep — thread 30413 `matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_matthew-3-fruits-meet.sql
-- =====================================================================
\echo 'session503c — matthew-3-fruits-meet starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (30413, 'matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11', $n$Bring forth fruits meet for repentance — stones raised to Abraham (Isaiah 1; Ezekiel 18; Romans 11)$n$, $n$Of these stones to raise up children unto Abraham — the stones are the scattered house (Joshua 4; Hosea 1; Ezekiel 37)$n$, $n$**Come and see** — John's thunder against *O generation of vipers* is not new severity; it is the prophets' own demand. *Bring forth therefore fruits meet for repentance* (Matthew 3:8). Repentance is never a feeling — it is a TURNING into obedience, and the Tanakh has said so all along. ¶ **Isaiah 1:16** — *Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil* — and **1:17** turns it outward: *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow.* That is the fruit. **Jeremiah 4:3** demands the broken heart that bears it: *Break up your fallow ground, and sow not among thorns.* ¶ And to those who hide behind *We have Abraham to our father*, **Ezekiel 18:30** answers: *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* — for what Elohim wants is **18:31**: *make you a new heart and a new spirit: for why will ye die, O house of Yashar'el (Israel)?* A new heart, not a bloodline. The axe laid to the root is Isaiah's own picture — **Isaiah 10:33** — *shall lop the bough with terror... and the haughty shall be humbled.* ¶ But hear the guard carefully. *Elohim is able of these stones to raise up children unto Abraham* does NOT mean Israel cast off. **Romans 11:1** — *Hath Elohim (God) cast away his people? Elohim (God) forbid.* The stones become Abraham's children by **Romans 11:17** — *thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root* — the nations grafted INTO the same root, brought home alongside Israel, never in place of her.$n$, $n$It ain't new. John is standing in the Jordan when he says it:

*And think not to say within yourselves, We have Abraham to our father: for I say unto you, that Elohim (God) is able of these stones to raise up children unto Abraham.* (Matthew 3:9)

The Jordan already had stones that meant something. When Yashar'el (Israel) crossed it, one man from every tribe carried a stone up out of the river bed:

*And Joshua said unto them, Pass over before the ark of Yahuah Elohaychem (the LORD your God) into the midst of Jordan, and take ye up every man of you a stone upon his shoulder, according unto the number of the tribes of the children of Yashar'el (Israel):* (Joshua 4:5)

*And he spake unto the children of Yashar'el (Israel), saying, When your children shall ask their fathers in time to come, saying, What mean these stones?* (Joshua 4:21)

Twelve stones, twelve tribes. By John's day ten of those tribes had been gone seven hundred years, scattered among the nations and counted as dead. Hosea had said what Yahuah (God) would do with them:

*Yet the number of the children of Yashar'el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10)

Ezekiel saw them as bones and was told who they were:

*Then he said unto me, Son of Adam, these bones are the whole house of Yashar'el (Israel): behold, they say, Our bones are dried, and our hope is lost: we are cut off for our parts.* (Ezekiel 37:11)

*And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar'el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land:* (Ezekiel 37:21)

Dry bones made a living house; stones made children of Abraham. It is one promise in two pictures, and in both it is the scattered house coming home, not the nations made into Yashar'el (Israel). So *We have Abraham to our father* is answered from two sides at once. The ones who trust their birth and bear no fruit are cut down: *every tree which bringeth not forth good fruit is hewn down, and cast into the fire.* (Matthew 3:10) And the children everyone thought were lost are raised up. Those are the people Paul means when he asks *Hath Elohim (God) cast away his people? Elohim (God) forbid.* (Romans 11:1), and the wild olive *graffed in among them* (Romans 11:17) is that same seed, grown wild in the nations but olive from the root. The fruit John asks for is what Isaiah asked of the same house: *Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil;* (Isaiah 1:16). Repentance is a turning, and the ones who turn are the ones Yahuah (God) raises.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 30413 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 30413 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (matthew-3-fruits-meet) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — matthew-3-fruits-meet done.'
