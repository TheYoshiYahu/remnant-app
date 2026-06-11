-- ----- fragment: minion_jubilees_28.sql (session251 jubilees 28) -----
-- Source anchor: jubilees/jubilees ch28. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju28 (view _session251_ju28_lookup). Sort band base 53675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju28_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-28-leah-rachel-seven-years
  ('jubilees', 'jubilees', 28, 1, 'canon', 'genesis', 29, 1, 'free', E'Genesis 29:1 — *Then Jacob went on his journey, and came into the land of the people of the east.* Jubilees 28:1 retells the same arrival at Laban''s, adding only that the service for Rachel was “one week” of years.'),
  ('jubilees', 'jubilees', 28, 2, 'canon', 'genesis', 29, 18, 'free', E'Genesis 29:18 — *And Jacob loved Rachel; and said, I will serve thee seven years for Rachel thy younger daughter.* The wage Jacob demands in Jubilees 28:2 — “Give me my wife, for whom I have served you seven years” — is the Genesis bargain word for word.'),
  ('jubilees', 'jubilees', 28, 4, 'canon', 'genesis', 29, 25, 'free', E'Genesis 29:25 — *And it came to pass, that in the morning, behold, it was Leah: and he said to Laban, What is this thou hast done unto me? did not I serve with thee for Rachel? wherefore then hast thou beguiled me?* Jubilees 28:4 carries the same dawn-discovery and the same angry charge against Laban.'),
  ('jubilees', 'jubilees', 28, 5, 'canon', 'genesis', 29, 17, 'free', E'Genesis 29:17 — *Leah was tender eyed; but Rachel was beautiful and well favoured.* Jubilees 28:5 expands the same contrast — Leah''s eyes weak, Rachel''s form handsome — to explain why Jacob loved Rachel more.'),
  -- thread: jubilees-28-heavenly-tables-elder-younger
  ('jubilees', 'jubilees', 28, 6, 'canon', 'genesis', 29, 26, 'free', E'Genesis 29:26 — *And Laban said, It must not be so done in our country, to give the younger before the firstborn.* Jubilees 28:6 takes this bare custom and writes it into the heavenly tables as a binding command to Israel.'),
  ('jubilees', 'jubilees', 28, 6, 'canon', 'deuteronomy', 7, 3, 'free', E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The heavenly-tablet marriage-law Jubilees 28:6 lays on Israel is the same Torah care that the seed be given and kept rightly, not mixed with the nations.'),
  ('jubilees', 'jubilees', 28, 6, 'canon', 'exodus', 32, 32, 'free', E'Exodus 32:32 — *Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written.* The “book” Moses appeals to is the same heavenly writing Jubilees 28:6 cites — guilt “set down…in heaven,” the law and judgement pre-engraved.'),
  -- thread: jubilees-28-twelve-tribes-sons-born
  ('jubilees', 'jubilees', 28, 11, 'canon', 'genesis', 29, 31, 'free', E'Genesis 29:31 — *And when Yahuah (LORD) saw that Leah was hated, he opened her womb: but Rachel was barren.* Jubilees 28:11 echoes it exactly — “Yahuah saw that Leah was hated and Rachel loved” — as the womb opens for Reuben.'),
  ('jubilees', 'jubilees', 28, 18, 'canon', 'genesis', 30, 6, 'free', E'Genesis 30:6 — *And Rachel said, Elohim (God) hath judged me, and hath also heard my voice, and hath given me a son: therefore called she his name Dan.* The handmaid''s first son in Jubilees 28:18, Bilhah''s Dan, is the same birth Genesis records.'),
  ('jubilees', 'jubilees', 28, 24, 'canon', 'genesis', 30, 22, 'free', E'Genesis 30:22 — *And Elohim (God) remembered Rachel, and Elohim (God) hearkened to her, and opened her womb.* Jubilees 28:24 — “Yahuah was gracious to Rachel, and opened her womb” — brings Joseph the same way Genesis does.'),
  ('jubilees', 'jubilees', 28, 23, 'canon', 'genesis', 35, 22, 'free', E'Genesis 35:22 — *...Now the sons of Jacob were twelve:* The births dated through Jubilees 28 — ending with Zebulon and Dinah in v23 — complete the twelve Genesis gathers in one line.'),
  ('jubilees', 'jubilees', 28, 11, 'canon', 'exodus', 1, 2, 'free', E'Exodus 1:2 — *Reuben, Simeon, Levi, and Yahudah (Judah),* The tribe-names born in Jubilees 28 are the same households Exodus carries down into Egypt as the nation Israel.'),
  -- thread: jubilees-28-levi-priesthood-judah-sceptre
  ('jubilees', 'jubilees', 28, 14, 'canon', 'deuteronomy', 33, 8, 'free', E'Deuteronomy 33:8 — *And of Levi he said, Let thy Thummim and thy Urim be with thy holy one, whom thou didst prove at Massah, and with whom thou didst strive at the waters of Meribah;* The Levi born in Jubilees 28:14 is the priesthood, the holy one given the Urim and Thummim.'),
  ('jubilees', 'jubilees', 28, 14, 'canon', 'genesis', 49, 10, 'free', E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The Yahudah born in Jubilees 28:14 carries the kingship and the Messianic sceptre.'),
  ('jubilees', 'jubilees', 28, 14, 'canon', 'numbers', 24, 17, 'free', E'Numbers 24:17 — *...there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth.* The Sceptre of Judah''s line, first dated at his birth in Jubilees 28:14, is the Star Balaam foresaw.'),
  ('jubilees', 'jubilees', 28, 14, 'canon', 'hebrews', 7, 14, 'free', E'Hebrews 7:14 — *For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood.* The kingly tribe born in Jubilees 28:14 is the tribe of the Messiah — Judah''s sceptre fulfilled.'),
  -- thread: jubilees-28-flocks-jacobs-wages
  ('jubilees', 'jubilees', 28, 27, 'canon', 'genesis', 30, 32, 'free', E'Genesis 30:32 — *I will pass through all thy flock to day, removing from thence all the speckled and spotted cattle, and all the brown cattle among the sheep, and the spotted and speckled among the goats: and of such shall be my hire.* The spotted-and-speckled wage of Jubilees 28:27 is Jacob''s Genesis bargain.'),
  ('jubilees', 'jubilees', 28, 29, 'canon', 'genesis', 30, 43, 'free', E'Genesis 30:43 — *And the man increased exceedingly, and had much cattle, and maidservants, and menservants, and camels, and asses.* Jubilees 28:29 — “Jacob''s possessions multiplied exceedingly” — records the same blessing over Laban''s envy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-28-leah-rachel-seven-years',
       E'Leah and Rachel — the two weeks of years',
       E'Jubilees opens with Jacob in Laban''s house: *“And he went on his journey, and came to the land of the east, to Laban, the brother of Rebecca, and he was with him, and served him for Rachel his daughter one week.”* (Jubilees 28:1). This is Genesis told over again — *“Then Jacob went on his journey, and came into the land of the people of the east.”* (Genesis 29:1) — down to the bargain itself: *“And Jacob loved Rachel; and said, I will serve thee seven years for Rachel thy younger daughter.”* (Genesis 29:18). When Leah is given in the dark, Jubilees keeps Jacob''s protest and Laban''s deceit, the very wronging the Genesis text records: *“And it came to pass, that in the morning, behold, it was Leah: and he said to Laban, What is this thou hast done unto me? did not I serve with thee for Rachel? wherefore then hast thou beguiled me?”* (Genesis 29:25). It ain''t new — the Book of Division is simply Genesis, dated.',
       sv.verse_id, ev.verse_id, 'extras', 53675
  FROM _session251_ju28_lookup sv, _session251_ju28_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=28 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-28-heavenly-tables-elder-younger',
       E'The heavenly tables — the elder before the younger',
       E'Where Genesis lets Laban speak only custom, Jubilees lifts the rule onto the heavenly tablets and turns it into a command to Israel: *“it is ordained and written in the heavenly tables, that no one should give his younger daughter before the elder…And command you the children of Yashar’el (Israel) that they do not this thing…for it is very wicked.”* (Jubilees 28:6). This is Jubilees'' whole posture — the law stands pre-written, the patriarchal moment is law-bearing, the Torah is engraved before it is given. Genesis preserves the kernel as Laban''s word: *“And Laban said, It must not be so done in our country, to give the younger before the firstborn.”* (Genesis 29:26). And the larger frame — the seed kept separate, the marriage-law given to Israel — is the same Torah voice that forbids mixing with the nations: *“Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.”* (Deuteronomy 7:3). The fathers keep the heavenly law before Sinai writes it.',
       sv.verse_id, ev.verse_id, 'extras', 53678
  FROM _session251_ju28_lookup sv, _session251_ju28_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=28 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-28-twelve-tribes-sons-born',
       E'The twelve tribes begin — the sons born',
       E'Jubilees dates every birth, but the line is Genesis exactly. Reuben first: *“And Yahuah (God) opened the womb of Leah…and he called his name Reuben”* (Jubilees 28:11), as in *“And when Yahuah (LORD) saw that Leah was hated, he opened her womb: but Rachel was barren.”* (Genesis 29:31) and *“And Leah conceived, and bare a son, and she called his name Reuben”* (Genesis 29:32). Then the handmaids'' sons: *“And Rachel said, Elohim (God) hath judged me…therefore called she his name Dan.”* (Genesis 30:6). Joseph closes the count: *“And Yahuah (God) was gracious to Rachel…and she called his name Joseph”* (Jubilees 28:24), as *“And Elohim (God) remembered Rachel…And she called his name Joseph”* (Genesis 30:22–24). These are the twelve whose names Genesis gathers at the end — *“Now the sons of Jacob were twelve”* (Genesis 35:22) — and whom Exodus carries down into Egypt: *“Reuben, Simeon, Levi, and Yahudah (Judah)”* (Exodus 1:2). It ain''t new: the nation is born in these verses.',
       sv.verse_id, ev.verse_id, 'extras', 53681
  FROM _session251_ju28_lookup sv, _session251_ju28_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=28 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-28-levi-priesthood-judah-sceptre',
       E'Levi the priesthood, Judah the sceptre',
       E'Two of the sons born in this chapter carry the whole future. Jubilees dates them together: *“she conceived, and bare him a third son, and he called his name Levi…and bare him a fourth son, and he called his name Yahudah (Judah)”* (Jubilees 28:14). Levi is the priesthood — *“And of Levi he said, Let thy Thummim and thy Urim be with thy holy one”* (Deuteronomy 33:8) — the office Jubilees later sets on him at Bethel (ch31). Judah is the kingship and the Messianic sceptre: *“The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come”* (Genesis 49:10), the Star foreseen by Balaam — *“there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar’el (Israel)”* (Numbers 24:17) — and confessed in the Gospel: *“For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood.”* (Hebrews 7:14). Levi and Yahudah, born here on dated days, are priesthood and kingdom — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53684
  FROM _session251_ju28_lookup sv, _session251_ju28_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=14
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=28 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-28-flocks-jacobs-wages',
       E'The flocks — Jacob''s wages',
       E'Jubilees closes with the spotted flocks: *“those of the lambs and kids which were born black and spotted and white…were to be his wages. And all the sheep brought forth spotted and speckled and black…And Jacob’s possessions multiplied exceedingly”* (Jubilees 28:27–29). It is the Genesis arrangement — *“I will pass through all thy flock to day, removing from thence all the speckled and spotted cattle…and of such shall be my hire.”* (Genesis 30:32) — ending in the same increase Yahuah gave Jacob despite Laban''s envy: *“And the man increased exceedingly, and had much cattle, and maidservants, and menservants, and camels, and asses.”* (Genesis 30:43). Jubilees keeps the note that Laban “observed him with evil intent,” the seed prospered against the one who would cheat it.',
       sv.verse_id, ev.verse_id, 'extras', 53687
  FROM _session251_ju28_lookup sv, _session251_ju28_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=26
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=28 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-28-leah-rachel-seven-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 29:1 — *Then Jacob went on his journey, and came into the land of the people of the east.* Jubilees 28:1 retells the same arrival at Laban''s, adding only that the service for Rachel was “one week” of years.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-leah-rachel-seven-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 29:18 — *And Jacob loved Rachel; and said, I will serve thee seven years for Rachel thy younger daughter.* The wage Jacob demands in Jubilees 28:2 — “Give me my wife, for whom I have served you seven years” — is the Genesis bargain word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-leah-rachel-seven-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 29:25 — *And it came to pass, that in the morning, behold, it was Leah: and he said to Laban, What is this thou hast done unto me? did not I serve with thee for Rachel? wherefore then hast thou beguiled me?* Jubilees 28:4 carries the same dawn-discovery and the same angry charge against Laban.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-leah-rachel-seven-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 29:17 — *Leah was tender eyed; but Rachel was beautiful and well favoured.* Jubilees 28:5 expands the same contrast — Leah''s eyes weak, Rachel''s form handsome — to explain why Jacob loved Rachel more.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-leah-rachel-seven-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-28-heavenly-tables-elder-younger
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 29:26 — *And Laban said, It must not be so done in our country, to give the younger before the firstborn.* Jubilees 28:6 takes this bare custom and writes it into the heavenly tables as a binding command to Israel.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-heavenly-tables-elder-younger'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The heavenly-tablet marriage-law Jubilees 28:6 lays on Israel is the same Torah care that the seed be given and kept rightly, not mixed with the nations.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-heavenly-tables-elder-younger'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 32:32 — *Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written.* The “book” Moses appeals to is the same heavenly writing Jubilees 28:6 cites — guilt “set down…in heaven,” the law and judgement pre-engraved.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-heavenly-tables-elder-younger'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-28-twelve-tribes-sons-born
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 29:31 — *And when Yahuah (LORD) saw that Leah was hated, he opened her womb: but Rachel was barren.* Jubilees 28:11 echoes it exactly — “Yahuah saw that Leah was hated and Rachel loved” — as the womb opens for Reuben.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-twelve-tribes-sons-born'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=29 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 30:6 — *And Rachel said, Elohim (God) hath judged me, and hath also heard my voice, and hath given me a son: therefore called she his name Dan.* The handmaid''s first son in Jubilees 28:18, Bilhah''s Dan, is the same birth Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-twelve-tribes-sons-born'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=30 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 30:22 — *And Elohim (God) remembered Rachel, and Elohim (God) hearkened to her, and opened her womb.* Jubilees 28:24 — “Yahuah was gracious to Rachel, and opened her womb” — brings Joseph the same way Genesis does.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-twelve-tribes-sons-born'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=30 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 35:22 — *...Now the sons of Jacob were twelve:* The births dated through Jubilees 28 — ending with Zebulon and Dinah in v23 — complete the twelve Genesis gathers in one line.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-twelve-tribes-sons-born'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 1:2 — *Reuben, Simeon, Levi, and Yahudah (Judah),* The tribe-names born in Jubilees 28 are the same households Exodus carries down into Egypt as the nation Israel.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-twelve-tribes-sons-born'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-28-levi-priesthood-judah-sceptre
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 33:8 — *And of Levi he said, Let thy Thummim and thy Urim be with thy holy one, whom thou didst prove at Massah, and with whom thou didst strive at the waters of Meribah;* The Levi born in Jubilees 28:14 is the priesthood, the holy one given the Urim and Thummim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-levi-priesthood-judah-sceptre'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The Yahudah born in Jubilees 28:14 carries the kingship and the Messianic sceptre.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-levi-priesthood-judah-sceptre'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 24:17 — *...there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth.* The Sceptre of Judah''s line, first dated at his birth in Jubilees 28:14, is the Star Balaam foresaw.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-levi-priesthood-judah-sceptre'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 7:14 — *For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood.* The kingly tribe born in Jubilees 28:14 is the tribe of the Messiah — Judah''s sceptre fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-levi-priesthood-judah-sceptre'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-28-flocks-jacobs-wages
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 30:32 — *I will pass through all thy flock to day, removing from thence all the speckled and spotted cattle, and all the brown cattle among the sheep, and the spotted and speckled among the goats: and of such shall be my hire.* The spotted-and-speckled wage of Jubilees 28:27 is Jacob''s Genesis bargain.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-flocks-jacobs-wages'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=30 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 30:43 — *And the man increased exceedingly, and had much cattle, and maidservants, and menservants, and camels, and asses.* Jubilees 28:29 — “Jacob''s possessions multiplied exceedingly” — records the same blessing over Laban''s envy.'
  FROM cross_reference_threads t, cross_references x, _session251_ju28_lookup sv, _session251_ju28_lookup tv
 WHERE t.slug='jubilees-28-flocks-jacobs-wages'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=28 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=30 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

