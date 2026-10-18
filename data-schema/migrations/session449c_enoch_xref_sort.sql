-- =====================================================================
-- Session 449c migration — 2026-10-15
-- 1 Enoch cross-reference cards on the removed (surplus) verses: re-point or retire
-- =====================================================================
-- Context: S449 rebuilt 1 Enoch to Charles 1917; 241 verse rows above
-- Charles's last verse were kept (blanked by 449b) because cards pointed
-- at them. S449 sorted the 416 cards on those rows by what the old verse
-- actually was (enoch-damage-summary.json provenance):
--   * 144 RE-POINT: the old verse was Charles text filed under the wrong
--     number (old 3:2 = Charles 4:1, old 17:9-21 = ch 18, the eight copies
--     of ch 25 ...). The card moves to the true verse; the note's own
--     "Enoch c:v" citation is rewritten; thread members follow the card.
--   * 272 RETIRE (1 self-reference after re-point) (deleted; archived in enoch-xrefs-retired.tsv with notes):
--     216 sat on an invented verse; 55 would duplicate a card that already
--     exists on the destination pair.
-- Thread anchors on surplus rows move the same way (mapped verse, else
-- the chapter's first/last Charles verse). Then every surplus row that is
-- no longer referenced is deleted; rows carrying reader highlights or
-- study notes (5) stay, blanked.
-- Run: python3 api/apply_migration.py data-schema/migrations/session449c_enoch_xref_sort.sql
-- =====================================================================
\echo 'session449c — Enoch xref sort starting...'
BEGIN;
CREATE TEMP TABLE _s449c_rep (xid INT, side TEXT, oc INT, ov INT, nc INT, nv INT) ON COMMIT DROP;
INSERT INTO _s449c_rep VALUES (15997,'source',3,2,4,1),
(15992,'source',3,2,4,1),
(15995,'source',3,2,4,1),
(15998,'source',3,2,4,1),
(16273,'source',11,3,10,13),
(16271,'source',11,5,10,15),
(16270,'source',11,5,10,15),
(16266,'source',11,6,10,16),
(16267,'source',11,9,10,19),
(16262,'source',11,11,10,21),
(16264,'source',11,11,10,21),
(16263,'source',11,11,10,21),
(16265,'source',11,11,10,21),
(16672,'source',17,9,18,2),
(16673,'source',17,10,18,3),
(16671,'source',17,15,18,8),
(16670,'source',17,15,18,8),
(16665,'source',17,19,18,14),
(16667,'source',17,19,18,14),
(16668,'source',17,20,18,15),
(16666,'source',17,21,18,16),
(16669,'source',17,21,18,16),
(16681,'source',18,18,21,10),
(16682,'source',18,18,21,10),
(16779,'source',24,9,25,3),
(16776,'source',24,9,25,3),
(16778,'source',24,9,25,3),
(16767,'source',24,10,25,4),
(16768,'source',24,11,25,5),
(16769,'source',24,11,25,5),
(16770,'source',24,11,25,5),
(16766,'source',24,12,25,6),
(16765,'source',24,12,25,6),
(16764,'source',24,12,25,6),
(17137,'source',25,9,15,11),
(17147,'source',26,8,25,4),
(17146,'source',26,8,25,4),
(17145,'source',26,9,25,5),
(17143,'source',26,10,25,6),
(17166,'source',27,6,25,3),
(17167,'source',27,6,25,3),
(17158,'source',27,8,25,5),
(17160,'source',27,8,25,5),
(17157,'source',27,9,25,6),
(17156,'source',27,9,25,6),
(17179,'source',28,4,30,1),
(17181,'source',28,4,30,1),
(17180,'source',28,4,30,1),
(17169,'source',28,10,25,3),
(17175,'source',28,11,25,4),
(17190,'source',29,9,25,3),
(17196,'source',30,7,32,6),
(17192,'source',30,10,25,6),
(17205,'source',31,4,32,6),
(17214,'source',32,8,25,5),
(17244,'source',34,6,18,2),
(17243,'source',34,6,18,2),
(17241,'source',34,7,18,2),
(17239,'source',34,7,18,2),
(17240,'source',34,8,18,3),
(17258,'target',34,4,34,2),
(17261,'source',35,2,34,2),
(17260,'source',35,2,34,2),
(17259,'source',35,2,34,2),
(17254,'source',35,5,18,2),
(17256,'source',35,5,18,2),
(17252,'source',35,6,18,2),
(17251,'source',35,7,18,3),
(17269,'source',36,5,18,3),
(17268,'source',36,5,18,3),
(17918,'source',37,6,1,4),
(17915,'source',37,7,1,5),
(17917,'source',37,8,1,6),
(17914,'source',37,9,1,7),
(17913,'source',37,9,1,7),
(17909,'source',37,10,1,8),
(17912,'source',37,10,1,8),
(17910,'source',37,10,1,8),
(17911,'source',37,10,1,8),
(17938,'source',38,10,49,4),
(17936,'source',38,10,49,4),
(17939,'source',38,10,49,4),
(17926,'source',38,12,69,28),
(17981,'source',40,17,38,3),
(18003,'source',42,8,62,14),
(18004,'source',42,8,62,14),
(18001,'source',42,9,51,4),
(18002,'source',42,9,51,4),
(18023,'source',43,7,18,3),
(18024,'source',43,7,18,3),
(18022,'source',43,9,18,5),
(18048,'source',44,2,41,4),
(18046,'source',44,3,41,5),
(18045,'source',44,3,41,5),
(18043,'source',44,4,41,7),
(18044,'source',44,4,41,7),
(18041,'source',44,5,41,8),
(18042,'source',44,5,41,8),
(18943,'source',45,11,51,1),
(18946,'source',45,11,51,1),
(18930,'source',45,12,51,2),
(18932,'source',45,12,51,2),
(19941,'source',59,4,41,5),
(21318,'source',66,8,62,13),
(21345,'source',68,7,8,1),
(21347,'source',68,8,8,2),
(21346,'source',68,9,8,3),
(21342,'source',68,10,8,4),
(21343,'source',68,10,8,4),
(21341,'source',68,10,8,4),
(21376,'source',69,38,9,9),
(21375,'source',69,38,9,9),
(21377,'source',69,38,9,9),
(22531,'source',77,11,18,15),
(22530,'source',77,11,18,15),
(22532,'source',77,11,18,15),
(22534,'source',77,11,18,15),
(22535,'source',77,11,18,15),
(23832,'source',84,7,9,9),
(23880,'source',88,4,89,1),
(23881,'source',88,4,89,1),
(23882,'source',88,4,89,1),
(23883,'source',88,4,89,1),
(23876,'source',88,5,89,2),
(23878,'source',88,8,89,5),
(23874,'source',88,9,89,6),
(25334,'source',94,18,96,5),
(25331,'source',94,18,96,5),
(25362,'source',95,8,97,9),
(25467,'source',102,12,96,5),
(25462,'source',102,13,97,8),
(25466,'source',102,13,97,8),
(25503,'source',104,14,96,5),
(25504,'source',104,15,97,8),
(25546,'source',108,16,100,12),
(25547,'source',108,16,100,12),
(12826,'target',24,11,25,5),
(14941,'target',24,11,25,5);
CREATE TEMP TABLE _s449c_ret (xid INT PRIMARY KEY) ON COMMIT DROP;
INSERT INTO _s449c_ret VALUES (15999), (15996), (16272), (16269), (16268), (16316), (16674), (16683), (16729), (16730), (16742), (16741), (16740), (16757), (16756), (16753), (16754), (16755), (16752), (17144), (17162), (17163), (17159), (17155), (17178), (17176), (17177), (17174), (17172), (17168), (17173), (17191), (17189), (17187), (17188), (17186), (17182), (17183), (17184), (17185), (17199), (17197), (17198), (17193), (17194), (17206), (17207), (17202), (17203), (17204), (17216), (17215), (17210), (17213), (17212), (17211), (17233), (17231), (17232), (17230), (17229), (17228), (17227), (17226), (17224), (17223), (17225), (17242), (17257), (17255), (17250), (17253), (17263), (17262), (17264), (17265), (17266), (17920), (17916), (17941), (17942), (17937), (17943), (17944), (17945), (17979), (17980), (17978), (17982), (17984), (18007), (18006), (18008), (18005), (17999), (17998), (18000), (18018), (18019), (18021), (18020), (18039), (18040), (18038), (18037), (18035), (18034), (18036), (18938), (18939), (18941), (18940), (18937), (18942), (18944), (18929), (18931), (18947), (18949), (18948), (19940), (21295), (21297), (21294), (21296), (21291), (21292), (21293), (21290), (21289), (21288), (21299), (21300), (21298), (21323), (21321), (21319), (21320), (21316), (21317), (21369), (21370), (21371), (21372), (21373), (21374), (21379), (21378), (21381), (21382), (21380), (22518), (22516), (22515), (22517), (22514), (22512), (22513), (22533), (22561), (22554), (22556), (22555), (22572), (22574), (22573), (22571), (22570), (22569), (23811), (23813), (23812), (23810), (23809), (23833), (23828), (23835), (23834), (23844), (23843), (23838), (23837), (23839), (23840), (23841), (23842), (23863), (23862), (23879), (23877), (23875), (25299), (25298), (25300), (25297), (25295), (25294), (25293), (25296), (25310), (25338), (25336), (25337), (25332), (25346), (25351), (25357), (25360), (25359), (25358), (25353), (25356), (25355), (25354), (25384), (25386), (25387), (25388), (25389), (25390), (25394), (25395), (25396), (25401), (25400), (25392), (25391), (25393), (25468), (25465), (25464), (25461), (25483), (25481), (25480), (25479), (25482), (25502), (25499), (25500), (25501), (25526), (25525), (25528), (25527), (25521), (25520), (25522), (25524), (25523), (25516), (25518), (25519), (25517), (25541), (25544), (25538), (25540), (25532), (25543), (25542), (25535), (25537), (25536), (25539), (25534), (25533), (59359), (145068), (62563), (7954), (16758), (17171), (17170), (17195), (18945), (21303), (21344);
CREATE TEMP TABLE _s449c_prov (oc INT, ov INT, nc INT, nv INT, PRIMARY KEY (oc,ov)) ON COMMIT DROP;
INSERT INTO _s449c_prov VALUES (3,2,4,1), (5,7,1,8), (5,8,1,9), (10,22,10,21), (11,1,10,11), (11,2,10,12), (11,3,10,13), (11,4,10,14), (11,5,10,15), (11,6,10,16), (11,7,10,17), (11,8,10,18), (11,9,10,19), (11,10,10,20), (11,11,10,21), (11,12,10,21), (11,13,10,21), (14,5,39,4), (14,9,18,4), (14,12,18,5), (14,13,18,6), (14,14,18,7), (14,15,18,8), (14,17,18,11), (14,18,18,12), (14,19,18,14), (14,20,18,15), (14,21,18,16), (15,11,16,1), (17,9,18,2), (17,10,18,3), (17,11,18,4), (17,12,18,5), (17,13,18,6), (17,14,18,7), (17,15,18,8), (17,17,18,11), (17,18,18,12), (17,19,18,14), (17,20,18,15), (17,21,18,16), (18,15,21,7), (18,16,21,8), (18,17,21,9), (18,18,21,10), (21,2,18,11), (21,3,18,12), (21,4,18,13), (21,5,18,14), (21,6,18,15), (21,7,18,16), (22,1,34,1), (22,2,18,11), (22,3,18,12), (22,4,21,3), (22,5,21,4), (22,6,21,9), (22,7,21,10), (23,6,72,3), (24,5,32,5), (24,7,25,1), (24,8,25,2), (24,9,25,3), (24,10,25,4), (24,11,25,5), (24,12,25,6), (25,1,15,1), (25,2,15,2), (25,3,15,3), (25,4,15,4), (25,5,15,5), (25,6,15,8), (25,7,15,9), (25,8,15,10), (25,9,15,11), (25,10,15,12), (25,11,16,1), (26,3,30,2), (26,4,30,3), (26,6,24,6), (26,7,25,3), (26,8,25,4), (26,9,25,5), (26,10,25,6), (27,1,26,1), (27,2,26,2), (27,3,30,2), (27,4,30,3), (27,6,25,3), (27,7,25,4), (27,8,25,5), (27,9,25,6), (28,1,23,1), (28,4,30,1), (28,7,24,6), (28,8,25,1), (28,9,25,2), (28,10,25,3), (28,11,25,4), (28,12,25,5), (28,13,25,6), (29,4,30,1), (29,7,25,1), (29,8,25,2), (29,9,25,3), (29,10,25,4), (29,11,25,5), (29,12,25,6), (30,2,31,2), (30,7,32,6), (30,9,25,5), (30,10,25,6), (31,2,32,4), (31,4,32,6), (31,6,25,5), (31,7,25,6), (32,8,25,5), (32,9,25,6), (33,3,72,3), (33,6,18,2), (33,7,18,4), (33,8,18,5), (33,9,18,5), (34,2,34,2), (34,4,34,2), (34,6,18,2), (34,7,18,2), (34,8,18,3), (35,2,34,2), (35,3,34,1), (35,5,18,2), (35,6,18,2), (35,7,18,3), (35,8,34,2), (36,3,18,2), (36,4,18,2), (36,5,18,3), (36,6,34,2), (36,8,18,2), (37,4,1,2), (37,5,1,3), (37,6,1,4), (37,7,1,5), (37,8,1,6), (37,9,1,7), (37,10,1,8), (38,2,69,28), (38,10,49,4), (38,12,69,28), (39,6,51,5), (39,7,62,14), (39,8,51,4), (39,12,40,3), (39,13,40,4), (39,14,40,5), (39,15,40,6), (39,16,40,7), (39,17,40,8), (39,18,40,9), (40,17,38,3), (40,18,38,3), (40,19,38,3), (40,20,38,3), (40,23,38,3), (42,4,41,2), (42,5,39,5), (42,7,51,5), (42,8,62,14), (42,9,51,4), (43,6,18,2), (43,7,18,3), (43,8,18,4), (43,9,18,5), (43,10,18,5), (44,1,41,3), (44,2,41,4), (44,3,41,5), (44,4,41,7), (44,5,41,8), (45,4,45,4), (45,11,51,1), (45,12,51,2), (46,8,46,7), (48,8,63,1), (52,6,56,4), (52,7,56,5), (52,8,56,6), (59,2,41,3), (59,3,41,4), (59,4,41,5), (60,12,71,4), (60,13,41,3), (60,14,41,4), (61,12,56,2), (62,1,61,8), (62,2,61,9), (62,3,61,10), (62,4,61,11), (62,6,49,4), (62,7,71,14), (62,8,46,3), (62,9,46,4), (62,10,46,5), (62,12,46,6), (63,2,62,2), (63,3,62,9), (63,4,62,10), (63,6,69,27), (63,8,62,5), (64,5,43,3), (65,10,15,12), (65,13,10,21), (66,8,62,13), (67,1,10,13), (67,2,54,6), (67,3,51,1), (67,4,47,3), (67,5,47,4), (68,1,6,6), (68,2,6,7), (68,3,6,8), (68,5,6,7), (68,6,6,8), (68,7,8,1), (68,8,8,2), (68,9,8,3), (68,10,8,4), (69,4,6,8), (69,5,8,1), (69,6,8,2), (69,7,8,3), (69,34,8,4), (69,35,67,12), (69,37,9,8), (69,38,9,9), (69,40,15,12), (70,1,71,1), (70,2,71,2), (70,3,71,3), (70,4,71,4), (70,5,71,5), (70,8,60,12), (70,9,71,5), (70,11,70,4), (71,7,70,4), (71,8,60,12), (71,9,71,5), (71,11,70,4), (71,12,71,5), (72,11,72,11), (74,9,78,9), (75,11,82,13), (76,3,76,13), (77,8,32,4), (77,9,18,12), (77,10,18,14), (77,11,18,15), (77,12,18,16), (80,1,80,4), (80,2,80,4), (80,3,80,4), (84,3,9,5), (84,4,9,6), (84,5,9,7), (84,6,9,8), (84,7,9,9), (86,1,90,8), (86,3,90,8), (86,4,90,8), (86,5,90,8), (86,6,90,8), (86,7,90,8), (86,8,90,8), (86,9,90,8), (86,10,90,8), (87,6,90,8), (87,7,90,8), (87,8,90,8), (87,9,90,8), (87,10,90,8), (88,4,89,1), (88,5,89,2), (88,6,89,3), (88,7,89,4), (88,8,89,5), (88,9,89,6), (88,10,89,7), (88,11,89,8), (89,25,89,29), (89,49,90,37), (89,50,90,38), (89,52,90,39), (94,6,96,5), (94,7,97,8), (94,8,97,9), (94,17,99,11), (94,18,96,5), (94,20,96,5), (94,21,99,11), (95,1,99,1), (95,3,99,11), (95,4,99,11), (95,6,96,5), (95,7,97,8), (95,8,97,9), (95,16,99,11), (96,1,96,5), (96,5,97,8), (96,6,97,9), (96,14,99,11), (97,1,99,1), (97,3,99,11), (97,4,99,11), (97,6,96,5), (97,16,99,11), (102,1,91,18), (102,2,47,1), (102,8,103,5), (102,10,96,5), (102,12,96,5), (102,13,97,8), (102,14,97,9), (103,13,100,8), (103,14,96,5), (103,15,97,8), (103,16,97,9), (104,1,103,1), (104,13,100,8), (104,14,96,5), (104,15,97,8), (104,16,97,9), (106,2,18,2), (106,3,18,5), (106,4,18,6), (106,5,18,7), (106,6,18,8), (106,7,18,9), (106,8,18,12), (106,9,18,14), (106,10,18,15), (106,11,18,16), (107,1,106,5), (107,2,106,6), (108,5,100,1), (108,6,100,2), (108,7,100,3), (108,8,100,4), (108,9,100,5), (108,10,100,6), (108,11,100,7), (108,12,100,8), (108,13,100,9), (108,14,100,10), (108,15,100,11), (108,16,100,12), (108,17,100,13);
CREATE TEMP TABLE _s449c_max (ch INT PRIMARY KEY, hi INT) ON COMMIT DROP;
INSERT INTO _s449c_max VALUES (1,9), (2,3), (3,1), (4,1), (5,9), (6,8), (7,6), (8,4), (9,11), (10,22), (11,2), (12,6), (13,10), (14,25), (15,12), (16,4), (17,8), (18,16), (19,3), (20,8), (21,10), (22,14), (23,4), (24,6), (25,7), (26,6), (27,5), (28,3), (29,2), (30,3), (31,3), (32,6), (33,4), (34,3), (35,1), (36,4), (37,5), (38,6), (39,14), (40,10), (41,9), (42,3), (43,4), (44,1), (45,6), (46,8), (47,4), (48,10), (49,4), (50,5), (51,5), (52,9), (53,7), (54,10), (55,4), (56,8), (57,3), (58,6), (59,3), (60,25), (61,13), (62,16), (63,12), (64,2), (65,12), (66,3), (67,13), (68,5), (69,29), (70,4), (71,17), (72,37), (73,8), (74,17), (75,9), (76,14), (77,8), (78,17), (79,6), (80,8), (81,10), (82,20), (83,11), (84,6), (85,10), (86,6), (87,4), (88,3), (89,77), (90,42), (91,19), (92,5), (93,14), (94,11), (95,7), (96,8), (97,10), (98,16), (99,16), (100,13), (101,9), (102,11), (103,15), (104,13), (105,2), (106,19), (107,3), (108,15);

CREATE TEMP VIEW _s449c_ev AS
  SELECT v.id, c.chapter_number ch, v.verse_number vn FROM verses v
    JOIN chapters c ON c.id=v.chapter_id JOIN books b ON b.id=c.book_id AND b.slug='1-enoch'
    JOIN editions e ON e.id=b.edition_id AND e.slug='enoch';

DO $pre$ DECLARE n INT; BEGIN
  SELECT count(*) INTO n FROM cross_references x JOIN _s449c_ret r ON r.xid=x.id;
  RAISE NOTICE 'S449c retire set found in DB: % of %', n, (SELECT count(*) FROM _s449c_ret);
  SELECT count(DISTINCT xid) INTO n FROM _s449c_rep r JOIN cross_references x ON x.id=r.xid;
  RAISE NOTICE 'S449c re-point set found in DB: % of %', n, (SELECT count(DISTINCT xid) FROM _s449c_rep);
END $pre$;

-- 1. Retire: thread members first (FK RESTRICT), then the cards
DELETE FROM cross_reference_thread_members m USING _s449c_ret r WHERE m.cross_reference_id = r.xid;
DELETE FROM cross_references x USING _s449c_ret r WHERE x.id = r.xid;

-- 2. Re-point sources / targets and rewrite the note citation
UPDATE cross_references x
   SET source_verse_id = nv.id,
       note = regexp_replace(coalesce(x.note,''), '(1 )?Enoch ' || r.oc || ':' || r.ov || '(?!\d)', '1 Enoch ' || r.nc || ':' || r.nv, 'g')
  FROM _s449c_rep r JOIN _s449c_ev nv ON nv.ch = r.nc AND nv.vn = r.nv
 WHERE r.side = 'source' AND x.id = r.xid;
UPDATE cross_references x
   SET target_verse_id = nv.id,
       note = regexp_replace(coalesce(x.note,''), '(1 )?Enoch ' || r.oc || ':' || r.ov || '(?!\d)', '1 Enoch ' || r.nc || ':' || r.nv, 'g')
  FROM _s449c_rep r JOIN _s449c_ev nv ON nv.ch = r.nc AND nv.vn = r.nv
 WHERE r.side = 'target' AND x.id = r.xid;

-- 3. Thread anchors on surplus rows: mapped verse, else first/last Charles verse of the chapter
UPDATE cross_reference_threads t
   SET anchor_verse_id_start = coalesce(
        (SELECT nv.id FROM _s449c_prov p JOIN _s449c_ev nv ON nv.ch=p.nc AND nv.vn=p.nv WHERE p.oc=ov.ch AND p.ov=ov.vn),
        (SELECT nv.id FROM _s449c_ev nv WHERE nv.ch=ov.ch AND nv.vn=1))
  FROM _s449c_ev ov JOIN _s449c_max m ON m.ch=ov.ch
 WHERE t.anchor_verse_id_start = ov.id AND ov.vn > m.hi;
UPDATE cross_reference_threads t
   SET anchor_verse_id_end = coalesce(
        (SELECT nv.id FROM _s449c_prov p JOIN _s449c_ev nv ON nv.ch=p.nc AND nv.vn=p.nv WHERE p.oc=ov.ch AND p.ov=ov.vn),
        (SELECT nv.id FROM _s449c_ev nv JOIN _s449c_max mm ON mm.ch=nv.ch WHERE nv.ch=ov.ch AND nv.vn=mm.hi))
  FROM _s449c_ev ov JOIN _s449c_max m ON m.ch=ov.ch
 WHERE t.anchor_verse_id_end = ov.id AND ov.vn > m.hi;
-- a thread whose start now sits after its end (both anchors were surplus) gets the range swapped
UPDATE cross_reference_threads t SET anchor_verse_id_start = t.anchor_verse_id_end, anchor_verse_id_end = t.anchor_verse_id_start
  FROM _s449c_ev a, _s449c_ev b
 WHERE a.id = t.anchor_verse_id_start AND b.id = t.anchor_verse_id_end AND a.ch = b.ch AND a.vn > b.vn;

-- 4. Delete surplus rows that nothing references any more
DO $surplus$
DECLARE r RECORD; fk RECORD; hit BOOLEAN; refs TEXT; ndel INT := 0; nkept INT := 0;
BEGIN
    FOR r IN SELECT ov.id, ov.ch, ov.vn FROM _s449c_ev ov JOIN _s449c_max m ON m.ch=ov.ch WHERE ov.vn > m.hi ORDER BY 2,3
    LOOP
        refs := '';
        FOR fk IN SELECT cl.relname AS tbl, a.attname AS col FROM pg_constraint con
                    JOIN pg_class cl ON cl.oid = con.conrelid JOIN pg_namespace ns ON ns.oid = cl.relnamespace
                    JOIN pg_attribute a ON a.attrelid = con.conrelid AND a.attnum = con.conkey[1]
                   WHERE con.contype='f' AND con.confrelid='verses'::regclass AND ns.nspname NOT LIKE 'pg_temp%'
        LOOP
            EXECUTE format('SELECT EXISTS (SELECT 1 FROM %I WHERE %I = $1)', fk.tbl, fk.col) INTO hit USING r.id;
            IF hit THEN refs := refs || fk.tbl || '.' || fk.col || ' '; END IF;
        END LOOP;
        IF refs = '' THEN DELETE FROM verses WHERE id = r.id; ndel := ndel + 1;
        ELSE nkept := nkept + 1; RAISE NOTICE 'S449c KEPT %:% (id %) — %', r.ch, r.vn, r.id, refs; END IF;
    END LOOP;
    RAISE NOTICE 'S449c surplus rows deleted: %, kept: %', ndel, nkept;
END $surplus$;

DO $verify$ DECLARE n INT; BEGIN
  SELECT count(*) INTO n FROM cross_references x JOIN _s449c_ret r ON r.xid=x.id;
  IF n <> 0 THEN RAISE EXCEPTION 'S449c: % retired cards still present', n; END IF;
  SELECT count(*) INTO n FROM cross_references x JOIN _s449c_rep r ON r.xid=x.id AND r.side='source'
     JOIN _s449c_ev ov ON ov.id=x.source_verse_id JOIN _s449c_max m ON m.ch=ov.ch WHERE ov.vn > m.hi;
  IF n <> 0 THEN RAISE EXCEPTION 'S449c: % re-pointed cards still on a surplus source', n; END IF;
  SELECT count(*) INTO n FROM _s449c_ev ov JOIN _s449c_max m ON m.ch=ov.ch WHERE ov.vn > m.hi;
  RAISE NOTICE 'S449c AFTER surplus Enoch rows remaining: %', n;
  SELECT count(*) INTO n FROM cross_references x JOIN verses sv ON sv.id=x.source_verse_id JOIN chapters sc ON sc.id=sv.chapter_id JOIN books sb ON sb.id=sc.book_id
      JOIN verses tv ON tv.id=x.target_verse_id JOIN chapters tc ON tc.id=tv.chapter_id JOIN books tb ON tb.id=tc.book_id WHERE sb.slug='1-enoch' OR tb.slug='1-enoch';
  RAISE NOTICE 'S449c AFTER cross-references touching 1 Enoch: %', n;
END $verify$;
COMMIT;
\echo 'session449c — done.'