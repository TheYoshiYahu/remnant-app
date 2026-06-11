-- =====================================================================
-- Session 251 — Jubilees FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session251_jubilees_extracanon_cross_references.sql
-- =====================================================================

\echo 'session251 — Jubilees cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_jubilees_02.sql (session251 jubilees 2) -----
-- Source anchor: jubilees/jubilees ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju02 (view _session251_ju02_lookup). Sort band base 53025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-2-six-days-creation
  ('jubilees', 'jubilees', 2, 4, 'canon', 'genesis', 1, 6, 'free', E'Genesis 1:6 — *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* Jubilees 2:4 retells the second day''s dividing of the waters word for word.'),
  ('jubilees', 'jubilees', 2, 5, 'canon', 'genesis', 1, 9, 'free', E'Genesis 1:9 — *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* The third-day command of Jubilees 2:5 is the same gathering of the waters and appearing of the dry land.'),
  ('jubilees', 'jubilees', 2, 14, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth.* Jubilees 2:14 gives the same man, male and female, dominion over all that moves on the earth and in the seas.'),
  ('jubilees', 'jubilees', 2, 16, 'canon', 'genesis', 2, 2, 'free', E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* Jubilees 2:16 finishes the six days and gives the Sabbath rest exactly as the source closes the creation account.'),
  -- thread: jubilees-2-angels-first-day-spirits
  ('jubilees', 'jubilees', 2, 2, 'canon', 'psalms', 104, 4, 'free', E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire.* Jubilees 2:2 names these same serving spirits, including the angels of the spirit of fire, created on the first day.'),
  ('jubilees', 'jubilees', 2, 2, 'enoch', '1-enoch', 60, 13, 'extras', E'1 Enoch 60:13 — *And he showed me all the secrets of the lightning and thunder, and showed me the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew, and there I saw from whence they proceed in that place and from whence they saturate the dusty earth.* The same governed winds, clouds, lightning and thunder that Jubilees 2:2 assigns to angelic spirits.'),
  ('jubilees', 'jubilees', 2, 2, 'enoch', '1-enoch', 60, 14, 'extras', E'1 Enoch 60:14 — *And he showed me closed chambers out of which the winds are divided, the chamber of the hail and winds, the chamber of the mist, and of the clouds, and the cloud thereof hovers over the earth from the beginning of the world.* The chambers of hail and mist match Jubilees 2:2''s angels of snow, hail and hoar frost.'),
  ('jubilees', 'jubilees', 2, 3, 'canon', 'job', 38, 7, 'free', E'Job 38:7 — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* The host praising at creation in Jubilees 2:3 is the same heavenly rejoicing over the works of Yahuah.'),
  -- thread: jubilees-2-sun-sign-feasts-jubilees
  ('jubilees', 'jubilees', 2, 9, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* Jubilees 2:9 reads the fourth-day lights as the appointed sign for sabbaths, feasts and jubilees.'),
  ('jubilees', 'jubilees', 2, 9, 'jubilees', 'jubilees', 6, 32, 'extras', E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts.* The sun-as-sign of Jubilees 2:9 becomes the 364-day solar year Jubilees later commands.'),
  ('jubilees', 'jubilees', 2, 9, 'enoch', '1-enoch', 72, 1, 'extras', E'1 Enoch 72:1 — *The book of the courses of the luminaries of the heaven, the relations of each, according to their classes, their dominion and their seasons, according to their names and places of origin, and according to their months, which Uriel, the holy angel who was with me, who was their leader, showed me.* The same luminaries Jubilees 2:9 makes the sign for seasons and feasts govern Enoch''s calendar of the years.'),
  ('jubilees', 'jubilees', 2, 9, 'canon', 'leviticus', 23, 2, 'free', E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The feasts the sun marks in Jubilees 2:9 are the very moedim of Yahuah, His own appointed times.'),
  -- thread: jubilees-2-sabbath-hallowed-from-creation
  ('jubilees', 'jubilees', 2, 16, 'canon', 'genesis', 2, 3, 'free', E'Genesis 2:3 — *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* Jubilees 2:16 gives this same blessed, sanctified seventh day as the great sign over creation.'),
  ('jubilees', 'jubilees', 2, 1, 'canon', 'exodus', 20, 11, 'free', E'Exodus 20:11 — *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* The fourth word grounds the Sabbath in creation exactly as Jubilees 2:1 says the seventh day was hallowed for all ages.'),
  ('jubilees', 'jubilees', 2, 21, 'canon', 'exodus', 31, 17, 'free', E'Exodus 31:17 — *It is a sign between me and the children of Yashar''el (Israel) for ever: for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested, and was refreshed.* Jubilees 2:21 names the same created sign by which Israel keeps Sabbath with the angels for ever.'),
  ('jubilees', 'jubilees', 2, 25, 'canon', 'exodus', 31, 14, 'free', E'Exodus 31:14 — *Ye shall keep the sabbath therefore; for it is holy unto you: every one that defileth it shall surely be put to death: for whosoever doeth any work therein, that soul shall be cut off from among his people.* The death-penalty for defiling the day in Jubilees 2:25 quotes the Torah''s own statute.'),
  ('jubilees', 'jubilees', 2, 29, 'canon', 'isaiah', 58, 13, 'free', E'Isaiah 58:13 — *If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable; and shalt honour him, not doing thine own ways, nor finding thine own pleasure, nor speaking thine own words.* Jubilees 2:29 forbids that same pleasure-seeking on the holy day, keeping the Sabbath honourable.'),
  -- thread: jubilees-2-israel-chosen-firstborn-seed
  ('jubilees', 'jubilees', 2, 20, 'canon', 'exodus', 4, 22, 'free', E'Exodus 4:22 — *And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn.* Jubilees 2:20 writes the seed of Jacob down as that same firstborn son, sanctified for ever.'),
  ('jubilees', 'jubilees', 2, 19, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The people separated and sanctified in Jubilees 2:19 are this chosen, holy people of the Torah.'),
  ('jubilees', 'jubilees', 2, 31, 'canon', 'leviticus', 23, 3, 'free', E'Leviticus 23:3 — *Six days shall work be done: but the seventh day is the sabbath of rest, an holy convocation; ye shall do no work therein: it is the sabbath of Yahuah (LORD) in all your dwellings.* The Sabbath Yahuah permits Israel alone to keep in Jubilees 2:31 stands first among the holy convocations of His feasts.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-2-six-days-creation',
       E'The six days of creation — Genesis retold on the heavenly tablets',
       E'The angel of the presence dictates to Moses the very opening of the Torah: *Write the complete history of the creation, how in six days Yahuah Elohim (the LORD God) finished all His works and all that He created, and kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* (Jubilees 2:1). It ain''t new — this is Genesis 1 set beside itself. The firmament dividing the waters, *And on the second day He created the firmament in the midst of the waters, and the waters were divided on that day* (Jubilees 2:4), is the same word as *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters* (Genesis 1:6). The dry land, the lights, the sea creatures, man given dominion — every day matches the source: *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea* (Genesis 1:26). And the rest that crowns the week stands engraved from the first page: *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made* (Genesis 2:2).',
       sv.verse_id, ev.verse_id, 'extras', 53025
  FROM _session251_ju02_lookup sv, _session251_ju02_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-2-angels-first-day-spirits',
       E'The angels and the spirits of the elements, created on day one',
       E'Jubilees fills out what Genesis only implies: on the very first day the heavenly host was made. *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence, and the angels of sanctification, and the angels of the spirit of fire and the angels of the spirit of the winds, and the angels of the spirit of the clouds, and of darkness, and of snow and of hail and of hoar frost* (Jubilees 2:2). The Psalmist names this same household of ministering spirits: *Who maketh his angels spirits; his ministers a flaming fire* (Psalm 104:4). And the live Enoch apparatus shows the very same chambers of the elements being shown to a man caught up: *And he showed me all the secrets of the lightning and thunder, and showed me the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew* (1 Enoch 60:13) — *the chamber of the hail and winds, the chamber of the mist, and of the clouds* (1 Enoch 60:14). The angels seeing and praising the work, *And thereupon we saw His works, and praised Him, and lauded before Him on account of all His works* (Jubilees 2:3), is the heavenly host worshipping at creation — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53028
  FROM _session251_ju02_lookup sv, _session251_ju02_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-2-sun-sign-feasts-jubilees',
       E'The sun a great sign — for sabbaths, feasts, and jubilees',
       E'On the fourth day the luminaries are not merely lamps but the clock of the appointed times: *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years* (Jubilees 2:9). This is Genesis read with open eyes: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). The moedim are written into the sun from the fourth day — the feasts are not a later invention. Jubilees presses it to the solar reckoning later: *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days* (Jubilees 6:32), and the live Enoch apparatus opens its calendar book the same way: *The book of the courses of the luminaries of the heaven... showed me all their laws exactly as they are, and how it is with regard to all the years of the world* (1 Enoch 72:1). The feasts the sun marks are Yahuah''s own: *Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts* (Leviticus 23:2). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53031
  FROM _session251_ju02_lookup sv, _session251_ju02_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-2-sabbath-hallowed-from-creation',
       E'The Sabbath hallowed from creation — the eternal sign',
       E'The seventh day is not a Sinai novelty; it is the crown of creation, kept in heaven before any flesh kept it on earth: *And He gave us a great sign, the Sabbath day, that we should work six days, but keep Sabbath on the seventh day from all work* (Jubilees 2:16), and *on this we kept Sabbath in the heavens before it was made known to any flesh to keep Sabbath thereon on the earth* (Jubilees 2:30). Genesis already sealed it: *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made* (Genesis 2:3). The fourth word at Sinai grounds the rest in creation itself: *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). And it is named the everlasting covenant sign — exactly Jubilees'' language: *It is a sign between me and the children of Yashar''el (Israel) for ever: for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested, and was refreshed* (Exodus 31:17). The prophets keep calling it a delight, not a burden: *If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable* (Isaiah 58:13). Torah stands; the sign is eternal. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53034
  FROM _session251_ju02_lookup sv, _session251_ju02_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=2 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-2-israel-chosen-firstborn-seed',
       E'Israel chosen — the seed of Jacob, the firstborn, kept for the Sabbath',
       E'The Sabbath is the badge of an elect people, separated from the nations: *Behold, I will separate to Myself a people from among all the peoples, and these will keep the Sabbath day, and I will sanctify them to Myself as My people, and will bless them* (Jubilees 2:19), and *I have chosen the seed of Jacob from amongst all that I have seen, and have written him down as My firstborn son, and have sanctified him to Myself for ever and ever* (Jubilees 2:20). The firstborn-son title is straight from the Exodus deliverance: *Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22). The election is Moses'' own charter: *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6). And the Sabbath that seals this people is fixed in the calendar of holy convocations: *Six days shall work be done: but the seventh day is the sabbath of rest, an holy convocation; ye shall do no work therein: it is the sabbath of Yahuah (LORD) in all your dwellings* (Leviticus 23:3). Election precedes the keeping; the seed of Jacob is kept holy and gathered as Yahuah''s portion — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53037
  FROM _session251_ju02_lookup sv, _session251_ju02_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=2 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-2-six-days-creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:6 — *And Elohim (God) said, Let there be a firmament in the midst of the waters, and let it divide the waters from the waters.* Jubilees 2:4 retells the second day''s dividing of the waters word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-six-days-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:9 — *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so.* The third-day command of Jubilees 2:5 is the same gathering of the waters and appearing of the dry land.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-six-days-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth.* Jubilees 2:14 gives the same man, male and female, dominion over all that moves on the earth and in the seas.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-six-days-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 2:2 — *And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made.* Jubilees 2:16 finishes the six days and gives the Sabbath rest exactly as the source closes the creation account.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-six-days-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-2-angels-first-day-spirits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 104:4 — *Who maketh his angels spirits; his ministers a flaming fire.* Jubilees 2:2 names these same serving spirits, including the angels of the spirit of fire, created on the first day.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-angels-first-day-spirits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 60:13 — *And he showed me all the secrets of the lightning and thunder, and showed me the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew, and there I saw from whence they proceed in that place and from whence they saturate the dusty earth.* The same governed winds, clouds, lightning and thunder that Jubilees 2:2 assigns to angelic spirits.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-angels-first-day-spirits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=60 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 60:14 — *And he showed me closed chambers out of which the winds are divided, the chamber of the hail and winds, the chamber of the mist, and of the clouds, and the cloud thereof hovers over the earth from the beginning of the world.* The chambers of hail and mist match Jubilees 2:2''s angels of snow, hail and hoar frost.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-angels-first-day-spirits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=60 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Job 38:7 — *When the morning stars sang together, and all the sons of Elohim (God) shouted for joy?* The host praising at creation in Jubilees 2:3 is the same heavenly rejoicing over the works of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-angels-first-day-spirits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-2-sun-sign-feasts-jubilees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* Jubilees 2:9 reads the fourth-day lights as the appointed sign for sabbaths, feasts and jubilees.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sun-sign-feasts-jubilees'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 6:32 — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts.* The sun-as-sign of Jubilees 2:9 becomes the 364-day solar year Jubilees later commands.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sun-sign-feasts-jubilees'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 72:1 — *The book of the courses of the luminaries of the heaven, the relations of each, according to their classes, their dominion and their seasons, according to their names and places of origin, and according to their months, which Uriel, the holy angel who was with me, who was their leader, showed me.* The same luminaries Jubilees 2:9 makes the sign for seasons and feasts govern Enoch''s calendar of the years.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sun-sign-feasts-jubilees'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=72 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The feasts the sun marks in Jubilees 2:9 are the very moedim of Yahuah, His own appointed times.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sun-sign-feasts-jubilees'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-2-sabbath-hallowed-from-creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:3 — *And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made.* Jubilees 2:16 gives this same blessed, sanctified seventh day as the great sign over creation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sabbath-hallowed-from-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:11 — *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it.* The fourth word grounds the Sabbath in creation exactly as Jubilees 2:1 says the seventh day was hallowed for all ages.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sabbath-hallowed-from-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 31:17 — *It is a sign between me and the children of Yashar''el (Israel) for ever: for in six days Yahuah (LORD) made heaven and earth, and on the seventh day he rested, and was refreshed.* Jubilees 2:21 names the same created sign by which Israel keeps Sabbath with the angels for ever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sabbath-hallowed-from-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 31:14 — *Ye shall keep the sabbath therefore; for it is holy unto you: every one that defileth it shall surely be put to death: for whosoever doeth any work therein, that soul shall be cut off from among his people.* The death-penalty for defiling the day in Jubilees 2:25 quotes the Torah''s own statute.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sabbath-hallowed-from-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 58:13 — *If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable; and shalt honour him, not doing thine own ways, nor finding thine own pleasure, nor speaking thine own words.* Jubilees 2:29 forbids that same pleasure-seeking on the holy day, keeping the Sabbath honourable.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-sabbath-hallowed-from-creation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-2-israel-chosen-firstborn-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 4:22 — *And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn.* Jubilees 2:20 writes the seed of Jacob down as that same firstborn son, sanctified for ever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-israel-chosen-firstborn-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The people separated and sanctified in Jubilees 2:19 are this chosen, holy people of the Torah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-israel-chosen-firstborn-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:3 — *Six days shall work be done: but the seventh day is the sabbath of rest, an holy convocation; ye shall do no work therein: it is the sabbath of Yahuah (LORD) in all your dwellings.* The Sabbath Yahuah permits Israel alone to keep in Jubilees 2:31 stands first among the holy convocations of His feasts.'
  FROM cross_reference_threads t, cross_references x, _session251_ju02_lookup sv, _session251_ju02_lookup tv
 WHERE t.slug='jubilees-2-israel-chosen-firstborn-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=2 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jubilees_03.sql (session251 jubilees 3) -----
-- Source anchor: jubilees/jubilees ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju03 (view _session251_ju03_lookup). Sort band base 53050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-3-adam-names-the-creatures
  ('jubilees', 'jubilees', 3, 1, 'canon', 'genesis', 1, 25, 'free', E'Genesis 1:25 — *And Elohim (God) made the beast of the earth after his kind, and cattle after their kind, and every thing that creepeth upon the earth after his kind: and Elohim (God) saw that it was good.* The very creatures Jubilees 3:1 says were brought to Adam "according to their kinds" are the kinds the Creator made.'),
  ('jubilees', 'jubilees', 3, 2, 'canon', 'genesis', 2, 19, 'free', E'Genesis 2:19 — *And out of the ground Yahuah Elohim (the LORD God) formed every beast of the field, and every fowl of the air; and brought them unto Adam to see what he would call them: and whatsoever Adam called every living creature, that was the name thereof.* Jubilees 3:2 retells this scene word for theme: as Adam called them, so was their name.'),
  ('jubilees', 'jubilees', 3, 3, 'canon', 'genesis', 2, 20, 'free', E'Genesis 2:20 — *And Adam gave names to all cattle, and to the fowl of the air, and to every beast of the field; but for Adam there was not found an help meet for him.* Jubilees 3:3 echoes the same ache exactly — Adam saw every kind "but he was alone and found no helpmeet for him."'),
  -- thread: jubilees-3-woman-from-the-rib-one-flesh
  ('jubilees', 'jubilees', 3, 4, 'canon', 'genesis', 2, 18, 'free', E'Genesis 2:18 — *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* Jubilees 3:4 quotes the same divine resolve: "It is not good that the man should be alone: let us make a helpmeet for him."'),
  ('jubilees', 'jubilees', 3, 5, 'canon', 'genesis', 2, 21, 'free', E'Genesis 2:21 — *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof.* This is the very deep sleep and the rib Jubilees 3:5 says became "the origin of the woman from amongst his ribs."'),
  ('jubilees', 'jubilees', 3, 6, 'canon', 'genesis', 2, 23, 'free', E'Genesis 2:23 — *And Adam said, This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man.* Adam''s words in Jubilees 3:6 are this confession; the one-flesh ordinance is woven straight from it.'),
  ('jubilees', 'jubilees', 3, 6, 'canon', 'matthew', 19, 5, 'free', E'Matthew 19:5 — *And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* Yahusha appeals to the same creation ordinance Jubilees 3:6 records as given from the second week — "man and wife be one."'),
  -- thread: jubilees-3-law-of-purification-grounded-in-eve
  ('jubilees', 'jubilees', 3, 8, 'canon', 'leviticus', 12, 2, 'free', E'Leviticus 12:2 — *Speak unto the children of Yashar''el (Israel), saying, If a woman have conceived seed, and born a man child: then she shall be unclean seven days; according to the days of the separation for her infirmity shall she be unclean.* Jubilees 3:8 anchors this seven-day purification for a male in Eve and the creation weeks themselves.'),
  ('jubilees', 'jubilees', 3, 10, 'canon', 'leviticus', 12, 4, 'free', E'Leviticus 12:4 — *And she shall then continue in the blood of her purifying three and thirty days; she shall touch no hallowed thing, nor come into the sanctuary, until the days of her purifying be fulfilled.* Jubilees 3:10 quotes this same thirty-three days and sanctuary restriction as written "on the heavenly tables."'),
  ('jubilees', 'jubilees', 3, 11, 'canon', 'leviticus', 12, 5, 'free', E'Leviticus 12:5 — *But if she bear a maid child, then she shall be unclean two weeks, as in her separation: and she shall continue in the blood of her purifying threescore and six days.* The two weeks and sixty-six days of Jubilees 3:11 match the statute exactly, pre-engraved in Eve.'),
  ('jubilees', 'jubilees', 3, 13, 'canon', 'leviticus', 12, 7, 'free', E'Leviticus 12:7 — *Who shall offer it before Yahuah (LORD), and make an atonement for her; and she shall be cleansed from the issue of her blood. This is the law for her that hath born a male or a female.* Jubilees 3:13 gives the same single statute "regarding her who bears a male or a female child."'),
  -- thread: jubilees-3-eden-the-first-sanctuary
  ('jubilees', 'jubilees', 3, 9, 'canon', 'genesis', 2, 15, 'free', E'Genesis 2:15 — *And Yahuah Elohim (the LORD God) took the man, and put him into the garden of Eden to dress it and to keep it.* Jubilees 3:9 retells this priestly charge — Adam brought in "to till and keep" the holy garden.'),
  ('jubilees', 'jubilees', 3, 11, 'canon', 'genesis', 2, 8, 'free', E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The garden Jubilees 3:11 calls "holier than all the earth besides" is this planted Eden of Genesis.'),
  -- thread: jubilees-3-the-serpent-and-the-fall
  ('jubilees', 'jubilees', 3, 16, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* Jubilees 3:16 quotes the serpent''s opening question almost word for word.'),
  ('jubilees', 'jubilees', 3, 19, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The lie of Jubilees 3:19 — "You shall not surely die" — is the identical deception.'),
  ('jubilees', 'jubilees', 3, 19, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* Jubilees 3:19 carries the same promise that "your eyes will be opened, and you will be as gods."'),
  ('jubilees', 'jubilees', 3, 20, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Jubilees 3:20-21 retells the seeing, the taking, the eating, and the giving to Adam.'),
  -- thread: jubilees-3-curse-and-expulsion
  ('jubilees', 'jubilees', 3, 24, 'canon', 'genesis', 3, 16, 'free', E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* Jubilees 3:24 quotes this judgment on the woman almost verbatim.'),
  ('jubilees', 'jubilees', 3, 25, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* This is the sentence Jubilees 3:25 retells: "Because you have hearkened to the voice of your wife... cursed be the ground for your sake."'),
  ('jubilees', 'jubilees', 3, 25, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The sweat, the bread, and the return to earth of Jubilees 3:25 are this verse.'),
  ('jubilees', 'jubilees', 3, 26, 'canon', 'genesis', 3, 21, 'free', E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* Jubilees 3:26 retells the coats of skin and the sending forth from the garden.'),
  -- thread: jubilees-3-adam-the-priest-offers-incense
  ('jubilees', 'jubilees', 3, 27, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* Adam''s offering "in the morning with the rising of the sun" (Jubilees 3:27) keeps the appointed-time reckoning the lights were set for — the moedim engraved from creation.'),
  ('jubilees', 'jubilees', 3, 30, 'canon', 'genesis', 3, 21, 'free', E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The covering Jubilees 3:30 prescribes "on the heavenly tables" — that they not uncover themselves as the nations do — flows from this first God-given covering.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-adam-names-the-creatures',
       E'Adam names every creature — the second week of creation',
       E'Jubilees opens chapter three by retelling the naming of the animals, dating it to the second week and binding it tight to the creation order of Genesis: *"And Adam named them all by their respective names, and as he called them, so was their name"* (Jubilees 3:2). This is no new myth — it is the Genesis account quoted back from the heavenly remembrance. The angel narrating to Moses says Yahuah brought *"all the beasts, and all the cattle, and all the birds"* to Adam by their kinds, exactly the creatures the Creator had ordered: *"And Elohim (God) made the beast of the earth after his kind, and cattle after their kind, and every thing that creepeth upon the earth after his kind"* (Genesis 1:25). And the naming itself is the very scene of Eden: *"and whatsoever Adam called every living creature, that was the name thereof"* (Genesis 2:19). It ain''t new — Jubilees is reading Genesis back to us.',
       sv.verse_id, ev.verse_id, 'extras', 53050
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-woman-from-the-rib-one-flesh',
       E'The woman built from his side — and one flesh forever',
       E'Jubilees grounds marriage in the creation week itself: *"And Yahuah our Elohim (the LORD our God) caused a deep sleep to fall upon him, and he slept, and He took for the woman one rib from amongst his ribs... and built the woman"* (Jubilees 3:5). It is the Eden text retold: *"And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof"* (Genesis 2:21). When she is brought to him Adam''s cry is the same in both books — *"This is now bone of my bones and flesh of my flesh"* (Jubilees 3:6 / Genesis 2:23) — and the one-flesh ordinance follows. This is the law Yahusha Himself appeals back to as the unbreakable beginning: *"For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?"* (Matthew 19:5). The covenant of marriage was engraved from the first week; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53053
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-law-of-purification-grounded-in-eve',
       E'The days of purifying — written on the heavenly tables in Eve',
       E'Here is Jubilees'' signature move: it roots the Torah''s law of purification after childbirth in Eve herself and in the days of her entering the garden — *"for this reason the commandment was given to keep in their defilement, for a male seven days, and for a female twice seven days"* (Jubilees 3:8). The author then quotes the statute as already standing *"on the heavenly tables"*: *"if she bears a male, she shall remain in her uncleanness seven days... and thirty and three days shall she remain in the blood of her purifying"* (Jubilees 3:10), and for a female "two weeks... and sixty-six days" (Jubilees 3:11). This is the law of Leviticus, pre-engraved before Sinai: *"then she shall be unclean seven days... And she shall then continue in the blood of her purifying three and thirty days"* (Leviticus 12:2-4), and for a maid child "two weeks... threescore and six days" (Leviticus 12:5). Jubilees declares it plainly the eternal testimony: *"This is the law and testimony which was written down for Yashar''el (Israel), in order that they should observe (it) all the days"* (Jubilees 3:14). The feasts, the Sabbath, and the purity statutes are not Jewish latecomers — they were engraved on the heavenly tablets from the beginning. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53056
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-eden-the-first-sanctuary',
       E'Eden the holy place — the garden as sanctuary',
       E'Jubilees reads the Garden of Eden as the first sanctuary on earth, holier than all the world: *"we brought her into the Garden of Eden, for it is holier than all the earth besides, and every tree that is planted in it is holy"* (Jubilees 3:11). This is why the purifying mother who may not "enter into the sanctuary" (Jubilees 3:13) is delayed from entering Eden — the garden IS the temple. And Adam''s charge there is priestly service: *"we brought him into the Garden of Eden to till and keep it"* (Jubilees 3:9), the very commission of Genesis: *"And Yahuah Elohim (the LORD God) took the man, and put him into the garden of Eden to dress it and to keep it"* (Genesis 2:15). The same verbs the Torah later uses for the Levites'' guarding of the tabernacle. Adam is the first priest in the first holy place.',
       sv.verse_id, ev.verse_id, 'extras', 53059
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-the-serpent-and-the-fall',
       E'The serpent, the tree, and the eyes opened',
       E'Jubilees dates the fall to the second month, the seventeenth day, and retells Genesis 3 almost verse for verse: *"the serpent said to the woman, Has Elohim (God) commanded you, saying, You shall not eat of every tree of the garden?"* (Jubilees 3:16). It is the Eden temptation: *"Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?"* (Genesis 3:1). The serpent''s lie is the same — *"You shall not surely die"* (Jubilees 3:19) / *"Ye shall not surely die"* (Genesis 3:4) — and the woman''s seeing and taking is the same: *"the woman saw the tree that it was agreeable and pleasant to the eye, and that its fruit was good for food, and she took thereof and ate"* (Jubilees 3:20), retelling *"And when the woman saw that the tree was good for food... she took of the fruit thereof, and did eat"* (Genesis 3:6). The deception that breaks the first man is the oldest story in the world — and the oldest war. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53062
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-curse-and-expulsion',
       E'Sorrow, thorns, dust, and the coats of skin',
       E'The judgment in Jubilees is the judgment of Genesis 3, quoted back: to the woman, *"I shall greatly multiply your sorrow and your pains in sorrow you shall bring forth children"* (Jubilees 3:24), retelling *"I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children"* (Genesis 3:16); to the man, *"cursed be the ground for your sake: thorns and thistles shall it bring forth to you... for earth you are, and to earth shall you return"* (Jubilees 3:25), the very sentence of *"cursed is the ground for thy sake... for dust thou art, and unto dust shalt thou return"* (Genesis 3:17-19). Then the mercy: *"And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden"* (Jubilees 3:26), the covering of *"Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them"* (Genesis 3:21). The expulsion and the covering are the same in both — and the covering is already the shadow of an offering.',
       sv.verse_id, ev.verse_id, 'extras', 53065
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=24
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-3-adam-the-priest-offers-incense',
       E'Adam''s morning offering — the first incense outside Eden',
       E'Jubilees adds a detail Genesis only implies: on the day he left the garden, Adam offered worship like a priest. *"And on that day on which Adam went forth from the garden, he offered as a sweet savour an offering, frankincense, galbanum, and stacte, and spices in the morning with the rising of the sun"* (Jubilees 3:27). Frankincense, galbanum, and stacte are the very holy incense the Torah will later prescribe for the sanctuary — Adam is keeping the heavenly pattern before there is a tabernacle. And the law that follows is grounded in the heavenly tables again: *"it is prescribed on the heavenly tables... that they should cover their shame, and should not uncover themselves as the nations uncover themselves"* (Jubilees 3:30) — the seed kept holy and separate from the nations, even in the matter of shame. The covering Yahuah gave in skins (Genesis 3:21) becomes a standing testimony that Yahuah''s people are not like the nations. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53068
  FROM _session251_ju03_lookup sv, _session251_ju03_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=27
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=3 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-3-adam-names-the-creatures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:25 — *And Elohim (God) made the beast of the earth after his kind, and cattle after their kind, and every thing that creepeth upon the earth after his kind: and Elohim (God) saw that it was good.* The very creatures Jubilees 3:1 says were brought to Adam "according to their kinds" are the kinds the Creator made.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-adam-names-the-creatures'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:19 — *And out of the ground Yahuah Elohim (the LORD God) formed every beast of the field, and every fowl of the air; and brought them unto Adam to see what he would call them: and whatsoever Adam called every living creature, that was the name thereof.* Jubilees 3:2 retells this scene word for theme: as Adam called them, so was their name.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-adam-names-the-creatures'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:20 — *And Adam gave names to all cattle, and to the fowl of the air, and to every beast of the field; but for Adam there was not found an help meet for him.* Jubilees 3:3 echoes the same ache exactly — Adam saw every kind "but he was alone and found no helpmeet for him."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-adam-names-the-creatures'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-3-woman-from-the-rib-one-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:18 — *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* Jubilees 3:4 quotes the same divine resolve: "It is not good that the man should be alone: let us make a helpmeet for him."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-woman-from-the-rib-one-flesh'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:21 — *And Yahuah Elohim (the LORD God) caused a deep sleep to fall upon Adam, and he slept: and he took one of his ribs, and closed up the flesh instead thereof.* This is the very deep sleep and the rib Jubilees 3:5 says became "the origin of the woman from amongst his ribs."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-woman-from-the-rib-one-flesh'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:23 — *And Adam said, This is now bone of my bones, and flesh of my flesh: she shall be called Woman, because she was taken out of Man.* Adam''s words in Jubilees 3:6 are this confession; the one-flesh ordinance is woven straight from it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-woman-from-the-rib-one-flesh'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 19:5 — *And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* Yahusha appeals to the same creation ordinance Jubilees 3:6 records as given from the second week — "man and wife be one."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-woman-from-the-rib-one-flesh'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-3-law-of-purification-grounded-in-eve
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 12:2 — *Speak unto the children of Yashar''el (Israel), saying, If a woman have conceived seed, and born a man child: then she shall be unclean seven days; according to the days of the separation for her infirmity shall she be unclean.* Jubilees 3:8 anchors this seven-day purification for a male in Eve and the creation weeks themselves.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-law-of-purification-grounded-in-eve'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 12:4 — *And she shall then continue in the blood of her purifying three and thirty days; she shall touch no hallowed thing, nor come into the sanctuary, until the days of her purifying be fulfilled.* Jubilees 3:10 quotes this same thirty-three days and sanctuary restriction as written "on the heavenly tables."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-law-of-purification-grounded-in-eve'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 12:5 — *But if she bear a maid child, then she shall be unclean two weeks, as in her separation: and she shall continue in the blood of her purifying threescore and six days.* The two weeks and sixty-six days of Jubilees 3:11 match the statute exactly, pre-engraved in Eve.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-law-of-purification-grounded-in-eve'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 12:7 — *Who shall offer it before Yahuah (LORD), and make an atonement for her; and she shall be cleansed from the issue of her blood. This is the law for her that hath born a male or a female.* Jubilees 3:13 gives the same single statute "regarding her who bears a male or a female child."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-law-of-purification-grounded-in-eve'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-3-eden-the-first-sanctuary
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:15 — *And Yahuah Elohim (the LORD God) took the man, and put him into the garden of Eden to dress it and to keep it.* Jubilees 3:9 retells this priestly charge — Adam brought in "to till and keep" the holy garden.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-eden-the-first-sanctuary'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* The garden Jubilees 3:11 calls "holier than all the earth besides" is this planted Eden of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-eden-the-first-sanctuary'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-3-the-serpent-and-the-fall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* Jubilees 3:16 quotes the serpent''s opening question almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-the-serpent-and-the-fall'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The lie of Jubilees 3:19 — "You shall not surely die" — is the identical deception.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-the-serpent-and-the-fall'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* Jubilees 3:19 carries the same promise that "your eyes will be opened, and you will be as gods."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-the-serpent-and-the-fall'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Jubilees 3:20-21 retells the seeing, the taking, the eating, and the giving to Adam.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-the-serpent-and-the-fall'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-3-curse-and-expulsion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* Jubilees 3:24 quotes this judgment on the woman almost verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-curse-and-expulsion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life.* This is the sentence Jubilees 3:25 retells: "Because you have hearkened to the voice of your wife... cursed be the ground for your sake."'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-curse-and-expulsion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The sweat, the bread, and the return to earth of Jubilees 3:25 are this verse.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-curse-and-expulsion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* Jubilees 3:26 retells the coats of skin and the sending forth from the garden.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-curse-and-expulsion'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-3-adam-the-priest-offers-incense
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years.* Adam''s offering "in the morning with the rising of the sun" (Jubilees 3:27) keeps the appointed-time reckoning the lights were set for — the moedim engraved from creation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-adam-the-priest-offers-incense'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The covering Jubilees 3:30 prescribes "on the heavenly tables" — that they not uncover themselves as the nations do — flows from this first God-given covering.'
  FROM cross_reference_threads t, cross_references x, _session251_ju03_lookup sv, _session251_ju03_lookup tv
 WHERE t.slug='jubilees-3-adam-the-priest-offers-incense'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=3 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jubilees_04.sql (session251 jubilees 4) -----
-- Source anchor: jubilees/jubilees ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju04 (view _session251_ju04_lookup). Sort band base 53075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-4-cain-abel-blood
  ('jubilees', 'jubilees', 4, 2, 'canon', 'genesis', 4, 3, 'free', E'Genesis 4:3 — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD).* Jubilees 4:2 retells the rejected ground-offering exactly as Genesis frames it.'),
  ('jubilees', 'jubilees', 4, 2, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* This is the accepted sacrifice Jubilees 4:2 names as the reason Cain rose up.'),
  ('jubilees', 'jubilees', 4, 3, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The Genesis source of the blood that, in Jubilees 4:3, cried from the ground to heaven.'),
  ('jubilees', 'jubilees', 4, 2, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The Renewed Covenant names Abel''s accepted offering of Jubilees 4:2 as faith that still speaks.'),
  ('jubilees', 'jubilees', 4, 3, 'canon', 'hebrews', 12, 24, 'free', E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* Abel''s crying blood in Jubilees 4:3 becomes the very type the blood of Messiah surpasses.'),
  -- thread: jubilees-4-heavenly-tablets-judgment
  ('jubilees', 'jubilees', 4, 32, 'canon', 'leviticus', 24, 20, 'free', E'Leviticus 24:20 — *Breach for breach, eye for eye, tooth for tooth: as he hath caused a blemish in a man, so shall it be done to him again.* The Torah carries the same measure-for-measure law Jubilees 4:32 says was ordained on the heavenly tablets.'),
  ('jubilees', 'jubilees', 4, 31, 'canon', 'leviticus', 24, 17, 'free', E'Leviticus 24:17 — *And he that killeth any man shall surely be put to death.* Cain killed by stones in Jubilees 4:31 is the life-for-life sentence Torah lays down.'),
  ('jubilees', 'jubilees', 4, 4, 'canon', 'genesis', 4, 15, 'free', E'Genesis 4:15 — *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold. And Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him.* The Genesis judgment on Cain matches the heavenly-tablet curse of Jubilees 4:4.'),
  -- thread: jubilees-4-seth-second-seed
  ('jubilees', 'jubilees', 4, 7, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Jubilees 4:7 retells the raising up of the second seed almost word for word.'),
  ('jubilees', 'jubilees', 4, 12, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The calling on the Name Jubilees 4:12 attributes to Enos is the Genesis source.'),
  ('jubilees', 'jubilees', 4, 7, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* The genealogy of the kept seed that Jubilees 4:7 is unrolling jubilee by jubilee.'),
  -- thread: jubilees-4-enoch-scribe-witness
  ('jubilees', 'jubilees', 4, 17, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Torah''s terse note is what Jubilees 4:23 expands into Enoch being conducted into the Garden of Eden.'),
  ('jubilees', 'jubilees', 4, 23, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The Renewed Covenant confirms the taking-alive Jubilees 4:23 narrates.'),
  ('jubilees', 'jubilees', 4, 17, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* The canon itself names Enoch the testifying prophet Jubilees 4:17 calls the first to write a testimony.'),
  ('jubilees', 'jubilees', 4, 17, 'enoch', '1-enoch', 12, 3, 'extras', E'1 Enoch 12:3 — *And I Enoch was blessing Yahuah (God) of majesty and the King of the ages, and lo! the Watchers called me—Enoch the scribe—and said to me:* The living 1 Enoch text shows the scribe-of-righteousness office Jubilees 4:17 ascribes to him.'),
  ('jubilees', 'jubilees', 4, 23, 'enoch', '1-enoch', 13, 8, 'extras', E'1 Enoch 13:8 — *And behold a dream came to me, and visions fell upon me, and I saw visions of chastisement, and a voice came to me saying: ‘Speak to the sons of heaven, and reprimand them.’* The vision-and-witness commission of Jubilees 4:23 unfolds in the parallel Enoch apparatus.'),
  -- thread: jubilees-4-watchers-descended-jared
  ('jubilees', 'jubilees', 4, 22, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Genesis source of the Watchers defiling themselves with the daughters of men that Enoch testifies against in Jubilees 4:22.'),
  ('jubilees', 'jubilees', 4, 15, 'enoch', '1-enoch', 6, 6, 'extras', E'1 Enoch 6:6 — *And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The 1 Enoch apparatus fixes the Watchers'' descent to the same generation of Jared that Jubilees 4:15 names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-4-cain-abel-blood',
       E'Cain and Abel — the blood that cries from the ground',
       E'Jubilees opens Adam''s line with the first murder and the first martyr''s blood: *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain* (Jubilees 4:2), *And he slew him in the field: and his blood cried from the ground to heaven, complaining because he had slain him* (Jubilees 4:3). This is the Genesis source retold word for word: *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD)* (Genesis 4:3) and *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground* (Genesis 4:10). It ain''t new — the Renewed Covenant reads the same scene back: Abel''s accepted sacrifice was faith, *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh* (Hebrews 11:4), and his crying blood becomes the type that the blood of Messiah surpasses, *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel* (Hebrews 12:24).',
       sv.verse_id, ev.verse_id, 'extras', 53075
  FROM _session251_ju04_lookup sv, _session251_ju04_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-4-heavenly-tablets-judgment',
       E'Written on the heavenly tablets — life for life, measure for measure',
       E'Jubilees grounds the law of bloodguilt not in Sinai-as-novelty but in the heavenly tablets engraved before the deed: *And on this account it is written on the heavenly tables, “Cursed is he who smites his neighbour treacherously, and let all who have seen and heard say, So be it; and the man who has seen and not declared (it), let him be accursed as the other.”* (Jubilees 4:4). Cain''s own end seals it — *At the close of this jubilee Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment* (Jubilees 4:31) — *For this reason it was ordained on the heavenly tables: “With the instrument with which a man kills his neighbour with the same shall he be killed; after the manner that he wounded him, in like manner shall they deal with him.”* (Jubilees 4:32). It ain''t new: the same measure-for-measure justice stands in the Torah, *Breach for breach, eye for eye, tooth for tooth: as he hath caused a blemish in a man, so shall it be done to him again* (Leviticus 24:20) and *And he that killeth any man shall surely be put to death* (Leviticus 24:17) — Torah and the heavenly tablets agree, the covenant''s justice eternal, never abolished. Even Cain''s protective mark belongs to the same ordered judgment, *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold. And Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him* (Genesis 4:15).',
       sv.verse_id, ev.verse_id, 'extras', 53078
  FROM _session251_ju04_lookup sv, _session251_ju04_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=4 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-4-seth-second-seed',
       E'Seth — the second seed raised up, the line kept',
       E'Where Cain''s line is cursed, Jubilees keeps the elect seed alive through Seth: *Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said “Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him.”* (Jubilees 4:7), and through his son the worship begins, *He began to call on the name of Yahuah (God) on the earth* (Jubilees 4:12). This is Genesis 5 and the close of Genesis 4 retold: *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew* (Genesis 4:25) and *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). The genealogy that carries the seed forward is the very book Jubilees is unrolling, *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth* (Genesis 5:3) — the seed kept separate and called by the Name, election running through the chosen line. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53081
  FROM _session251_ju04_lookup sv, _session251_ju04_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=7
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-4-enoch-scribe-witness',
       E'Enoch — the first scribe, the witness, taken to the Garden',
       E'Jubilees gives Enoch his fullest portrait: the first to learn writing and to read the heavens, the scribe and witness who recounted the appointed times. *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven according to the order of their months in a book, that men might know the seasons of the years according to the order of their separate months. And he was the first to write a testimony, and he testified to the sons of men among the generations of the earth, and recounted the weeks of the jubilees, and made known to them the days of the years, and set in order the months and recounted the Sabbaths of the years as we made (them) known to him* (Jubilees 4:17). He was taken alive — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men* (Jubilees 4:23). The Torah genealogy says the same in fewer words, *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24), and the Renewed Covenant confirms the translation, *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). His office as the prophet of judgment is quoted in the canon itself, *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14). And the live 1 Enoch apparatus shows the very scribe Jubilees describes: *And I Enoch was blessing Yahuah (God) of majesty and the King of the ages, and lo! the Watchers called me—Enoch the scribe—and said to me:* (1 Enoch 12:3) and *And behold a dream came to me, and visions fell upon me, and I saw visions of chastisement, and a voice came to me saying: ‘Speak to the sons of heaven, and reprimand them.’* (1 Enoch 13:8). It ain''t new — the calendar of the heavenly tablets, the months and Sabbaths of the years, is the same Appointed Times engraved before the patriarchs ever kept them.',
       sv.verse_id, ev.verse_id, 'extras', 53084
  FROM _session251_ju04_lookup sv, _session251_ju04_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=4 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-4-watchers-descended-jared',
       E'The Watchers descended in the days of Jared',
       E'Jubilees fixes the descent of the Watchers to a generation in Adam''s line: *and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers, that they should instruct the children of men, and that they should do judgment and uprightness on the earth* (Jubilees 4:15) — and what they became is what Enoch testified against, *And he testified to the Watchers, who had sinned with the daughters of men; for these had begun to unite themselves, so as to be defiled, with the daughters of men, and Enoch testified against (them) all* (Jubilees 4:22). This is the Genesis 6 corruption read alongside its source, *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2). The live 1 Enoch apparatus ties the descent to the very name Jared, *And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it* (1 Enoch 6:6). The seed-war is one story across the witnesses — the defilement of the daughters of men, the Watchers'' sin, and the Flood that answers it, all engraved on the heavenly tablets long before Genesis was written down. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53087
  FROM _session251_ju04_lookup sv, _session251_ju04_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=15
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=4 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-4-cain-abel-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:3 — *And in process of time it came to pass, that Cain brought of the fruit of the ground an offering unto Yahuah (LORD).* Jubilees 4:2 retells the rejected ground-offering exactly as Genesis frames it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-cain-abel-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* This is the accepted sacrifice Jubilees 4:2 names as the reason Cain rose up.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-cain-abel-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother''s blood crieth unto me from the ground.* The Genesis source of the blood that, in Jubilees 4:3, cried from the ground to heaven.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-cain-abel-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The Renewed Covenant names Abel''s accepted offering of Jubilees 4:2 as faith that still speaks.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-cain-abel-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 12:24 — *And to Yahusha (Jesus) the mediator of the new covenant, and to the blood of sprinkling, that speaketh better things than that of Abel.* Abel''s crying blood in Jubilees 4:3 becomes the very type the blood of Messiah surpasses.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-cain-abel-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-4-heavenly-tablets-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 24:20 — *Breach for breach, eye for eye, tooth for tooth: as he hath caused a blemish in a man, so shall it be done to him again.* The Torah carries the same measure-for-measure law Jubilees 4:32 says was ordained on the heavenly tablets.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-heavenly-tablets-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=24 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 24:17 — *And he that killeth any man shall surely be put to death.* Cain killed by stones in Jubilees 4:31 is the life-for-life sentence Torah lays down.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-heavenly-tablets-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:15 — *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold. And Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him.* The Genesis judgment on Cain matches the heavenly-tablet curse of Jubilees 4:4.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-heavenly-tablets-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-4-seth-second-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Jubilees 4:7 retells the raising up of the second seed almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-seth-second-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The calling on the Name Jubilees 4:12 attributes to Enos is the Genesis source.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-seth-second-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* The genealogy of the kept seed that Jubilees 4:7 is unrolling jubilee by jubilee.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-seth-second-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-4-enoch-scribe-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Torah''s terse note is what Jubilees 4:23 expands into Enoch being conducted into the Garden of Eden.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-enoch-scribe-witness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The Renewed Covenant confirms the taking-alive Jubilees 4:23 narrates.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-enoch-scribe-witness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* The canon itself names Enoch the testifying prophet Jubilees 4:17 calls the first to write a testimony.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-enoch-scribe-witness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 12:3 — *And I Enoch was blessing Yahuah (God) of majesty and the King of the ages, and lo! the Watchers called me—Enoch the scribe—and said to me:* The living 1 Enoch text shows the scribe-of-righteousness office Jubilees 4:17 ascribes to him.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-enoch-scribe-witness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 13:8 — *And behold a dream came to me, and visions fell upon me, and I saw visions of chastisement, and a voice came to me saying: ‘Speak to the sons of heaven, and reprimand them.’* The vision-and-witness commission of Jubilees 4:23 unfolds in the parallel Enoch apparatus.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-enoch-scribe-witness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-4-watchers-descended-jared
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Genesis source of the Watchers defiling themselves with the daughters of men that Enoch testifies against in Jubilees 4:22.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-watchers-descended-jared'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 6:6 — *And they were in all two hundred; who descended in the days of Yered (Jared) on the summit of Mount Hermon, and they called it Mount Hermon, because they had sworn and bound themselves by mutual imprecations upon it.* The 1 Enoch apparatus fixes the Watchers'' descent to the same generation of Jared that Jubilees 4:15 names.'
  FROM cross_reference_threads t, cross_references x, _session251_ju04_lookup sv, _session251_ju04_lookup tv
 WHERE t.slug='jubilees-4-watchers-descended-jared'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

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

-- ----- fragment: minion_jubilees_06.sql (session251 jubilees 6) -----
-- Source anchor: jubilees/jubilees ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju06 (view _session251_ju06_lookup). Sort band base 53125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-6-noah-altar-covenant
  ('jubilees', 'jubilees', 6, 1, 'canon', 'genesis', 8, 20, 'free', E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* The Genesis source of Noah''s altar that Jubilees 6:1 dates to the new moon of the third month.'),
  ('jubilees', 'jubilees', 6, 3, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The goodly savour of Jubilees 6:3 is the sweet savour Genesis records, and the same promise of no second flood follows.'),
  ('jubilees', 'jubilees', 6, 4, 'canon', 'genesis', 8, 22, 'free', E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* Jubilees 6:4 quotes this ordering of the seasons almost word for word as the content of the covenant Yahuah makes with Noah.'),
  ('jubilees', 'jubilees', 6, 4, 'canon', 'genesis', 9, 11, 'free', E'Genesis 9:11 — *And I will establish my covenant with you; neither shall all flesh be cut off any more by the waters of a flood; neither shall there any more be a flood to destroy the earth.* The covenant of no second flood that Jubilees 6:4 names is the covenant Genesis 9 establishes.'),
  -- thread: jubilees-6-be-fruitful-the-bow
  ('jubilees', 'jubilees', 6, 5, 'canon', 'genesis', 9, 1, 'free', E'Genesis 9:1 — *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth.* The increase-and-multiply blessing of Jubilees 6:5,9 is the Genesis blessing on Noah, itself the creation mandate renewed after the flood.'),
  ('jubilees', 'jubilees', 6, 5, 'canon', 'genesis', 9, 2, 'free', E'Genesis 9:2 — *And the fear of you and the dread of you shall be upon every beast of the earth, and upon every fowl of the air, upon all that moveth upon the earth, and upon all the fishes of the sea; into your hand are they delivered.* Jubilees 6:5 retells this dominion: the fear and dread inspired in everything on earth and in the sea.'),
  ('jubilees', 'jubilees', 6, 16, 'canon', 'genesis', 9, 13, 'free', E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The bow Yahuah sets in Jubilees 6:16 as the sign of the covenant is the bow Genesis sets as its token.'),
  ('jubilees', 'jubilees', 6, 16, 'canon', 'genesis', 9, 16, 'free', E'Genesis 9:16 — *And the bow shall be in the cloud; and I will look upon it, that I may remember the everlasting covenant between Elohim (God) and every living creature of all flesh that is upon the earth.* What Jubilees 6:16 calls the eternal covenant Genesis calls the everlasting covenant — a permanent sign, never abolished.'),
  -- thread: jubilees-6-no-blood-the-life-is-the-blood
  ('jubilees', 'jubilees', 6, 6, 'canon', 'genesis', 9, 4, 'free', E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* The blood prohibition Jubilees 6:6 gives Noah is taken straight from Genesis'' covenant with Noah.'),
  ('jubilees', 'jubilees', 6, 8, 'canon', 'genesis', 9, 6, 'free', E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* Jubilees 6:8 quotes this image-of-Elohim ground for requiring the blood of man almost verbatim.'),
  ('jubilees', 'jubilees', 6, 13, 'canon', 'leviticus', 17, 10, 'free', E'Leviticus 17:10 — *And whatsoever man there be of the house of Yashar''el (Israel), or of the strangers that sojourn among you, that eateth any manner of blood; I will even set my face against that soul that eateth blood, and will cut him off from among his people.* The Torah carries the Noahic no-blood law forward to Israel, with the same cutting-off Jubilees 6:11,13 commands.'),
  ('jubilees', 'jubilees', 6, 6, 'canon', 'leviticus', 17, 11, 'free', E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* Jubilees 6:6''s reason — the life of all flesh is in the blood — is the Torah''s own reason, and it is why the blood belongs on the altar (Jubilees 6:14).'),
  ('jubilees', 'jubilees', 6, 6, 'canon', 'leviticus', 17, 14, 'free', E'Leviticus 17:14 — *For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off.* Word for word the rationale of Jubilees 6:6 — the life of all flesh is the blood — binding the same eternal commandment.'),
  -- thread: jubilees-6-covenant-by-oath-blood-sprinkled-sinai
  ('jubilees', 'jubilees', 6, 11, 'canon', 'exodus', 19, 1, 'free', E'Exodus 19:1 — *In the third month, when the children of Yashar''el (Israel) were gone forth out of the land of Egypt, the same day came they into the wilderness of Sinai.* Jubilees 6:11 makes the covenant on the mountain a third-month covenant, the very month Exodus places Israel at Sinai.'),
  ('jubilees', 'jubilees', 6, 11, 'canon', 'exodus', 24, 8, 'free', E'Exodus 24:8 — *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* The sprinkling of blood on the people because of all the words of the covenant in Jubilees 6:11 is the Sinai covenant-blood Exodus describes.'),
  -- thread: jubilees-6-feast-of-weeks-heavenly-tablets
  ('jubilees', 'jubilees', 6, 17, 'canon', 'leviticus', 23, 15, 'free', E'Leviticus 23:15 — *And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete.* The Torah''s count of weeks to Shavuot is the feast of weeks Jubilees 6:17 says was engraved on the heavenly tablets and kept from creation.'),
  ('jubilees', 'jubilees', 6, 21, 'canon', 'leviticus', 23, 16, 'free', E'Leviticus 23:16 — *Even unto the morrow after the seventh sabbath shall ye number fifty days; and ye shall offer a new meat offering unto Yahuah (LORD).* The fifty-day count to the new offering matches the once-a-year feast of weeks Jubilees 6:21 calls twofold.'),
  ('jubilees', 'jubilees', 6, 21, 'canon', 'leviticus', 23, 17, 'free', E'Leviticus 23:17 — *Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto Yahuah (LORD).* Jubilees 6:21 names the feast ''the feast of weeks and the feast of first-fruits''; here are the firstfruits loaves the Torah commands for it.'),
  ('jubilees', 'jubilees', 6, 20, 'canon', 'leviticus', 23, 21, 'free', E'Leviticus 23:21 — *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever in all your dwellings throughout your generations.* Jubilees 6:20 commands Israel to keep this festival in all their generations; the Torah seals it a statute for ever — never abolished.'),
  -- thread: jubilees-6-364-day-year-against-the-moon
  ('jubilees', 'jubilees', 6, 32, 'enoch', '1-enoch', 74, 10, 'extras', E'1 Enoch 74:10 — *And the sun and the moon complete the year in three hundred and sixty-four days.* Enoch''s luminary order names the exact 364-day reckoning Jubilees 6:32 commands Israel to observe.'),
  ('jubilees', 'jubilees', 6, 32, 'enoch', '1-enoch', 74, 13, 'extras', E'1 Enoch 74:13 — *And the moon brings in all the years exactly, that their stations may come, and that they may not transgress their reckoned stations, and that they may not change their order, but complete the years with righteousness, three hundred and sixty-four days.* The same 364-day order kept ''with righteousness'' that Jubilees 6:32 says must not disturb its feasts.'),
  ('jubilees', 'jubilees', 6, 37, 'enoch', '1-enoch', 82, 3, 'extras', E'1 Enoch 82:3 — *And in those days the sinners shall alter the order, And shall set aside all the commandments of Yahuah (God) of Spirits... And they shall alter the times, And the seasons, And the new moons, And the sabbaths, And the festivals, And they shall eat blood with all kinds of flesh.* Enoch''s warning is Jubilees 6:37 word for word, closing on the same eating of blood with all kinds of flesh.'),
  ('jubilees', 'jubilees', 6, 36, 'canon', 'daniel', 7, 25, 'free', E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The horn that thinks to change times and laws is Daniel''s name for the very disordering of the appointed times Jubilees 6:36-37 foretells.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-6-noah-altar-covenant',
       E'Noah''s altar and the covenant after the flood',
       E'Jubilees opens the chapter with Noah coming off the ark and building an altar in the third month: *And on the new moon of the third month he went forth from the ark, and built an altar on that mountain* (Jubilees 6:1), and Yahuah answers the sweet savour with a covenant — *And Yahuah (God) smelt the goodly savour, and He made a covenant with him that there should not be any more a flood to destroy the earth; that all the days of the earth seed-time and harvest should never cease; cold and heat, and summer and winter, and day and night should not change their order, nor cease for ever* (Jubilees 6:4). This is Genesis retold beside its source: *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar* (Genesis 8:20), the same sweet savour — *And Yahuah (LORD) smelled a sweet savour* (Genesis 8:21) — and the same unbroken seasons, *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease* (Genesis 8:22). The covenant of Genesis 9 stands behind it — *And I will establish my covenant with you; neither shall all flesh be cut off any more by the waters of a flood; neither shall there any more be a flood to destroy the earth* (Genesis 9:11). It ain''t new: Jubilees is unfolding Genesis, not replacing it.',
       sv.verse_id, ev.verse_id, 'extras', 53125
  FROM _session251_ju06_lookup sv, _session251_ju06_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=6 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-6-be-fruitful-the-bow',
       E'Be fruitful and multiply, and the bow in the cloud',
       E'To Noah Jubilees gives the creation blessing again — *And you, increase you and multiply upon the earth, and become many upon it, and be a blessing upon it. The fear of you and the dread of you I shall inspire in everything that is on earth and in the sea* (Jubilees 6:5) — and seals it with the sign: *He set His bow in the cloud for a sign of the eternal covenant that there should not again be a flood on the earth to destroy it all the days of the earth* (Jubilees 6:16). Genesis is the source quoted beside it: *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth* (Genesis 9:1), with the same fear and dread laid on every beast (Genesis 9:2), and the bow set as the token — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth* (Genesis 9:13). Jubilees calls it the sign of the **eternal** covenant, and Genesis calls it the **everlasting** covenant (Genesis 9:16): a sign engraved into the order of things, never repealed.',
       sv.verse_id, ev.verse_id, 'extras', 53128
  FROM _session251_ju06_lookup sv, _session251_ju06_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-6-no-blood-the-life-is-the-blood',
       E'Eat no blood: the life of all flesh is in the blood',
       E'Jubilees grounds the blood prohibition in Noah and binds it on Israel for ever: *But flesh, with the life thereof, with the blood, you shall not eat; for the life of all flesh is in the blood* (Jubilees 6:7), and the oath that follows — *And Noah and his sons swore that they would not eat any blood that was in any flesh* (Jubilees 6:10) — is law without limit: *And for this law there is no limit of days, for it is for ever* (Jubilees 6:14). The Genesis source is quoted beside it — *But flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4) — together with the image-of-Elohim ground for the avenging of blood, *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). And the Torah carries the same statute forward to Israel: *And whatsoever man there be of the house of Yashar''el (Israel)... that eateth any manner of blood; I will even set my face against that soul that eateth blood, and will cut him off from among his people* (Leviticus 17:10), *For the life of the flesh is in the blood* (Leviticus 17:11). One unbroken commandment from Noah to Sinai — it ain''t new, and it ain''t repealed.',
       sv.verse_id, ev.verse_id, 'extras', 53131
  FROM _session251_ju06_lookup sv, _session251_ju06_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=6 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-6-covenant-by-oath-blood-sprinkled-sinai',
       E'The covenant by oath, the blood sprinkled in the third month at Sinai',
       E'Jubilees reads Noah''s third-month oath forward to Sinai: *On this account He spake to you that you should make a covenant with the children of Yashar''el (Israel) in this month upon the mountain with an oath, and that you should sprinkle blood upon them because of all the words of the covenant* (Jubilees 6:11). The same third month, the same mountain — Exodus places Israel at Sinai exactly then: *In the third month, when the children of Yashar''el (Israel) were gone forth out of the land of Egypt, the same day came they into the wilderness of Sinai* (Exodus 19:1). And the blood sprinkled on the people is the Sinai covenant-blood: *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words* (Exodus 24:8). Jubilees binds Noah''s feast-of-oaths to the covenant cut at Sinai in the very same month — the patriarchal root of Shavuot as a covenant-renewal feast.',
       sv.verse_id, ev.verse_id, 'extras', 53134
  FROM _session251_ju06_lookup sv, _session251_ju06_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=6 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-6-feast-of-weeks-heavenly-tablets',
       E'The feast of weeks engraved on the heavenly tablets — it ain''t new',
       E'Here is the spine of Yoshi''s Appointed Times. Jubilees grounds Shavuot in the heavenly tablets and the fathers, centuries before Sinai: *For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year* (Jubilees 6:17), kept from creation through Noah, *But Abraham observed it, and Isaac and Jacob and his children observed it up to your days* (Jubilees 6:19). It is named twofold — *For it is the feast of weeks and the feast of first-fruits: this feast is twofold and of a double nature* (Jubilees 6:21). The Torah counts that very feast: *And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete* (Leviticus 23:15); *Even unto the morrow after the seventh sabbath shall ye number fifty days* (Leviticus 23:16), the firstfruits loaves (Leviticus 23:17), proclaimed a holy convocation *for ever in all your dwellings throughout your generations* (Leviticus 23:21). The feast is not a later Jewish invention layered on; Jubilees says it was kept by the patriarchs and engraved on the tablets. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53137
  FROM _session251_ju06_lookup sv, _session251_ju06_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=17
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=6 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-6-364-day-year-against-the-moon',
       E'The 364-day year on the heavenly tablets, and the sinners who follow the moon',
       E'The calendar climax. Jubilees commands the solar reckoning engraved on the tablets — *And command you the children of Yashar''el (Israel) that they observe the years according to this reckoning-three hundred and sixty-four days, and (these) will constitute a complete year, and they will not disturb its time from its days and from its feasts* (Jubilees 6:32) — and warns that those who watch the moon will wreck the appointed times: *For there will be those who will assuredly make observations of the moon–now (it) disturbs the seasons and comes in from year to year ten days too soon* (Jubilees 6:36), confounding the holy with the unclean, *for they will go wrong as to the months and sabbaths and feasts and jubilees* (Jubilees 6:37). The live 1 Enoch apparatus speaks with one voice: *And the sun and the moon complete the year in three hundred and sixty-four days* (1 Enoch 74:10), the years brought in *that they may not change their order, but complete the years with righteousness, three hundred and sixty-four days* (1 Enoch 74:13); and the same indictment of the sinners — *And shall set aside all the commandments... And they shall alter the times, And the seasons, And the new moons, And the sabbaths, And the festivals, And they shall eat blood with all kinds of flesh* (1 Enoch 82:3), which echoes Jubilees 6:37''s blood-and-flesh closing line exactly. And Daniel names the same spirit in the last days: *and think to change times and laws* (Daniel 7:25). Yoshi''s Appointed Times: the order is fixed on the heavenly tablets — to follow the moon''s drift is to lose the path of the years.',
       sv.verse_id, ev.verse_id, 'extras', 53140
  FROM _session251_ju06_lookup sv, _session251_ju06_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=32
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=6 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-6-noah-altar-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* The Genesis source of Noah''s altar that Jubilees 6:1 dates to the new moon of the third month.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-noah-altar-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The goodly savour of Jubilees 6:3 is the sweet savour Genesis records, and the same promise of no second flood follows.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-noah-altar-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* Jubilees 6:4 quotes this ordering of the seasons almost word for word as the content of the covenant Yahuah makes with Noah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-noah-altar-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 9:11 — *And I will establish my covenant with you; neither shall all flesh be cut off any more by the waters of a flood; neither shall there any more be a flood to destroy the earth.* The covenant of no second flood that Jubilees 6:4 names is the covenant Genesis 9 establishes.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-noah-altar-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-6-be-fruitful-the-bow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:1 — *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth.* The increase-and-multiply blessing of Jubilees 6:5,9 is the Genesis blessing on Noah, itself the creation mandate renewed after the flood.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-be-fruitful-the-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:2 — *And the fear of you and the dread of you shall be upon every beast of the earth, and upon every fowl of the air, upon all that moveth upon the earth, and upon all the fishes of the sea; into your hand are they delivered.* Jubilees 6:5 retells this dominion: the fear and dread inspired in everything on earth and in the sea.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-be-fruitful-the-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The bow Yahuah sets in Jubilees 6:16 as the sign of the covenant is the bow Genesis sets as its token.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-be-fruitful-the-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 9:16 — *And the bow shall be in the cloud; and I will look upon it, that I may remember the everlasting covenant between Elohim (God) and every living creature of all flesh that is upon the earth.* What Jubilees 6:16 calls the eternal covenant Genesis calls the everlasting covenant — a permanent sign, never abolished.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-be-fruitful-the-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-6-no-blood-the-life-is-the-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* The blood prohibition Jubilees 6:6 gives Noah is taken straight from Genesis'' covenant with Noah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-no-blood-the-life-is-the-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* Jubilees 6:8 quotes this image-of-Elohim ground for requiring the blood of man almost verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-no-blood-the-life-is-the-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 17:10 — *And whatsoever man there be of the house of Yashar''el (Israel), or of the strangers that sojourn among you, that eateth any manner of blood; I will even set my face against that soul that eateth blood, and will cut him off from among his people.* The Torah carries the Noahic no-blood law forward to Israel, with the same cutting-off Jubilees 6:11,13 commands.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-no-blood-the-life-is-the-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul.* Jubilees 6:6''s reason — the life of all flesh is in the blood — is the Torah''s own reason, and it is why the blood belongs on the altar (Jubilees 6:14).'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-no-blood-the-life-is-the-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Leviticus 17:14 — *For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off.* Word for word the rationale of Jubilees 6:6 — the life of all flesh is the blood — binding the same eternal commandment.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-no-blood-the-life-is-the-blood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-6-covenant-by-oath-blood-sprinkled-sinai
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:1 — *In the third month, when the children of Yashar''el (Israel) were gone forth out of the land of Egypt, the same day came they into the wilderness of Sinai.* Jubilees 6:11 makes the covenant on the mountain a third-month covenant, the very month Exodus places Israel at Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-covenant-by-oath-blood-sprinkled-sinai'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 24:8 — *And Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words.* The sprinkling of blood on the people because of all the words of the covenant in Jubilees 6:11 is the Sinai covenant-blood Exodus describes.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-covenant-by-oath-blood-sprinkled-sinai'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-6-feast-of-weeks-heavenly-tablets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:15 — *And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete.* The Torah''s count of weeks to Shavuot is the feast of weeks Jubilees 6:17 says was engraved on the heavenly tablets and kept from creation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-feast-of-weeks-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 23:16 — *Even unto the morrow after the seventh sabbath shall ye number fifty days; and ye shall offer a new meat offering unto Yahuah (LORD).* The fifty-day count to the new offering matches the once-a-year feast of weeks Jubilees 6:21 calls twofold.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-feast-of-weeks-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:17 — *Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto Yahuah (LORD).* Jubilees 6:21 names the feast ''the feast of weeks and the feast of first-fruits''; here are the firstfruits loaves the Torah commands for it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-feast-of-weeks-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 23:21 — *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever in all your dwellings throughout your generations.* Jubilees 6:20 commands Israel to keep this festival in all their generations; the Torah seals it a statute for ever — never abolished.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-feast-of-weeks-heavenly-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-6-364-day-year-against-the-moon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 74:10 — *And the sun and the moon complete the year in three hundred and sixty-four days.* Enoch''s luminary order names the exact 364-day reckoning Jubilees 6:32 commands Israel to observe.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-364-day-year-against-the-moon'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=32
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=74 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 74:13 — *And the moon brings in all the years exactly, that their stations may come, and that they may not transgress their reckoned stations, and that they may not change their order, but complete the years with righteousness, three hundred and sixty-four days.* The same 364-day order kept ''with righteousness'' that Jubilees 6:32 says must not disturb its feasts.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-364-day-year-against-the-moon'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=32
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=74 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 82:3 — *And in those days the sinners shall alter the order, And shall set aside all the commandments of Yahuah (God) of Spirits... And they shall alter the times, And the seasons, And the new moons, And the sabbaths, And the festivals, And they shall eat blood with all kinds of flesh.* Enoch''s warning is Jubilees 6:37 word for word, closing on the same eating of blood with all kinds of flesh.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-364-day-year-against-the-moon'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=37
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=82 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:25 — *And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* The horn that thinks to change times and laws is Daniel''s name for the very disordering of the appointed times Jubilees 6:36-37 foretells.'
  FROM cross_reference_threads t, cross_references x, _session251_ju06_lookup sv, _session251_ju06_lookup tv
 WHERE t.slug='jubilees-6-364-day-year-against-the-moon'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=6 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jubilees_07.sql (session251 jubilees 7) -----
-- Source anchor: jubilees/jubilees ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju07 (view _session251_ju07_lookup). Sort band base 53150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-7-noah-vineyard-firstfruits
  ('jubilees', 'jubilees', 7, 1, 'canon', 'genesis', 9, 20, 'free', E'Genesis 9:20 — *And Noah began to be an husbandman, and he planted a vineyard:* the bare Genesis planting that Jubilees 7:1 retells as a guarded, calendared firstfruits crop.'),
  ('jubilees', 'jubilees', 7, 1, 'canon', 'leviticus', 19, 23, 'free', E'Leviticus 19:23 — *And when ye shall come into the land, and shall have planted all manner of trees for food, then ye shall count the fruit thereof as uncircumcised: three years shall it be as uncircumcised unto you: it shall not be eaten of:* the very law for which Noah *guarded their fruit* through three years in Jubilees 7:1.'),
  ('jubilees', 'jubilees', 7, 1, 'canon', 'leviticus', 19, 24, 'free', E'Leviticus 19:24 — *But in the fourth year all the fruit thereof shall be holy to praise Yahuah (LORD) withal:* why Noah gathers in *the fourth year* — the fruit is now holy, kept before Sinai (Jubilees 7:1).'),
  -- thread: jubilees-7-firstfruits-wine-oil-feast
  ('jubilees', 'jubilees', 7, 36, 'canon', 'leviticus', 19, 24, 'free', E'Leviticus 19:24 — *But in the fourth year all the fruit thereof shall be holy to praise Yahuah (LORD) withal:* the fourth-year holiness Jubilees 7:36 spells out as *in the fourth year its fruit will be accounted holy.*'),
  ('jubilees', 'jubilees', 7, 37, 'canon', 'leviticus', 19, 25, 'free', E'Leviticus 19:25 — *And in the fifth year shall ye eat of the fruit thereof, that it may yield unto you the increase thereof: I am Yahuah Elohaychem (the LORD your God):* the fifth-year release Jubilees 7:37 commands, the same reckoning Noah began keeping in 7:2.'),
  -- thread: jubilees-7-curse-of-canaan
  ('jubilees', 'jubilees', 7, 6, 'canon', 'genesis', 9, 21, 'free', E'Genesis 9:21 — *And he drank of the wine, and was drunken; and he was uncovered within his tent:* the Genesis source Jubilees 7:6 retells almost verbatim.'),
  ('jubilees', 'jubilees', 7, 8, 'canon', 'genesis', 9, 22, 'free', E'Genesis 9:22 — *And Ham, the father of Canaan, saw the nakedness of his father, and told his two brethren without:* matched almost word for word by Jubilees 7:8.'),
  ('jubilees', 'jubilees', 7, 9, 'canon', 'genesis', 9, 23, 'free', E'Genesis 9:23 — *And Shem and Japheth took a garment, and laid it upon both their shoulders, and went backward, and covered the nakedness of their father; and their faces were backward, and they saw not their father''s nakedness:* the same backward-covering Jubilees 7:9 recounts.'),
  ('jubilees', 'jubilees', 7, 10, 'canon', 'genesis', 9, 25, 'free', E'Genesis 9:25 — *And he said, Cursed be Canaan; a servant of servants shall he be unto his brethren:* the curse Jubilees 7:10 gives as *Cursed be Canaan; an enslaved servant shall he be to his brethren.*'),
  ('jubilees', 'jubilees', 7, 11, 'canon', 'genesis', 9, 26, 'free', E'Genesis 9:26 — *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant:* the blessing of the Shem-line, kept verbatim in Jubilees 7:11.'),
  -- thread: jubilees-7-division-of-the-nations
  ('jubilees', 'jubilees', 7, 18, 'canon', 'genesis', 10, 1, 'free', E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood:* the heading of the table Jubilees 7:18 retells with the sons of Shem.'),
  ('jubilees', 'jubilees', 7, 19, 'canon', 'genesis', 10, 2, 'free', E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras:* the same seven sons of Japheth listed in Jubilees 7:19.'),
  ('jubilees', 'jubilees', 7, 19, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel):* the division of the earth that names Jubilees the Book of Division (7:19), with Israel as the measure.'),
  -- thread: jubilees-7-watchers-flood-cause
  ('jubilees', 'jubilees', 7, 21, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose:* the Watchers'' fornication Jubilees 7:21 names as the first of the three causes of the flood.'),
  ('jubilees', 'jubilees', 7, 21, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown:* the giants Jubilees 7:21 calls the Nâphîdîm who devoured one another.'),
  ('jubilees', 'jubilees', 7, 21, 'enoch', '1-enoch', 7, 2, 'extras', E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells:* the live Enoch witness to the giants Jubilees 7:21 names from the Watchers.'),
  ('jubilees', 'jubilees', 7, 21, 'enoch', '1-enoch', 7, 3, 'extras', E'1 Enoch 7:3 — *Who consumed all the acquisitions of men. And when men could no longer sustain them, the giants turned against them and devoured mankind:* the same mutual devouring Jubilees 7:21 describes among the Nâphîdîm.'),
  ('jubilees', 'jubilees', 7, 25, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually:* the wickedness for which, in Jubilees 7:25, Yahuah destroyed everything from the face of the earth.'),
  -- thread: jubilees-7-blood-prohibition
  ('jubilees', 'jubilees', 7, 28, 'canon', 'genesis', 9, 4, 'free', E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat:* the Noahic blood prohibition Jubilees 7:28 restates as eating the blood of any flesh.'),
  ('jubilees', 'jubilees', 7, 28, 'canon', 'genesis', 9, 6, 'free', E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man:* the shed-blood half of the charge Jubilees 7:28 carries — *whoso sheds man''s blood... will all be destroyed.*'),
  ('jubilees', 'jubilees', 7, 31, 'canon', 'leviticus', 17, 11, 'free', E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul:* the heavenly-tablet ground of why Noah, in Jubilees 7:31-32, says the blood is the life and may not be eaten.'),
  ('jubilees', 'jubilees', 7, 31, 'canon', 'leviticus', 17, 13, 'free', E'Leviticus 17:13 — *...he shall even pour out the blood thereof, and cover it with dust:* the covering-of-blood command Noah gives in Jubilees 7:31, *cover the blood,* standing word for word in the Torah.'),
  ('jubilees', 'jubilees', 7, 28, 'canon', 'acts', 15, 20, 'free', E'Acts 15:20 — *But that we write unto them, that they abstain from pollutions of idols, and from fornication, and from things strangled, and from blood:* the same blood-law laid on the nations in the renewed covenant — the Noahic charge of Jubilees 7:28 is not abolished.'),
  -- thread: jubilees-7-enoch-fathers-handed-down
  ('jubilees', 'jubilees', 7, 38, 'canon', 'genesis', 6, 9, 'free', E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God):* the walking-line of the fathers Jubilees 7:38 traces from Enoch through Methuselah and Lamech to Noah.'),
  ('jubilees', 'jubilees', 7, 39, 'enoch', '1-enoch', 7, 5, 'extras', E'1 Enoch 7:5 — *Then the earth laid accusation against the lawless ones:* the live Enoch testimony — the *seventh in his generation* whose commandment Jubilees 7:39 says Enoch handed to his sons'' sons.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-noah-vineyard-firstfruits',
       E'Noah''s vineyard, the fourth-year fruit, and the feast — it ain''t new',
       E'Jubilees opens Noah''s husbandry as a calendar and a feast, not a casual planting: *And in the seventh week in the first year thereof, in this jubilee, Noah planted vines on the mountain on which the ark had rested, named Lûbâr, one of the Ararat Mountains, and they produced fruit in the fourth year, and he guarded their fruit, and gathered it in this year in the seventh month* (Jubilees 7:1). Genesis tells the same planting plainly — *And Noah began to be an husbandman, and he planted a vineyard* (Genesis 9:20) — and Jubilees lays the heavenly-tablet ordinance over it. The reason Noah *guarded their fruit* until *the fourth year* is the firstfruits law engraved before Sinai: *And when ye shall come into the land, and shall have planted all manner of trees for food... three years shall it be as uncircumcised unto you: it shall not be eaten of* (Leviticus 19:23), and *in the fourth year all the fruit thereof shall be holy to praise Yahuah (LORD) withal* (Leviticus 19:24). Noah keeps it before it is given to Moses — the Appointed Times are ancient.',
       sv.verse_id, ev.verse_id, 'extras', 53150
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-firstfruits-wine-oil-feast',
       E'The fourth-year fruit accounted holy — firstfruits of wine and oil',
       E'Noah turns his guarded vintage into a feast-offering, and Jubilees then states the ordinance outright for his sons: *And he made wine therefrom and put it into a vessel, and kept it until the fifth year, until the first day, on the new moon of the first month* (Jubilees 7:2), and *he celebrated with joy the day of this feast, and he made a burnt sacrifice to Yahuah (God)* (Jubilees 7:3). The standing law is spoken to the patriarchs as already engraved: *For three years the fruit of everything that is eaten will not be gathered: and in the fourth year its fruit will be accounted holy and they will offer the first-fruits, acceptable before the El Elyon (Most High) Elohim (God)... Let them offer in abundance the first of the wine and oil (as) first-fruits on the altar of Yahuah (God)* (Jubilees 7:36). This is Leviticus 19 verbatim in substance: *in the fourth year all the fruit thereof shall be holy* (Leviticus 19:24), *and in the fifth year shall ye eat of the fruit thereof* (Leviticus 19:25) — the same three-four-five reckoning Noah keeps in Jubilees 7:2, 36-37. The feast is not new; it is the patriarchs keeping the heavenly tablets.',
       sv.verse_id, ev.verse_id, 'extras', 53153
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=36
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-curse-of-canaan',
       E'Noah''s nakedness and the curse of Canaan — retold from Genesis 9',
       E'Jubilees retells the wine, the shame, and the curse exactly as Genesis: *And he rejoiced and drank of this wine, he and his children with joy. And it was evening, and he went into his tent, and being drunken he lay down and slept, and was uncovered in his tent as he slept* (Jubilees 7:6); *And Ham saw Noah his father naked, and went forth and told his two brethren without* (Jubilees 7:8); and the curse, *Cursed be Canaan; an enslaved servant shall he be to his brethren* (Jubilees 7:10). Genesis is the source quoted beside it: *And he drank of the wine, and was drunken; and he was uncovered within his tent* (Genesis 9:21); *And Ham, the father of Canaan, saw the nakedness of his father, and told his two brethren without* (Genesis 9:22); *And he said, Cursed be Canaan; a servant of servants shall he be unto his brethren* (Genesis 9:25). And the blessing of Shem in Jubilees 7:11 — *Blessed be Yahuah Elohim (the LORD God) of Shem* — is Genesis 9:26 word for word. The line of blessing runs through Shem; the seed is kept.',
       sv.verse_id, ev.verse_id, 'extras', 53156
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-division-of-the-nations',
       E'The sons of Noah and the dividing of the nations',
       E'Jubilees names the sons and the cities they founded, then the table of nations: *And these are the sons of Shem: Elam, and Asshur, and Arpachshad–this (son) was born two years after the flood–and Lud, and Aram* (Jubilees 7:18), and *The sons of Japheth: Gomer and Magog and Madai and Javan, Tubal and Meshech and Tiras: these are the sons of Noah* (Jubilees 7:19). This is the Genesis table retold: *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood* (Genesis 10:1); *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (Genesis 10:2). Behind the whole scattering stands the Most High''s ordering of the peoples — the ''Book of Division'' that gives Jubilees its name: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). Israel is the measure by which the nations are divided; the seed is the Most High''s portion.',
       sv.verse_id, ev.verse_id, 'extras', 53159
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-watchers-flood-cause',
       E'Why the flood came — the Watchers, the giants, and the bloodshed',
       E'Noah charges his grandsons with the ordinances and tells them plainly why the flood came: *For owing to these three things came the flood upon the earth, namely, owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness. And they begat sons the Nâphîdîm, and they were all unlike, and they devoured one another: and the Giants slew the Nâphîl* (Jubilees 7:21). This is Genesis 6 and 1 Enoch''s Watchers in one breath. Genesis: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2); *There were giants in the earth in those days* (Genesis 6:4). 1 Enoch tells the same devouring: *And they became pregnant, and they bare great giants* (1 Enoch 7:2), and *the giants turned against them and devoured mankind* (1 Enoch 7:3). The earth filled with blood — *And Yahuah (God) destroyed everything from off the face of the earth; because of the wickedness of their deeds, and because of the blood which they had shed* (Jubilees 7:25) — and *GOD saw that the wickedness of man was great in the earth* (Genesis 6:5). The seed-war is the same across all three witnesses.',
       sv.verse_id, ev.verse_id, 'extras', 53162
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=20
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-blood-prohibition',
       E'Eat not the blood — Noah''s charge and the eternal blood-law',
       E'Noah''s central ordinance to his sons is the blood prohibition, given as a testimony engraved for all flesh: *For whoso sheds man''s blood, and whoso eats the blood of any flesh, will all be destroyed from the earth* (Jubilees 7:28), and *guard yourselves that none may eat blood before you: cover the blood, for thus have I been commanded to testify to you and your children, together with all flesh* (Jubilees 7:31). This is the Noahic charge of Genesis 9 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat* (Genesis 9:4); *Whoso sheddeth man''s blood, by man shall his blood be shed* (Genesis 9:6) — carried forward into the standing Torah: *For the life of the flesh is in the blood... it is the blood that maketh an atonement for the soul* (Leviticus 17:11), and the hunter shall *pour out the blood thereof, and cover it with dust* (Leviticus 17:13), the very covering Noah commands. And the same law is laid on the nations in the renewed covenant: *that they abstain from pollutions of idols, and from fornication, and from things strangled, and from blood* (Acts 15:20). One blood-law, from Noah to the heavenly tablets to the assembly of the nations — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53165
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-7-enoch-fathers-handed-down',
       E'From Enoch to Methuselah to Lamech to Noah — the testimony handed down',
       E'Noah closes by tracing the ordinances back through the fathers, naming the chain of the kept testimony: *For thus did Enoch, the father of your father command Methuselah, his son, and Methuselah his son Lamech, and Lamech commanded me all the things which his fathers commanded him* (Jubilees 7:38), and *I also will give you commandment, my sons, as Enoch commanded his son in the first jubilees: whilst still living, the seventh in his generation, he commanded and testified to his son and to his sons'' sons until the day of his death* (Jubilees 7:39). The chain is the seed kept and the testimony handed down before Sinai. Genesis names the same line of walking-with-Elohim: *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God)* (Genesis 6:9). And 1 Enoch is the very testimony Jubilees says Enoch *commanded his son* — the live witness self-links here: *Then the earth laid accusation against the lawless ones* (1 Enoch 7:5). The commandments are not later inventions; they are the fathers'' deposit, Enoch to Noah, engraved on the heavenly tablets.',
       sv.verse_id, ev.verse_id, 'extras', 53168
  FROM _session251_ju07_lookup sv, _session251_ju07_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=38
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=7 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-7-noah-vineyard-firstfruits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:20 — *And Noah began to be an husbandman, and he planted a vineyard:* the bare Genesis planting that Jubilees 7:1 retells as a guarded, calendared firstfruits crop.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-noah-vineyard-firstfruits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:23 — *And when ye shall come into the land, and shall have planted all manner of trees for food, then ye shall count the fruit thereof as uncircumcised: three years shall it be as uncircumcised unto you: it shall not be eaten of:* the very law for which Noah *guarded their fruit* through three years in Jubilees 7:1.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-noah-vineyard-firstfruits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:24 — *But in the fourth year all the fruit thereof shall be holy to praise Yahuah (LORD) withal:* why Noah gathers in *the fourth year* — the fruit is now holy, kept before Sinai (Jubilees 7:1).'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-noah-vineyard-firstfruits'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-7-firstfruits-wine-oil-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:24 — *But in the fourth year all the fruit thereof shall be holy to praise Yahuah (LORD) withal:* the fourth-year holiness Jubilees 7:36 spells out as *in the fourth year its fruit will be accounted holy.*'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-firstfruits-wine-oil-feast'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:25 — *And in the fifth year shall ye eat of the fruit thereof, that it may yield unto you the increase thereof: I am Yahuah Elohaychem (the LORD your God):* the fifth-year release Jubilees 7:37 commands, the same reckoning Noah began keeping in 7:2.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-firstfruits-wine-oil-feast'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-7-curse-of-canaan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:21 — *And he drank of the wine, and was drunken; and he was uncovered within his tent:* the Genesis source Jubilees 7:6 retells almost verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-curse-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:22 — *And Ham, the father of Canaan, saw the nakedness of his father, and told his two brethren without:* matched almost word for word by Jubilees 7:8.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-curse-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 9:23 — *And Shem and Japheth took a garment, and laid it upon both their shoulders, and went backward, and covered the nakedness of their father; and their faces were backward, and they saw not their father''s nakedness:* the same backward-covering Jubilees 7:9 recounts.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-curse-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 9:25 — *And he said, Cursed be Canaan; a servant of servants shall he be unto his brethren:* the curse Jubilees 7:10 gives as *Cursed be Canaan; an enslaved servant shall he be to his brethren.*'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-curse-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 9:26 — *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant:* the blessing of the Shem-line, kept verbatim in Jubilees 7:11.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-curse-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-7-division-of-the-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood:* the heading of the table Jubilees 7:18 retells with the sons of Shem.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-division-of-the-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras:* the same seven sons of Japheth listed in Jubilees 7:19.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-division-of-the-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel):* the division of the earth that names Jubilees the Book of Division (7:19), with Israel as the measure.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-division-of-the-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-7-watchers-flood-cause
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose:* the Watchers'' fornication Jubilees 7:21 names as the first of the three causes of the flood.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-watchers-flood-cause'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown:* the giants Jubilees 7:21 calls the Nâphîdîm who devoured one another.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-watchers-flood-cause'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 7:2 — *And they became pregnant, and they bare great giants, whose height was three thousand ells:* the live Enoch witness to the giants Jubilees 7:21 names from the Watchers.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-watchers-flood-cause'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 7:3 — *Who consumed all the acquisitions of men. And when men could no longer sustain them, the giants turned against them and devoured mankind:* the same mutual devouring Jubilees 7:21 describes among the Nâphîdîm.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-watchers-flood-cause'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually:* the wickedness for which, in Jubilees 7:25, Yahuah destroyed everything from the face of the earth.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-watchers-flood-cause'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-7-blood-prohibition
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat:* the Noahic blood prohibition Jubilees 7:28 restates as eating the blood of any flesh.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-blood-prohibition'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man:* the shed-blood half of the charge Jubilees 7:28 carries — *whoso sheds man''s blood... will all be destroyed.*'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-blood-prohibition'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 17:11 — *For the life of the flesh is in the blood: and I have given it to you upon the altar to make an atonement for your souls: for it is the blood that maketh an atonement for the soul:* the heavenly-tablet ground of why Noah, in Jubilees 7:31-32, says the blood is the life and may not be eaten.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-blood-prohibition'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 17:13 — *...he shall even pour out the blood thereof, and cover it with dust:* the covering-of-blood command Noah gives in Jubilees 7:31, *cover the blood,* standing word for word in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-blood-prohibition'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 15:20 — *But that we write unto them, that they abstain from pollutions of idols, and from fornication, and from things strangled, and from blood:* the same blood-law laid on the nations in the renewed covenant — the Noahic charge of Jubilees 7:28 is not abolished.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-blood-prohibition'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=15 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-7-enoch-fathers-handed-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God):* the walking-line of the fathers Jubilees 7:38 traces from Enoch through Methuselah and Lamech to Noah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-enoch-fathers-handed-down'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 7:5 — *Then the earth laid accusation against the lawless ones:* the live Enoch testimony — the *seventh in his generation* whose commandment Jubilees 7:39 says Enoch handed to his sons'' sons.'
  FROM cross_reference_threads t, cross_references x, _session251_ju07_lookup sv, _session251_ju07_lookup tv
 WHERE t.slug='jubilees-7-enoch-fathers-handed-down'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=7 AND sv.verse_number=39
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jubilees_08.sql (session251 jubilees 8) -----
-- Source anchor: jubilees/jubilees ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju08 (view _session251_ju08_lookup). Sort band base 53175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-8-generations-of-shem
  ('jubilees', 'jubilees', 8, 8, 'canon', 'genesis', 10, 25, 'free', E'Genesis 10:25 — *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother’s name was Joktan.* Genesis names Peleg for the dividing of the earth exactly as Jubilees 8:8 does.'),
  ('jubilees', 'jubilees', 8, 5, 'canon', 'genesis', 10, 24, 'free', E'Genesis 10:24 — *And Arphaxad begat Salah; and Salah begat Eber.* The Genesis source of the Arpachshad–Shelah–Eber descent Jubilees 8:5-6 retells.'),
  ('jubilees', 'jubilees', 8, 1, 'canon', 'genesis', 10, 1, 'free', E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood.* The header of the generations Jubilees 8 unfolds verse by verse.'),
  ('jubilees', 'jubilees', 8, 1, 'canon', 'genesis', 10, 21, 'free', E'Genesis 10:21 — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born.* The Torah''s own framing of Shem as father of Eber, the kept line Jubilees follows.'),
  -- thread: jubilees-8-watchers-writing-on-the-rock
  ('jubilees', 'jubilees', 8, 3, 'enoch', '1-enoch', 8, 2, 'extras', E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways. Semjâzâ taught enchantments, and root-cuttings, Armârôs the resolving of enchantments, Barâqîjâl taught astrology, Kôkabêl the constellations, Ezêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Shamsiêl the signs of the sun, and Sariêl the course of the moon. And as men perished, they cried, and their cry went up to heaven.* The Watchers'' star-omens Kainam transcribes in Jubilees 8:3 are the very teaching 1 Enoch names by name.'),
  -- thread: jubilees-8-division-of-the-earth-by-lot
  ('jubilees', 'jubilees', 8, 10, 'canon', 'genesis', 10, 32, 'free', E'Genesis 10:32 — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood.* The Torah''s summary of the post-Flood dividing Jubilees 8:10 stages as a casting of lots.'),
  ('jubilees', 'jubilees', 8, 10, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The bounds of the nations are the Most High''s appointment, which the lot of Jubilees 8:10-11 carries out.'),
  -- thread: jubilees-8-shem-the-centre-navel-of-the-earth
  ('jubilees', 'jubilees', 8, 18, 'canon', 'ezekiel', 5, 5, 'free', E'Ezekiel 5:5 — *Thus saith Adonai Yahuah (the Lord GOD); This is Jerusalem: I have set it in the midst of the nations and countries that are round about her.* Yahuah Himself names Jerusalem the midst of the earth that Jubilees 8:18-19 calls Zion the navel.'),
  ('jubilees', 'jubilees', 8, 18, 'canon', 'ezekiel', 38, 12, 'free', E'Ezekiel 38:12 — *To take a spoil, and to take a prey; to turn thine hand upon the desolate places that are now inhabited, and upon the people that are gathered out of the nations, which have gotten cattle and goods, that dwell in the midst of the land.* The regathered seed dwelling in the navel of the earth — the centre Shem inherits in Jubilees 8:18.'),
  ('jubilees', 'jubilees', 8, 18, 'enoch', '1-enoch', 26, 1, 'extras', E'1 Enoch 26:1 — *And I proceeded to the middle of the earth, and saw there a blessed and fertile place, and there were many trees in it.* Enoch''s vision of the middle of the earth — the holy mountain and Zion — is the same centre Jubilees 8:18 sets at the navel of the world.'),
  -- thread: jubilees-8-blessed-be-yahuah-of-shem
  ('jubilees', 'jubilees', 8, 18, 'canon', 'genesis', 9, 26, 'free', E'Genesis 9:26 — *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant.* Noah''s Torah blessing, quoted back word-for-word as Jubilees 8:18 records the prophecy he remembered.'),
  ('jubilees', 'jubilees', 8, 18, 'canon', 'genesis', 9, 27, 'free', E'Genesis 9:27 — *Elohim (God) shall enlarge Japheth, and he shall dwell in the tents of Shem; and Canaan shall be his servant.* Japheth dwelling in Shem''s tents, the dwelling Jubilees 8:18 says Yahuah Himself chooses.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-8-generations-of-shem',
       E'The generations of Shem — and Peleg, when the earth was divided',
       E'Jubilees walks the line of Shem down to the days the earth was parted: *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg* (Jubilees 8:8). This is no new genealogy — it is Genesis told again. Moses had already written *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood* (Genesis 10:1), and traced the same descent: *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born* (Genesis 10:21) — *And Arphaxad begat Salah; and Salah begat Eber* (Genesis 10:24). And Genesis names Peleg for the very same reason: *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother’s name was Joktan* (Genesis 10:25). It ain''t new — Jubilees keeps the Torah''s own seed-line, the kept line through which the covenant runs.',
       sv.verse_id, ev.verse_id, 'extras', 53175
  FROM _session251_ju08_lookup sv, _session251_ju08_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=8 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-8-watchers-writing-on-the-rock',
       E'Kainam finds the Watchers'' writing — the omens of sun, moon and stars',
       E'Before the earth is divided, Jubilees pauses on a buried danger: *And he found a writing which former (generations) had carved on the rock, and he read what was thereon, and he transcribed it and sinned owing to it; for it contained the teaching of the Watchers in accordance with which they used to observe the omens of the sun and moon and stars in all the signs of heaven* (Jubilees 8:3). This is the same corruption the live Enoch apparatus records: *Barâqîjâl taught astrology, Kôkabêl the constellations... Shamsiêl the signs of the sun, and Sariêl the course of the moon* (1 Enoch 8:2). The Watchers'' star-reading is the counterfeit of the heavenly calendar — and Kainam *wrote it down and said nothing regarding it; for he was afraid to speak to Noah about it lest he should be angry with him on account of it* (Jubilees 8:4). The true Appointed Times are engraved on the heavenly tablets and kept by Noah and the fathers; this is its dark forgery, the omen-craft that crept back in after the Flood.',
       sv.verse_id, ev.verse_id, 'extras', 53178
  FROM _session251_ju08_lookup sv, _session251_ju08_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-8-division-of-the-earth-by-lot',
       E'The earth divided by lot among Noah''s sons',
       E'At the head of the thirty-third jubilee the inheritance is parcelled out: *they divided the earth into three parts, for Shem and Ham and Japheth, according to the inheritance of each* (Jubilees 8:10), and Noah''s sons *reached forth their hands, and took the writing out of the bosom of Noah, their father* (Jubilees 8:11). Genesis seals the same dividing: *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood* (Genesis 10:32). And the Torah grounds it deeper still — the boundaries of the nations are not chance but appointment: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). The lot in Jubilees only makes visible what the Most High had already written.',
       sv.verse_id, ev.verse_id, 'extras', 53181
  FROM _session251_ju08_lookup sv, _session251_ju08_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=8 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-8-shem-the-centre-navel-of-the-earth',
       E'Shem''s lot — the middle of the earth, Eden, Sinai and Zion the navel',
       E'The first lot falls to Shem, and it is the holy centre: *And there came forth on the writing as Shem’s lot the middle of the earth which he should take as an inheritance for himself and for his sons for the generations of eternity* (Jubilees 8:11), *that they should possess it for ever to his generations for evermore* (Jubilees 8:17). And the reason is unveiled: *he knew that the Garden of Eden is the holy of holies, and the dwelling of Yahuah (God), and Mount Sinai the centre of the desert, and Mount Zion–the centre of the navel of the earth: these three were created as holy places facing each other* (Jubilees 8:18). This is the framework''s land itself — Jerusalem at the centre of the world. Ezekiel says it plainly: *Thus saith Adonai Yahuah (the Lord GOD); This is Jerusalem: I have set it in the midst of the nations and countries that are round about her* (Ezekiel 5:5), and again of the regathered people *that dwell in the midst of the land* (Ezekiel 38:12). The live Enoch apparatus saw the same centre: *And I proceeded to the middle of the earth, and saw there a blessed and fertile place* (1 Enoch 26:1) — Zion, the navel, the kept inheritance of the seed.',
       sv.verse_id, ev.verse_id, 'extras', 53184
  FROM _session251_ju08_lookup sv, _session251_ju08_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=8 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-8-blessed-be-yahuah-of-shem',
       E'Blessed be Yahuah Elohim of Shem — Noah''s prophecy remembered',
       E'When Shem''s portion falls, Noah remembers his own prophecy: *Blessed be Yahuah Elohim (the LORD God) of Shem, And may Yahuah (God) dwell in the dwelling of Shem* (Jubilees 8:18), and *a blessed portion and a blessing had come to Shem and his sons to the generations for ever* (Jubilees 8:21). This is word-for-word the blessing Noah spoke in the Torah after the Flood: *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant* (Genesis 9:26) — *Elohim (God) shall enlarge Japheth, and he shall dwell in the tents of Shem; and Canaan shall be his servant* (Genesis 9:27). It ain''t new: the dividing of the earth in Jubilees is the outworking of Genesis 9, the election of the kept line in Shem, in whose dwelling Yahuah chooses to dwell. The seed is set apart not by merit but by the blessing already spoken over it.',
       sv.verse_id, ev.verse_id, 'extras', 53187
  FROM _session251_ju08_lookup sv, _session251_ju08_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=8 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-8-generations-of-shem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:25 — *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother’s name was Joktan.* Genesis names Peleg for the dividing of the earth exactly as Jubilees 8:8 does.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-generations-of-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:24 — *And Arphaxad begat Salah; and Salah begat Eber.* The Genesis source of the Arpachshad–Shelah–Eber descent Jubilees 8:5-6 retells.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-generations-of-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood.* The header of the generations Jubilees 8 unfolds verse by verse.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-generations-of-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 10:21 — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born.* The Torah''s own framing of Shem as father of Eber, the kept line Jubilees follows.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-generations-of-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-8-watchers-writing-on-the-rock
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways. Semjâzâ taught enchantments, and root-cuttings, Armârôs the resolving of enchantments, Barâqîjâl taught astrology, Kôkabêl the constellations, Ezêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Shamsiêl the signs of the sun, and Sariêl the course of the moon. And as men perished, they cried, and their cry went up to heaven.* The Watchers'' star-omens Kainam transcribes in Jubilees 8:3 are the very teaching 1 Enoch names by name.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-watchers-writing-on-the-rock'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-8-division-of-the-earth-by-lot
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:32 — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood.* The Torah''s summary of the post-Flood dividing Jubilees 8:10 stages as a casting of lots.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-division-of-the-earth-by-lot'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The bounds of the nations are the Most High''s appointment, which the lot of Jubilees 8:10-11 carries out.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-division-of-the-earth-by-lot'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-8-shem-the-centre-navel-of-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 5:5 — *Thus saith Adonai Yahuah (the Lord GOD); This is Jerusalem: I have set it in the midst of the nations and countries that are round about her.* Yahuah Himself names Jerusalem the midst of the earth that Jubilees 8:18-19 calls Zion the navel.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-shem-the-centre-navel-of-the-earth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 38:12 — *To take a spoil, and to take a prey; to turn thine hand upon the desolate places that are now inhabited, and upon the people that are gathered out of the nations, which have gotten cattle and goods, that dwell in the midst of the land.* The regathered seed dwelling in the navel of the earth — the centre Shem inherits in Jubilees 8:18.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-shem-the-centre-navel-of-the-earth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=38 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 26:1 — *And I proceeded to the middle of the earth, and saw there a blessed and fertile place, and there were many trees in it.* Enoch''s vision of the middle of the earth — the holy mountain and Zion — is the same centre Jubilees 8:18 sets at the navel of the world.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-shem-the-centre-navel-of-the-earth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-8-blessed-be-yahuah-of-shem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:26 — *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant.* Noah''s Torah blessing, quoted back word-for-word as Jubilees 8:18 records the prophecy he remembered.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-blessed-be-yahuah-of-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:27 — *Elohim (God) shall enlarge Japheth, and he shall dwell in the tents of Shem; and Canaan shall be his servant.* Japheth dwelling in Shem''s tents, the dwelling Jubilees 8:18 says Yahuah Himself chooses.'
  FROM cross_reference_threads t, cross_references x, _session251_ju08_lookup sv, _session251_ju08_lookup tv
 WHERE t.slug='jubilees-8-blessed-be-yahuah-of-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session251 — Jubilees cross-references complete.'
