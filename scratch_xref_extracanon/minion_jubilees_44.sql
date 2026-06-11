-- ----- fragment: minion_jubilees_44.sql (session251 jubilees 44) -----
-- Source anchor: jubilees/jubilees ch44. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju44 (view _session251_ju44_lookup). Sort band base 54075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju44_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-44-beersheba-vision
  ('jubilees', 'jubilees', 44, 5, 'canon', 'genesis', 46, 2, 'free', E'Genesis 46:2 — *And Elohim (God) spake unto Yashar''el (Israel) in the visions of the night, and said, Jacob, Jacob. And he said, Here am I.* The Genesis source of the night-vision Jubilees 44:5 retells, the same doubled name and ''Here am I'' answer.'),
  ('jubilees', 'jubilees', 44, 5, 'canon', 'genesis', 46, 3, 'free', E'Genesis 46:3 — *And he said, I am Elohim (God), the Elohim (God) of thy father: fear not to go down into Egypt; for I will there make of thee a great nation:* The exact promise Jubilees 44:5 carries word for word — fear not, a great nation made in Egypt.'),
  ('jubilees', 'jubilees', 44, 6, 'canon', 'genesis', 46, 4, 'free', E'Genesis 46:4 — *I will go down with thee into Egypt; and I will also surely bring thee up again: and Joseph shall put his hand upon thine eyes.* Genesis behind Jubilees 44:6 — I go down with you, I bring you up, Joseph closes your eyes.'),
  ('jubilees', 'jubilees', 44, 6, 'canon', 'genesis', 15, 14, 'free', E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* The Abrahamic covenant that the ''bring you up again'' of Jubilees 44:6 is fulfilling — the descent and the exodus were promised long before.'),
  ('jubilees', 'jubilees', 44, 2, 'jubilees', 'jubilees', 27, 24, 'extras', E'Jubilees 27:24 — *And behold, I shall be with you, and shall keep you whithersoever you go, and I shall bring you again into this land in peace; for I shall not leave you until I do everything that I told you of.* The Bethel dream Jacob ''remembered'' in Jubilees 44:2 — the same ''I shall bring you again'' that steadies him now.'),
  -- thread: jubilees-44-firstfruits-calendar
  ('jubilees', 'jubilees', 44, 1, 'canon', 'genesis', 46, 1, 'free', E'Genesis 46:1 — *And Yashar''el (Israel) took his journey with all that he had, and came to Beer-sheba, and offered sacrifices unto the Elohim (God) of his father Isaac.* The Genesis source of Jubilees 44:1 — the sacrifice at Beer-sheba (the Well of the Oath) to the God of Isaac, which Jubilees dates to the new moon and the seventh of the third month.'),
  -- thread: jubilees-44-judah-sent-goshen
  ('jubilees', 'jubilees', 44, 9, 'canon', 'genesis', 46, 28, 'free', E'Genesis 46:28 — *And he sent Yahudah (Judah) before him unto Joseph, to direct his face unto Goshen; and they came into the land of Goshen.* The Genesis source of Jubilees 44:9 — Judah, the kingly tribe, sent ahead to Goshen.'),
  ('jubilees', 'jubilees', 44, 9, 'canon', 'genesis', 46, 29, 'free', E'Genesis 46:29 — *And Joseph made ready his chariot, and went up to meet Yashar''el (Israel) his father, to Goshen, and presented himself unto him; and he fell on his neck, and wept on his neck a good while.* The reunion that completes the descent Jubilees 44:9 sets up — the rejected-then-exalted brother weeping over his father''s neck.'),
  -- thread: jubilees-44-seventy-souls
  ('jubilees', 'jubilees', 44, 33, 'canon', 'genesis', 46, 27, 'free', E'Genesis 46:27 — *And the sons of Joseph, which were born him in Egypt, were two souls: all the souls of the house of Jacob, which came into Egypt, were threescore and ten.* The Genesis tally Jubilees 44:33 reproduces — seventy souls of the house of Jacob.'),
  ('jubilees', 'jubilees', 44, 11, 'canon', 'exodus', 1, 1, 'free', E'Exodus 1:1 — *Now these are the names of the children of Yashar''el (Israel), which came into Egypt; every man and his household came with Jacob.* The Exodus roll-call of names that Jubilees 44:11 opens — ''these are the names of the sons of Jacob who went into Egypt.'''),
  ('jubilees', 'jubilees', 44, 33, 'canon', 'exodus', 1, 5, 'free', E'Exodus 1:5 — *And all the souls that came out of the loins of Jacob were seventy souls: for Joseph was in Egypt already.* The same seventy souls of Jubilees 44:33, now standing at the head of the book of the Exodus.'),
  ('jubilees', 'jubilees', 44, 33, 'canon', 'deuteronomy', 10, 22, 'free', E'Deuteronomy 10:22 — *Thy fathers went down into Egypt with threescore and ten persons; and now Yahuah Elohayka (the LORD thy God) hath made thee as the stars of heaven for multitude.* Moses'' reading of the seventy of Jubilees 44:33 — the embryo nation grown into the star-multitude promised at Beer-sheba.'),
  ('jubilees', 'jubilees', 44, 33, 'canon', 'acts', 7, 14, 'free', E'Acts 7:14 — *Then sent Joseph, and called his father Jacob to him, and all his kindred, threescore and fifteen souls.* Stephen still preaching the descent of Jubilees 44:33 — the household called down to Joseph in Egypt.'),
  -- thread: jubilees-44-judah-line-er-onan-perez
  ('jubilees', 'jubilees', 44, 34, 'canon', 'genesis', 46, 12, 'free', E'Genesis 46:12 — *And the sons of Yahudah (Judah); Er, and Onan, and Shelah, and Pharez, and Zerah: but Er and Onan died in the land of Canaan. And the sons of Pharez were Hezron and Hamul.* The Genesis source of Jubilees 44:15 and 44:34 — Judah''s sons, with Er and Onan dead in Canaan and Perez carrying on.'),
  ('jubilees', 'jubilees', 44, 15, 'canon', 'matthew', 1, 3, 'free', E'Matthew 1:3 — *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram.* The Perez and Zerah of Jubilees 44:15 set in the Messiah''s own genealogy — the kept Judah-seed running to Yahusha.'),
  ('jubilees', 'jubilees', 44, 15, 'canon', 'ruth', 4, 18, 'free', E'Ruth 4:18 — *Now these are the generations of Pharez: Pharez begat Hezron.* The Perez of Jubilees 44:15 opening the genealogy that runs to David''s throne.'),
  ('jubilees', 'jubilees', 44, 34, 'jubilees', 'jubilees', 41, 1, 'extras', E'Jubilees 41:1 — *And in the forty-fifth jubilee, in the second week, (and) in the second year, Yahudah (Judah) took for his first-born Er, a wife from the daughters of Aram, named Tamar.* Jubilees'' own earlier telling of the Er-and-Tamar story behind the deaths noted in Jubilees 44:34 — the Tamar-Perez chapter that secured the line.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju44_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju44_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-44-beersheba-vision',
       E'The vision at the Well of the Oath — fear not to go down into Egypt',
       E'Jubilees sets the descent into Egypt on the heavenly-tablet calendar and quotes the Genesis vision almost word for word: *And on the sixteenth Yahuah (God) appeared to him, and said to him, “Jacob, Jacob”; and he said, “Here am I.” And He said to him: “I am the Elohim (God) of your fathers, the Elohim (God) of Abraham and Isaac; fear not to go down into Egypt, for I will there make of you a great nation”* (Jubilees 44:5). This is the retelling of *And Elohim (God) spake unto Yashar''el (Israel) in the visions of the night, and said, Jacob, Jacob. And he said, Here am I* (Genesis 46:2) and *fear not to go down into Egypt; for I will there make of thee a great nation* (Genesis 46:3). The promise to come up again — *I will go down with thee into Egypt; and I will also surely bring thee up again: and Joseph shall put his hand upon thine eyes* (Genesis 46:4) — reaches back to Abraham’s covenant of the four hundred years: *and afterward shall they come out with great substance* (Genesis 15:14). The nation is going down in embryo, and Yahuah is already carrying it.',
       sv.verse_id, ev.verse_id, 'extras', 54075
  FROM _session251_ju44_lookup sv, _session251_ju44_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=44 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-44-firstfruits-calendar',
       E'He kept the festival of first-fruits at the Well of the Oath',
       E'Even in famine and fear Jacob keeps the appointed time: *And he celebrated the harvest festival of the first-fruits with old grain, for in all the land of Canaan there was not a handful of seed (in the land), for the famine was over all the beasts and cattle and birds, and also over man* (Jubilees 44:4). And the journey itself is dated to the moedim — *And Yashar’el (Israel) took his journey from Haran from his house on the new moon of the third month, and he went on the way of the Well of the Oath, and he offered a sacrifice to the Elohim (God) of his father Isaac on the seventh of this month* (Jubilees 44:1). This is Jubilees'' spine: the harvest-of-first-fruits feast (Shavuot, the third-month covenant feast) is no late invention but is kept by the fathers, exactly as Jubilees grounds it in Noah and the heavenly tablets. It ain''t new — the patriarchs kept the feasts.',
       sv.verse_id, ev.verse_id, 'extras', 54078
  FROM _session251_ju44_lookup sv, _session251_ju44_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=44 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-44-judah-sent-goshen',
       E'Judah sent ahead to Goshen',
       E'Jubilees keeps the detail that the tribe of kingship leads the way down: *And Yashar’el (Israel) sent Yahudah (Judah) before him to his son Joseph to examine the Land of Goshen, for Joseph had told his brothers that they should come and dwell there that they might be near him* (Jubilees 44:9). This is the retelling of *And he sent Yahudah (Judah) before him unto Joseph, to direct his face unto Goshen; and they came into the land of Goshen* (Genesis 46:28), and the reunion that follows: *And Joseph made ready his chariot, and went up to meet Yashar''el (Israel) his father, to Goshen, and presented himself unto him; and he fell on his neck, and wept on his neck a good while* (Genesis 46:29). Judah goes first — the same Judah whose line Jubilees has just carried through Tamar and Perez (Jubilees 41) toward the throne.',
       sv.verse_id, ev.verse_id, 'extras', 54081
  FROM _session251_ju44_lookup sv, _session251_ju44_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=44 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-44-seventy-souls',
       E'Seventy souls went down — the nation in embryo, now as the stars',
       E'Jubilees gives the same census and the same number that the Torah and the New Testament fix as the seed of the nation: *And all the souls of Jacob which went into Egypt were seventy souls. These are his children and his children’s children, in all seventy* (Jubilees 44:33). It is the retelling of *And all the souls of the house of Jacob, which came into Egypt, were threescore and ten* (Genesis 46:27) and of the Exodus roll-call: *Now these are the names of the children of Yashar''el (Israel), which came into Egypt; every man and his household came with Jacob* (Exodus 1:1) ... *And all the souls that came out of the loins of Jacob were seventy souls: for Joseph was in Egypt already* (Exodus 1:5). Moses turns the seventy into the great-nation promise: *Thy fathers went down into Egypt with threescore and ten persons; and now Yahuah Elohayka (the LORD thy God) hath made thee as the stars of heaven for multitude* (Deuteronomy 10:22). And Stephen tells it still in Acts: *Then sent Joseph, and called his father Jacob to him, and all his kindred, threescore and fifteen souls* (Acts 7:14). The nation goes down small to come up a multitude — ''I will there make of you a great nation'' kept exactly.',
       sv.verse_id, ev.verse_id, 'extras', 54084
  FROM _session251_ju44_lookup sv, _session251_ju44_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=44 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-44-judah-line-er-onan-perez',
       E'Er and Onan died, but Perez stands — the kept Messianic seed',
       E'In the very census of those who went down, Jubilees marks both the broken branches and the surviving heir of Judah: *Yahudah (Judah) and his sons; and these are the names of his sons: Shela, and Perez, and Zerah–four* (Jubilees 44:15), and then notes the deaths in Canaan — *And in the land of Canaan two sons of Yahudah (Judah) died, Er and Onan, and they had no children* (Jubilees 44:34). This is the line Jubilees has just told through Tamar (*Yahudah (Judah) took for his first-born Er, a wife from the daughters of Aram, named Tamar*, Jubilees 41:1), and it is the line Genesis records: *And the sons of Yahudah (Judah); Er, and Onan, and Shelah, and Pharez, and Zerah: but Er and Onan died in the land of Canaan* (Genesis 46:12). The New Testament carries the same survivors straight to the Messiah: *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram* (Matthew 1:3), and Ruth confirms the throne-road: *Now these are the generations of Pharez: Pharez begat Hezron* (Ruth 4:18). The wicked sons fall, but the seed Yahuah keeps for the throne goes down to Egypt and comes up again.',
       sv.verse_id, ev.verse_id, 'extras', 54087
  FROM _session251_ju44_lookup sv, _session251_ju44_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=15
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=44 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-44-beersheba-vision
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 46:2 — *And Elohim (God) spake unto Yashar''el (Israel) in the visions of the night, and said, Jacob, Jacob. And he said, Here am I.* The Genesis source of the night-vision Jubilees 44:5 retells, the same doubled name and ''Here am I'' answer.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-beersheba-vision'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 46:3 — *And he said, I am Elohim (God), the Elohim (God) of thy father: fear not to go down into Egypt; for I will there make of thee a great nation:* The exact promise Jubilees 44:5 carries word for word — fear not, a great nation made in Egypt.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-beersheba-vision'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 46:4 — *I will go down with thee into Egypt; and I will also surely bring thee up again: and Joseph shall put his hand upon thine eyes.* Genesis behind Jubilees 44:6 — I go down with you, I bring you up, Joseph closes your eyes.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-beersheba-vision'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 15:14 — *And also that nation, whom they shall serve, will I judge: and afterward shall they come out with great substance.* The Abrahamic covenant that the ''bring you up again'' of Jubilees 44:6 is fulfilling — the descent and the exodus were promised long before.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-beersheba-vision'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 27:24 — *And behold, I shall be with you, and shall keep you whithersoever you go, and I shall bring you again into this land in peace; for I shall not leave you until I do everything that I told you of.* The Bethel dream Jacob ''remembered'' in Jubilees 44:2 — the same ''I shall bring you again'' that steadies him now.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-beersheba-vision'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=27 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-44-firstfruits-calendar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 46:1 — *And Yashar''el (Israel) took his journey with all that he had, and came to Beer-sheba, and offered sacrifices unto the Elohim (God) of his father Isaac.* The Genesis source of Jubilees 44:1 — the sacrifice at Beer-sheba (the Well of the Oath) to the God of Isaac, which Jubilees dates to the new moon and the seventh of the third month.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-firstfruits-calendar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-44-judah-sent-goshen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 46:28 — *And he sent Yahudah (Judah) before him unto Joseph, to direct his face unto Goshen; and they came into the land of Goshen.* The Genesis source of Jubilees 44:9 — Judah, the kingly tribe, sent ahead to Goshen.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-judah-sent-goshen'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 46:29 — *And Joseph made ready his chariot, and went up to meet Yashar''el (Israel) his father, to Goshen, and presented himself unto him; and he fell on his neck, and wept on his neck a good while.* The reunion that completes the descent Jubilees 44:9 sets up — the rejected-then-exalted brother weeping over his father''s neck.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-judah-sent-goshen'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-44-seventy-souls
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 46:27 — *And the sons of Joseph, which were born him in Egypt, were two souls: all the souls of the house of Jacob, which came into Egypt, were threescore and ten.* The Genesis tally Jubilees 44:33 reproduces — seventy souls of the house of Jacob.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-seventy-souls'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:1 — *Now these are the names of the children of Yashar''el (Israel), which came into Egypt; every man and his household came with Jacob.* The Exodus roll-call of names that Jubilees 44:11 opens — ''these are the names of the sons of Jacob who went into Egypt.'''
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-seventy-souls'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:5 — *And all the souls that came out of the loins of Jacob were seventy souls: for Joseph was in Egypt already.* The same seventy souls of Jubilees 44:33, now standing at the head of the book of the Exodus.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-seventy-souls'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 10:22 — *Thy fathers went down into Egypt with threescore and ten persons; and now Yahuah Elohayka (the LORD thy God) hath made thee as the stars of heaven for multitude.* Moses'' reading of the seventy of Jubilees 44:33 — the embryo nation grown into the star-multitude promised at Beer-sheba.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-seventy-souls'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 7:14 — *Then sent Joseph, and called his father Jacob to him, and all his kindred, threescore and fifteen souls.* Stephen still preaching the descent of Jubilees 44:33 — the household called down to Joseph in Egypt.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-seventy-souls'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-44-judah-line-er-onan-perez
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 46:12 — *And the sons of Yahudah (Judah); Er, and Onan, and Shelah, and Pharez, and Zerah: but Er and Onan died in the land of Canaan. And the sons of Pharez were Hezron and Hamul.* The Genesis source of Jubilees 44:15 and 44:34 — Judah''s sons, with Er and Onan dead in Canaan and Perez carrying on.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-judah-line-er-onan-perez'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=46 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 1:3 — *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram.* The Perez and Zerah of Jubilees 44:15 set in the Messiah''s own genealogy — the kept Judah-seed running to Yahusha.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-judah-line-er-onan-perez'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ruth 4:18 — *Now these are the generations of Pharez: Pharez begat Hezron.* The Perez of Jubilees 44:15 opening the genealogy that runs to David''s throne.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-judah-line-er-onan-perez'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 41:1 — *And in the forty-fifth jubilee, in the second week, (and) in the second year, Yahudah (Judah) took for his first-born Er, a wife from the daughters of Aram, named Tamar.* Jubilees'' own earlier telling of the Er-and-Tamar story behind the deaths noted in Jubilees 44:34 — the Tamar-Perez chapter that secured the line.'
  FROM cross_reference_threads t, cross_references x, _session251_ju44_lookup sv, _session251_ju44_lookup tv
 WHERE t.slug='jubilees-44-judah-line-er-onan-perez'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=44 AND sv.verse_number=34
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=41 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

