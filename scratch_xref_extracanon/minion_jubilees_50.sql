-- ----- fragment: minion_jubilees_50.sql (session251 jubilees 50) -----
-- Source anchor: jubilees/jubilees ch50. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju50 (view _session251_ju50_lookup). Sort band base 54225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju50_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-50-sabbath-of-the-land-and-jubilee
  ('jubilees', 'jubilees', 50, 2, 'canon', 'leviticus', 25, 2, 'free', E'Leviticus 25:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, When ye come into the land which I give you, then shall the land keep a sabbath unto Yahuah (LORD).* Jubilees says the Sabbaths of the land were told on Sinai but the jubilee year withheld ''till you enter the land'' — exactly Leviticus'' ''when ye come into the land.'''),
  ('jubilees', 'jubilees', 50, 3, 'canon', 'leviticus', 25, 4, 'free', E'Leviticus 25:4 — *But in the seventh year shall be a sabbath of rest unto the land, a sabbath for Yahuah (LORD): thou shalt neither sow thy field, nor prune thy vineyard.* Jubilees'' ''the land also will keep its sabbaths while they dwell upon it'' is the seventh-year land-rest of the Torah.'),
  ('jubilees', 'jubilees', 50, 4, 'canon', 'leviticus', 25, 8, 'free', E'Leviticus 25:8 — *And thou shalt number seven sabbaths of years unto thee, seven times seven years; and the space of the seven sabbaths of years shall be unto thee forty and nine years.* Jubilees'' ''forty-nine jubilees from the days of Adam'' counts the same seven-times-seven that the Torah numbers to the jubilee.'),
  -- thread: jubilees-50-proclaim-liberty-land-cleansed
  ('jubilees', 'jubilees', 50, 5, 'canon', 'leviticus', 25, 10, 'free', E'Leviticus 25:10 — *And ye shall hallow the fiftieth year, and proclaim liberty throughout all the land unto all the inhabitants thereof: it shall be a jubile unto you; and ye shall return every man unto his possession, and ye shall return every man unto his family.* Jubilees'' jubilees passing until the land is ''clean from that time for evermore'' is the Torah''s proclaimed liberty carried to its end.'),
  ('jubilees', 'jubilees', 50, 5, 'canon', 'isaiah', 58, 14, 'free', E'Isaiah 58:14 — *Then shalt thou delight thyself in Yahuah (LORD); and I will cause thee to ride upon the high places of the earth, and feed thee with the heritage of Jacob thy father: for the mouth of Yahuah (LORD) hath spoken it.* The Sabbath-keeper''s inheritance of the heritage of Jacob is the same ''dwells with confidence in all the land'' Jubilees promises the cleansed Israel.'),
  -- thread: jubilees-50-six-days-labour-seventh-rest
  ('jubilees', 'jubilees', 50, 7, 'canon', 'exodus', 20, 8, 'free', E'Exodus 20:8 — *Remember the sabbath day, to keep it holy.* Jubilees 50:7''s ''six days will you labour, but on the seventh day is the Sabbath'' is the fourth commandment delivered at the same Sinai.'),
  ('jubilees', 'jubilees', 50, 7, 'canon', 'exodus', 20, 10, 'free', E'Exodus 20:10 — *But the seventh day is the sabbath of Yahuah Elohayka (the LORD thy God): in it thou shalt not do any work, thou, nor thy son, nor thy daughter, thy manservant, nor thy maidservant, nor thy cattle, nor thy stranger that is within thy gates.* Jubilees names the identical household — sons, men-servants, maid-servants, cattle, the sojourner — that the commandment binds to the rest.'),
  ('jubilees', 'jubilees', 50, 7, 'canon', 'leviticus', 23, 3, 'free', E'Leviticus 23:3 — *Six days shall work be done: but the seventh day is the sabbath of rest, an holy convocation; ye shall do no work therein: it is the sabbath of Yahuah (LORD) in all your dwellings.* The Sabbath stands at the head of the feasts of Yahuah — Jubilees'' ''a day of festival, and a holy day'' is this holy convocation.'),
  ('jubilees', 'jubilees', 50, 9, 'canon', 'genesis', 2, 2, 'free', E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* Jubilees roots the seventh-day rest where ch2 rooted it — in the creation Sabbath, not in a later Jewish invention.'),
  -- thread: jubilees-50-no-work-kindle-no-fire
  ('jubilees', 'jubilees', 50, 8, 'canon', 'exodus', 31, 14, 'free', E'Exodus 31:14 — *Ye shall keep the sabbath therefore; for it is holy unto you: every one that defileth it shall surely be put to death: for whosoever doeth any work therein, that soul shall be cut off from among his people.* Jubilees'' ''the man that does any work on it shall die'' is this commandment, holding the Sabbath holy on pain of death.'),
  ('jubilees', 'jubilees', 50, 12, 'canon', 'exodus', 35, 2, 'free', E'Exodus 35:2 — *Six days shall work be done, but on the seventh day there shall be to you an holy day, a sabbath of rest to Yahuah (LORD): whosoever doeth work therein shall be put to death.* Jubilees 50:12''s death-sentence on the Sabbath-worker repeats this six-days/seventh-day decree.'),
  ('jubilees', 'jubilees', 50, 12, 'canon', 'exodus', 35, 3, 'free', E'Exodus 35:3 — *Ye shall kindle no fire throughout your habitations upon the sabbath day.* Jubilees'' ''whoever lights a fire... on the Sabbaths'' names the very prohibition the Torah set against kindling fire on the day.'),
  -- thread: jubilees-50-sign-for-ever-heavenly-tablets
  ('jubilees', 'jubilees', 50, 9, 'canon', 'exodus', 31, 13, 'free', E'Exodus 31:13 — *Speak thou also unto the children of Yashar''el (Israel), saying, Verily my sabbaths ye shall keep: for it is a sign between me and you throughout your generations; that ye may know that I am Yahuah (LORD) that doth sanctify you.* Jubilees'' ''a day of the holy kingdom for all Yashar''el is this day... for ever'' is the Sabbath kept as the sanctifying sign of Sinai.'),
  ('jubilees', 'jubilees', 50, 13, 'canon', 'exodus', 31, 16, 'free', E'Exodus 31:16 — *Wherefore the children of Yashar''el (Israel) shall keep the sabbath, to observe the sabbath throughout their generations, for a perpetual covenant.* Jubilees 50:13''s charge that ''the children of Yashar''el shall observe the Sabbaths... as it is written in the tables'' is this perpetual covenant written down.'),
  ('jubilees', 'jubilees', 50, 13, 'canon', 'exodus', 31, 17, 'free', E'Exodus 31:17 — *It is a sign between me and the children of Yashar''el (Israel) for ever: for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested, and was refreshed.* The eternal sign ''written in the tables'' that Jubilees closes with is the Sabbath sign of creation grounded in Exodus.'),
  ('jubilees', 'jubilees', 50, 9, 'jubilees', 'jubilees', 2, 19, 'extras', E'Jubilees 2:19 — *And He said to us: “Behold, I will separate to Myself a people from among all the peoples, and these will keep the Sabbath day, and I will sanctify them to Myself as My people, and will bless them...* The book that closes on the Sabbath ''for ever'' opened on this same heavenly Sabbath — the inclusio of the whole Book of Division.'),
  ('jubilees', 'jubilees', 50, 9, 'canon', 'hebrews', 4, 9, 'free', E'Hebrews 4:9 — *There remaineth therefore a rest to the people of Elohim (God).* Jubilees'' eternal ''day of the holy kingdom... for ever'' is the abiding Sabbath-rest the apostle says still stands open for the people of Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju50_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju50_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-50-sabbath-of-the-land-and-jubilee',
       E'The Sabbaths of the land and the jubilee years — counted from Sinai',
       E'The Book of Division closes on the very thing it opened with: the Sabbath. *And I told you of the Sabbaths of the land on Mount Sinai, and I told you of the jubilee years in the sabbaths of years: but the year thereof have I not told you till you enter the land which you are to possess* (Jubilees 50:2). *And the land also will keep its sabbaths while they dwell upon it, and they will know the jubilee year* (Jubilees 50:3). This is not a new ordinance handed to Moses — it is Leviticus 25 spoken at the same mountain: *Speak unto the children of Yashar''el (Israel), and say unto them, When ye come into the land which I give you, then shall the land keep a sabbath unto Yahuah (LORD)* (Leviticus 25:2). The seventh year rests the field — *But in the seventh year shall be a sabbath of rest unto the land, a sabbath for Yahuah (LORD): thou shalt neither sow thy field, nor prune thy vineyard* (Leviticus 25:4) — and seven sevens are counted to the fiftieth: *And thou shalt number seven sabbaths of years unto thee, seven times seven years; and the space of the seven sabbaths of years shall be unto thee forty and nine years* (Leviticus 25:8). Jubilees'' whole reckoning — *there are forty-nine jubilees from the days of Adam until this day* (Jubilees 50:4) — is the Torah''s own jubilee clock running from creation. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 54225
  FROM _session251_ju50_lookup sv, _session251_ju50_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=2
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=50 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-50-proclaim-liberty-land-cleansed',
       E'Proclaim liberty — the land cleansed, no more Satan, the Sabbath a delight',
       E'Jubilees sets the jubilee toward a final cleansing: *And the jubilees will pass by, until Yashar’el (Israel) is cleansed from all guilt of fornication, and uncleanness, and pollution, and sin, and error, and dwells with confidence in all the land, and there will be no more a Satan or any evil one, and the land will be clean from that time for evermore* (Jubilees 50:5). The Torah''s jubilee is the seed of this hope: *And ye shall hallow the fiftieth year, and proclaim liberty throughout all the land unto all the inhabitants thereof: it shall be a jubile unto you; and ye shall return every man unto his possession, and ye shall return every man unto his family* (Leviticus 25:10). And the prophet names the reward of the kept Sabbath in the very terms Jubilees uses for the festival rest: *Then shalt thou delight thyself in Yahuah (LORD); and I will cause thee to ride upon the high places of the earth, and feed thee with the heritage of Jacob thy father: for the mouth of Yahuah (LORD) hath spoken it* (Isaiah 58:14). Liberty proclaimed, the land clean for ever — the restoration the whole book has been pointing to.',
       sv.verse_id, ev.verse_id, 'extras', 54228
  FROM _session251_ju50_lookup sv, _session251_ju50_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=50 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-50-six-days-labour-seventh-rest',
       E'Six days labour, the seventh the Sabbath of Yahuah your Elohim',
       E'Jubilees gives the Sabbath command word for word with the fourth commandment: *Six days will you labour, but on the seventh day is the Sabbath of Yahuah your Elohim (the LORD your God). In it you shall do no manner of work, you and your sons, and your men-servants and your maid-servants, and all your cattle and the sojourner also who is with you* (Jubilees 50:7). That is Sinai: *Remember the sabbath day, to keep it holy* (Exodus 20:8) — *But the seventh day is the sabbath of Yahuah Elohayka (the LORD thy God): in it thou shalt not do any work, thou, nor thy son, nor thy daughter, thy manservant, nor thy maidservant, nor thy cattle, nor thy stranger that is within thy gates* (Exodus 20:10). It is the appointed feast of Leviticus 23: *Six days shall work be done: but the seventh day is the sabbath of rest, an holy convocation; ye shall do no work therein: it is the sabbath of Yahuah (LORD) in all your dwellings* (Leviticus 23:3). And it reaches back past Sinai to creation, where Jubilees ch2 began: *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made* (Genesis 2:2). Same command, same list of household and stranger, same seventh day. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 54231
  FROM _session251_ju50_lookup sv, _session251_ju50_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=7
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=50 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-50-no-work-kindle-no-fire',
       E'Do no work on the Sabbath — kindle no fire, carry no burden',
       E'Jubilees lists the forbidden Sabbath labours with deadly seriousness: *And the man that does any work on it shall die... and whoever takes up any burden to carry it out of his tent or out of his house shall die* (Jubilees 50:8), and again *And every man who does any work thereon... and whoever lights a fire, or rides on any beast, or travels by ship on the sea... or makes war on the Sabbaths* (Jubilees 50:12). Every one of these has its Torah source. The death-penalty for desecration: *Ye shall keep the sabbath therefore; for it is holy unto you: every one that defileth it shall surely be put to death: for whosoever doeth any work therein, that soul shall be cut off from among his people* (Exodus 31:14), and *Six days shall work be done, but on the seventh day there shall be to you an holy day, a sabbath of rest to Yahuah (LORD): whosoever doeth work therein shall be put to death* (Exodus 35:2). The kindling of fire is named directly: *Ye shall kindle no fire throughout your habitations upon the sabbath day* (Exodus 35:3). Jubilees is not inventing rigor — it is reciting the written law. Torah stands.',
       sv.verse_id, ev.verse_id, 'extras', 54234
  FROM _session251_ju50_lookup sv, _session251_ju50_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=50 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-50-sign-for-ever-heavenly-tablets',
       E'A sign for ever, written in the tables — the book closes where it began',
       E'Jubilees ends by sealing the Sabbath as an eternal sign written on the heavenly tablets: *a day of the holy kingdom for all Yashar’el (Israel) is this day among their days for ever* (Jubilees 50:9), and *so that the children of Yashar’el (Israel) shall observe the Sabbaths according to the commandments regarding the Sabbaths of the land, as it is written in the tables, which He gave into my hands that I should write out for you* (Jubilees 50:13). This is the sign-language of Sinai: *Speak thou also unto the children of Yashar''el (Israel), saying, Verily my sabbaths ye shall keep: for it is a sign between me and you throughout your generations; that ye may know that I am Yahuah (LORD) that doth sanctify you* (Exodus 31:13) — *Wherefore the children of Yashar''el (Israel) shall keep the sabbath, to observe the sabbath throughout their generations, for a perpetual covenant* (Exodus 31:16) — *It is a sign between me and the children of Yashar''el (Israel) for ever* (Exodus 31:17). And it shuts the inclusio of the whole book, returning to the heavenly Sabbath of ch2: *Behold, I will separate to Myself a people from among all the peoples, and these will keep the Sabbath day, and I will sanctify them to Myself as My people* (Jubilees 2:19). The rest is not abolished but stands open ahead — *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). The Book of Division closes on its first word: the eternal Sabbath. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 54237
  FROM _session251_ju50_lookup sv, _session251_ju50_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=50 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-50-sabbath-of-the-land-and-jubilee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 25:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, When ye come into the land which I give you, then shall the land keep a sabbath unto Yahuah (LORD).* Jubilees says the Sabbaths of the land were told on Sinai but the jubilee year withheld ''till you enter the land'' — exactly Leviticus'' ''when ye come into the land.'''
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-sabbath-of-the-land-and-jubilee'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 25:4 — *But in the seventh year shall be a sabbath of rest unto the land, a sabbath for Yahuah (LORD): thou shalt neither sow thy field, nor prune thy vineyard.* Jubilees'' ''the land also will keep its sabbaths while they dwell upon it'' is the seventh-year land-rest of the Torah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-sabbath-of-the-land-and-jubilee'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 25:8 — *And thou shalt number seven sabbaths of years unto thee, seven times seven years; and the space of the seven sabbaths of years shall be unto thee forty and nine years.* Jubilees'' ''forty-nine jubilees from the days of Adam'' counts the same seven-times-seven that the Torah numbers to the jubilee.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-sabbath-of-the-land-and-jubilee'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-50-proclaim-liberty-land-cleansed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 25:10 — *And ye shall hallow the fiftieth year, and proclaim liberty throughout all the land unto all the inhabitants thereof: it shall be a jubile unto you; and ye shall return every man unto his possession, and ye shall return every man unto his family.* Jubilees'' jubilees passing until the land is ''clean from that time for evermore'' is the Torah''s proclaimed liberty carried to its end.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-proclaim-liberty-land-cleansed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 58:14 — *Then shalt thou delight thyself in Yahuah (LORD); and I will cause thee to ride upon the high places of the earth, and feed thee with the heritage of Jacob thy father: for the mouth of Yahuah (LORD) hath spoken it.* The Sabbath-keeper''s inheritance of the heritage of Jacob is the same ''dwells with confidence in all the land'' Jubilees promises the cleansed Israel.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-proclaim-liberty-land-cleansed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-50-six-days-labour-seventh-rest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:8 — *Remember the sabbath day, to keep it holy.* Jubilees 50:7''s ''six days will you labour, but on the seventh day is the Sabbath'' is the fourth commandment delivered at the same Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-six-days-labour-seventh-rest'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:10 — *But the seventh day is the sabbath of Yahuah Elohayka (the LORD thy God): in it thou shalt not do any work, thou, nor thy son, nor thy daughter, thy manservant, nor thy maidservant, nor thy cattle, nor thy stranger that is within thy gates.* Jubilees names the identical household — sons, men-servants, maid-servants, cattle, the sojourner — that the commandment binds to the rest.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-six-days-labour-seventh-rest'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:3 — *Six days shall work be done: but the seventh day is the sabbath of rest, an holy convocation; ye shall do no work therein: it is the sabbath of Yahuah (LORD) in all your dwellings.* The Sabbath stands at the head of the feasts of Yahuah — Jubilees'' ''a day of festival, and a holy day'' is this holy convocation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-six-days-labour-seventh-rest'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* Jubilees roots the seventh-day rest where ch2 rooted it — in the creation Sabbath, not in a later Jewish invention.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-six-days-labour-seventh-rest'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-50-no-work-kindle-no-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 31:14 — *Ye shall keep the sabbath therefore; for it is holy unto you: every one that defileth it shall surely be put to death: for whosoever doeth any work therein, that soul shall be cut off from among his people.* Jubilees'' ''the man that does any work on it shall die'' is this commandment, holding the Sabbath holy on pain of death.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-no-work-kindle-no-fire'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 35:2 — *Six days shall work be done, but on the seventh day there shall be to you an holy day, a sabbath of rest to Yahuah (LORD): whosoever doeth work therein shall be put to death.* Jubilees 50:12''s death-sentence on the Sabbath-worker repeats this six-days/seventh-day decree.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-no-work-kindle-no-fire'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=35 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 35:3 — *Ye shall kindle no fire throughout your habitations upon the sabbath day.* Jubilees'' ''whoever lights a fire... on the Sabbaths'' names the very prohibition the Torah set against kindling fire on the day.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-no-work-kindle-no-fire'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=35 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-50-sign-for-ever-heavenly-tablets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 31:13 — *Speak thou also unto the children of Yashar''el (Israel), saying, Verily my sabbaths ye shall keep: for it is a sign between me and you throughout your generations; that ye may know that I am Yahuah (LORD) that doth sanctify you.* Jubilees'' ''a day of the holy kingdom for all Yashar''el is this day... for ever'' is the Sabbath kept as the sanctifying sign of Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-sign-for-ever-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 31:16 — *Wherefore the children of Yashar''el (Israel) shall keep the sabbath, to observe the sabbath throughout their generations, for a perpetual covenant.* Jubilees 50:13''s charge that ''the children of Yashar''el shall observe the Sabbaths... as it is written in the tables'' is this perpetual covenant written down.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-sign-for-ever-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 31:17 — *It is a sign between me and the children of Yashar''el (Israel) for ever: for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested, and was refreshed.* The eternal sign ''written in the tables'' that Jubilees closes with is the Sabbath sign of creation grounded in Exodus.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-sign-for-ever-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:19 — *And He said to us: “Behold, I will separate to Myself a people from among all the peoples, and these will keep the Sabbath day, and I will sanctify them to Myself as My people, and will bless them...* The book that closes on the Sabbath ''for ever'' opened on this same heavenly Sabbath — the inclusio of the whole Book of Division.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-sign-for-ever-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 4:9 — *There remaineth therefore a rest to the people of Elohim (God).* Jubilees'' eternal ''day of the holy kingdom... for ever'' is the abiding Sabbath-rest the apostle says still stands open for the people of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju50_lookup sv, _session251_ju50_lookup tv
 WHERE t.slug='jubilees-50-sign-for-ever-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=50 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

