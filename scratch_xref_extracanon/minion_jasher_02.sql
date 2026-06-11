-- ----- fragment: minion_jasher_02.sql (session252 jasher 2) -----
-- Source anchor: jasher/jasher ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja02 (view _session252_ja02_lookup). Sort band base 55025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-2-seth-the-appointed-seed
  ('jasher', 'jasher', 2, 1, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Jasher 2:1 carries the Genesis naming of Seth verbatim, the appointed seed set in Abel''s place.'),
  ('jasher', 'jasher', 2, 1, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* Jasher 2:1 fixes the same hundred-and-thirtieth year and the likeness-and-image language of the seed-line record.'),
  ('jasher', 'jasher', 2, 2, 'canon', 'genesis', 5, 6, 'free', E'Genesis 5:6 — *And Seth lived an hundred and five years, and begat Enos:* Jasher 2:2 traces the chosen line one more generation, Seth begetting Enosh at a hundred and five years.'),
  ('jasher', 'jasher', 2, 1, 'jubilees', 'jubilees', 4, 7, 'extras', E'Jubilees 4:7 — *Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* Jubilees narrates the identical appointed-seed scene of Jasher 2:1 — both now live, the same election.'),
  -- thread: jasher-2-enosh-idolatry-forgot-the-lord
  ('jasher', 'jasher', 2, 5, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Jasher 2:5 sets its account of the days of Enosh against the very generation Genesis marks as the beginning of calling on the Name, the two lines diverging.'),
  ('jasher', 'jasher', 2, 4, 'canon', 'romans', 1, 21, 'free', E'Romans 1:21 — *Because that, when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations, and their foolish heart was darkened.* Sha''ul names the same fall Jasher 2:4 describes — men who knew their Creator yet forgot Him and served other gods.'),
  ('jasher', 'jasher', 2, 4, 'canon', 'romans', 1, 23, 'free', E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* The images of brass, iron, wood and stone of Jasher 2:4 are the idolatry Sha''ul indicts — the glory of God exchanged for an image.'),
  ('jasher', 'jasher', 2, 8, 'canon', 'genesis', 5, 29, 'free', E'Genesis 5:29 — *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed.* The thorns and barren ground of Jasher 2:8 are the curse on the earth that Genesis itself remembers from Adam''s day down to Noah.'),
  -- thread: jasher-2-cainan-the-wise-foreseeing-flood
  ('jasher', 'jasher', 2, 10, 'canon', 'genesis', 5, 9, 'free', E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan:* Jasher 2:10 carries the genealogy verbatim, Enosh begetting Cainan at ninety years, before expanding him into the wise ruler.'),
  ('jasher', 'jasher', 2, 15, 'canon', 'genesis', 5, 12, 'free', E'Genesis 5:12 — *And Cainan lived seventy years, and begat Mahalaleel:* Jasher 2:15 keeps the same seventieth-year reckoning for Cainan''s offspring that the seed-line record fixes in Genesis.'),
  ('jasher', 'jasher', 2, 13, 'jubilees', 'jubilees', 4, 17, 'extras', E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven according to the order of their months in a book, that men might know the seasons of the years according to the order of their separate months.* Cainan''s writing of things to come on stone tablets in Jasher 2:13 mirrors the chosen line''s scribal foreknowledge that Jubilees gives to Enoch.'),
  -- thread: jasher-2-lamech-and-the-line-of-cain
  ('jasher', 'jasher', 2, 17, 'canon', 'genesis', 4, 19, 'free', E'Genesis 4:19 — *And Lamech took unto him two wives: the name of the one was Adah, and the name of the other Zillah.* Jasher 2:17 names the same two wives of Lamech, Adah and Zillah, retelling the Cainite genealogy.'),
  ('jasher', 'jasher', 2, 17, 'canon', 'genesis', 4, 20, 'free', E'Genesis 4:20 — *And Adah bare Jabal: he was the father of such as dwell in tents, and of such as have cattle.* Jasher 2:17 names Jabal as Adah''s son exactly as Genesis records the father of the herdsmen.'),
  ('jasher', 'jasher', 2, 18, 'canon', 'genesis', 4, 21, 'free', E'Genesis 4:21 — *And his brother''s name was Jubal: he was the father of all such as handle the harp and organ.* Jasher 2:18 names Jubal as the second son born to Adah, the same brother Genesis makes father of the musicians.'),
  ('jasher', 'jasher', 2, 24, 'canon', 'genesis', 4, 22, 'free', E'Genesis 4:22 — *And Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron: and the sister of Tubal-cain was Naamah.* Jasher 2:24-25 names Zillah''s children Tubal Cain and Naamah just as Genesis closes the line of Cain with its smith and his sister.'),
  -- thread: jasher-2-lamech-slays-cain
  ('jasher', 'jasher', 2, 35, 'canon', 'genesis', 4, 23, 'free', E'Genesis 4:23 — *And Lamech said unto his wives, Adah and Zillah, Hear my voice; ye wives of Lamech, hearken unto my speech: for I have slain a man to my wounding, and a young man to my hurt.* Jasher 2:35 expands this very song of Lamech, supplying the story of the man and young man he slew.'),
  ('jasher', 'jasher', 2, 29, 'canon', 'genesis', 4, 15, 'free', E'Genesis 4:15 — *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold. And Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him.* Jasher 2:29 reads Cain''s death by Lamech''s arrow as the Lord requiting his wickedness, the sevenfold word at last fulfilled.'),
  ('jasher', 'jasher', 2, 29, 'jubilees', 'jubilees', 4, 31, 'extras', E'Jubilees 4:31 — *Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment.* Both Jasher 2:29 and Jubilees end Cain in measure-for-measure judgment for Abel''s blood — the same event, both now live.'),
  -- thread: jasher-2-line-toward-enoch
  ('jasher', 'jasher', 2, 37, 'canon', 'genesis', 5, 15, 'free', E'Genesis 5:15 — *And Mahalaleel lived sixty and five years, and begat Jared:* Jasher 2:37 carries the same sixty-five-year reckoning of Mahalaleel begetting Jared in the chosen line.'),
  ('jasher', 'jasher', 2, 37, 'canon', 'genesis', 5, 18, 'free', E'Genesis 5:18 — *And Jared lived an hundred sixty and two years, and he begat Enoch:* Jasher 2:37 brings the line to Jared begetting Enoch, the same generation Genesis fixes before the one who walked with Elohim.'),
  ('jasher', 'jasher', 2, 37, 'jubilees', 'jubilees', 4, 15, 'extras', E'Jubilees 4:15 — *Mahalalel took to him to wife Dînâh, the daughter of Barâkî''êl the daughter of his father''s brother, and she bare him a son... and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers, that they should instruct the children of men.* Jubilees carries the same Mahalaleel-Jared generation of Jasher 2:37 and marks Jared''s days as when the Watchers came down — the corruption Jasher''s next chapters and 1 Enoch unfold.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-2-seth-the-appointed-seed',
       E'Seth, the appointed seed in Abel''s place',
       E'Jasher opens the chapter on the chosen line: *And it was in the hundred and thirtieth year of the life of Adam upon the earth, that he again knew Eve his wife, and she conceived and bare a son in his likeness and in his image, and she called his name Seth, saying, Because Elohim (God) has appointed me another seed in the place of Abel, for Cain has slain him.* (Jasher 2:1) This is Genesis told over again, word answering word: *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* (Genesis 4:25). The genealogy fixes the year exactly — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* (Genesis 5:3) — and the line continues, *And Seth lived one hundred and five years, and he begat a son; and Seth called the name of his son Enosh* (Jasher 2:2), retelling *And Seth lived an hundred and five years, and begat Enos:* (Genesis 5:6). Jubilees keeps the same record of the appointed seed: *Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* (Jubilees 4:7). The election runs Adam to Seth to Enosh — the covenant seed kept and chosen. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55025
  FROM _session252_ja02_lookup sv, _session252_ja02_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-2-enosh-idolatry-forgot-the-lord',
       E'The days of Enosh: images of brass and stone, and the Lord forgotten',
       E'Jasher reads the sons of men''s descent into idolatry into the very generation Genesis marks as the start of calling on the Name: *And the sons of men went and they served other gods, and they forgot Yahuah (the Lord) who had created them in the earth: and in those days the sons of men made images of brass and iron, wood and stone, and they bowed down and served them.* (Jasher 2:4) — *And every man made his god and they bowed down to them, and the sons of men forsook Yahuah (the Lord) all the days of Enosh* (Jasher 2:5). Genesis fixes the pivot in the same days: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* (Genesis 4:26). Sha''ul names exactly this fall — knowing the Creator yet turning to images: *Because that, when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations, and their foolish heart was darkened.* (Romans 1:21), *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* (Romans 1:23). The corrupted ways corrupt the earth itself (Jasher 2:9), and the thorns and famine (Jasher 2:7-8) carry the curse already spoken from Adam''s day: *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed.* (Genesis 5:29). The seed-war is already running — the line that forgets against the line that calls on the Name. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55028
  FROM _session252_ja02_lookup sv, _session252_ja02_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-2-cainan-the-wise-foreseeing-flood',
       E'Cainan the wise, who foresaw the flood and wrote on stone',
       E'Jasher fills out the bare Genesis name Cainan with the legend of a wise ruler who foresaw the judgment: *And Enosh lived ninety years and he begat Cainan* (Jasher 2:10) — exactly *And Enos lived ninety years, and begat Cainan:* (Genesis 5:9). Where Genesis only lists him — *And Cainan lived seventy years, and begat Mahalaleel:* (Genesis 5:12) — Jasher adds the detail of the seer-king: *And Cainan knew by his wisdom that Elohim would destroy the sons of men for having sinned upon earth, and that Yahuah (the Lord) would in the latter days bring upon them the waters of the flood.* (Jasher 2:12), who *wrote upon tablets of stone, what was to take place in time to come* (Jasher 2:13). This is the same scribal-foreknowledge motif Jubilees gives to the chosen line, where Enoch *wrote down the signs of heaven... in a book, that men might know the seasons* (Jubilees 4:17) and the angels *should instruct the children of men* in the days of Jared (Jubilees 4:15). Jasher anchors the addition to the canon''s genealogy and to the genuine parallel — never inventing a fulfillment the text does not carry. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55031
  FROM _session252_ja02_lookup sv, _session252_ja02_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-2-lamech-and-the-line-of-cain',
       E'Lamech, Adah and Zillah, and the craftsmen of the line of Cain',
       E'Jasher names the families of the Cainite Lamech that Genesis lists: *And Lamech, the son of Methusael, became related to Cainan by marriage, and he took his two daughters for his wives, and Adah conceived and bare a son to Lamech, and she called his name Jabal. And she again conceived and bare a son, and called his name Jubal* (Jasher 2:17-18); and later *she conceived and bare a son and she called his name Tubal Cain* and *bare a daughter, and she called her name Naamah* (Jasher 2:24-25). Genesis carries the same roster: *And Lamech took unto him two wives: the name of the one was Adah, and the name of the other Zillah.* (Genesis 4:19) — *And Adah bare Jabal: he was the father of such as dwell in tents, and of such as have cattle.* (Genesis 4:20) — *And his brother''s name was Jubal: he was the father of all such as handle the harp and organ.* (Genesis 4:21) — *And Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron: and the sister of Tubal-cain was Naamah.* (Genesis 4:22). This is the parallel line, Cain''s seed building its own world of cities and crafts beside the line that calls on the Name. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55034
  FROM _session252_ja02_lookup sv, _session252_ja02_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=17
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=2 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-2-lamech-slays-cain',
       E'Lamech slays Cain, and the requiting of Abel''s blood',
       E'Jasher gives the legend behind Lamech''s dark song in Genesis — that the blind old Lamech, guided by Tubal Cain, slew Cain himself: *And the arrows entered Cain''s body although he was distant from them, and he fell to the ground and died.* (Jasher 2:28), *And Yahuah (the Lord) requited Cain''s evil according to his wickedness, which he had done to his brother Abel* (Jasher 2:29). Then Lamech pleads to his wives, *Hear my voice O wives of Lamech, attend to my words, for now you have imagined and said that I slew a man with my wounds, and a child with my stripes* (Jasher 2:35) — the very speech Genesis preserves: *And Lamech said unto his wives, Adah and Zillah, Hear my voice; ye wives of Lamech, hearken unto my speech: for I have slain a man to my wounding, and a young man to my hurt.* (Genesis 4:23), *If Cain shall be avenged sevenfold, truly Lamech seventy and sevenfold.* (Genesis 4:24). And the sevenfold vengeance threatened over Cain is satisfied — *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold.* (Genesis 4:15). Jubilees keeps the same measure-for-measure end: *Cain was killed... for his house fell upon him... for with a stone he had killed Abel, and by a stone was he killed in righteous judgment.* (Jubilees 4:31). The blood of Abel is requited; the way of Cain ends under judgment. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55037
  FROM _session252_ja02_lookup sv, _session252_ja02_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=26
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=2 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-2-line-toward-enoch',
       E'Mahalaleel to Jared to Enoch — the chosen line toward the one translated',
       E'Jasher closes the chapter by carrying the elect line one step further, to the threshold of Enoch''s story: *And Mahlallel the son of Cainan lived sixty-five years and he begat Jared; and Jared lived sixty-two years and he begat Enoch.* (Jasher 2:37). Genesis gives the same generations and years: *And Mahalaleel lived sixty and five years, and begat Jared:* (Genesis 5:15) and *And Jared lived an hundred sixty and two years, and he begat Enoch:* (Genesis 5:18). Jubilees keeps the very record and adds the days of Jared when the Watchers descended: *Mahalalel took to him to wife Dînâh... and she bare him a son... and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers* (Jubilees 4:15). The line runs unbroken toward Enoch who walked with Elohim and was taken — the chosen seed kept across the generations, set up here for the chapter to come. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55040
  FROM _session252_ja02_lookup sv, _session252_ja02_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=37
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=2 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-2-seth-the-appointed-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Jasher 2:1 carries the Genesis naming of Seth verbatim, the appointed seed set in Abel''s place.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-seth-the-appointed-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* Jasher 2:1 fixes the same hundred-and-thirtieth year and the likeness-and-image language of the seed-line record.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-seth-the-appointed-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:6 — *And Seth lived an hundred and five years, and begat Enos:* Jasher 2:2 traces the chosen line one more generation, Seth begetting Enosh at a hundred and five years.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-seth-the-appointed-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:7 — *Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* Jubilees narrates the identical appointed-seed scene of Jasher 2:1 — both now live, the same election.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-seth-the-appointed-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-2-enosh-idolatry-forgot-the-lord
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Jasher 2:5 sets its account of the days of Enosh against the very generation Genesis marks as the beginning of calling on the Name, the two lines diverging.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-enosh-idolatry-forgot-the-lord'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:21 — *Because that, when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations, and their foolish heart was darkened.* Sha''ul names the same fall Jasher 2:4 describes — men who knew their Creator yet forgot Him and served other gods.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-enosh-idolatry-forgot-the-lord'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* The images of brass, iron, wood and stone of Jasher 2:4 are the idolatry Sha''ul indicts — the glory of God exchanged for an image.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-enosh-idolatry-forgot-the-lord'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 5:29 — *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed.* The thorns and barren ground of Jasher 2:8 are the curse on the earth that Genesis itself remembers from Adam''s day down to Noah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-enosh-idolatry-forgot-the-lord'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-2-cainan-the-wise-foreseeing-flood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan:* Jasher 2:10 carries the genealogy verbatim, Enosh begetting Cainan at ninety years, before expanding him into the wise ruler.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-cainan-the-wise-foreseeing-flood'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:12 — *And Cainan lived seventy years, and begat Mahalaleel:* Jasher 2:15 keeps the same seventieth-year reckoning for Cainan''s offspring that the seed-line record fixes in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-cainan-the-wise-foreseeing-flood'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven according to the order of their months in a book, that men might know the seasons of the years according to the order of their separate months.* Cainan''s writing of things to come on stone tablets in Jasher 2:13 mirrors the chosen line''s scribal foreknowledge that Jubilees gives to Enoch.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-cainan-the-wise-foreseeing-flood'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-2-lamech-and-the-line-of-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:19 — *And Lamech took unto him two wives: the name of the one was Adah, and the name of the other Zillah.* Jasher 2:17 names the same two wives of Lamech, Adah and Zillah, retelling the Cainite genealogy.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-and-the-line-of-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:20 — *And Adah bare Jabal: he was the father of such as dwell in tents, and of such as have cattle.* Jasher 2:17 names Jabal as Adah''s son exactly as Genesis records the father of the herdsmen.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-and-the-line-of-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:21 — *And his brother''s name was Jubal: he was the father of all such as handle the harp and organ.* Jasher 2:18 names Jubal as the second son born to Adah, the same brother Genesis makes father of the musicians.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-and-the-line-of-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 4:22 — *And Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron: and the sister of Tubal-cain was Naamah.* Jasher 2:24-25 names Zillah''s children Tubal Cain and Naamah just as Genesis closes the line of Cain with its smith and his sister.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-and-the-line-of-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-2-lamech-slays-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:23 — *And Lamech said unto his wives, Adah and Zillah, Hear my voice; ye wives of Lamech, hearken unto my speech: for I have slain a man to my wounding, and a young man to my hurt.* Jasher 2:35 expands this very song of Lamech, supplying the story of the man and young man he slew.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-slays-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:15 — *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold. And Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him.* Jasher 2:29 reads Cain''s death by Lamech''s arrow as the Lord requiting his wickedness, the sevenfold word at last fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-slays-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:31 — *Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment.* Both Jasher 2:29 and Jubilees end Cain in measure-for-measure judgment for Abel''s blood — the same event, both now live.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-slays-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=29
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-2-line-toward-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:15 — *And Mahalaleel lived sixty and five years, and begat Jared:* Jasher 2:37 carries the same sixty-five-year reckoning of Mahalaleel begetting Jared in the chosen line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-line-toward-enoch'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:18 — *And Jared lived an hundred sixty and two years, and he begat Enoch:* Jasher 2:37 brings the line to Jared begetting Enoch, the same generation Genesis fixes before the one who walked with Elohim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-line-toward-enoch'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:15 — *Mahalalel took to him to wife Dînâh, the daughter of Barâkî''êl the daughter of his father''s brother, and she bare him a son... and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers, that they should instruct the children of men.* Jubilees carries the same Mahalaleel-Jared generation of Jasher 2:37 and marks Jared''s days as when the Watchers came down — the corruption Jasher''s next chapters and 1 Enoch unfold.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-line-toward-enoch'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=37
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

