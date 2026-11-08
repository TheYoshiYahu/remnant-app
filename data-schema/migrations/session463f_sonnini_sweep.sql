-- =====================================================================
-- Session 463f migration — 2026-11-08 — edition `sonnini-acts-29` (books: sonnini-acts-29) — the last Phase-1 card-fidelity sweep
-- Apostolic Fathers (Lightfoot 1891) / Acts 29 (Sonnini) card sweep (the S463e/S463f chain), one migration per edition:
--   3 cards on the canon side (S1xx-era framework prose) rebuilt Come-and-See — both whole verses in italics, cited, then plain prose;
--   2 cards whose prose carried degraded markers / hyphen-chains / a paraphrase inside quotation marks / a bare 'the Lord': that sentence rewritten, all else kept;
--   0 cards fixed by script and verified by content: canon lead quotations re-quoted from parsed/canon.json (the NT-Lord rule), citations named in English
--   ('Ignatius 1:7' → 'Ignatius to the Ephesians 1:7', '(1:20)' → '(Martyrdom of Polycarp 1:20)', 'hermas 5:1' → 'Hermas 5:1', Hebrew book names → English);
--   5 thread member notes ride along; 1 thread summaries fixed (old summary must match exactly or the row is skipped), incl. the Hermas
--   Similitude 8–10 summaries that cited an older chapter numbering (23/24 → live 25/26/27) and every witness quotation re-quoted verbatim;
--   1 cards re-pointed to the verse their own words sit in (ids kept) — the S253 cards were written against a different chapter division; every move
--   agreed by two independent cold reads (Sonnet) by content; 1 thread anchors follow their member cards; 0 live verse(s): the OCR typo 'Cod' → 'Elohim (God)'.
-- Reads before this was written: Sonnet drafters (model named in each out/*.json), every drafted note / member note / summary read against the voice
-- skill on Fable; every quotation checked verbatim against the live text by script (assemble463f.py) before the SQL was written.
-- Safety: a card is skipped (NOTICE) if its extra-book end is not at the expected address (edited since the Nov 8 read-back), if a card
-- already sits on the destination pair, or if the move would make source = target. RAISES if the live verse text differs from
-- the read-back, or if a rebuilt note does not carry the live verse verbatim.
-- Idempotent: a re-run finds every card already landed and reports 0 changed.
-- Run: python3 api/apply_migration.py data-schema/migrations/session463f_sonnini_sweep.sql
-- =====================================================================
\echo 'session463f — sonnini-acts-29 sweep starting...'
BEGIN;
CREATE TEMP TABLE _s463f_so (xid INT, side CHAR(1), ob TEXT, oc INT, ov INT, nb TEXT, nc INT, nv INT, new_note TEXT, live_text TEXT, quotes_live BOOLEAN) ON COMMIT DROP;
INSERT INTO _s463f_so VALUES
(4439,'T','sonnini-acts-29',29,2,'sonnini-acts-29',29,2,$n$Matthew 10:6 — *But go rather to the lost sheep of the house of Yashar'el (Israel).* Acts 29:2 — *For he had heard in Phoenicia that certain of the children of Yashar'el (Israel), about the time of the Assyrian captivity, had escaped by sea to "the isles afar off," as spoken by the prophet, and called by the Romans, Britain.* Yahusha (Jesus) sent his disciples to the lost sheep of the house of Yashar'el (Israel), and this manuscript tells of Paul going after the same sheep. It says some of the children of Yashar'el (Israel) had escaped by sea about the time of the Assyrian captivity, which puts the lost sheep of Matthew 10:6 among the scattered of that captivity, far from the land. The manuscript has Paul setting out for Spain and Britain because he had heard where they went.$n$,$n$For he had heard in Phoenicia that certain of the children of Yashar'el (Israel), about the time of the Assyrian captivity, had escaped by sea to "the isles afar off," as spoken by the prophet, and called by the Romans, Britain.$n$,true),
(4440,'T','sonnini-acts-29',29,3,'sonnini-acts-29',29,3,$n$Matthew 10:6 — *But go rather to the lost sheep of the house of Yashar'el (Israel).* Acts 29:3 — *And Yahuah (Lord) commanded the gospel to be preached far hence to the Gentiles, and to the lost sheep of the House of Yashar'el (Israel).* The manuscript puts into Paul's commission the very words Yahusha (Jesus) spoke to his disciples, the lost sheep of the House of Yashar'el (Israel), and sends him far hence with them. It sets the Gentiles beside those sheep, and since the sheep were scattered among the nations, the Gentiles named here may well be that same scattered flock living as Gentiles. So the manuscript carries the commission of Matthew 10:6 out of Galilee to wherever the scattered went.$n$,$n$And Yahuah (Lord) commanded the gospel to be preached far hence to the Gentiles, and to the lost sheep of the House of Yashar'el (Israel).$n$,true),
(4441,'T','sonnini-acts-29',29,13,'sonnini-acts-29',29,13,$n$Matthew 10:23 — *But when they persecute you in this city, flee ye into another: for verily I say unto you, Ye shall not have gone over the cities of Yashar'el (Israel), till the Son of Adam be come.* Acts 29:13 — *And it came to pass that certain of the Druids came unto Paul privately, and showed by their rites and ceremonies they were descended from the Yahudim (Jews) which escaped from bondage in the land of Egypt, and the apostle believed these things, and he gave them the kiss of peace.* Yahusha (Jesus) told his disciples they would not have gone over the cities of Yashar'el (Israel) before the Son of Adam came, so the search for Yashar'el (Israel) was meant to outlast them. The manuscript tells of Paul finding, in Britain, men whose rites and ceremonies pointed back to the exodus from Egypt, and of his giving them the kiss of peace. The manuscript's standing is disputed, but what it shows is the scattered children being found where they were driven, which is what Matthew 10:23 leaves still to be done.$n$,$n$And it came to pass that certain of the Druids came unto Paul privately, and showed by their rites and ceremonies they were descended from the Yahudim (Jews) which escaped from bondage in the land of Egypt, and the apostle believed these things, and he gave them the kiss of peace.$n$,true),
(49009,'S','sonnini-acts-29',29,20,'sonnini-acts-29',29,22,$n$Matthew 27:4 — *Saying, I have sinned in that I have betrayed the innocent blood. And they said, What is that to us? see thou to that.* The innocent blood Judas confesses is the same blood-shedding Acts 29:20 says Pilate answered for.$n$,$n$And a voice came out of heaven saying, Even Pilate hath escaped the wrath to come, for he washed his hands before the multitude at the blood-shedding of Yahuah (Lord) Yahusha (Jesus).$n$,false),
(49016,'S','sonnini-acts-29',29,4,'sonnini-acts-29',29,4,$n$Acts 9:15 — *But Yahusha (Lord) said unto him, Go thy way: for he is a chosen vessel unto me, to bear my name before the Gentiles, and kings, and the children of Yashar'el (Israel).* Yahusha (Jesus) chose Paul to bear his name before the Gentiles, kings, and the children of Yashar'el (Israel), and the Acts 29:4 words "he testified boldly of Yahusha (Jesus) before the tribunes and among the people" show that name being borne.$n$,$n$And no man hindered Paul; for he testified boldly of Yahusha (Jesus) before the tribunes and among the people; and he took with him certain of the brethren which abode with him at Rome, and they took shipping at Ostium, and having the winds fair were brought safely into an haven of Spain.$n$,false),
(49019,'S','sonnini-acts-29',29,3,'sonnini-acts-29',29,3,$n$Matthew 15:24 — *But he answered and said, I am not sent but unto the lost sheep of the house of Yashar'el (Israel).* Yahusha (Jesus) names the same flock that Acts 29:3 says Yahuah (the Lord) commanded the gospel to be preached to, "the lost sheep of the House of Yashar'el (Israel)."$n$,$n$And Yahuah (Lord) commanded the gospel to be preached far hence to the Gentiles, and to the lost sheep of the House of Yashar'el (Israel).$n$,false);
CREATE TEMP TABLE _s463f_som (thread_id INT, xid INT, new_note TEXT) ON COMMIT DROP;
INSERT INTO _s463f_som VALUES
(108,4439,$n$Acts 29:2 — *certain of the children of Yashar'el (Israel), about the time of the Assyrian captivity, had escaped by sea to "the isles afar off,"* This is the manuscript's reason for Paul's journey to Spain and Britain, following the lost sheep of Matthew 10:6 to where they were scattered.$n$),
(108,4440,$n$Acts 29:3 — *Yahuah (Lord) commanded the gospel to be preached far hence to the Gentiles, and to the lost sheep of the House of Yashar'el (Israel).* The manuscript carries the commission of Matthew 10:6 and Matthew 15:24 out to the far places where the scattered flock was driven.$n$),
(108,4441,$n$Acts 29:13 — *certain of the Druids came unto Paul privately, and showed by their rites and ceremonies they were descended from the Yahudim (Jews) which escaped from bondage in the land of Egypt.* The manuscript has Paul finding the scattered children in Britain, where Matthew 10:23 says the cities of Yashar'el (Israel) are not yet fully gone over.$n$),
(11874,49019,$n$Matthew 15:24 — *But he answered and said, I am not sent but unto the lost sheep of the house of Yashar'el (Israel).* Yahusha (Jesus) names the same flock that Acts 29:3 says Yahuah (the Lord) commanded the gospel to be preached to, "the lost sheep of the House of Yashar'el (Israel)."$n$),
(11875,49016,$n$Acts 9:15 — *But Yahusha (Lord) said unto him, Go thy way: for he is a chosen vessel unto me, to bear my name before the Gentiles, and kings, and the children of Yashar'el (Israel).* Yahusha (Jesus) chose Paul to bear his name before the Gentiles, kings, and the children of Yashar'el (Israel), and the Acts 29:4 words "he testified boldly of Yahusha (Jesus) before the tribunes and among the people" show that name being borne.$n$);
CREATE TEMP TABLE _s463f_sos (thread_id INT, old_summary TEXT, new_summary TEXT, old_title TEXT, new_title TEXT) ON COMMIT DROP;
INSERT INTO _s463f_sos VALUES
(11875,$n$*And no man hindered Paul; for he testified boldly of Yahusha (Jesus) before the tribunes and among the people... And Paul preached mightily in Spain, and great multitudes believed and were converted, for they perceived he was an apostle sent from Elohim (God).* The chosen vessel goes where the flock is scattered. *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* (John 10:16) The Lord had marked Paul out for this very reach: *But Yahuah (Lord) said unto him, Go thy way: for he is a chosen vessel unto me, to bear my name before the Gentiles, and kings, and the children of Yashar'el (Israel):* (Acts 9:15) — Gentiles, kings, and the children of Israel, the threefold company Acts 29 sends him to.$n$,$n$*And no man hindered Paul; for he testified boldly of Yahusha (Jesus) before the tribunes and among the people... And Paul preached mightily in Spain, and great multitudes believed and were converted, for they perceived he was an apostle sent from Elohim (God).* The chosen vessel goes where the flock is scattered. *And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd.* (John 10:16) Yahusha (Jesus) had marked Paul out for this very reach: *But Yahusha (Lord) said unto him, Go thy way: for he is a chosen vessel unto me, to bear my name before the Gentiles, and kings, and the children of Yashar'el (Israel):* (Acts 9:15) — Gentiles, kings, and the children of Israel, the threefold company Acts 29 sends him to.$n$,$n$Other sheep, one fold, one shepherd$n$,$n$Other sheep, one fold, one shepherd$n$);
CREATE TEMP TABLE _s463f_sot (bs TEXT, ch INT, vn INT, old_text TEXT, new_text TEXT) ON COMMIT DROP;
CREATE TEMP TABLE _s463f_soa (thread_id INT, ob TEXT, oc INT, ov INT, nb TEXT, nc INT, nv INT) ON COMMIT DROP;
INSERT INTO _s463f_soa VALUES
(11877,'sonnini-acts-29',29,20,'sonnini-acts-29',29,22);

CREATE OR REPLACE TEMP VIEW _s463f_sov AS
  SELECT v.id, e.slug es, b.slug bs, c.chapter_number ch, v.verse_number vn, v.text FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id JOIN editions e ON e.id=b.edition_id;

DO $fix$
DECLARE r RECORD; cur RECORD; pass INT; nid INT; dup INT;
        n_moved INT := 0; n_requoted INT := 0; n_same INT := 0; n_absent INT := 0; n_skipped INT := 0; n_mem INT := 0; n_sum INT := 0; n_sum_skip INT := 0; n_txt INT := 0; n_anc INT := 0; vid INT;
BEGIN
  FOR r IN SELECT * FROM _s463f_sot LOOP
    SELECT id INTO vid FROM _s463f_sov WHERE es = 'sonnini-acts-29' AND bs = r.bs AND ch = r.ch AND vn = r.vn;
    IF vid IS NULL THEN RAISE EXCEPTION 'S463f: live % %:% missing', r.bs, r.ch, r.vn; END IF;
    IF (SELECT text FROM verses WHERE id = vid) = r.old_text THEN UPDATE verses SET text = r.new_text WHERE id = vid; n_txt := n_txt + 1;
    ELSIF (SELECT text FROM verses WHERE id = vid) <> r.new_text THEN RAISE EXCEPTION 'S463f: live % %:% text is neither the read-back nor the fix — re-run the dump', r.bs, r.ch, r.vn; END IF;
  END LOOP;
  FOR pass IN 1..3 LOOP
  FOR r IN SELECT * FROM _s463f_so ORDER BY xid LOOP
    IF r.side = 'T' THEN
      SELECT x.id, x.note, t.ch, t.vn, t.es, t.bs, x.source_verse_id AS other_id INTO cur
        FROM cross_references x JOIN _s463f_sov t ON t.id = x.target_verse_id WHERE x.id = r.xid;
    ELSE
      SELECT x.id, x.note, s.ch, s.vn, s.es, s.bs, x.target_verse_id AS other_id INTO cur
        FROM cross_references x JOIN _s463f_sov s ON s.id = x.source_verse_id WHERE x.id = r.xid;
    END IF;
    IF cur.id IS NULL THEN
      IF pass = 3 THEN n_absent := n_absent + 1; RAISE NOTICE 'S463f card % absent', r.xid; END IF; CONTINUE;
    END IF;
    IF cur.es <> 'sonnini-acts-29' OR cur.bs <> r.ob THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463f card % extra end is %/% not sonnini-acts-29/% — skipped', r.xid, cur.es, cur.bs, r.ob; END IF; CONTINUE;
    END IF;
    IF cur.bs = r.nb AND cur.ch = r.nc AND cur.vn = r.nv AND cur.note = r.new_note THEN
      IF pass = 1 THEN n_same := n_same + 1; END IF; CONTINUE;
    END IF;
    IF NOT (cur.ch = r.oc AND cur.vn = r.ov) AND NOT (cur.bs = r.nb AND cur.ch = r.nc AND cur.vn = r.nv) THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1;
      RAISE NOTICE 'S463f card % is at % %:%, expected %:% — edited since the read-back, skipped', r.xid, cur.bs, cur.ch, cur.vn, r.oc, r.ov; END IF; CONTINUE;
    END IF;
    SELECT id INTO nid FROM _s463f_sov WHERE es = 'sonnini-acts-29' AND bs = r.nb AND ch = r.nc AND vn = r.nv;
    IF nid IS NULL THEN RAISE EXCEPTION 'S463f: live % %:% missing', r.nb, r.nc, r.nv; END IF;
    IF (SELECT text FROM _s463f_sov WHERE id = nid) <> r.live_text THEN
      RAISE EXCEPTION 'S463f: live % %:% text differs from the read-back the fix was written against — re-run the dump and rebuild', r.nb, r.nc, r.nv;
    END IF;
    IF r.quotes_live AND position(r.live_text IN r.new_note) = 0 THEN
      RAISE EXCEPTION 'S463f: new note for card % does not quote the live % %:% verbatim', r.xid, r.nb, r.nc, r.nv;
    END IF;
    IF nid = cur.other_id THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463f SKIPPED card % (-> % %:%): that is the card''s other verse', r.xid, r.nb, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    IF r.side = 'T' THEN
      SELECT count(*) INTO dup FROM cross_references x WHERE x.source_verse_id = cur.other_id AND x.target_verse_id = nid AND x.id <> r.xid;
    ELSE
      SELECT count(*) INTO dup FROM cross_references x WHERE x.target_verse_id = cur.other_id AND x.source_verse_id = nid AND x.id <> r.xid;
    END IF;
    IF dup > 0 THEN
      IF pass = 3 THEN n_skipped := n_skipped + 1; RAISE NOTICE 'S463f SKIPPED card % (-> % %:%): a card already sits on that pair', r.xid, r.nb, r.nc, r.nv; END IF;
      CONTINUE;
    END IF;
    IF r.side = 'T' THEN UPDATE cross_references SET target_verse_id = nid, note = r.new_note WHERE id = r.xid;
    ELSE UPDATE cross_references SET source_verse_id = nid, note = r.new_note WHERE id = r.xid; END IF;
    IF r.oc = r.nc AND r.ov = r.nv AND r.ob = r.nb THEN n_requoted := n_requoted + 1;
    ELSE n_moved := n_moved + 1; RAISE NOTICE 'S463f moved card %: % %:% -> %:% (%)', r.xid, r.nb, r.oc, r.ov, r.nc, r.nv, CASE WHEN r.side='T' THEN 'target' ELSE 'source' END; END IF;
  END LOOP;
  END LOOP;

  FOR r IN SELECT m.* FROM _s463f_som m LOOP
    UPDATE cross_reference_thread_members SET member_note = r.new_note
     WHERE thread_id = r.thread_id AND cross_reference_id = r.xid AND member_note IS DISTINCT FROM r.new_note;
    IF FOUND THEN n_mem := n_mem + 1; END IF;
  END LOOP;

  FOR r IN SELECT a.* FROM _s463f_soa a LOOP
    SELECT id INTO vid FROM _s463f_sov WHERE es = 'sonnini-acts-29' AND bs = r.nb AND ch = r.nc AND vn = r.nv;
    IF vid IS NULL THEN RAISE EXCEPTION 'S463f: live % %:% missing', r.nb, r.nc, r.nv; END IF;
    UPDATE cross_reference_threads SET anchor_verse_id_start = vid, anchor_verse_id_end = CASE WHEN anchor_verse_id_end = anchor_verse_id_start THEN vid ELSE anchor_verse_id_end END
      WHERE id = r.thread_id AND anchor_verse_id_start = (SELECT id FROM _s463f_sov WHERE es = 'sonnini-acts-29' AND bs = r.ob AND ch = r.oc AND vn = r.ov);
    IF FOUND THEN n_anc := n_anc + 1; RAISE NOTICE 'S463f thread % anchor moved %:% -> %:%', r.thread_id, r.oc, r.ov, r.nc, r.nv;
    ELSIF NOT EXISTS (SELECT 1 FROM cross_reference_threads WHERE id = r.thread_id AND anchor_verse_id_start = vid) THEN
      RAISE NOTICE 'S463f thread % anchor is neither the old nor the new verse — left alone', r.thread_id; END IF;
  END LOOP;

  FOR r IN SELECT s.* FROM _s463f_sos s LOOP
    UPDATE cross_reference_threads SET summary_md = r.new_summary, title = r.new_title WHERE id = r.thread_id AND summary_md = r.old_summary;
    IF FOUND THEN n_sum := n_sum + 1;
    ELSIF NOT EXISTS (SELECT 1 FROM cross_reference_threads WHERE id = r.thread_id AND summary_md = r.new_summary) THEN
      n_sum_skip := n_sum_skip + 1; RAISE NOTICE 'S463f SKIPPED thread % summary: live text is neither the old nor the new', r.thread_id;
    END IF;
  END LOOP;

  RAISE NOTICE 'S463f (sonnini-acts-29) summary: notes rewritten in place %, moved %, already landed %, skipped %, absent %; member notes updated %; summaries updated % (skipped %); verse texts fixed %; thread anchors moved %',
    n_requoted, n_moved, n_same, n_skipped, n_absent, n_mem, n_sum, n_sum_skip, n_txt, n_anc;
  IF n_skipped + n_absent + n_sum_skip > 0 THEN RAISE NOTICE 'S463f: read the SKIPPED/absent lines above — those rows still carry the old text'; END IF;
END $fix$;
COMMIT;
\echo 'session463f — sonnini-acts-29 done.'
