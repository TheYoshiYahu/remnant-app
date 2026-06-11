-- ----- fragment: minion_jubilees_05.sql (session251 jubilees 5) -----
-- Source anchor: jubilees/jubilees ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju05 (view _session251_ju05_lookup). Sort band base 53100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-5-watchers-giants
  ('jubilees', 'jubilees', 5, 1, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The angels who took wives in Jubilees 5:1 are the sons of Elohim Moses recorded in Genesis.'),
  ('jubilees', 'jubilees', 5, 1, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants Jubilees 5:1 names are Genesis'' giants, the offspring of that union.'),
  ('jubilees', 'jubilees', 5, 2, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The increase of lawlessness and devouring in Jubilees 5:2 is Genesis'' earth filled with violence.'),
  ('jubilees', 'jubilees', 5, 2, 'enoch', '1-enoch', 7, 3, 'extras', E'1 Enoch 7:3 — *Who consumed all the acquisitions of men. And when men could no longer sustain them, the giants turned against them and devoured mankind.* The mutual devouring of Jubilees 5:2 is the giants'' cannibal violence in the live Enoch apparatus.'),
  ('jubilees', 'jubilees', 5, 3, 'canon', 'genesis', 6, 12, 'free', E'Genesis 6:12 — *And Elohim (God) looked upon the earth, and, behold, it was corrupt; for all flesh had corrupted his way upon the earth.* Jubilees 5:3 (''Elohim looked upon the earth, and behold it was corrupt'') quotes Genesis almost verbatim.'),
  -- thread: jubilees-5-noah-found-grace
  ('jubilees', 'jubilees', 5, 4, 'canon', 'genesis', 6, 7, 'free', E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* Jubilees 5:4 (''I shall destroy man and all flesh'') is Genesis'' sentence of judgement word for word.'),
  ('jubilees', 'jubilees', 5, 5, 'canon', 'genesis', 6, 8, 'free', E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* Jubilees 5:5 carries Genesis'' line nearly unchanged — the one man kept while the world is judged.'),
  ('jubilees', 'jubilees', 5, 5, 'canon', '2-peter', 2, 5, 'free', E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly.* Peter reads the grace of Jubilees 5:5 as the pattern of judgement-with-rescue that runs the whole canon.'),
  ('jubilees', 'jubilees', 5, 5, 'enoch', '1-enoch', 10, 3, 'extras', E'1 Enoch 10:3 — *And now instruct him that he may escape and his seed may be preserved for all the generations of the world.* The grace Noah found in Jubilees 5:5 is, in the Enoch apparatus, the seed preserved through the Flood.'),
  -- thread: jubilees-5-angels-bound
  ('jubilees', 'jubilees', 5, 6, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude preaches the very binding Jubilees 5:6 records — angels chained until the great day.'),
  ('jubilees', 'jubilees', 5, 6, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter''s chains of darkness are the depths of the earth Jubilees 5:6 binds the Watchers in.'),
  ('jubilees', 'jubilees', 5, 9, 'enoch', '1-enoch', 10, 9, 'extras', E'1 Enoch 10:9 — *Proceed against the bastards and the reprobates, and against the children of fornication... send them one against the other that they may destroy each other in battle: for length of days shall they not have.* The sword turning the giants against each other in Jubilees 5:9 is this command in the Enoch apparatus.'),
  ('jubilees', 'jubilees', 5, 10, 'enoch', '1-enoch', 10, 12, 'extras', E'1 Enoch 10:12 — *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The binding ''until the day of the great condemnation'' in Jubilees 5:10 is this same reserved judgement.'),
  -- thread: jubilees-5-heavenly-tables-judgment
  ('jubilees', 'jubilees', 5, 13, 'canon', 'psalms', 139, 16, 'free', E'Psalm 139:16 — *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* The judgement ''written on the heavenly tables'' in Jubilees 5:13 is the same pre-written book David knew.'),
  ('jubilees', 'jubilees', 5, 13, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The heavenly tables of Jubilees 5:13 are this book of remembrance kept before Yahuah.'),
  ('jubilees', 'jubilees', 5, 14, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *and at that time thy people shall be delivered, every one that shall be found written in the book.* The judgements ''ordained and written and engraved'' in Jubilees 5:14 are the book by which Daniel''s people are delivered at the end.'),
  ('jubilees', 'jubilees', 5, 16, 'canon', 'deuteronomy', 10, 17, 'free', E'Deuteronomy 10:17 — *For Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty, and a terrible, which regardeth not persons, nor taketh reward.* The impartial judge of Jubilees 5:16 is the Torah''s own Elohim, who takes no gifts.'),
  ('jubilees', 'jubilees', 5, 16, 'canon', 'romans', 2, 11, 'free', E'Romans 2:11 — *For there is no respect of persons with Elohim (God).* Paul presses the same impartiality Jubilees 5:16 declares onto Jew and Gentile alike at the judgement.'),
  -- thread: jubilees-5-once-a-year-atonement
  ('jubilees', 'jubilees', 5, 18, 'canon', 'leviticus', 16, 30, 'free', E'Leviticus 16:30 — *For on that day shall the priest make an atonement for you, to cleanse you, that ye may be clean from all your sins before Yahuah (LORD).* The mercy ''once each year'' in Jubilees 5:18 is the Day of Atonement cleansing the Torah commands.'),
  ('jubilees', 'jubilees', 5, 18, 'canon', 'leviticus', 23, 27, 'free', E'Leviticus 23:27 — *Also on the tenth day of this seventh month there shall be a day of atonement: it shall be an holy convocation unto you; and ye shall afflict your souls, and offer an offering made by fire unto Yahuah (LORD).* The yearly turning of Jubilees 5:18 is fixed as a moed in the Torah''s feast calendar.'),
  ('jubilees', 'jubilees', 5, 16, 'canon', 'leviticus', 16, 29, 'free', E'Leviticus 16:29 — *And this shall be a statute for ever unto you: that in the seventh month, on the tenth day of the month, ye shall afflict your souls, and do no work at all.* Jubilees 5:16 promises Israel forgiveness if they turn — the Torah fixes the ''statute for ever'' on which that yearly pardon hangs.'),
  -- thread: jubilees-5-the-flood
  ('jubilees', 'jubilees', 5, 20, 'canon', 'genesis', 6, 13, 'free', E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* Jubilees 5:20 retells this sentence of destruction with the command to build the ark.'),
  ('jubilees', 'jubilees', 5, 20, 'canon', 'genesis', 6, 14, 'free', E'Genesis 6:14 — *Make thee an ark of gopher wood; rooms shalt thou make in the ark, and shalt pitch it within and without with pitch.* The ark Noah is commanded to make in Jubilees 5:20 is Genesis'' ark of gopher wood.'),
  ('jubilees', 'jubilees', 5, 23, 'canon', 'genesis', 7, 11, 'free', E'Genesis 7:11 — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* Jubilees 5:23 dates the flood-gates to the second month exactly as Genesis dates the great deep.'),
  ('jubilees', 'jubilees', 5, 23, 'canon', 'genesis', 7, 12, 'free', E'Genesis 7:12 — *And the rain was upon the earth forty days and forty nights.* The forty days and forty nights of Jubilees 5:23 are Genesis'' forty-day rain.'),
  ('jubilees', 'jubilees', 5, 23, 'canon', 'genesis', 7, 24, 'free', E'Genesis 7:24 — *And the waters prevailed upon the earth an hundred and fifty days.* The ''five months-one hundred and fifty days'' of Jubilees 5:23 is Genesis'' hundred and fifty days exactly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-5-watchers-giants',
       E'The angels took wives, and the earth was corrupted — it ain''t new',
       E'Jubilees opens chapter 5 with the descent of the Watchers: *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants* (Jubilees 5:1). This is the very same scene Moses set down in Genesis: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and *There were giants in the earth in those days... the same became mighty men which were of old, men of renown* (Genesis 6:4). Jubilees then tells how *lawlessness increased on the earth and all flesh corrupted its way... and they began to devour each other* (Jubilees 5:2) — Genesis names the same ruin: *the earth was filled with violence... for all flesh had corrupted his way upon the earth* (Genesis 6:11-12). The live 1 Enoch apparatus tells the identical story from the angels'' side: *the angels, the children of the heaven, saw and lusted after them* (1 Enoch 6:2) and *they became pregnant, and they bare great giants... the giants turned against them and devoured mankind* (1 Enoch 7:2-3). One Flood, one Watcher-rebellion, three witnesses agreeing word for word — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53100
  FROM _session251_ju05_lookup sv, _session251_ju05_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-5-noah-found-grace',
       E'But Noah found grace — the one man kept',
       E'Against the whole corrupted world Jubilees lifts up a single righteous man: *But Noah found grace before the eyes of Yahuah (God)* (Jubilees 5:5) — the same six words Moses wrote: *But Noah found grace in the eyes of Yahuah (LORD)* (Genesis 6:8). Jubilees explains why the seed was kept through him: *no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways* (Jubilees 5:19). Peter reads the Flood as the pattern of judgement and rescue together: *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly* (2 Peter 2:5). And in the live 1 Enoch apparatus the warning to Noah is spoken plainly: *Go to Noah and tell him in My Name ''Hide thyself!''... that he may escape and his seed may be preserved for all the generations of the world* (1 Enoch 10:2-3). The seed is kept; the righteous remnant is carried through the waters — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53103
  FROM _session251_ju05_lookup sv, _session251_ju05_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-5-angels-bound',
       E'Bound in the depths until the day of the great condemnation',
       E'Jubilees tells what was done to the rebel angels: *And against the angels whom He had sent upon the earth, He was exceedingly wroth... and He bade us to bind them in the depths of the earth, and behold they are bound in the midst of them, and are (kept) separate* (Jubilees 5:6), and they remain *bound in the depths of the earth for ever, until the day of the great condemnation when judgment is executed on all those who have corrupted their ways* (Jubilees 5:10). The apostles preach exactly this binding: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6), and *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). The live 1 Enoch apparatus gives the command itself: *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement* (1 Enoch 10:12). Their giant sons are slain by the sword among themselves: *He sent His sword into their midst that each should slay his neighbour* (Jubilees 5:9) answers 1 Enoch 10:9. Jude and Peter are not inventing a doctrine — they are quoting the apparatus the fathers already had. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53106
  FROM _session251_ju05_lookup sv, _session251_ju05_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=5 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-5-heavenly-tables-judgment',
       E'Ordained and engraved on the heavenly tables — and no respecter of persons',
       E'Jubilees grounds the coming judgement not in caprice but in writing already engraved: *And the judgment of all is ordained and written on the heavenly tables in righteousness* (Jubilees 5:13), and *all their judgments are ordained and written and engraved* (Jubilees 5:14). This is Yoshi''s heavenly-tablets framework — the history and the verdict pre-written before they unfold. Scripture knows these books: *and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them* (Psalm 139:16); *a book of remembrance was written before him for them that feared Yahuah (LORD)* (Malachi 3:16); *thy people shall be delivered, every one that shall be found written in the book* (Daniel 12:1). And the Judge of those tablets shows no favor: *He is not one who will regard the person (of any), nor is He one who will receive gifts... for He is a righteous judge* (Jubilees 5:16) is the Torah''s own character — *which regardeth not persons, nor taketh reward* (Deuteronomy 10:17) — which Paul presses on Jew and Gentile alike: *For there is no respect of persons with Elohim (God)* (Romans 2:11). The verdict was written before the Watchers ever fell. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53109
  FROM _session251_ju05_lookup sv, _session251_ju05_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-5-once-a-year-atonement',
       E'Mercy to all who turn, once each year — the Day of Atonement engraved',
       E'Woven into the judgement is the appointed time of mercy: *It is written and ordained that He will show mercy to all who turn from all their guilt once each year* (Jubilees 5:18). This is the Day of Atonement, and Jubilees grounds it — like the Sabbath of chapter 2 and the Feast of Weeks of chapter 6 — in what is *written and ordained*, engraved on the tablets, not in a later invention. The Torah sets the same day: *in the seventh month, on the tenth day of the month, ye shall afflict your souls... For on that day shall the priest make an atonement for you, to cleanse you, that ye may be clean from all your sins before Yahuah (LORD)* (Leviticus 16:29-30), and *Also on the tenth day of this seventh month there shall be a day of atonement: it shall be an holy convocation unto you* (Leviticus 23:27). The annual cleansing ''once each year'' is the Appointed Time Yahuah set from the beginning. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53112
  FROM _session251_ju05_lookup sv, _session251_ju05_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=5 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-5-the-flood',
       E'The ark, the flood-gates, the forty days — the Flood retold',
       E'Jubilees retells the Flood from Genesis, dated to the heavens. *And Yahuah (God) said that He would destroy everything which was upon the earth... And He commanded Noah to make him an ark, that he might save himself from the waters of the flood* (Jubilees 5:20) is Genesis'' command: *And Elohim (God) said unto Noah, The end of all flesh is come before me... Make thee an ark of gopher wood* (Genesis 6:13-14). Jubilees fixes the very day Genesis fixes — *he entered in the sixth (year) thereof, in the second month, on the new moon of the second month* (Jubilees 5:23) beside *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month... were all the fountains of the great deep broken up, and the windows of heaven were opened* (Genesis 7:11). The waters obey the same count: *forty days and forty nights* (Jubilees 5:23) is *the rain was upon the earth forty days and forty nights* (Genesis 7:12); *Fifteen cubits did the waters rise above all the high mountains* (Jubilees 5:23) is *Fifteen cubits upward did the waters prevail; and the mountains were covered* (Genesis 7:20); the *five months-one hundred and fifty days* (Jubilees 5:23) is *the waters prevailed upon the earth an hundred and fifty days* (Genesis 7:24). One Flood, dated to the new moons of the heavenly calendar — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53115
  FROM _session251_ju05_lookup sv, _session251_ju05_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=20
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=5 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-5-watchers-giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The angels who took wives in Jubilees 5:1 are the sons of Elohim Moses recorded in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-watchers-giants'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants Jubilees 5:1 names are Genesis'' giants, the offspring of that union.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-watchers-giants'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The increase of lawlessness and devouring in Jubilees 5:2 is Genesis'' earth filled with violence.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-watchers-giants'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 7:3 — *Who consumed all the acquisitions of men. And when men could no longer sustain them, the giants turned against them and devoured mankind.* The mutual devouring of Jubilees 5:2 is the giants'' cannibal violence in the live Enoch apparatus.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-watchers-giants'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 6:12 — *And Elohim (God) looked upon the earth, and, behold, it was corrupt; for all flesh had corrupted his way upon the earth.* Jubilees 5:3 (''Elohim looked upon the earth, and behold it was corrupt'') quotes Genesis almost verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-watchers-giants'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-5-noah-found-grace
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* Jubilees 5:4 (''I shall destroy man and all flesh'') is Genesis'' sentence of judgement word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-noah-found-grace'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* Jubilees 5:5 carries Genesis'' line nearly unchanged — the one man kept while the world is judged.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-noah-found-grace'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly.* Peter reads the grace of Jubilees 5:5 as the pattern of judgement-with-rescue that runs the whole canon.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-noah-found-grace'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:3 — *And now instruct him that he may escape and his seed may be preserved for all the generations of the world.* The grace Noah found in Jubilees 5:5 is, in the Enoch apparatus, the seed preserved through the Flood.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-noah-found-grace'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-5-angels-bound
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude preaches the very binding Jubilees 5:6 records — angels chained until the great day.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-angels-bound'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter''s chains of darkness are the depths of the earth Jubilees 5:6 binds the Watchers in.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-angels-bound'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:9 — *Proceed against the bastards and the reprobates, and against the children of fornication... send them one against the other that they may destroy each other in battle: for length of days shall they not have.* The sword turning the giants against each other in Jubilees 5:9 is this command in the Enoch apparatus.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-angels-bound'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:12 — *bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The binding ''until the day of the great condemnation'' in Jubilees 5:10 is this same reserved judgement.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-angels-bound'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-5-heavenly-tables-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 139:16 — *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* The judgement ''written on the heavenly tables'' in Jubilees 5:13 is the same pre-written book David knew.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-heavenly-tables-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:16 — *a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The heavenly tables of Jubilees 5:13 are this book of remembrance kept before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-heavenly-tables-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:1 — *and at that time thy people shall be delivered, every one that shall be found written in the book.* The judgements ''ordained and written and engraved'' in Jubilees 5:14 are the book by which Daniel''s people are delivered at the end.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-heavenly-tables-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 10:17 — *For Yahuah Elohaychem (the LORD your God) is Elohim (God) of gods, and Lord of lords, a great Elohim (God), a mighty, and a terrible, which regardeth not persons, nor taketh reward.* The impartial judge of Jubilees 5:16 is the Torah''s own Elohim, who takes no gifts.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-heavenly-tables-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 2:11 — *For there is no respect of persons with Elohim (God).* Paul presses the same impartiality Jubilees 5:16 declares onto Jew and Gentile alike at the judgement.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-heavenly-tables-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-5-once-a-year-atonement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:30 — *For on that day shall the priest make an atonement for you, to cleanse you, that ye may be clean from all your sins before Yahuah (LORD).* The mercy ''once each year'' in Jubilees 5:18 is the Day of Atonement cleansing the Torah commands.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-once-a-year-atonement'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 23:27 — *Also on the tenth day of this seventh month there shall be a day of atonement: it shall be an holy convocation unto you; and ye shall afflict your souls, and offer an offering made by fire unto Yahuah (LORD).* The yearly turning of Jubilees 5:18 is fixed as a moed in the Torah''s feast calendar.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-once-a-year-atonement'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 16:29 — *And this shall be a statute for ever unto you: that in the seventh month, on the tenth day of the month, ye shall afflict your souls, and do no work at all.* Jubilees 5:16 promises Israel forgiveness if they turn — the Torah fixes the ''statute for ever'' on which that yearly pardon hangs.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-once-a-year-atonement'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-5-the-flood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* Jubilees 5:20 retells this sentence of destruction with the command to build the ark.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-the-flood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:14 — *Make thee an ark of gopher wood; rooms shalt thou make in the ark, and shalt pitch it within and without with pitch.* The ark Noah is commanded to make in Jubilees 5:20 is Genesis'' ark of gopher wood.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-the-flood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 7:11 — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* Jubilees 5:23 dates the flood-gates to the second month exactly as Genesis dates the great deep.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-the-flood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 7:12 — *And the rain was upon the earth forty days and forty nights.* The forty days and forty nights of Jubilees 5:23 are Genesis'' forty-day rain.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-the-flood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 7:24 — *And the waters prevailed upon the earth an hundred and fifty days.* The ''five months-one hundred and fifty days'' of Jubilees 5:23 is Genesis'' hundred and fifty days exactly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju05_lookup sv, _session251_ju05_lookup tv
 WHERE t.slug='jubilees-5-the-flood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

