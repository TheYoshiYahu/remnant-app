-- ----- fragment: minion_jubilees_01.sql (session251 jubilees 1) -----
-- Source anchor: jubilees/jubilees ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju01 (view _session251_ju01_lookup). Sort band base 53000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-1-sinai-tables-retold
  ('jubilees', 'jubilees', 1, 1, 'canon', 'exodus', 24, 12, 'free', E'Exodus 24:12 — *And Yahuah (LORD) said unto Moses, Come up to me into the mount, and be there: and I will give thee tables of stone, and a law, and commandments which I have written; that thou mayest teach them.* Jubilees 1:1 reproduces this summons verbatim — the tables, the writing, and the charge to teach are the Exodus original, not a new word.'),
  ('jubilees', 'jubilees', 1, 1, 'canon', 'exodus', 19, 1, 'free', E'Exodus 19:1 — *In the third month, when the children of Yashar''el (Israel) were gone forth out of the land of Egypt, the same day came they into the wilderness of Sinai.* Jubilees 1:1 dates the dictation to that same third month of the first year of the exodus, anchoring its calendar in the Sinai chronology of Exodus.'),
  ('jubilees', 'jubilees', 1, 2, 'canon', 'exodus', 24, 16, 'free', E'Exodus 24:16 — *And the glory of Yahuah (LORD) abode upon mount Sinai, and the cloud covered it six days: and the seventh day he called unto Moses out of the midst of the cloud.* Jubilees 1:2-3 retells exactly this — the glory abiding, the six-day cloud, and the seventh-day call out of its midst.'),
  ('jubilees', 'jubilees', 1, 4, 'canon', 'exodus', 34, 28, 'free', E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* Jubilees 1:4 keeps the forty days and forty nights of Exodus while widening the dictation to the whole division of days — the same Mount, the same scribe.'),
  -- thread: jubilees-1-apostasy-feasts-forgotten
  ('jubilees', 'jubilees', 1, 10, 'canon', 'leviticus', 26, 31, 'free', E'Leviticus 26:31 — *And I will make your cities waste, and bring your sanctuaries unto desolation, and I will not smell the savour of your sweet odours.* Jubilees 1:10 echoes this covenant curse — forsaking the holy place and sanctuary brings the desolation Leviticus 26 foretold.'),
  ('jubilees', 'jubilees', 1, 13, 'canon', 'leviticus', 26, 33, 'free', E'Leviticus 26:33 — *And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste.* Jubilees 1:13 — *I shall scatter them amongst the nations* — is the same scattering-curse of Leviticus 26, the covenant penalty for transgression.'),
  ('jubilees', 'jubilees', 1, 14, 'canon', 'leviticus', 26, 2, 'free', E'Leviticus 26:2 — *Ye shall keep my sabbaths, and reverence my sanctuary: I am Yahuah (LORD).* The sabbaths and festivals Jubilees 1:14 says they will forget are the standing commandment of Leviticus 26 — the Appointed Times that ground the whole covenant blessing.'),
  ('jubilees', 'jubilees', 1, 9, 'canon', 'deuteronomy', 30, 1, 'free', E'Deuteronomy 30:1 — *And it shall come to pass, when all these things are come upon thee, the blessing and the curse, which I have set before thee, and thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee,* Jubilees 1:9 walks the same path — forsaking the commandments and walking after the nations triggers the curse Deuteronomy 30 sets before them.'),
  -- thread: jubilees-1-circumcise-heart-restoration
  ('jubilees', 'jubilees', 1, 15, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* Jubilees 1:15 — *I shall gather them from amongst all the nations* — is this regathering promise, the two-house ingathering out of every nation.'),
  ('jubilees', 'jubilees', 1, 23, 'canon', 'deuteronomy', 30, 6, 'free', E'Deuteronomy 30:6 — *And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live.* Jubilees 1:23 follows it precisely — the heart and the seed''s heart circumcised — the restoration is the heart-cutting Moses already promised.'),
  ('jubilees', 'jubilees', 1, 23, 'canon', 'ezekiel', 36, 26, 'free', E'Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* Jubilees 1:23 — *I shall create in them a holy spirit* — is the new heart and new spirit of Ezekiel''s restoration vision.'),
  ('jubilees', 'jubilees', 1, 24, 'canon', 'jeremiah', 31, 33, 'free', E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* Jubilees 1:24 — *they will fulfil My commandments, and I shall be their Father and they will be My children* — is the new covenant with the law in the inward parts.'),
  ('jubilees', 'jubilees', 1, 23, 'canon', 'romans', 2, 29, 'free', E'Romans 2:29 — *But he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart, in the spirit, and not in the letter; whose praise is not of men, but of Elohim (God).* Paul names the very thing Jubilees 1:23 promises — circumcision of the heart by the Spirit — confirming the restoration was always the inward cutting, not a new law.'),
  -- thread: jubilees-1-dwell-among-them
  ('jubilees', 'jubilees', 1, 17, 'canon', 'leviticus', 26, 11, 'free', E'Leviticus 26:11 — *And I will set my tabernacle among you: and my soul shall not abhor you.* Jubilees 1:17 — *I shall build My sanctuary in their midst, and I shall dwell with them* — repeats the tabernacle-among-you promise of Leviticus 26.'),
  ('jubilees', 'jubilees', 1, 17, 'canon', 'leviticus', 26, 12, 'free', E'Leviticus 26:12 — *And I will walk among you, and will be your Elohim (God), and ye shall be my people.* Jubilees 1:17 quotes this covenant formula directly — I shall be their Elohim and they will be My people — the heart of the everlasting covenant.'),
  ('jubilees', 'jubilees', 1, 17, 'canon', 'ezekiel', 36, 28, 'free', E'Ezekiel 36:28 — *And ye shall dwell in the land that I gave to your fathers; and ye shall be my people, and I will be your Elohim (God).* Jubilees 1:17 sets the same people-and-God bond in the regathered land of Ezekiel''s restoration.'),
  ('jubilees', 'jubilees', 1, 18, 'canon', 'revelation', 21, 3, 'free', E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* Jubilees 1:18 — *I am Yahuah their Elohim* — reaches its consummation here, the eternal dwelling of God with His people.'),
  -- thread: jubilees-1-heavenly-tablets-election
  ('jubilees', 'jubilees', 1, 29, 'enoch', '1-enoch', 81, 1, 'extras', E'1 Enoch 81:1 — *And he said unto me: ''Observe, Enoch, these heavenly tablets, And read what is written thereon, And understand every single fact.''* The tables of the divisions Jubilees 1:29 describes are the same heavenly tablets Enoch was shown — the pre-written record of all the years.'),
  ('jubilees', 'jubilees', 1, 25, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* Jubilees 1:25''s charge to write the first and the last echoes the book of remembrance written before Yahuah.'),
  ('jubilees', 'jubilees', 1, 25, 'canon', 'psalms', 139, 16, 'free', E'Psalm 139:16 — *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* The pre-written divisions of days in Jubilees 1:25-29 match the days written in Yahuah''s book before any of them existed.'),
  ('jubilees', 'jubilees', 1, 29, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The *elect of Yashar''el* gathered in Jubilees 1:29 are the chosen, special people of Deuteronomy 7 — election grounds the restoration.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-1-sinai-tables-retold',
       E'Moses on the Mount — the Exodus account retold',
       E'Jubilees opens at Sinai, retelling the Exodus narrative almost word for word: *"And it came to pass in the first year of the exodus of the children of Yashar''el (Israel) out of Egypt, in the third month... ''Come up to Me on the Mount, and I will give you two tables of stone of the law and of the commandment, which I have written, that you may teach them.''"* (Jubilees 1:1). This is no new revelation — it is Exodus quoted back. The summons and the written tables are Exodus 24:12, the third month is Exodus 19:1, and the six days of cloud with the seventh-day call is Exodus 24:16. **It ain''t new** — the Book of Division is Sinai itself, told again.',
       sv.verse_id, ev.verse_id, 'extras', 53000
  FROM _session251_ju01_lookup sv, _session251_ju01_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-1-apostasy-feasts-forgotten',
       E'They will forsake My festivals and sabbaths — the curse foretold',
       E'Yahuah foretells the apostasy in Jubilees'' own calendar idiom: *"because they have forsaken My ordinances and My commandments, and the festivals of My covenant, and My sabbaths, and My holy place"* (Jubilees 1:10), and *"they will... go astray as to new moons, and sabbaths, and festivals, and jubilees, and ordinances"* (Jubilees 1:14). What is forsaken is the **Appointed Times** — the moedim, the sabbaths, the new moons. This is the very curse Leviticus 26 spelled out for despising the covenant, and Deuteronomy 30:1 names it as the blessing-and-curse set before them. The feasts are not later inventions to be discarded; they are the covenant itself, and to lose them is the exile.',
       sv.verse_id, ev.verse_id, 'extras', 53003
  FROM _session251_ju01_lookup sv, _session251_ju01_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-1-circumcise-heart-restoration',
       E'I will circumcise their hearts — the two-house restoration',
       E'After the exile comes the turning: *"And after this they will turn to Me from amongst the nations with all their heart... and I shall gather them from amongst all the nations"* (Jubilees 1:15), and the promise deepens: *"I shall circumcise the foreskin of their heart and the foreskin of the heart of their seed, and I shall create in them a holy spirit"* (Jubilees 1:23). This is the regathering and heart-circumcision of **Deuteronomy 30:3-6** word for word; the **new covenant written on the inward parts** of Jeremiah 31:33; the **new heart and new spirit** of Ezekiel 36:26. Paul carries it forward — the true circumcision *is that of the heart, in the spirit* (Romans 2:29). The two houses gathered, the heart cut, the Spirit given: **it ain''t new** — Jubilees is quoting the prophets of restoration.',
       sv.verse_id, ev.verse_id, 'extras', 53006
  FROM _session251_ju01_lookup sv, _session251_ju01_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=15
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=1 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-1-dwell-among-them',
       E'I will dwell with them and be their Elohim — tabernacle restored',
       E'The restoration culminates in indwelling: *"And I shall build My sanctuary in their midst, and I shall dwell with them, and I shall be their Elohim (God) and they will be My people in truth and righteousness"* (Jubilees 1:17). This is the covenant formula of **Leviticus 26:11-12** — *I will set my tabernacle among you... and will be your Elohim, and ye shall be my people* — gathered up into Ezekiel''s restored land (Ezekiel 36:28) and carried to its end in the new Jerusalem, where *the tabernacle of Elohim is with men* (Revelation 21:3). The dwelling-promise threads unbroken from Sinai to Zion.',
       sv.verse_id, ev.verse_id, 'extras', 53009
  FROM _session251_ju01_lookup sv, _session251_ju01_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-1-heavenly-tablets-election',
       E'The tables of the divisions — heavenly tablets and the elect of Israel',
       E'The chapter closes with the Angel of the Presence taking up *"the tables of the divisions of the years –from the time of the creation–of the law and of the testimony of the weeks, of the jubilees... for all the elect of Yashar''el (Israel)"* (Jubilees 1:29), and Moses is told to write *"from the beginning of creation till My sanctuary has been built among them for all eternity"* (Jubilees 1:25). This is the **heavenly tablets** motif — history and ordinance pre-written before they unfold — the *book of remembrance written before him* (Malachi 3:16) and the days *written* before there was one of them (Psalm 139:16). Enoch saw the same tablets and read all that was written (1 Enoch 81:1-2). And the gathering is for *the elect of Yashar''el* — the **chosen, special people** of Deuteronomy 7:6, election preceding confession.',
       sv.verse_id, ev.verse_id, 'extras', 53012
  FROM _session251_ju01_lookup sv, _session251_ju01_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=25
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=1 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-1-sinai-tables-retold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 24:12 — *And Yahuah (LORD) said unto Moses, Come up to me into the mount, and be there: and I will give thee tables of stone, and a law, and commandments which I have written; that thou mayest teach them.* Jubilees 1:1 reproduces this summons verbatim — the tables, the writing, and the charge to teach are the Exodus original, not a new word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-sinai-tables-retold'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 19:1 — *In the third month, when the children of Yashar''el (Israel) were gone forth out of the land of Egypt, the same day came they into the wilderness of Sinai.* Jubilees 1:1 dates the dictation to that same third month of the first year of the exodus, anchoring its calendar in the Sinai chronology of Exodus.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-sinai-tables-retold'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 24:16 — *And the glory of Yahuah (LORD) abode upon mount Sinai, and the cloud covered it six days: and the seventh day he called unto Moses out of the midst of the cloud.* Jubilees 1:2-3 retells exactly this — the glory abiding, the six-day cloud, and the seventh-day call out of its midst.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-sinai-tables-retold'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* Jubilees 1:4 keeps the forty days and forty nights of Exodus while widening the dictation to the whole division of days — the same Mount, the same scribe.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-sinai-tables-retold'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-1-apostasy-feasts-forgotten
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:31 — *And I will make your cities waste, and bring your sanctuaries unto desolation, and I will not smell the savour of your sweet odours.* Jubilees 1:10 echoes this covenant curse — forsaking the holy place and sanctuary brings the desolation Leviticus 26 foretold.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-apostasy-feasts-forgotten'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:33 — *And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste.* Jubilees 1:13 — *I shall scatter them amongst the nations* — is the same scattering-curse of Leviticus 26, the covenant penalty for transgression.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-apostasy-feasts-forgotten'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 26:2 — *Ye shall keep my sabbaths, and reverence my sanctuary: I am Yahuah (LORD).* The sabbaths and festivals Jubilees 1:14 says they will forget are the standing commandment of Leviticus 26 — the Appointed Times that ground the whole covenant blessing.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-apostasy-feasts-forgotten'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 30:1 — *And it shall come to pass, when all these things are come upon thee, the blessing and the curse, which I have set before thee, and thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee,* Jubilees 1:9 walks the same path — forsaking the commandments and walking after the nations triggers the curse Deuteronomy 30 sets before them.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-apostasy-feasts-forgotten'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-1-circumcise-heart-restoration
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* Jubilees 1:15 — *I shall gather them from amongst all the nations* — is this regathering promise, the two-house ingathering out of every nation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-circumcise-heart-restoration'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:6 — *And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live.* Jubilees 1:23 follows it precisely — the heart and the seed''s heart circumcised — the restoration is the heart-cutting Moses already promised.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-circumcise-heart-restoration'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* Jubilees 1:23 — *I shall create in them a holy spirit* — is the new heart and new spirit of Ezekiel''s restoration vision.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-circumcise-heart-restoration'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* Jubilees 1:24 — *they will fulfil My commandments, and I shall be their Father and they will be My children* — is the new covenant with the law in the inward parts.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-circumcise-heart-restoration'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 2:29 — *But he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart, in the spirit, and not in the letter; whose praise is not of men, but of Elohim (God).* Paul names the very thing Jubilees 1:23 promises — circumcision of the heart by the Spirit — confirming the restoration was always the inward cutting, not a new law.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-circumcise-heart-restoration'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-1-dwell-among-them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:11 — *And I will set my tabernacle among you: and my soul shall not abhor you.* Jubilees 1:17 — *I shall build My sanctuary in their midst, and I shall dwell with them* — repeats the tabernacle-among-you promise of Leviticus 26.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-dwell-among-them'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 26:12 — *And I will walk among you, and will be your Elohim (God), and ye shall be my people.* Jubilees 1:17 quotes this covenant formula directly — I shall be their Elohim and they will be My people — the heart of the everlasting covenant.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-dwell-among-them'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:28 — *And ye shall dwell in the land that I gave to your fathers; and ye shall be my people, and I will be your Elohim (God).* Jubilees 1:17 sets the same people-and-God bond in the regathered land of Ezekiel''s restoration.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-dwell-among-them'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* Jubilees 1:18 — *I am Yahuah their Elohim* — reaches its consummation here, the eternal dwelling of God with His people.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-dwell-among-them'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-1-heavenly-tablets-election
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 81:1 — *And he said unto me: ''Observe, Enoch, these heavenly tablets, And read what is written thereon, And understand every single fact.''* The tables of the divisions Jubilees 1:29 describes are the same heavenly tablets Enoch was shown — the pre-written record of all the years.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-heavenly-tablets-election'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=29
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=81 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* Jubilees 1:25''s charge to write the first and the last echoes the book of remembrance written before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-heavenly-tablets-election'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 139:16 — *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* The pre-written divisions of days in Jubilees 1:25-29 match the days written in Yahuah''s book before any of them existed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-heavenly-tablets-election'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The *elect of Yashar''el* gathered in Jubilees 1:29 are the chosen, special people of Deuteronomy 7 — election grounds the restoration.'
  FROM cross_reference_threads t, cross_references x, _session251_ju01_lookup sv, _session251_ju01_lookup tv
 WHERE t.slug='jubilees-1-heavenly-tablets-election'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=1 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

