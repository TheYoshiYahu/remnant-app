-- =====================================================================
-- Session 503c migration — summaries sweep — thread 30901 `matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4`: title + summary rewritten (slug kept); 0 member card(s)
-- rewritten in place with their member notes (ids, verse pairs and membership untouched). Written and read on Claude Fable 5.1 against
-- live read-back S503 (canon/matthew) · schema 1.0.0-phase4-session475. Every note composed by script (build503c.py). Guards RAISE before any write if the live data moved. Idempotent. Nothing deleted.
-- Run: python3 api/apply_migration.py data-schema/migrations/session503c_matthew-13-the-mustard.sql
-- =====================================================================
\echo 'session503c — matthew-13-the-mustard starting...'
BEGIN;
CREATE TEMP TABLE s503c_cards (id bigint, s_ed text, s_book text, src_ch int, src_vn int, src_text text, t_ed text, tgt_book text, tgt_ch int, tgt_vn int, old_note text, new_note text, thread_id bigint, old_mnote text, new_mnote text) ON COMMIT DROP;
-- (no card rows)
CREATE TEMP TABLE s503c_thread (id bigint, slug text, old_title text, new_title text, old_summary text, new_summary text) ON COMMIT DROP;
INSERT INTO s503c_thread VALUES (30901, 'matthew-13-the-mustard-seed-the-leaven-the-birds-lodge-ezekiel-17-daniel-4', $n$The mustard seed and the leaven — the birds lodge in the branches (Ezekiel 17; Daniel 4; Psalm 104)$n$, $n$The mustard seed and the leaven — what grows in the field before the harvest (Daniel 4; Ezekiel 31; Exodus 12)$n$, $n$*The kingdom of heaven is like to a grain of mustard seed... which indeed is the least of all seeds: but when it is grown, it is the greatest among herbs, and becometh a tree, so that the birds of the air come and lodge in the branches thereof* (13:31-32). This is no chance picture — it is Ezekiel's prophecy of the kingdom Yahuah plants: *In the mountain of the height of Yashar'el (Israel) will I plant it: and it shall bring forth boughs, and bear fruit, and be a goodly cedar: and under it shall dwell all fowl of every wing; in the shadow of the branches thereof shall they dwell* (Ezekiel 17:23). The least twig becomes the sheltering cedar. Daniel saw the same great tree: *the fowls of the heaven dwelt in the boughs thereof, and all flesh was fed of it* (Daniel 4:12), and again *upon whose branches the fowls of the heaven had their habitation* (Daniel 4:21). And the old psalm sang it first: *By them shall the fowls of the heaven have their habitation, which sing among the branches* (Psalm 104:12). So too the leaven *hid in three measures of meal, till the whole was leavened* (13:33): the kingdom's growth is hidden and quiet, but nothing escapes its working. From the least of seeds to the cedar that shelters every wing — that is how Yahuah grows His reign.$n$, $n$It ain't new. Two short parables sit between the sower and the explaining of the tares, and both describe the field before the harvest, not after it:

*Another parable put he forth unto them, saying, The kingdom of heaven is like to a grain of mustard seed, which a man took, and sowed in his field:* (Matthew 13:31)

*Which indeed is the least of all seeds: but when it is grown, it is the greatest among herbs, and becometh a tree, so that the birds of the air come and lodge in the branches thereof.* (Matthew 13:32)

A mustard plant is an herb. One that *becometh a tree* has grown past its kind, and the birds that come to lodge in it are the birds this chapter has already named: *And when he sowed, some seeds fell by the way side, and the fowls came and devoured them up:* (Matthew 13:4), which he explains himself: *then cometh the wicked one, and catcheth away that which was sown in his heart.* (Matthew 13:19). Scripture does have a great tree full of nesting birds, and it is Babylon:

*The leaves thereof were fair, and the fruit thereof much, and in it was meat for all: the beasts of the field had shadow under it, and the fowls of the heaven dwelt in the boughs thereof, and all flesh was fed of it.* (Daniel 4:12)

*He cried aloud, and said thus, Hew down the tree, and cut off his branches, shake off his leaves, and scatter his fruit: let the beasts get away from under it, and the fowls from his branches:* (Daniel 4:14)

And Assyria, cut down for lifting itself up:

*All the fowls of heaven made their nests in his boughs, and under his branches did all the beasts of the field bring forth their young, and under his shadow dwelt all great nations.* (Ezekiel 31:6)

The leaven says the same thing plainly:

*Another parable spake he unto them; The kingdom of heaven is like unto leaven, which a woman took, and hid in three measures of meal, till the whole was leavened.* (Matthew 13:33)

Nowhere in scripture is leaven a good thing. It is put out of the house at Passover on pain of being cut off (Exodus 12:15); no offering may carry it (Leviticus 2:11); he names it himself, *Take heed and beware of the leaven of the Pharisees and of the Sadducees.* (Matthew 16:6), and the disciples understood *the doctrine of the Pharisees and of the Sadducees* (Matthew 16:12), which Luke calls *hypocrisy* (Luke 12:1); Paul says of the teaching that was pulling the Galatians away, *A little leaven leaveneth the whole lump.* (Galatians 5:9). Three measures of fine meal is what Sarah kneaded for the three who came to Abraham's tent (Genesis 18:6). Someone hid leaven in the offering, and it worked through all of it. That is what the kingdom looks like in this age, told without flattery: a seed grown into something out of its kind where the wicked one's birds lodge, and a doctrine worked quietly through the whole until nothing is left unleavened. The cedar Yahuah (God) plants with his own hand is still to come, *In the mountain of the height of Yashar'el (Israel) will I plant it* (Ezekiel 17:23), and it comes when *I Yahuah (LORD) have brought down the high tree, have exalted the low tree* (Ezekiel 17:24). The tares grow with the wheat until the harvest; these two parables say the same thing in two pictures.$n$);

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
  IF NOT FOUND THEN RAISE EXCEPTION 'S503c: thread 30901 not found under its slug'; END IF;
  SELECT count(*) INTO n FROM cross_reference_threads t JOIN s503c_thread s ON s.id = t.id
    WHERE (t.title = s.old_title AND t.summary_md = s.old_summary) OR (t.title = s.new_title AND t.summary_md = s.new_summary);
  IF n <> 1 THEN RAISE EXCEPTION 'S503c: thread 30901 title/summary differ from the read-back — re-dump and rebuild'; END IF;
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
  RAISE NOTICE 'S503c (matthew-13-the-mustard) summary: notes rewritten % / already there %; member notes rewritten % / already there %; thread rewritten % / already there %', n_notes, n_c - n_notes, n_m, n_c - n_m, n_t, 1 - n_t;
END $s503c2$;
COMMIT;
\echo 'session503c — matthew-13-the-mustard done.'
