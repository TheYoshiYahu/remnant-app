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

-- ----- fragment: minion_jubilees_09.sql (session251 jubilees 9) -----
-- Source anchor: jubilees/jubilees ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju09 (view _session251_ju09_lookup). Sort band base 53200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-9-division-table-of-nations
  ('jubilees', 'jubilees', 9, 1, 'canon', 'genesis', 10, 1, 'free', E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood.* The same three sons of Noah whose portions Jubilees 9 is dividing by lot.'),
  ('jubilees', 'jubilees', 9, 1, 'canon', 'genesis', 10, 6, 'free', E'Genesis 10:6 — *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.* The very sons among whom Jubilees 9:1 says Ham divided his portion — Cush, Mizraim, Put, Canaan.'),
  ('jubilees', 'jubilees', 9, 6, 'canon', 'genesis', 10, 32, 'free', E'Genesis 10:32 — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood.* Genesis seals its table of nations with the very division Jubilees 9 is narrating by lot.'),
  ('jubilees', 'jubilees', 9, 1, 'jubilees', 'jubilees', 8, 8, 'extras', E'Jubilees 8:8 — *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg.* The division Jubilees 9 details was begun and named one chapter earlier.'),
  -- thread: jubilees-9-isles-divided-by-tongue
  ('jubilees', 'jubilees', 9, 9, 'canon', 'genesis', 10, 2, 'free', E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* The same seven sons of Japheth whose island-portions Jubilees 9:8-12 distributes by lot.'),
  ('jubilees', 'jubilees', 9, 10, 'canon', 'genesis', 10, 5, 'free', E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Genesis already assigns the isles and coastlands to Japheth''s line, exactly as Jubilees 9:9-10 gives Madai and Javan the islands.'),
  -- thread: jubilees-9-most-high-set-the-bounds
  ('jubilees', 'jubilees', 9, 14, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The very dividing of the nations'' inheritance by lot that Jubilees 9:14 records, credited in the Torah to the Most High Himself.'),
  ('jubilees', 'jubilees', 9, 14, 'canon', 'deuteronomy', 32, 9, 'free', E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* Out of all the portions divided in Jubilees 9, the Most High keeps one lot for Himself — Jacob, the elect seed.'),
  ('jubilees', 'jubilees', 9, 15, 'canon', 'acts', 17, 26, 'free', E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation.* Paul tells idolatrous Athens what Jubilees 9 enacts: the nations'' boundaries are Yahuah''s appointment, not chance.'),
  -- thread: jubilees-9-oath-curse-day-of-judgment
  ('jubilees', 'jubilees', 9, 14, 'canon', 'genesis', 9, 6, 'free', E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* The post-flood covenant of accountability behind the curse Noah lays on whoever seizes another''s portion in Jubilees 9:14.'),
  ('jubilees', 'jubilees', 9, 15, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* The same appointed day of judgment by fire that Jubilees 9:15 names — the reckoning the bound Watchers of the live Enoch apparatus await.'),
  ('jubilees', 'jubilees', 9, 15, 'canon', 'acts', 17, 31, 'free', E'Acts 17:31 — *Because he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained; whereof he hath given assurance unto all men, in that he hath raised him from the dead.* Paul names the very day of judgment Jubilees 9:15 swears the oath toward.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-9-division-table-of-nations',
       E'The portions of the sons of Ham, Shem and Japheth — the table of nations',
       E'Jubilees opens the chapter by parcelling the earth among Noah''s grandsons: *And Ham divided amongst his sons, and the first portion came forth for Cush towards the east, and to the west of him for Mizraim, and to the west . of him for Put, and to the west of him and to the west thereof on the sea for Canaan* (Jubilees 9:1), and likewise *And Sherri also divided amongst his sons, and the first portion came forth for Elam and his sons* (Jubilees 9:2) and *And Japheth also divided the land of his inheritance amongst his sons* (Jubilees 9:6). This is not a new genealogy — it is the SAME roster Genesis already laid down: *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood* (Genesis 10:1), and where Jubilees gives Cush and Mizraim and Canaan to Ham, Genesis answers *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan* (Genesis 10:6). The whole earth carved up by lot here closes the way Genesis closes its table: *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood* (Genesis 10:32). The division itself began in the prior chapter, when Peleg was named for it — *the children of Noah began to divide the earth amongst themselves* (Jubilees 8:8). It ain''t new: Jubilees is reading you Genesis 10 from the inside.',
       sv.verse_id, ev.verse_id, 'extras', 53200
  FROM _session251_ju09_lookup sv, _session251_ju09_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-9-isles-divided-by-tongue',
       E'The islands and coasts apportioned — divided in their lands, after their tongues',
       E'Japheth''s sons receive the sea-board and the islands: *And for Madai came forth as his portion that he should possess from the west of his two brothers to the islands, and to the coasts of the islands* (Jubilees 9:9), *And for Javan came forth the fourth portion every island and the islands which are towards the border of Lud* (Jubilees 9:10), and *And for Tiras there came forth the seventh portion, four great islands in the midst of the sea* (Jubilees 9:12). Genesis had already filed this exact picture under Japheth: *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (Genesis 10:2), and then summed their inheritance as the coastlands of the nations — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations* (Genesis 10:5). The seven sons of Japheth, the islands, the dividing — Jubilees 9 is simply walking the reader verse-by-verse through Genesis 10. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53203
  FROM _session251_ju09_lookup sv, _session251_ju09_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=9 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-9-most-high-set-the-bounds',
       E'The bounds set by the Most High — the inheritance of the nations divided',
       E'When the sons of Noah divide the earth and bind it for ever — *And they all said, "So be it; so be it," for themselves and their sons for ever throughout their generations* (Jubilees 9:15) — Jubilees is showing the human side of a division the Torah credits to Yahuah Himself. Moses sings it: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8) — and out of all those portions Yahuah reserves one for Himself: *For the LORD''S portion is his people; Jacob is the lot of his inheritance* (Deuteronomy 32:9). Paul preaches the same architecture to the idolaters at Athens: *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). The lots Noah''s sons cast in Jubilees 9 are the Most High''s bounds — election and the nations'' borders set together. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53206
  FROM _session251_ju09_lookup sv, _session251_ju09_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=14
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=9 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-9-oath-curse-day-of-judgment',
       E'The oath, the curse on the land-seizer, and the day of judgment by sword and fire',
       E'Noah binds the division with an oath and a curse: *and he bound them all by an oath, imprecating a curse on every one that sought to seize the portion which had not fallen (to him) by his lot* (Jubilees 9:14), and the sons ratify it to the end of the age — *for themselves and their sons for ever throughout their generations till the day of judgment, on which Yahuah Elohim (the LORD God) shall judge them with a sword and with fire, for all the unclean wickedness of their errors* (Jubilees 9:15). The curse-on-the-bloodguilty reaches back to the covenant Yahuah cut with Noah''s house after the flood: *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man* (Genesis 9:6). The appointed day of judgment by fire is the same day the bound Watchers await in the live 1 Enoch apparatus — *And on the day of the great judgement he shall be cast into the fire* (1 Enoch 10:6) — and the day Paul proclaims to Athens: *Because he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained* (Acts 17:31). The oath, the curse, the appointed fire — all already written. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53209
  FROM _session251_ju09_lookup sv, _session251_ju09_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=14
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=9 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-9-division-table-of-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood.* The same three sons of Noah whose portions Jubilees 9 is dividing by lot.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-division-table-of-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:6 — *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.* The very sons among whom Jubilees 9:1 says Ham divided his portion — Cush, Mizraim, Put, Canaan.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-division-table-of-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:32 — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood.* Genesis seals its table of nations with the very division Jubilees 9 is narrating by lot.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-division-table-of-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 8:8 — *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg.* The division Jubilees 9 details was begun and named one chapter earlier.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-division-table-of-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-9-isles-divided-by-tongue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* The same seven sons of Japheth whose island-portions Jubilees 9:8-12 distributes by lot.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-isles-divided-by-tongue'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Genesis already assigns the isles and coastlands to Japheth''s line, exactly as Jubilees 9:9-10 gives Madai and Javan the islands.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-isles-divided-by-tongue'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-9-most-high-set-the-bounds
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The very dividing of the nations'' inheritance by lot that Jubilees 9:14 records, credited in the Torah to the Most High Himself.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-most-high-set-the-bounds'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:9 — *For the LORD''S portion is his people; Jacob is the lot of his inheritance.* Out of all the portions divided in Jubilees 9, the Most High keeps one lot for Himself — Jacob, the elect seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-most-high-set-the-bounds'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation.* Paul tells idolatrous Athens what Jubilees 9 enacts: the nations'' boundaries are Yahuah''s appointment, not chance.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-most-high-set-the-bounds'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-9-oath-curse-day-of-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:6 — *Whoso sheddeth man''s blood, by man shall his blood be shed: for in the image of Elohim (God) made he man.* The post-flood covenant of accountability behind the curse Noah lays on whoever seizes another''s portion in Jubilees 9:14.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-oath-curse-day-of-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* The same appointed day of judgment by fire that Jubilees 9:15 names — the reckoning the bound Watchers of the live Enoch apparatus await.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-oath-curse-day-of-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 17:31 — *Because he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained; whereof he hath given assurance unto all men, in that he hath raised him from the dead.* Paul names the very day of judgment Jubilees 9:15 swears the oath toward.'
  FROM cross_reference_threads t, cross_references x, _session251_ju09_lookup sv, _session251_ju09_lookup tv
 WHERE t.slug='jubilees-9-oath-curse-day-of-judgment'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jubilees_10.sql (session251 jubilees 10) -----
-- Source anchor: jubilees/jubilees ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju10 (view _session251_ju10_lookup). Sort band base 53225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-10-demons-lead-astray-noahs-prayer
  ('jubilees', 'jubilees', 10, 1, 'enoch', '1-enoch', 15, 8, 'extras', E'1 Enoch 15:8 — *And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling.* The very demons leading Noah''s grandsons astray in Jubilees 10:1 are, in the live 1 Enoch apparatus, the disembodied spirits of the dead giants of the Watchers.'),
  ('jubilees', 'jubilees', 10, 2, 'enoch', '1-enoch', 15, 10, 'extras', E'1 Enoch 15:10 — *And these spirits shall rise up against the children of men and against the women, because they have proceeded from them.* Enoch foretold the very assault Noah''s sons report in Jubilees 10:2 — the spirits rising up to lead astray and slay the sons of men.'),
  ('jubilees', 'jubilees', 10, 3, 'canon', 'deuteronomy', 32, 17, 'free', E'Deuteronomy 32:17 — *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* Noah''s prayer in Jubilees 10:3 against the wicked spirits is the same seed-war the Song of Moses names — the nations drawn to sacrifice unto demons, not Elohim.'),
  ('jubilees', 'jubilees', 10, 1, 'canon', 'matthew', 12, 43, 'free', E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The same restless, embodied-seeking unclean spirit Jubilees 10:1 describes leading men astray is the one Yahusha names — it ain''t new.'),
  -- thread: jubilees-10-binding-spirits-mastema-tenth
  ('jubilees', 'jubilees', 10, 7, 'enoch', '1-enoch', 10, 11, 'extras', E'1 Enoch 10:11 — *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* The binding Yahuah commands in Jubilees 10:7 is the same binding-of-the-spirits Enoch already records — it ain''t new.'),
  ('jubilees', 'jubilees', 10, 11, 'enoch', '1-enoch', 10, 12, 'extras', E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The malignant ones bound in the place of condemnation in Jubilees 10:11 are held, as Enoch says, until the day of judgement.'),
  ('jubilees', 'jubilees', 10, 8, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* Mastema''s plea in Jubilees 10:8 that a tenth remain stands against this first decree — the chief spirits cast into the darkness and condemnation.'),
  ('jubilees', 'jubilees', 10, 11, 'canon', 'matthew', 12, 29, 'free', E'Matthew 12:29 — *Or else how can one enter into a strong man''s house, and spoil his goods, except he first bind the strong man? and then he will spoil his house.* The binding of the spirits in Jubilees 10:11 is the pattern Yahusha claims for His own work — first bind the strong man, then spoil his house.'),
  -- thread: jubilees-10-medicines-herbs-noah-book-shem
  ('jubilees', 'jubilees', 10, 12, 'enoch', '1-enoch', 10, 7, 'extras', E'1 Enoch 10:7 — *And heal the earth which the angels have corrupted, and proclaim the healing of the earth, that they may heal the plague, and that all the children of men may not perish through all the secret things that the Watchers have disclosed and have taught their sons.* The medicines and herbs given Noah to heal in Jubilees 10:12 answer the very charge to heal the earth the Watchers corrupted — it ain''t new.'),
  -- thread: jubilees-10-babel-tower-city-shinar
  ('jubilees', 'jubilees', 10, 17, 'canon', 'genesis', 11, 1, 'free', E'Genesis 11:1 — *And the whole earth was of one language, and of one speech.* Jubilees 10:17 names the same moment in Peleg''s days — one people, evil in purpose, before the tongues were confounded.'),
  ('jubilees', 'jubilees', 10, 19, 'canon', 'genesis', 11, 2, 'free', E'Genesis 11:2 — *And it came to pass, as they journeyed from the east, that they found a plain in the land of Shinar; and they dwelt there.* Jubilees 10:19 retells the eastward departure from Ararat to Shinar where they built the city and the tower.'),
  ('jubilees', 'jubilees', 10, 20, 'canon', 'genesis', 11, 3, 'free', E'Genesis 11:3 — *And they said one to another, Go to, let us make brick, and burn them throughly. And they had brick for stone, and slime had they for morter.* Jubilees 10:20 carries the same detail — brick made with fire serving for stone — the Genesis source quoted beside its retelling.'),
  ('jubilees', 'jubilees', 10, 19, 'canon', 'genesis', 11, 4, 'free', E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The very ascent into heaven Jubilees 10:19 quotes is the prideful purpose Genesis records — it ain''t new.'),
  -- thread: jubilees-10-confounded-tongues-scattered-babel
  ('jubilees', 'jubilees', 10, 22, 'canon', 'genesis', 11, 6, 'free', E'Genesis 11:6 — *And Yahuah (LORD) said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them, which they have imagined to do.* Jubilees 10:22 quotes the same divine deliberation — one people, one speech, nothing withheld from them — before the descent to confound.'),
  ('jubilees', 'jubilees', 10, 22, 'canon', 'genesis', 11, 7, 'free', E'Genesis 11:7 — *Go to, let us go down, and there confound their language, that they may not understand one another''s speech.* The ''let us go down and confound their language'' of Jubilees 10:22 is the Genesis word verbatim — it ain''t new.'),
  ('jubilees', 'jubilees', 10, 25, 'canon', 'genesis', 11, 8, 'free', E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Jubilees 10:25 retells the same dispersal — scattered from Shinar, each according to his language and nation.'),
  ('jubilees', 'jubilees', 10, 25, 'canon', 'genesis', 11, 9, 'free', E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* Jubilees 10:25 names Babel for the same reason Genesis does — the confounding of the tongues at Shinar.'),
  ('jubilees', 'jubilees', 10, 25, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The dispersal into cities and nations in Jubilees 10:25 is the very dividing of the nations the Song of Moses remembers — and election out of them follows.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-10-demons-lead-astray-noahs-prayer',
       E'The unclean demons lead astray, and Noah prays',
       E'Jubilees opens the chapter with the seed-war breaking out again after the flood: *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them* (Jubilees 10:1), so that Noah *prayed before Yahuah (God) his Elohim (God)* that *wicked spirits* not *rule over* his sons (Jubilees 10:3). The live 1 Enoch apparatus already tells us WHERE these spirits came from — the dead giants of the Watchers: *And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling* (1 Enoch 15:8), and *these spirits shall rise up against the children of men and against the women, because they have proceeded from them* (1 Enoch 15:10). It ain''t new — and the Torah names the practice exactly: *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not* (Deuteronomy 32:17). Yahusha (Jesus) speaks of the same wandering unclean spirit: *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none* (Matthew 12:43).',
       sv.verse_id, ev.verse_id, 'extras', 53225
  FROM _session251_ju10_lookup sv, _session251_ju10_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=10 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-10-binding-spirits-mastema-tenth',
       E'The spirits bound, and Mastema''s tenth part left',
       E'Yahuah answers Noah''s prayer with a binding: *And Yahuah our Elohim (the LORD our God) bade us to bind all* (Jubilees 10:7) — but *the chief of the spirits, Mastêmâ* asks that *the tenth part of them remain before him* to *execute the power of my will on the sons of men* (Jubilees 10:8), and *a tenth part of them we left that they might be subject before Satan on the earth* (Jubilees 10:11). This is the seed-war handed forward under the accuser. The 1 Enoch apparatus carries the original binding word over the same spirits: *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates... bind them fast for seventy generations in the valleys of the earth, till the day of their judgement''* (1 Enoch 10:11-12), and Azazel cast *into the darkness* (1 Enoch 10:4). And Yahusha names the binding as the very pattern of His ministry: *Or else how can one enter into a strong man''s house, and spoil his goods, except he first bind the strong man? and then he will spoil his house* (Matthew 12:29).',
       sv.verse_id, ev.verse_id, 'extras', 53228
  FROM _session251_ju10_lookup sv, _session251_ju10_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=10 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-10-medicines-herbs-noah-book-shem',
       E'The medicines and herbs given to Noah, the book to Shem',
       E'Against the tenth left under Mastema, mercy is given: *And one of us He commanded that we should teach Noah all their medicines* (Jubilees 10:10), and *we explained to Noah all the medicines of their diseases, together with their seductions, how he might heal them with herbs of the earth* (Jubilees 10:12), so that *Noah wrote down all things in a book... And he gave all that he had written to Shem, his eldest son; for he loved him exceedingly above all his sons* (Jubilees 10:13). The healing of the earth is the same charge given in the live 1 Enoch apparatus: *And heal the earth which the angels have corrupted, and proclaim the healing of the earth, that they may heal the plague* (1 Enoch 10:7). The seed is kept and the knowledge handed down the chosen line to Shem — the line that will carry to Abraham.',
       sv.verse_id, ev.verse_id, 'extras', 53231
  FROM _session251_ju10_lookup sv, _session251_ju10_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=10 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-10-babel-tower-city-shinar',
       E'Babel — the city and the tower in Shinar',
       E'Jubilees retells Genesis directly: in Peleg''s days *the children of men have become evil through the wicked purpose of building for themselves a city and a tower in the land of Shinar* (Jubilees 10:17), *saying, ''Go to, let us ascend thereby into heaven''* (Jubilees 10:19), and *they made brick with fire, and the bricks served them for stone* (Jubilees 10:20). Set the Genesis source beside it and the retelling is unmistakable: *And the whole earth was of one language, and of one speech* (Genesis 11:1); *they found a plain in the land of Shinar; and they dwelt there* (Genesis 11:2); *Go to, let us make brick, and burn them throughly. And they had brick for stone, and slime had they for morter* (Genesis 11:3); *Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4).',
       sv.verse_id, ev.verse_id, 'extras', 53234
  FROM _session251_ju10_lookup sv, _session251_ju10_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=17
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=10 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-10-confounded-tongues-scattered-babel',
       E'The tongues confounded, and the nations scattered',
       E'The judgment falls exactly as Genesis tells it: Yahuah says *Go to, let us go down and confound their language, that they may not understand one another''s speech* (Jubilees 10:22), *He confounded their language* (Jubilees 10:24), and *the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language of the children of men, and from thence they were dispersed into their cities, each according to his language and his nation* (Jubilees 10:25). The Genesis source stands word for word beside it: *And Yahuah (LORD) said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them* (Genesis 11:6); *Go to, let us go down, and there confound their language* (Genesis 11:7); *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth* (Genesis 11:8); *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth* (Genesis 11:9). And the scattering sets the nations'' bounds the Torah remembers: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8) — election out of the scattered nations begins here.',
       sv.verse_id, ev.verse_id, 'extras', 53237
  FROM _session251_ju10_lookup sv, _session251_ju10_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=22
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=10 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-10-demons-lead-astray-noahs-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 15:8 — *And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling.* The very demons leading Noah''s grandsons astray in Jubilees 10:1 are, in the live 1 Enoch apparatus, the disembodied spirits of the dead giants of the Watchers.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-demons-lead-astray-noahs-prayer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 15:10 — *And these spirits shall rise up against the children of men and against the women, because they have proceeded from them.* Enoch foretold the very assault Noah''s sons report in Jubilees 10:2 — the spirits rising up to lead astray and slay the sons of men.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-demons-lead-astray-noahs-prayer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:17 — *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* Noah''s prayer in Jubilees 10:3 against the wicked spirits is the same seed-war the Song of Moses names — the nations drawn to sacrifice unto demons, not Elohim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-demons-lead-astray-noahs-prayer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The same restless, embodied-seeking unclean spirit Jubilees 10:1 describes leading men astray is the one Yahusha names — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-demons-lead-astray-noahs-prayer'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-10-binding-spirits-mastema-tenth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:11 — *And Yahuah (God) said unto Michael: ''Go, bind Semjâzâ and his associates who have united themselves with women so as to have defiled themselves with them in all their uncleanness.* The binding Yahuah commands in Jubilees 10:7 is the same binding-of-the-spirits Enoch already records — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-binding-spirits-mastema-tenth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:12 — *And when their sons have slain one another, and they have seen the destruction of their beloved ones, bind them fast for seventy generations in the valleys of the earth, till the day of their judgement and of their consummation, till the judgement that is for ever and ever is consummated.* The malignant ones bound in the place of condemnation in Jubilees 10:11 are held, as Enoch says, until the day of judgement.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-binding-spirits-mastema-tenth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* Mastema''s plea in Jubilees 10:8 that a tenth remain stands against this first decree — the chief spirits cast into the darkness and condemnation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-binding-spirits-mastema-tenth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 12:29 — *Or else how can one enter into a strong man''s house, and spoil his goods, except he first bind the strong man? and then he will spoil his house.* The binding of the spirits in Jubilees 10:11 is the pattern Yahusha claims for His own work — first bind the strong man, then spoil his house.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-binding-spirits-mastema-tenth'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-10-medicines-herbs-noah-book-shem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:7 — *And heal the earth which the angels have corrupted, and proclaim the healing of the earth, that they may heal the plague, and that all the children of men may not perish through all the secret things that the Watchers have disclosed and have taught their sons.* The medicines and herbs given Noah to heal in Jubilees 10:12 answer the very charge to heal the earth the Watchers corrupted — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-medicines-herbs-noah-book-shem'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-10-babel-tower-city-shinar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:1 — *And the whole earth was of one language, and of one speech.* Jubilees 10:17 names the same moment in Peleg''s days — one people, evil in purpose, before the tongues were confounded.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-babel-tower-city-shinar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:2 — *And it came to pass, as they journeyed from the east, that they found a plain in the land of Shinar; and they dwelt there.* Jubilees 10:19 retells the eastward departure from Ararat to Shinar where they built the city and the tower.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-babel-tower-city-shinar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:3 — *And they said one to another, Go to, let us make brick, and burn them throughly. And they had brick for stone, and slime had they for morter.* Jubilees 10:20 carries the same detail — brick made with fire serving for stone — the Genesis source quoted beside its retelling.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-babel-tower-city-shinar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The very ascent into heaven Jubilees 10:19 quotes is the prideful purpose Genesis records — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-babel-tower-city-shinar'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-10-confounded-tongues-scattered-babel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:6 — *And Yahuah (LORD) said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them, which they have imagined to do.* Jubilees 10:22 quotes the same divine deliberation — one people, one speech, nothing withheld from them — before the descent to confound.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-confounded-tongues-scattered-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:7 — *Go to, let us go down, and there confound their language, that they may not understand one another''s speech.* The ''let us go down and confound their language'' of Jubilees 10:22 is the Genesis word verbatim — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-confounded-tongues-scattered-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Jubilees 10:25 retells the same dispersal — scattered from Shinar, each according to his language and nation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-confounded-tongues-scattered-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* Jubilees 10:25 names Babel for the same reason Genesis does — the confounding of the tongues at Shinar.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-confounded-tongues-scattered-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The dispersal into cities and nations in Jubilees 10:25 is the very dividing of the nations the Song of Moses remembers — and election out of them follows.'
  FROM cross_reference_threads t, cross_references x, _session251_ju10_lookup sv, _session251_ju10_lookup tv
 WHERE t.slug='jubilees-10-confounded-tongues-scattered-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=10 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jubilees_11.sql (session251 jubilees 11) -----
-- Source anchor: jubilees/jubilees ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju11 (view _session251_ju11_lookup). Sort band base 53250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-11-shem-to-terah-line
  ('jubilees', 'jubilees', 11, 1, 'canon', 'genesis', 11, 20, 'free', E'Genesis 11:20 — *And Reu lived two and thirty years, and begat Serug:* the same father-son link Jubilees 11:1 records when Reu begets the one he names Sêrôḫ.'),
  ('jubilees', 'jubilees', 11, 6, 'canon', 'genesis', 11, 22, 'free', E'Genesis 11:22 — *And Serug lived thirty years, and begat Nahor:* matching Jubilees 11:6-8 where Serug dwells in Ur and his wife bears him Nahor.'),
  ('jubilees', 'jubilees', 11, 10, 'canon', 'genesis', 11, 24, 'free', E'Genesis 11:24 — *And Nahor lived nine and twenty years, and begat Terah:* the very birth Jubilees 11:10 dates when ''Îjâskâ bears Nahor a son named Terah.'),
  ('jubilees', 'jubilees', 11, 14, 'canon', 'genesis', 11, 26, 'free', E'Genesis 11:26 — *And Terah lived seventy years, and begat Abram, Nahor, and Haran:* the climax of the line, Abram born to Terah exactly as Jubilees 11:14 narrates.'),
  -- thread: jubilees-11-idolatry-bloodshed-babel
  ('jubilees', 'jubilees', 11, 4, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names the very idolatry Jubilees 11:4 says Terah''s generation fell into.'),
  ('jubilees', 'jubilees', 11, 2, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Stephen placing the call in the blood-and-idol world Jubilees 11:2-4 describes.'),
  ('jubilees', 'jubilees', 11, 4, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The prophetic verdict on the molten images Jubilees 11:4 says they worshipped.'),
  -- thread: jubilees-11-mastema-seed-war
  ('jubilees', 'jubilees', 11, 5, 'jubilees', 'jubilees', 10, 8, 'extras', E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say to them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men...”* the tenth-part of spirits whom Jubilees 11:5 now shows Mastêmâ sending out to corrupt and shed blood.'),
  ('jubilees', 'jubilees', 11, 5, 'enoch', '1-enoch', 10, 9, 'extras', E'1 Enoch 10:9 — *Proceed against the bastards and the reprobates, and against the children of fornication: and destroy [the children of fornication and] the children of the Watchers from amongst men... send them one against the other that they may destroy each other in battle: for length of days shall they not have.* The Watcher-spawn whose mutual slaughter Jubilees 11:5 echoes as Mastêmâ''s bloodshed on the earth.'),
  ('jubilees', 'jubilees', 11, 5, 'enoch', '1-enoch', 10, 15, 'extras', E'1 Enoch 10:15 — *And destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind.* The judgement on the very spirits Jubilees 11:5 says Mastêmâ unleashed to corrupt and destroy.'),
  -- thread: jubilees-11-abraham-turns-from-idols
  ('jubilees', 'jubilees', 11, 14, 'canon', 'joshua', 24, 3, 'free', E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* The election Jubilees 11:14 dramatizes as the boy separating himself from his father''s idols.'),
  ('jubilees', 'jubilees', 11, 17, 'canon', 'isaiah', 41, 8, 'free', E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The friend-of-God title earned by the very turning-to-the-Creator Jubilees 11:17 records in Abraham''s prayer.'),
  ('jubilees', 'jubilees', 11, 17, 'canon', 'acts', 7, 3, 'free', E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* The call out of the idolatrous house Jubilees 11:14-17 shows Abraham already straining toward as a child.'),
  -- thread: jubilees-11-ravens-seed-plough
  ('jubilees', 'jubilees', 11, 11, 'canon', 'genesis', 8, 22, 'free', E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* The covenant of the seedtime Mastêmâ tries to break in Jubilees 11:11 by sending ravens against the sown seed.'),
  ('jubilees', 'jubilees', 11, 23, 'enoch', '1-enoch', 10, 18, 'extras', E'1 Enoch 10:18 — *And then shall the whole earth be tilled in righteousness, and shall all be planted with trees and be full of blessing.* The tilled, freed land Jubilees 11:23 anticipates once Abram''s plough lets them sow without fear of the birds.'),
  ('jubilees', 'jubilees', 11, 19, 'apocrypha', 'the-wisdom-of-solomon', 13, 1, 'extras', E'Wisdom of Solomon 13:1 — *Surely vain are all men by nature, who are ignorant of Yahuah (God), and could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster;* the idol-vanity Abram leaves behind in Jubilees 11:19 as he commands the ravens in the Creator''s name.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-11-shem-to-terah-line',
       E'The line of Shem to Terah — the genealogy retold',
       E'Jubilees walks the same descent Genesis records — *Reu took to himself a wife, and her name was ''Ôrâ... and she bare him a son, and he called his name Sêrôḫ* (Jubilees 11:1), Serug to Nahor to *Terah in the seventh year of this week* (Jubilees 11:10), down to *Abram, by the name of the father of his mother* (Jubilees 11:14). Lay it beside Genesis and the line is identical: *And Reu lived two and thirty years, and begat Serug* (Genesis 11:20), *And Serug lived thirty years, and begat Nahor* (Genesis 11:22), *And Terah lived seventy years, and begat Abram, Nahor, and Haran* (Genesis 11:26). It ain''t new — Jubilees is the Book of Division retelling Bereshit, the chosen seed traced one name at a time through the post-Babel world toward Abraham.',
       sv.verse_id, ev.verse_id, 'extras', 53250
  FROM _session251_ju11_lookup sv, _session251_ju11_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=11 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-11-idolatry-bloodshed-babel',
       E'Idolatry and bloodshed spread — the fathers served other gods',
       E'After Babel the sons of Noah turn on each other and on heaven: *they made for themselves molten images, and they worshipped each the idol... and malignant spirits assisted and seduced (them) into committing transgression and uncleanness* (Jubilees 11:4), warring *to shed the blood of men on the earth, and to eat blood* (Jubilees 11:2). This is the world Abraham is born into — and Scripture names it bluntly: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham... and they served other gods* (Joshua 24:2). Stephen retells the same call out of that idolatry — *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia* (Acts 7:2). And Isaiah exposes the molten images for the vanity they are: *They that make a graven image are all of them vanity... they see not, nor know; that they may be ashamed* (Isaiah 44:9). The seed is kept holy not because the line was pure, but because Yahuah chose out of the idol-house.',
       sv.verse_id, ev.verse_id, 'extras', 53253
  FROM _session251_ju11_lookup sv, _session251_ju11_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=11 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-11-mastema-seed-war',
       E'Mastêmâ''s spirits — the seed-war loosed on the earth',
       E'The prince of the demons drives the corruption: *the prince Mastêmâ exerted himself to do all this, and he sent forth other spirits, those which were put under his hand, to do all manner of wrong and sin... to corrupt and destroy, and to shed blood upon the earth* (Jubilees 11:5). This is the tenth-part of spirits left under his hand one chapter earlier — *let some of them remain before me... for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men* (Jubilees 10:8). The live 1 Enoch apparatus is the root: the Watchers'' bastard spirits set *one against the other that they may destroy each other in battle* (1 Enoch 10:9), and the charge to *destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind* (1 Enoch 10:15). Same seed-war, three witnesses — the demons left on earth wage Mastêmâ''s campaign against the chosen line, and against the very seed in the ground (Jubilees 11:11).',
       sv.verse_id, ev.verse_id, 'extras', 53256
  FROM _session251_ju11_lookup sv, _session251_ju11_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=11 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-11-abraham-turns-from-idols',
       E'Abraham turns from idols — election out of the idolatrous line',
       E'While still a boy in Ur, Abraham breaks from his father''s idol-house: *the child began to understand the errors of the earth that all went astray after graven images and after uncleanness... and he separated himself from his father that he might not worship idols with him* (Jubilees 11:14), and *he began to pray to the Creator of all things that He might save him from the errors of the children of men* (Jubilees 11:17). Election precedes confession, and Scripture frames it the same way: out of the fathers who *served other gods*, *I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan* (Joshua 24:3). Isaiah calls him by the name this choosing earns: *thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend... I have taken from the ends of the earth, and called thee from the chief men thereof* (Isaiah 41:8-9). And Stephen: *Get thee out of thy country, and from thy kindred* (Acts 7:3). Abraham is chosen out of idolatry — not because the line was clean, but because Yahuah called him from it.',
       sv.verse_id, ev.verse_id, 'extras', 53259
  FROM _session251_ju11_lookup sv, _session251_ju11_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=14
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=11 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-11-ravens-seed-plough',
       E'The ravens devour the seed — Abraham drives them off and invents the seed-plough',
       E'Mastêmâ wages the seed-war in the dirt: *the prince Mastêmâ sent ravens and birds to devour the seed which was sown in the land, in order to destroy the land, and rob the children of men of their labours* (Jubilees 11:11). But the chosen child turns the tide — *Abram ran to meet them... and said, “Descend not: return to the place whence you came,” and they proceeded to turn back* (Jubilees 11:19), seventy times in a day, and then *Abram taught those who made implements for oxen... and they made a vessel above the ground, facing the frame of the plough, in order to put the seed thereon... and they no longer feared the ravens* (Jubilees 11:23). Set this against the covenant Yahuah swore over the earth after the flood: *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease* (Genesis 8:22) — Mastêmâ assaults the seedtime; Yahuah''s word guarantees it. And the healed, fruitful earth is exactly what 1 Enoch promises after the Watchers are bound: *then shall the whole earth be tilled in righteousness, and shall all be planted with trees and be full of blessing* (1 Enoch 10:18). The vanity of the idols that could not protect a single field stands rebuked beside the living God: *vain are all men by nature, who are ignorant of Yahuah (God)... neither by considering the works did they acknowledge the workmaster* (Wisdom of Solomon 13:1).',
       sv.verse_id, ev.verse_id, 'extras', 53262
  FROM _session251_ju11_lookup sv, _session251_ju11_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=11 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-11-shem-to-terah-line
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:20 — *And Reu lived two and thirty years, and begat Serug:* the same father-son link Jubilees 11:1 records when Reu begets the one he names Sêrôḫ.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-shem-to-terah-line'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:22 — *And Serug lived thirty years, and begat Nahor:* matching Jubilees 11:6-8 where Serug dwells in Ur and his wife bears him Nahor.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-shem-to-terah-line'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:24 — *And Nahor lived nine and twenty years, and begat Terah:* the very birth Jubilees 11:10 dates when ''Îjâskâ bears Nahor a son named Terah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-shem-to-terah-line'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 11:26 — *And Terah lived seventy years, and begat Abram, Nahor, and Haran:* the climax of the line, Abram born to Terah exactly as Jubilees 11:14 narrates.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-shem-to-terah-line'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-11-idolatry-bloodshed-babel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names the very idolatry Jubilees 11:4 says Terah''s generation fell into.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-idolatry-bloodshed-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:2 — *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Stephen placing the call in the blood-and-idol world Jubilees 11:2-4 describes.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-idolatry-bloodshed-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The prophetic verdict on the molten images Jubilees 11:4 says they worshipped.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-idolatry-bloodshed-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-11-mastema-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say to them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men...”* the tenth-part of spirits whom Jubilees 11:5 now shows Mastêmâ sending out to corrupt and shed blood.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-mastema-seed-war'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:9 — *Proceed against the bastards and the reprobates, and against the children of fornication: and destroy [the children of fornication and] the children of the Watchers from amongst men... send them one against the other that they may destroy each other in battle: for length of days shall they not have.* The Watcher-spawn whose mutual slaughter Jubilees 11:5 echoes as Mastêmâ''s bloodshed on the earth.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-mastema-seed-war'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:15 — *And destroy all the spirits of the reprobate and the children of the Watchers, because they have wronged mankind.* The judgement on the very spirits Jubilees 11:5 says Mastêmâ unleashed to corrupt and destroy.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-mastema-seed-war'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-11-abraham-turns-from-idols
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* The election Jubilees 11:14 dramatizes as the boy separating himself from his father''s idols.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-abraham-turns-from-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The friend-of-God title earned by the very turning-to-the-Creator Jubilees 11:17 records in Abraham''s prayer.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-abraham-turns-from-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* The call out of the idolatrous house Jubilees 11:14-17 shows Abraham already straining toward as a child.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-abraham-turns-from-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-11-ravens-seed-plough
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:22 — *While the earth remaineth, seedtime and harvest, and cold and heat, and summer and winter, and day and night shall not cease.* The covenant of the seedtime Mastêmâ tries to break in Jubilees 11:11 by sending ravens against the sown seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-ravens-seed-plough'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:18 — *And then shall the whole earth be tilled in righteousness, and shall all be planted with trees and be full of blessing.* The tilled, freed land Jubilees 11:23 anticipates once Abram''s plough lets them sow without fear of the birds.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-ravens-seed-plough'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 13:1 — *Surely vain are all men by nature, who are ignorant of Yahuah (God), and could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster;* the idol-vanity Abram leaves behind in Jubilees 11:19 as he commands the ravens in the Creator''s name.'
  FROM cross_reference_threads t, cross_references x, _session251_ju11_lookup sv, _session251_ju11_lookup tv
 WHERE t.slug='jubilees-11-ravens-seed-plough'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jubilees_12.sql (session251 jubilees 12) -----
-- Source anchor: jubilees/jubilees ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju12 (view _session251_ju12_lookup). Sort band base 53275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-12-idols-have-no-spirit
  ('jubilees', 'jubilees', 12, 2, 'canon', 'deuteronomy', 4, 28, 'free', E'Deuteronomy 4:28 — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell.* The Torah''s verdict on idols is exactly Abram''s in Jubilees 12:2: they are the work of men''s hands with no spirit in them.'),
  ('jubilees', 'jubilees', 12, 1, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names the very idolatry of Terah''s house that Abram confronts in Jubilees 12:1.'),
  ('jubilees', 'jubilees', 12, 7, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* — the election of Abraham out of the idolatrous Chaldee line that frames all of Jubilees 12.'),
  -- thread: jubilees-12-haran-burns-with-the-idols
  ('jubilees', 'jubilees', 12, 14, 'canon', 'genesis', 11, 28, 'free', E'Genesis 11:28 — *And Haran died before his father Terah in the land of his nativity, in Ur of the Chaldees.* Genesis records only the fact of Haran''s death; Jubilees 12:14 supplies the idol-fire that killed him in that same Ur.'),
  ('jubilees', 'jubilees', 12, 14, 'canon', 'genesis', 11, 31, 'free', E'Genesis 11:31 — *And Terah took Abram his son, and Lot the son of Haran his son''s son, and Sarai his daughter in law, his son Abram''s wife; and they went forth with them from Ur of the Chaldees, to go into the land of Canaan; and they came unto Haran, and dwelt there.* The family''s departure from Ur toward Canaan in Jubilees 12:14 is the same journey Genesis records.'),
  -- thread: jubilees-12-signs-in-his-hand
  ('jubilees', 'jubilees', 12, 17, 'canon', 'deuteronomy', 4, 19, 'free', E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* Abram''s realization in Jubilees 12:17 that the sun, moon, and stars are in Yahuah''s hand — not gods — is the Torah''s own guard against worshipping the host of heaven.'),
  ('jubilees', 'jubilees', 12, 17, 'enoch', '1-enoch', 19, 1, 'extras', E'1 Enoch 19:1 — *And Uriel said to me: ''Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* The evil spirits Abram prays to be delivered from in Jubilees 12:17 are the Watcher-spirits of the live 1 Enoch apparatus, who lead mankind astray into demon-worship.'),
  ('jubilees', 'jubilees', 12, 17, 'enoch', '1-enoch', 10, 16, 'extras', E'1 Enoch 10:16 — *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth'' shall be planted in truth and joy for evermore.* Abram''s plea to stablish him and his seed for ever in Jubilees 12:17 is the planting of the righteous seed against the seed-war that 1 Enoch 10 promises after the Watchers are bound.'),
  -- thread: jubilees-12-get-thee-out-the-call
  ('jubilees', 'jubilees', 12, 22, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* — the call Jubilees 12:22 retells nearly word for word as the angel delivers it to Abram.'),
  ('jubilees', 'jubilees', 12, 22, 'canon', 'genesis', 12, 3, 'free', E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.* The blessing-and-cursing and all-families promise of Jubilees 12:22 is Genesis 12:3 set side by side.'),
  ('jubilees', 'jubilees', 12, 22, 'canon', 'acts', 7, 3, 'free', E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen quotes the same call to Abraham that Jubilees 12:22 records.'),
  ('jubilees', 'jubilees', 12, 22, 'canon', 'romans', 4, 3, 'free', E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* The promise Abram receives in Jubilees 12:22 is met with the faith Paul names as counted for righteousness — election and promise, not law-as-curse.'),
  -- thread: jubilees-12-hebrew-restored-after-babel
  ('jubilees', 'jubilees', 12, 25, 'canon', 'genesis', 11, 7, 'free', E'Genesis 11:7 — *Go to, let us go down, and there confound their language, that they may not understand one another''s speech.* The confounding of language at Babel that Jubilees 12:25 says ceased the original tongue from all men is Genesis 11:7.'),
  ('jubilees', 'jubilees', 12, 25, 'canon', 'genesis', 11, 9, 'free', E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* Jubilees 12:25 names this Babel overthrow as the moment the tongue of creation was lost — until it is restored to Abram.'),
  ('jubilees', 'jubilees', 12, 27, 'canon', 'genesis', 11, 6, 'free', E'Genesis 11:6 — *And Yahuah (LORD) said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them, which they have imagined to do.* The one original language of Genesis 11:6 is the Hebrew given back to Abram in Jubilees 12:26-27 so he can read the books of his fathers.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-12-idols-have-no-spirit',
       E'They are dumb forms — Abram renounces the idols',
       E'Jubilees opens the chapter with the young Abram pleading with his idolatrous father: *"What help and profit have we from those idols which you do worship, And before which you do bow yourself? For there is no spirit in them, For they are dumb forms, and a misleading of the heart. Worship them not: Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth... For they are the work of (men''s) hands, And on your shoulders do you bear them, And you have no help from them"* (Jubilees 12:2). This is the same charge the Torah lays against idols: *"And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell"* (Deuteronomy 4:28). And it is Abraham''s election OUT of the idolatrous line — *"The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran"* (Acts 7:2) — the very fathers Joshua names: *"Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods"* (Joshua 24:2). The seed is chosen, separated from the nations, before it confesses. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53275
  FROM _session251_ju12_lookup sv, _session251_ju12_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-12-haran-burns-with-the-idols',
       E'He burned the house of the idols — Haran dies in Ur',
       E'Abram does not merely reason against the idols; he ends them: *"Abram arose by night, and burned the house of the idols, and he burned all that was in the house, and no man knew it"* (Jubilees 12:12), and *"Haran hasted to save them, but the fire flamed over him, and he was burnt in the fire, and he died in Ur of the Chaldees before Terah his father, and they buried him in Ur of the Chaldees"* (Jubilees 12:14). Genesis records the bare death without the cause: *"And Haran died before his father Terah in the land of his nativity, in Ur of the Chaldees"* (Genesis 11:28) — Jubilees fills in the idol-fire behind it. And the migration follows exactly as Genesis tells it: *"And Terah took Abram his son, and Lot the son of Haran his son''s son, and Sarai his daughter in law, his son Abram''s wife; and they went forth with them from Ur of the Chaldees, to go into the land of Canaan; and they came unto Haran, and dwelt there"* (Genesis 11:31). The retelling and its source stand side by side. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53278
  FROM _session251_ju12_lookup sv, _session251_ju12_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=12 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-12-signs-in-his-hand',
       E'The stars are not gods — all the signs are in His hand',
       E'Abram sits the whole night on the new moon of the seventh month to read the stars, and a word breaks in his heart: *"All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God). Why do I search (them) out? If He desires, He causes it to rain, morning and evening; And if He desires, He withholds it, And all things are in His hand"* (Jubilees 12:17). This is the Torah''s exact guard against star-worship: *"And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven"* (Deuteronomy 4:19). And Abram''s prayer in the same breath names the seed-war — *"Deliver me from the hands of evil spirits who have sway over the thoughts of men''s hearts, And let them not lead me astray from You... And stablish You me and my seed for ever"* (Jubilees 12:17) — the very demons the live 1 Enoch apparatus binds: *"their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods"* (1 Enoch 19:1). The Watcher-spirits drive the nations to idols; Abram prays to be kept, and his seed with him.',
       sv.verse_id, ev.verse_id, 'extras', 53281
  FROM _session251_ju12_lookup sv, _session251_ju12_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=12 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-12-get-thee-out-the-call',
       E'Get you up from your country — the call of Abram',
       E'The word of Yahuah comes to Abram and Jubilees gives the call almost word for word with Genesis: *"Get you up from your country, and from your kindred and from the house of your father to a land which I shall show you, and I shall make you a great and numerous nation. And I shall bless you And I shall make your name great... And in you will all families of the earth be blessed, And I shall bless them that bless you, And curse them that curse you"* (Jubilees 12:22). Set Genesis beside it: *"Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee"* (Genesis 12:1), and *"And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed"* (Genesis 12:3). Stephen preaches the same call: *"And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee"* (Acts 7:3). And this is the faith counted for righteousness — *"Abraham believed Elohim (God), and it was counted unto him for righteousness"* (Romans 4:3) — election and promise, not law-as-curse. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53284
  FROM _session251_ju12_lookup sv, _session251_ju12_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=22
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=12 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-12-hebrew-restored-after-babel',
       E'He spoke with him in Hebrew — the tongue of creation restored',
       E'Once Abram is called, Yahuah restores to him the lost language: *"Open his mouth and his ears, that he may hear and speak with his mouth, with the language which has been revealed; for it had ceased from the mouths of all the children of men from the day of the overthrow (of Babel)"* (Jubilees 12:25), *"And I opened his mouth, and his ears and his lips, and I began to speak with him in Hebrew in the tongue of the creation"* (Jubilees 12:26). Jubilees anchors this in the Babel judgement of Genesis: *"And Yahuah (LORD) said, Behold, the people is one, and they have all one language... Go to, let us go down, and there confound their language, that they may not understand one another''s speech"* (Genesis 11:6-7), *"Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth"* (Genesis 11:9). The one tongue confounded at Babel is given back to the chosen seed, and with it the books of the fathers — the heavenly-tablet inheritance Abram studies (Jubilees 12:27). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53287
  FROM _session251_ju12_lookup sv, _session251_ju12_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=25
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=12 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-12-idols-have-no-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:28 — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell.* The Torah''s verdict on idols is exactly Abram''s in Jubilees 12:2: they are the work of men''s hands with no spirit in them.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-idols-have-no-spirit'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names the very idolatry of Terah''s house that Abram confronts in Jubilees 12:1.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-idols-have-no-spirit'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* — the election of Abraham out of the idolatrous Chaldee line that frames all of Jubilees 12.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-idols-have-no-spirit'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-12-haran-burns-with-the-idols
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:28 — *And Haran died before his father Terah in the land of his nativity, in Ur of the Chaldees.* Genesis records only the fact of Haran''s death; Jubilees 12:14 supplies the idol-fire that killed him in that same Ur.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-haran-burns-with-the-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:31 — *And Terah took Abram his son, and Lot the son of Haran his son''s son, and Sarai his daughter in law, his son Abram''s wife; and they went forth with them from Ur of the Chaldees, to go into the land of Canaan; and they came unto Haran, and dwelt there.* The family''s departure from Ur toward Canaan in Jubilees 12:14 is the same journey Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-haran-burns-with-the-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-12-signs-in-his-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them, which Yahuah Elohayka (the LORD thy God) hath divided unto all nations under the whole heaven.* Abram''s realization in Jubilees 12:17 that the sun, moon, and stars are in Yahuah''s hand — not gods — is the Torah''s own guard against worshipping the host of heaven.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-signs-in-his-hand'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 19:1 — *And Uriel said to me: ''Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* The evil spirits Abram prays to be delivered from in Jubilees 12:17 are the Watcher-spirits of the live 1 Enoch apparatus, who lead mankind astray into demon-worship.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-signs-in-his-hand'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:16 — *Destroy all wrong from the face of the earth and let every evil work come to an end: and let the plant of righteousness and truth appear: and it shall prove a blessing; the works of righteousness and truth'' shall be planted in truth and joy for evermore.* Abram''s plea to stablish him and his seed for ever in Jubilees 12:17 is the planting of the righteous seed against the seed-war that 1 Enoch 10 promises after the Watchers are bound.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-signs-in-his-hand'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-12-get-thee-out-the-call
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee:* — the call Jubilees 12:22 retells nearly word for word as the angel delivers it to Abram.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-get-thee-out-the-call'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.* The blessing-and-cursing and all-families promise of Jubilees 12:22 is Genesis 12:3 set side by side.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-get-thee-out-the-call'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen quotes the same call to Abraham that Jubilees 12:22 records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-get-thee-out-the-call'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* The promise Abram receives in Jubilees 12:22 is met with the faith Paul names as counted for righteousness — election and promise, not law-as-curse.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-get-thee-out-the-call'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-12-hebrew-restored-after-babel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:7 — *Go to, let us go down, and there confound their language, that they may not understand one another''s speech.* The confounding of language at Babel that Jubilees 12:25 says ceased the original tongue from all men is Genesis 11:7.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-hebrew-restored-after-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* Jubilees 12:25 names this Babel overthrow as the moment the tongue of creation was lost — until it is restored to Abram.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-hebrew-restored-after-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:6 — *And Yahuah (LORD) said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them, which they have imagined to do.* The one original language of Genesis 11:6 is the Hebrew given back to Abram in Jubilees 12:26-27 so he can read the books of his fathers.'
  FROM cross_reference_threads t, cross_references x, _session251_ju12_lookup sv, _session251_ju12_lookup tv
 WHERE t.slug='jubilees-12-hebrew-restored-after-babel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=12 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jubilees_13.sql (session251 jubilees 13) -----
-- Source anchor: jubilees/jubilees ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju13 (view _session251_ju13_lookup). Sort band base 53300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-13-bethel-altar-call-name
  ('jubilees', 'jubilees', 13, 1, 'canon', 'genesis', 12, 6, 'free', E'Genesis 12:6 — *And Abram passed through the land unto the place of Sichem, unto the plain of Moreh. And the Canaanite was then in the land.* Jubilees 13:1 retells the same journey to Shechem by the lofty oak.'),
  ('jubilees', 'jubilees', 13, 2, 'canon', 'genesis', 12, 7, 'free', E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him.* The land-and-seed promise and the altar of Jubilees 13:2,4 are Genesis verbatim.'),
  ('jubilees', 'jubilees', 13, 7, 'canon', 'genesis', 12, 8, 'free', E'Genesis 12:8 — *And he removed from thence unto a mountain on the east of Beth-el, and pitched his tent, having Beth-el on the west, and Hai on the east: and there he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD).* Jubilees 13:7 has Abram between Bethel and Ai building the altar and calling on the Name.'),
  -- thread: jubilees-13-egypt-sarai-pharaoh-plagued
  ('jubilees', 'jubilees', 13, 11, 'canon', 'genesis', 12, 10, 'free', E'Genesis 12:10 — *And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land.* Jubilees 13:11 sends Abram down to Egypt by the same famine.'),
  ('jubilees', 'jubilees', 13, 12, 'canon', 'genesis', 12, 17, 'free', E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* Jubilees 13:12 carries the plaguing of Pharaoh''s house verbatim — Yahuah guards the seed-bearing wife.'),
  ('jubilees', 'jubilees', 13, 15, 'canon', 'genesis', 12, 19, 'free', E'Genesis 12:19 — *Why saidst thou, She is my sister? so I might have taken her to me to wife: now therefore behold thy wife, take her, and go thy way.* The restoration of Sarai and Abram''s sending out of Egypt in Jubilees 13:15 answers this Genesis scene.'),
  ('jubilees', 'jubilees', 13, 15, 'canon', 'genesis', 13, 4, 'free', E'Genesis 13:4 — *Unto the place of the altar, which he had made there at the first: and there Abram called on the name of Yahuah (LORD).* Jubilees 13:15 returns Abram to that same altar between Ai and Bethel where he again blesses and calls on the Name.'),
  -- thread: jubilees-13-lot-parts-land-seed-promise-renewed
  ('jubilees', 'jubilees', 13, 17, 'canon', 'genesis', 13, 11, 'free', E'Genesis 13:11 — *Then Lot chose him all the plain of Jordan; and Lot journeyed east: and they separated themselves the one from the other.* Jubilees 13:17 has Lot part and settle in Sodom.'),
  ('jubilees', 'jubilees', 13, 19, 'canon', 'genesis', 13, 14, 'free', E'Genesis 13:14 — *And Yahuah (LORD) said unto Abram, after that Lot was separated from him, Lift up now thine eyes, and look from the place where thou art northward, and southward, and eastward, and westward.* Jubilees 13:19 renews the promise in these exact words once Lot has parted.'),
  ('jubilees', 'jubilees', 13, 20, 'canon', 'genesis', 13, 15, 'free', E'Genesis 13:15 — *For all the land which thou seest, to thee will I give it, and to thy seed for ever.* The land-to-the-seed-for-ever of Jubilees 13:20 is the Genesis grant verbatim.'),
  ('jubilees', 'jubilees', 13, 20, 'canon', 'galatians', 3, 16, 'free', E'Galatians 3:16 — *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ).* The seed-promise renewed in Jubilees 13:20 rides on the single Seed.'),
  ('jubilees', 'jubilees', 13, 20, 'canon', 'romans', 4, 3, 'free', E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* Abram''s faith, not law-as-curse, secures the inheritance promised in Jubilees 13:20.'),
  -- thread: jubilees-13-kings-war-lot-captive
  ('jubilees', 'jubilees', 13, 20, 'canon', 'genesis', 14, 1, 'free', E'Genesis 14:1 — *And it came to pass in the days of Amraphel king of Shinar, Arioch king of Ellasar, Chedorlaomer king of Elam, and Tidal king of nations.* Jubilees 13:20 names the same coalition of kings.'),
  ('jubilees', 'jubilees', 13, 23, 'canon', 'genesis', 14, 12, 'free', E'Genesis 14:12 — *And they took Lot, Abram''s brother''s son, who dwelt in Sodom, and his goods, and departed.* Jubilees 13:23 has Lot taken captive with Sodom verbatim.'),
  ('jubilees', 'jubilees', 13, 24, 'canon', 'genesis', 14, 13, 'free', E'Genesis 14:13 — *And there came one that had escaped, and told Abram the Hebrew; for he dwelt in the plain of Mamre the Amorite, brother of Eshcol, and brother of Aner: and these were confederate with Abram.* The escapee bringing word in Jubilees 13:24 is the Genesis account.'),
  ('jubilees', 'jubilees', 13, 24, 'canon', 'genesis', 14, 14, 'free', E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* Abram arming his household in Jubilees 13:24 and pursuing to Dan matches Genesis exactly.'),
  -- thread: jubilees-13-tithe-ordinance-for-ever
  ('jubilees', 'jubilees', 13, 26, 'canon', 'genesis', 14, 20, 'free', E'Genesis 14:20 — *And blessed be the El Elyon (most high God), which hath delivered thine enemies into thy hand. And he gave him tithes of all.* Abram''s tenth in Jubilees 13:26 is the Genesis tithe to the priest of the Most High.'),
  ('jubilees', 'jubilees', 13, 26, 'canon', 'leviticus', 27, 30, 'free', E'Leviticus 27:30 — *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD).* The Torah keeps the tenth of seed and fruit holy, the very ordinance Jubilees 13:26 calls for ever.'),
  ('jubilees', 'jubilees', 13, 26, 'canon', 'numbers', 18, 21, 'free', E'Numbers 18:21 — *And, behold, I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance, for their service which they serve, even the service of the tabernacle of the congregation.* The priestly tenth for ever in Jubilees 13:26 is given to Levi in the Torah.'),
  ('jubilees', 'jubilees', 13, 26, 'canon', 'hebrews', 7, 2, 'free', E'Hebrews 7:2 — *To whom also Abraham gave a tenth part of all; first being by interpretation King of righteousness, and after that also King of Salem, which is, King of peace.* Hebrews reads Abram''s tithe of Jubilees 13:26 as the priesthood that foreshadows Messiah.'),
  ('jubilees', 'jubilees', 13, 29, 'canon', 'genesis', 14, 23, 'free', E'Genesis 14:23 — *That I will not take from a thread even to a shoelatchet, and that I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich.* Abram''s refusal of Sodom''s spoil in Jubilees 13:29 is the Genesis oath verbatim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-13-bethel-altar-call-name',
       E'Bethel, the altar, and calling on the Name — it ain''t new',
       E'Jubilees opens Abram''s life in the land exactly where Genesis sets it: *And Abram journeyed from Haran, and he took Sarai, his wife, and Lot his brother Haran''s son, to the land of Canaan, and he came into Asshur, and proceeded to Shechem, and dwelt near a lofty oak* (Jubilees 13:1), and there *Yahuah (God) said to him: "To you and to your seed will I give this land"* (Jubilees 13:2), so *he built an altar there, and he offered thereon a burnt sacrifice to Yahuah (God), who had appeared to him* (Jubilees 13:4). This is the Genesis account retold word for word — *And Abram passed through the land unto the place of Sichem, unto the plain of Moreh* (Genesis 12:6), *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* (Genesis 12:7). Jubilees then plants Abram between Bethel and Ai and has him build a second altar and *called on the name of Yahuah (God)* (Jubilees 13:7) — the same posture Genesis records: *and there he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD)* (Genesis 12:8). Worship at the altar, calling on the Name, the land-and-seed promise — none of it is later invention; it is the patriarch''s own walk, woven into the canon from the first.',
       sv.verse_id, ev.verse_id, 'extras', 53300
  FROM _session251_ju13_lookup sv, _session251_ju13_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-13-egypt-sarai-pharaoh-plagued',
       E'Down to Egypt — Sarai taken, Pharaoh plagued, the wife restored',
       E'The famine drives Abram down to Egypt in both books: *And Abram went into Egypt in the third year of the week, and he dwelt in Egypt five years before his wife was torn away from him* (Jubilees 13:11), which Genesis tells as *And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land* (Genesis 12:10). When Pharaoh seizes Sarai, Jubilees says *that Yahuah (God) plagued Pharaoh and his house with great plagues because of Sarai, Abram''s wife* (Jubilees 13:12) — the very wording of *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife* (Genesis 12:17). And the deliverance is the same: *And Pharaoh gave back Sarai, the wife of Abram, and he sent him out of the land of Egypt* (Jubilees 13:15) answers *Why saidst thou, She is my sister? so I might have taken her to me to wife: now therefore behold thy wife, take her, and go thy way* (Genesis 12:19). Yahuah guards the seed-bearing wife and brings Abram out of Egypt enriched — the first faint sketch of the Exodus pattern, kept and answered in the canon.',
       sv.verse_id, ev.verse_id, 'extras', 53303
  FROM _session251_ju13_lookup sv, _session251_ju13_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=13 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-13-lot-parts-land-seed-promise-renewed',
       E'Lot parts and the land-and-seed promise is renewed',
       E'Lot separates from Abram and chooses Sodom — *And in the fourth year of this week Lot parted from him, and Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly* (Jubilees 13:17) — exactly as Genesis: *Then Lot chose him all the plain of Jordan; and Lot journeyed east: and they separated themselves the one from the other* (Genesis 13:11), *But the men of Sodom were wicked and sinners before Yahuah (LORD) exceedingly* (Genesis 13:13). With Lot gone, Yahuah renews the promise to the seed: *"Lift up your eyes from the place where you are dwelling, northward and southward, and westward and eastward* (Jubilees 13:19), *For all the land which you see I shall give to you and to your seed for ever, and I shall make your seed as the sand of the sea* (Jubilees 13:20) — the canon''s *Lift up now thine eyes... For all the land which thou seest, to thee will I give it, and to thy seed for ever. And I will make thy seed as the dust of the earth* (Genesis 13:14-16). The promise rides on a single Seed and on faith counted righteous: *Now to Abraham and his seed were the promises made... but as of one, And to thy seed, which is Messiah (Christ)* (Galatians 3:16), and *Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3). Election and faith, not later law-as-curse, secure the inheritance — *And if ye be Messiah''s (Christ''s), then are ye Abraham''s seed, and heirs according to the promise* (Galatians 3:29).',
       sv.verse_id, ev.verse_id, 'extras', 53306
  FROM _session251_ju13_lookup sv, _session251_ju13_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=17
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=13 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-13-kings-war-lot-captive',
       E'The four kings, the war, and Lot taken captive',
       E'Jubilees compresses the war of the kings into a single sweep: *And in this year came Chedorlaomer, king of Elam, and Amraphel, king of Shinar, and Arioch, king of Sêllâsar and Têrgâl, king of nations, and slew the king of Gomorrah, and the king of Sodom fled, and many fell through wounds in the vale of Siddim, by the Salt Sea* (Jubilees 13:20) — the same alliance Genesis names: *And it came to pass in the days of Amraphel king of Shinar, Arioch king of Ellasar, Chedorlaomer king of Elam, and Tidal king of nations* (Genesis 14:1). Lot is swept up with Sodom — *And they took captive Sodom and Adam and Zeboim, and they took captive Lot also, the son of Abram''s brother, and all his possessions* (Jubilees 13:23), as in *And they took Lot, Abram''s brother''s son, who dwelt in Sodom, and his goods, and departed* (Genesis 14:12). One escapee brings word and Abram arms his house — *And one who had escaped came and told Abram that his brother''s son had been taken captive and (Abram) armed his household servants* (Jubilees 13:24) — the canon''s *And there came one that had escaped, and told Abram the Hebrew... And when Abram heard that his brother was taken captive, he armed his trained servants* (Genesis 14:13-14). The narrative is one with Genesis; Jubilees only frames it by jubilee and week.',
       sv.verse_id, ev.verse_id, 'extras', 53309
  FROM _session251_ju13_lookup sv, _session251_ju13_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=20
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=13 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-13-tithe-ordinance-for-ever',
       E'The tithe ordained for ever — and Abram''s refusal of Sodom''s spoil',
       E'Out of the rescue Jubilees grounds the tithe in the patriarch and the heavenly tablets: *a tenth of the first-fruits to Yahuah (God), and Yahuah (God) ordained it as an ordinance for ever that they should give it to the priests who served before Him, that they should possess it for ever* (Jubilees 13:25), *And to this law there is no limit of days; for He has ordained it for the generations for ever that they should give to Yahuah (God) the tenth of everything, of the seed and of the wine and of the oil and of the cattle and of the sheep* (Jubilees 13:26). This is the Genesis tithe to the priest-king — *And he gave him tithes of all* (Genesis 14:20) — read as an eternal ordinance, not a later levy. The Torah keeps it the same: *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD)* (Leviticus 27:30), and Numbers gives it to the priesthood for ever: *I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance* (Numbers 18:21). The book of Hebrews reads Abram''s tithe as the older, greater priesthood foreshadowing Messiah: *To whom also Abraham gave a tenth part of all... made like unto the Son of Elohim (God); abideth a priest continually* (Hebrews 7:2-3). And Abram takes nothing of Sodom''s spoil — *"I lift up my hands to the El Elyon (Most High) Elohim (God), that from a thread to a shoe-latchet I shall not take aught that is your"* (Jubilees 13:29) — the canon''s *I will not take from a thread even to a shoelatchet... lest thou shouldest say, I have made Abram rich* (Genesis 14:23). The tithe and the patriarch''s holiness are ancient and engraved; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53312
  FROM _session251_ju13_lookup sv, _session251_ju13_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=26
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=13 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-13-bethel-altar-call-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:6 — *And Abram passed through the land unto the place of Sichem, unto the plain of Moreh. And the Canaanite was then in the land.* Jubilees 13:1 retells the same journey to Shechem by the lofty oak.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-bethel-altar-call-name'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him.* The land-and-seed promise and the altar of Jubilees 13:2,4 are Genesis verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-bethel-altar-call-name'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 12:8 — *And he removed from thence unto a mountain on the east of Beth-el, and pitched his tent, having Beth-el on the west, and Hai on the east: and there he builded an altar unto Yahuah (LORD), and called upon the name of Yahuah (LORD).* Jubilees 13:7 has Abram between Bethel and Ai building the altar and calling on the Name.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-bethel-altar-call-name'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-13-egypt-sarai-pharaoh-plagued
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:10 — *And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land.* Jubilees 13:11 sends Abram down to Egypt by the same famine.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-egypt-sarai-pharaoh-plagued'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* Jubilees 13:12 carries the plaguing of Pharaoh''s house verbatim — Yahuah guards the seed-bearing wife.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-egypt-sarai-pharaoh-plagued'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 12:19 — *Why saidst thou, She is my sister? so I might have taken her to me to wife: now therefore behold thy wife, take her, and go thy way.* The restoration of Sarai and Abram''s sending out of Egypt in Jubilees 13:15 answers this Genesis scene.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-egypt-sarai-pharaoh-plagued'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 13:4 — *Unto the place of the altar, which he had made there at the first: and there Abram called on the name of Yahuah (LORD).* Jubilees 13:15 returns Abram to that same altar between Ai and Bethel where he again blesses and calls on the Name.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-egypt-sarai-pharaoh-plagued'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-13-lot-parts-land-seed-promise-renewed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 13:11 — *Then Lot chose him all the plain of Jordan; and Lot journeyed east: and they separated themselves the one from the other.* Jubilees 13:17 has Lot part and settle in Sodom.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-lot-parts-land-seed-promise-renewed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 13:14 — *And Yahuah (LORD) said unto Abram, after that Lot was separated from him, Lift up now thine eyes, and look from the place where thou art northward, and southward, and eastward, and westward.* Jubilees 13:19 renews the promise in these exact words once Lot has parted.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-lot-parts-land-seed-promise-renewed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 13:15 — *For all the land which thou seest, to thee will I give it, and to thy seed for ever.* The land-to-the-seed-for-ever of Jubilees 13:20 is the Genesis grant verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-lot-parts-land-seed-promise-renewed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 3:16 — *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ).* The seed-promise renewed in Jubilees 13:20 rides on the single Seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-lot-parts-land-seed-promise-renewed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* Abram''s faith, not law-as-curse, secures the inheritance promised in Jubilees 13:20.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-lot-parts-land-seed-promise-renewed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-13-kings-war-lot-captive
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:1 — *And it came to pass in the days of Amraphel king of Shinar, Arioch king of Ellasar, Chedorlaomer king of Elam, and Tidal king of nations.* Jubilees 13:20 names the same coalition of kings.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-kings-war-lot-captive'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:12 — *And they took Lot, Abram''s brother''s son, who dwelt in Sodom, and his goods, and departed.* Jubilees 13:23 has Lot taken captive with Sodom verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-kings-war-lot-captive'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 14:13 — *And there came one that had escaped, and told Abram the Hebrew; for he dwelt in the plain of Mamre the Amorite, brother of Eshcol, and brother of Aner: and these were confederate with Abram.* The escapee bringing word in Jubilees 13:24 is the Genesis account.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-kings-war-lot-captive'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* Abram arming his household in Jubilees 13:24 and pursuing to Dan matches Genesis exactly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-kings-war-lot-captive'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-13-tithe-ordinance-for-ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:20 — *And blessed be the El Elyon (most high God), which hath delivered thine enemies into thy hand. And he gave him tithes of all.* Abram''s tenth in Jubilees 13:26 is the Genesis tithe to the priest of the Most High.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-tithe-ordinance-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 27:30 — *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD).* The Torah keeps the tenth of seed and fruit holy, the very ordinance Jubilees 13:26 calls for ever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-tithe-ordinance-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=27 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 18:21 — *And, behold, I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance, for their service which they serve, even the service of the tabernacle of the congregation.* The priestly tenth for ever in Jubilees 13:26 is given to Levi in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-tithe-ordinance-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 7:2 — *To whom also Abraham gave a tenth part of all; first being by interpretation King of righteousness, and after that also King of Salem, which is, King of peace.* Hebrews reads Abram''s tithe of Jubilees 13:26 as the priesthood that foreshadows Messiah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-tithe-ordinance-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 14:23 — *That I will not take from a thread even to a shoelatchet, and that I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich.* Abram''s refusal of Sodom''s spoil in Jubilees 13:29 is the Genesis oath verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju13_lookup sv, _session251_ju13_lookup tv
 WHERE t.slug='jubilees-13-tithe-ordinance-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=13 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jubilees_14.sql (session251 jubilees 14) -----
-- Source anchor: jubilees/jubilees ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju14 (view _session251_ju14_lookup). Sort band base 53325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-14-fear-not-i-am-thy-shield
  ('jubilees', 'jubilees', 14, 1, 'canon', 'genesis', 15, 1, 'free', E'Genesis 15:1 — *After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward.* The same word, the same vision, the same "Fear not" — Jubilees 14:1 retells Genesis 15 verbatim.'),
  ('jubilees', 'jubilees', 14, 2, 'canon', 'genesis', 15, 2, 'free', E'Genesis 15:2 — *And Abram said, Yahuah (Lord) GOD, what wilt thou give me, seeing I go childless, and the steward of my house is this Eliezer of Damascus?* Abram''s childless complaint and the steward Eliezer stand in both Jubilees 14:2 and its Genesis source.'),
  ('jubilees', 'jubilees', 14, 3, 'canon', 'genesis', 15, 4, 'free', E'Genesis 15:4 — *And, behold, the word of Yahuah (LORD) came unto him, saying, This shall not be thine heir; but he that shall come forth out of thine own bowels shall be thine heir.* The heir of the bowels, not of the house — Jubilees 14:3 carries the Genesis promise of a true seed.'),
  -- thread: jubilees-14-count-the-stars-believed-righteousness
  ('jubilees', 'jubilees', 14, 5, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The star-numbering sign of the seed is identical in Jubilees 14:4-5 and Genesis 15.'),
  ('jubilees', 'jubilees', 14, 6, 'canon', 'genesis', 15, 6, 'free', E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness.* Jubilees 14:6 preserves the founding word of faith-counted-righteousness exactly as Genesis records it.'),
  ('jubilees', 'jubilees', 14, 6, 'canon', 'romans', 4, 3, 'free', E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* Sha''ul quotes the very verse Jubilees 14:6 retells — righteousness by faith ain''t new.'),
  ('jubilees', 'jubilees', 14, 6, 'canon', 'galatians', 3, 6, 'free', E'Galatians 3:6 — *Even as Abraham believed Elohim (God), and it was accounted to him for righteousness.* The faith reckoned to Abram in Jubilees 14:6 is the ground on which Galatians names the children of faith.'),
  ('jubilees', 'jubilees', 14, 6, 'canon', 'galatians', 3, 7, 'free', E'Galatians 3:7 — *Know ye therefore that they which are of faith, the same are the children of Abraham.* Those of Abram''s faith (Jubilees 14:6) are reckoned his children — the seed kept by faith, not flesh alone.'),
  -- thread: jubilees-14-out-of-ur-land-promise
  ('jubilees', 'jubilees', 14, 6, 'canon', 'genesis', 15, 7, 'free', E'Genesis 15:7 — *And he said unto him, I am Yahuah (LORD) that brought thee out of Ur of the Chaldees, to give thee this land to inherit it.* The self-naming by the deliverance out of Ur (Jubilees 14:6) is Abraham''s election out of the idolatrous nations.'),
  ('jubilees', 'jubilees', 14, 8, 'canon', 'genesis', 15, 8, 'free', E'Genesis 15:8 — *And he said, Yahuah (Lord) GOD, whereby shall I know that I shall inherit it?* Abram''s request for surety of the inheritance stands word for word in Jubilees 14:8.'),
  ('jubilees', 'jubilees', 14, 18, 'canon', 'genesis', 15, 18, 'free', E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* The land covenant from Egypt to the Euphrates is identical in Jubilees 14:18 and Genesis.'),
  ('jubilees', 'jubilees', 14, 6, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The "to you and to your seed after you" of Jubilees 14:6 is the everlasting seed-covenant Genesis 17 seals with circumcision.'),
  -- thread: jubilees-14-pieces-furnace-lamp-four-hundred-years
  ('jubilees', 'jubilees', 14, 11, 'canon', 'genesis', 15, 10, 'free', E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* The dividing of the pieces with the birds undivided is the same rite in Jubilees 14:11.'),
  ('jubilees', 'jubilees', 14, 13, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The four-hundred-year bondage foretold in Jubilees 14:13 is Genesis word for word.'),
  ('jubilees', 'jubilees', 14, 16, 'canon', 'genesis', 15, 17, 'free', E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The smoking furnace and flame passing between the pieces (Jubilees 14:16) is the sign of Yahuah cutting the covenant alone.'),
  ('jubilees', 'jubilees', 14, 13, 'canon', 'exodus', 12, 41, 'free', E'Exodus 12:41 — *And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt.* The affliction-word of Jubilees 14:13 came to pass to the very day — the tablets foretell history before it unfolds.'),
  ('jubilees', 'jubilees', 14, 13, 'enoch', '1-enoch', 81, 1, 'extras', E'1 Enoch 81:1 — *And he said unto me: ''Observe, Enoch, these heavenly tablets, And read what is written thereon, And understand every single fact.''* The four-hundred-year word of Jubilees 14:13 is read off the same heavenly tablets Enoch is shown — the history pre-written.'),
  -- thread: jubilees-14-covenant-with-noah-feast-renewed-for-ever
  ('jubilees', 'jubilees', 14, 20, 'jubilees', 'jubilees', 6, 17, 'extras', E'Jubilees 6:17 — *For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year. And this whole festival was celebrated in heaven from the day of creation till the days of Noah-twenty-six jubilees and five weeks of years: and Noah and his sons observed it for seven jubilees and one week of years, till the day of Noah''s death, and from the day of Noah''s death his sons did away with (it) until the days of Abraham, and they ate blood.* The covenant Abram renews "as we covenanted with Noah" (Jubilees 14:20) is the Feast of Weeks, engraved on the heavenly tablets and kept since creation.'),
  ('jubilees', 'jubilees', 14, 20, 'jubilees', 'jubilees', 6, 19, 'extras', E'Jubilees 6:19 — *But Abraham observed it, and Isaac and Jacob and his children observed it up to your days, and in your days the children of Yashar''el (Israel) forgot it until you celebrated it anew on this mountain.* Jubilees 14:20 shows Abraham renewing the very feast 6:19 says he observed — the patriarchs kept the appointed times, it ain''t new.'),
  ('jubilees', 'jubilees', 14, 20, 'canon', 'leviticus', 23, 15, 'free', E'Leviticus 23:15 — *And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete:* The festival ordinance Abram renews for ever (Jubilees 14:20) is the counted Feast of Weeks fixed in the Torah.'),
  ('jubilees', 'jubilees', 14, 18, 'canon', 'genesis', 15, 18, 'free', E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* Jubilees 14:18-20 anchors the same "in that day" land-covenant of Genesis 15 in the recurring oath-feast.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-14-fear-not-i-am-thy-shield',
       E'Fear not, Abram — the word in the vision, I am thy shield',
       E'Jubilees opens the covenant of the pieces exactly where Genesis does: *"After these things, in the fourth year of this week, on the new moon of the third month, the word of Yahuah (God) came to Abram in a dream, saying: ''Fear not, Abram; I am your defender, and your reward will be exceeding great.''"* (Jubilees 14:1). It ain''t new — it is the *word that came unto Abram in a vision*: *"After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward."* (Genesis 15:1). Abram answers out of his childlessness — *"Yahuah (God), Yahuah (God), what will you give me, seeing I go hence childless..."* (Jubilees 14:2) — the same complaint Genesis records: *"And Abram said, Yahuah (Lord) GOD, what wilt thou give me, seeing I go childless, and the steward of my house is this Eliezer of Damascus?"* (Genesis 15:2). And the heir is named not from the house but from the bowels: *"This (man) will not be your heir, but one that will come out of your own bowels; he will be your heir."* (Jubilees 14:3) answers to *"This shall not be thine heir; but he that shall come forth out of thine own bowels shall be thine heir."* (Genesis 15:4). The chosen line — Abram pulled out of Ur of the Chaldees, out of the idolatrous nations — is given the promise of a seed.',
       sv.verse_id, ev.verse_id, 'extras', 53325
  FROM _session251_ju14_lookup sv, _session251_ju14_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=14 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-14-count-the-stars-believed-righteousness',
       E'Count the stars — he believed, and it was counted for righteousness',
       E'Here is the hinge of the whole framework. Yahuah brings Abram out and bids him number the stars: *"And He brought him forth abroad, and said to him: ''Look toward heaven and number the stars, if you are able to number them.''"* (Jubilees 14:4), and *"And he looked toward heaven, and beheld the stars. And He said to him: ''So shall your seed be.''"* (Jubilees 14:5) — word for word the Genesis sign: *"And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be."* (Genesis 15:5). Then the verse the apostles built upon: *"And he believed in Yahuah (God), and it was counted to him for righteousness."* (Jubilees 14:6) — *"And he believed in Yahuah (LORD); and he counted it to him for righteousness."* (Genesis 15:6). Faith counted for righteousness ain''t new and it ain''t Paul''s invention; Sha''ul simply read it off the page: *"For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness."* (Romans 4:3). And those who walk in that faith are reckoned Abraham''s children: *"Even as Abraham believed Elohim (God), and it was accounted to him for righteousness. Know ye therefore that they which are of faith, the same are the children of Abraham."* (Galatians 3:6-7). The Torah does not become a curse here — election precedes the law, faith precedes the sign, and the seed promised is the seed kept.',
       sv.verse_id, ev.verse_id, 'extras', 53328
  FROM _session251_ju14_lookup sv, _session251_ju14_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=14 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-14-out-of-ur-land-promise',
       E'Out of Ur of the Chaldees — election out of idolatry, the land covenant',
       E'The God of the covenant identifies Himself by the election: *"...I am Yahuah (God) that brought you out of Ur of the Chaldees, to give you the land of the Canaanites to possess it for ever; and I shall be Elohim (God) to you and to your seed after you."* (Jubilees 14:6) — drawn out of the idolatrous Chaldean line, just as Genesis says: *"And he said unto him, I am Yahuah (LORD) that brought thee out of Ur of the Chaldees, to give thee this land to inherit it."* (Genesis 15:7). Abram asks for surety — *"Yahuah (God), Yahuah (God), whereby shall I know that I shall inherit (it)?"* (Jubilees 14:8) / *"And he said, Yahuah (Lord) GOD, whereby shall I know that I shall inherit it?"* (Genesis 15:8). And the land is bounded river to river: *"...To your seed will I give this land, from the river of Egypt to the great river, the river Euphrates..."* (Jubilees 14:18) — *"In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:"* (Genesis 15:18). This "to you and to your seed after you" is the same everlasting seed-covenant Genesis 17 seals: *"And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee."* (Genesis 17:7). Election precedes confession; Yahuah chooses the line and keeps it.',
       sv.verse_id, ev.verse_id, 'extras', 53331
  FROM _session251_ju14_lookup sv, _session251_ju14_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=14 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-14-pieces-furnace-lamp-four-hundred-years',
       E'The pieces, the deep sleep, the furnace and the lamp, the four hundred years',
       E'The cutting of the covenant is retold piece for piece. Abram divides the beasts and drives off the birds: *"And he built there an altar, and sacrificed all these; and he poured their blood upon the altar, and divided them in the midst, and laid them over against each other; but the birds divided he not. And birds came down upon the pieces, and Abram drove them away..."* (Jubilees 14:11) — *"And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not."* (Genesis 15:10). Then the dread sleep and the four-hundred-year word: *"...an horror of great darkness fell upon him, and it was said to Abram: ''Know of a surety that your seed shall be a stranger in a land (that is) not theirs, and they will bring them into bondage, and afflict them four hundred years."* (Jubilees 14:13) — *"And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;"* (Genesis 15:13). And the smoking furnace and flame pass between the pieces: *"...and there was a flame, and behold! a furnace was smoking, and a flame of fire passed between the pieces."* (Jubilees 14:16) — *"...behold a smoking furnace, and a burning lamp that passed between those pieces."* (Genesis 15:17). That bondage-word found its day exactly: *"And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt."* (Exodus 12:41) — the heavenly tablets foretold the affliction and the deliverance before either came to pass.',
       sv.verse_id, ev.verse_id, 'extras', 53334
  FROM _session251_ju14_lookup sv, _session251_ju14_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=14 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-14-covenant-with-noah-feast-renewed-for-ever',
       E'As we covenanted with Noah — the feast renewed for ever, it ain''t new',
       E'Here Jubilees does what only Jubilees does: it grounds the covenant of the pieces in the patriarchal FEAST. *"And on that day we made a covenant with Abram, according as we had covenanted with Noah in this month; and Abram renewed the festival and ordinance for himself for ever."* (Jubilees 14:20). The covenant comes "on the new moon of the third month" (14:1) — the third month, the month of the oath-feast, the Feast of Weeks. Jubilees elsewhere makes this explicit: the covenant-oath feast was kept by Noah and renewed by Abraham and engraved on the heavenly tablets — *"For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year... and Noah and his sons observed it..."* (Jubilees 6:17), and *"But Abraham observed it, and Isaac and Jacob and his children observed it up to your days..."* (Jubilees 6:19). This is Yoshi''s Appointed Times: the feast Abram "renewed for himself for ever" is the Shavuot of Torah, the covenant-feast counted from the wave-sheaf — *"And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete:"* (Leviticus 23:15). It ain''t a later Jewish invention and it ain''t abolished — Abram kept it, the heavenly tablets carry it, and it stands for ever. The seed-promise here begins to bend toward Ishmael and Hagar (14:22-24), but the festival ordinance is fixed.',
       sv.verse_id, ev.verse_id, 'extras', 53337
  FROM _session251_ju14_lookup sv, _session251_ju14_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=14 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-14-fear-not-i-am-thy-shield
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:1 — *After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward.* The same word, the same vision, the same "Fear not" — Jubilees 14:1 retells Genesis 15 verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-fear-not-i-am-thy-shield'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:2 — *And Abram said, Yahuah (Lord) GOD, what wilt thou give me, seeing I go childless, and the steward of my house is this Eliezer of Damascus?* Abram''s childless complaint and the steward Eliezer stand in both Jubilees 14:2 and its Genesis source.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-fear-not-i-am-thy-shield'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:4 — *And, behold, the word of Yahuah (LORD) came unto him, saying, This shall not be thine heir; but he that shall come forth out of thine own bowels shall be thine heir.* The heir of the bowels, not of the house — Jubilees 14:3 carries the Genesis promise of a true seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-fear-not-i-am-thy-shield'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-14-count-the-stars-believed-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The star-numbering sign of the seed is identical in Jubilees 14:4-5 and Genesis 15.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-count-the-stars-believed-righteousness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness.* Jubilees 14:6 preserves the founding word of faith-counted-righteousness exactly as Genesis records it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-count-the-stars-believed-righteousness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* Sha''ul quotes the very verse Jubilees 14:6 retells — righteousness by faith ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-count-the-stars-believed-righteousness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 3:6 — *Even as Abraham believed Elohim (God), and it was accounted to him for righteousness.* The faith reckoned to Abram in Jubilees 14:6 is the ground on which Galatians names the children of faith.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-count-the-stars-believed-righteousness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Galatians 3:7 — *Know ye therefore that they which are of faith, the same are the children of Abraham.* Those of Abram''s faith (Jubilees 14:6) are reckoned his children — the seed kept by faith, not flesh alone.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-count-the-stars-believed-righteousness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-14-out-of-ur-land-promise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:7 — *And he said unto him, I am Yahuah (LORD) that brought thee out of Ur of the Chaldees, to give thee this land to inherit it.* The self-naming by the deliverance out of Ur (Jubilees 14:6) is Abraham''s election out of the idolatrous nations.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-out-of-ur-land-promise'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:8 — *And he said, Yahuah (Lord) GOD, whereby shall I know that I shall inherit it?* Abram''s request for surety of the inheritance stands word for word in Jubilees 14:8.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-out-of-ur-land-promise'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* The land covenant from Egypt to the Euphrates is identical in Jubilees 14:18 and Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-out-of-ur-land-promise'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The "to you and to your seed after you" of Jubilees 14:6 is the everlasting seed-covenant Genesis 17 seals with circumcision.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-out-of-ur-land-promise'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-14-pieces-furnace-lamp-four-hundred-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* The dividing of the pieces with the birds undivided is the same rite in Jubilees 14:11.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-pieces-furnace-lamp-four-hundred-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The four-hundred-year bondage foretold in Jubilees 14:13 is Genesis word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-pieces-furnace-lamp-four-hundred-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The smoking furnace and flame passing between the pieces (Jubilees 14:16) is the sign of Yahuah cutting the covenant alone.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-pieces-furnace-lamp-four-hundred-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:41 — *And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt.* The affliction-word of Jubilees 14:13 came to pass to the very day — the tablets foretell history before it unfolds.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-pieces-furnace-lamp-four-hundred-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 81:1 — *And he said unto me: ''Observe, Enoch, these heavenly tablets, And read what is written thereon, And understand every single fact.''* The four-hundred-year word of Jubilees 14:13 is read off the same heavenly tablets Enoch is shown — the history pre-written.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-pieces-furnace-lamp-four-hundred-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=81 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-14-covenant-with-noah-feast-renewed-for-ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 6:17 — *For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year. And this whole festival was celebrated in heaven from the day of creation till the days of Noah-twenty-six jubilees and five weeks of years: and Noah and his sons observed it for seven jubilees and one week of years, till the day of Noah''s death, and from the day of Noah''s death his sons did away with (it) until the days of Abraham, and they ate blood.* The covenant Abram renews "as we covenanted with Noah" (Jubilees 14:20) is the Feast of Weeks, engraved on the heavenly tablets and kept since creation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-covenant-with-noah-feast-renewed-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 6:19 — *But Abraham observed it, and Isaac and Jacob and his children observed it up to your days, and in your days the children of Yashar''el (Israel) forgot it until you celebrated it anew on this mountain.* Jubilees 14:20 shows Abraham renewing the very feast 6:19 says he observed — the patriarchs kept the appointed times, it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-covenant-with-noah-feast-renewed-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:15 — *And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete:* The festival ordinance Abram renews for ever (Jubilees 14:20) is the counted Feast of Weeks fixed in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-covenant-with-noah-feast-renewed-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* Jubilees 14:18-20 anchors the same "in that day" land-covenant of Genesis 15 in the recurring oath-feast.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-covenant-with-noah-feast-renewed-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jubilees_15.sql (session251 jubilees 15) -----
-- Source anchor: jubilees/jubilees ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju15 (view _session251_ju15_lookup). Sort band base 53350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-15-circumcision-eternal-sign
  ('jubilees', 'jubilees', 15, 11, 'canon', 'genesis', 17, 11, 'free', E'Genesis 17:11 — *And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you.* Jubilees 15:11 carries the very words of the Genesis covenant — the foreskin circumcised as the token between Yahuah and Abraham''s seed.'),
  ('jubilees', 'jubilees', 15, 13, 'canon', 'genesis', 17, 13, 'free', E'Genesis 17:13 — *He that is born in thy house, and he that is bought with thy money, must needs be circumcised: and my covenant shall be in your flesh for an everlasting covenant.* Jubilees 15:13 echoes it exactly: the covenant in the flesh "for an eternal ordinance," and the uncircumcised soul cut off.'),
  ('jubilees', 'jubilees', 15, 12, 'canon', 'leviticus', 12, 3, 'free', E'Leviticus 12:3 — *And in the eighth day the flesh of his foreskin shall be circumcised.* Jubilees 15:12 fixes the same eighth-day timing the Torah commands — the sign given on the appointed day, never omitted.'),
  ('jubilees', 'jubilees', 15, 11, 'canon', 'acts', 7, 8, 'free', E'Acts 7:8 — *And he gave him the covenant of circumcision: and so Abraham begat Isaac, and circumcised him the eighth day; and Isaac begat Jacob; and Jacob begat the twelve patriarchs.* Stephen calls it "the covenant of circumcision" — the same eternal token Jubilees 15:11 places in Abraham''s keeping.'),
  ('jubilees', 'jubilees', 15, 13, 'canon', 'romans', 4, 11, 'free', E'Romans 4:11 — *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe, though they be not circumcised; that righteousness might be imputed unto them also.* Paul reads the sign of Jubilees 15:13 as a seal upon a faith already counted — the token of an eternal covenant, not its undoing.'),
  -- thread: jubilees-15-abram-to-abraham-covenant
  ('jubilees', 'jubilees', 15, 3, 'canon', 'genesis', 17, 1, 'free', E'Genesis 17:1 — *And when Abram was ninety years old and nine, Yahuah (LORD) appeared to Abram, and said unto him, I am the El Shaddai (Almighty God); walk before me, and be thou perfect.* Jubilees 15:3 retells the same self-disclosure of El Shaddai and the call to be perfect.'),
  ('jubilees', 'jubilees', 15, 5, 'canon', 'genesis', 17, 5, 'free', E'Genesis 17:5 — *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee.* Jubilees 15:5 carries the renaming word for word — Abram becomes Abraham, father of many nations forever.'),
  ('jubilees', 'jubilees', 15, 5, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* Jubilees 15:5 names the same everlasting covenant to Abraham and his seed throughout their generations.'),
  ('jubilees', 'jubilees', 15, 10, 'canon', 'genesis', 17, 8, 'free', E'Genesis 17:8 — *And I will give unto thee, and to thy seed after thee, the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession; and I will be their Elohim (God).* Jubilees 15:10 grants the same land of Canaan to the seed for an everlasting possession.'),
  ('jubilees', 'jubilees', 15, 5, 'canon', 'romans', 4, 17, 'free', E'Romans 4:17 — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* Paul takes the "father of many nations" of Jubilees 15:5 as the seal of Abraham''s faith in the God who raises the dead.'),
  -- thread: jubilees-15-isaac-promised-everlasting
  ('jubilees', 'jubilees', 15, 15, 'canon', 'genesis', 17, 15, 'free', E'Genesis 17:15 — *And Elohim (God) said unto Abraham, As for Sarai thy wife, thou shalt not call her name Sarai, but Sarah shall her name be.* Jubilees 15:15 retells the renaming of Sarai to Sarah, the mother of the promised seed.'),
  ('jubilees', 'jubilees', 15, 17, 'canon', 'genesis', 17, 17, 'free', E'Genesis 17:17 — *Then Abraham fell upon his face, and laughed, and said in his heart, Shall a child be born unto him that is an hundred years old? and shall Sarah, that is ninety years old, bear?* Jubilees 15:17 carries the same wonder of a hundred-year-old father and a ninety-year-old mother.'),
  ('jubilees', 'jubilees', 15, 18, 'canon', 'genesis', 17, 19, 'free', E'Genesis 17:19 — *And Elohim (God) said, Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him.* Jubilees 15:18 names Isaac and establishes the everlasting covenant in him exactly as Genesis does.'),
  ('jubilees', 'jubilees', 15, 17, 'canon', 'romans', 4, 19, 'free', E'Romans 4:19 — *And being not weak in faith, he considered not his own body now dead, when he was about an hundred years old, neither yet the deadness of Sara''s womb.* Paul turns the impossibility Abraham marvels at in Jubilees 15:17 into the very ground of his faith.'),
  -- thread: jubilees-15-abram-firstfruits-feast
  ('jubilees', 'jubilees', 15, 1, 'canon', 'leviticus', 23, 10, 'free', E'Leviticus 23:10 — *Speak unto the children of Yashar''el (Israel), and say unto them, When ye be come into the land which I give unto you, and shall reap the harvest thereof, then ye shall bring a sheaf of the firstfruits of your harvest unto the priest.* Abram''s feast of first-fruits in Jubilees 15:1 is the very harvest-offering the Torah later commands.'),
  ('jubilees', 'jubilees', 15, 1, 'canon', 'leviticus', 23, 17, 'free', E'Leviticus 23:17 — *Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto Yahuah (LORD).* The third-month grain first-fruits Abram keeps in Jubilees 15:1 is Shavuot, the feast of these wave-loaf firstfruits.'),
  ('jubilees', 'jubilees', 15, 2, 'canon', 'leviticus', 23, 21, 'free', E'Leviticus 23:21 — *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever in all your dwellings throughout your generations.* Abram''s new offerings of the first-fruits in Jubilees 15:2 keep the feast the Torah calls a statute for ever.'),
  -- thread: jubilees-15-election-spirits-over-nations
  ('jubilees', 'jubilees', 15, 30, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* Jubilees 15:31''s apportioning of spirits over the many nations retells the Song of Moses'' division of the peoples.'),
  ('jubilees', 'jubilees', 15, 32, 'canon', 'deuteronomy', 32, 9, 'free', E'Deuteronomy 32:9 — *For the LORD''s portion is his people; Jacob is the lot of his inheritance.* Jubilees 15:32 says Yahuah alone is Israel''s ruler, appointing no angel over them — Israel is His own portion as the Song declares.'),
  ('jubilees', 'jubilees', 15, 31, 'enoch', '1-enoch', 99, 7, 'extras', E'1 Enoch 99:7 — *And they who worship stones, and grave images of gold and silver and wood [and stone] and clay, And those who worship impure spirits and demons, And all kinds of idols not according to knowledge, shall get no manner of help from them.* The spirits set over the nations to lead them astray in Jubilees 15:31 are the impure spirits and demons behind the idols in the live Enoch apparatus.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-15-circumcision-eternal-sign',
       E'Circumcision — the token of an eternal covenant in the flesh',
       E'Jubilees sets the covenant-sign in Abraham''s flesh as something that does not expire: *And Yahuah (God) said to Abraham: "And as for you, do you keep My Covenant, you and your seed after you, and circumcise you every male among you, and circumcise your foreskins, and it will be a token of an eternal covenant between Me and you. And the child on the eighth day you will circumcise, every male throughout your generations"* (Jubilees 15:11-12). This is Genesis 17 retold almost word for word — *And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you* (Genesis 17:11), *and my covenant shall be in your flesh for an everlasting covenant* (Genesis 17:13). The Torah fixes the eighth day as the very day it falls in the cycle of cleanness — *And in the eighth day the flesh of his foreskin shall be circumcised* (Leviticus 12:3). Stephen names it the standing covenant Abraham received and kept — *And he gave him the covenant of circumcision: and so Abraham begat Isaac, and circumcised him the eighth day* (Acts 7:8). And Paul, far from voiding it, makes the sign read what was already true — *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised* (Romans 4:11). It ain''t new: one everlasting sign, the same in Genesis, in the law, in the apostles.',
       sv.verse_id, ev.verse_id, 'extras', 53350
  FROM _session251_ju15_lookup sv, _session251_ju15_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=15 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-15-abram-to-abraham-covenant',
       E'Abram made Abraham — father of many nations, the seed forever',
       E'El Shaddai appears and renames the patriarch: *And Abram fell on his face, and Elohim (God) talked with him, and said: "Behold My ordinance is with you, And you will be the father of many nations. Neither will your name any more be called Abram, But your name from henceforth, even for ever, shall be Abraham... And I shall establish My covenant between Me and you, and your seed after you, throughout their generations, for an eternal covenant"* (Jubilees 15:5). This is the Genesis theophany retold — *I am the El Shaddai (Almighty God); walk before me, and be thou perfect* (Genesis 17:1) and *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee* (Genesis 17:5). The land-grant of Jubilees 15:10 likewise repeats *the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession* (Genesis 17:8). Paul presses the same naming as the gospel of the dead made alive — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead* (Romans 4:17). The election of this seed is ancient and engraved: it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53353
  FROM _session251_ju15_lookup sv, _session251_ju15_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=15 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-15-isaac-promised-everlasting',
       E'Sarah shall bear Isaac — the covenant established with the promised seed',
       E'The covenant is narrowed to a son not yet born: *And Elohim (God) said to Abraham: "As for Sarai your wife, her name will no more be called Sarai, but Sarah will be her name. And I shall bless her, and give you a son by her... you will call his name Isaac, and I shall establish My covenant with him, an everlasting covenant, and for his seed after him"* (Jubilees 15:15-18). It is Genesis 17 retold — *Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him* (Genesis 17:19). Abraham''s laughing wonder is the same — *Shall a child be born unto him that is an hundred years old? and shall Sarah, that is ninety years old, bear?* (Genesis 17:17). Paul reads that very impossibility as Abraham''s faith — *And being not weak in faith, he considered not his own body now dead, when he was about an hundred years old, neither yet the deadness of Sara''s womb* (Romans 4:19). The seed is kept through the promised son: it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53356
  FROM _session251_ju15_lookup sv, _session251_ju15_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=15
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=15 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-15-abram-firstfruits-feast',
       E'Abram keeps the feast of first-fruits — the moedim kept by the fathers',
       E'Before the covenant is renewed, Jubilees dates it to an appointed time the patriarch is already keeping: *And in the fifth year of the fourth week of this jubilee, in the third month, in the middle of the month, Abram celebrated the feast of the first-fruits of the grain harvest. And he offered new offerings on the altar, the first-fruits of the produce, to Yahuah (God)* (Jubilees 15:1-2). The third-month grain first-fruits is Shavuot — the very feast the Torah ordains: *When ye be come into the land which I give unto you, and shall reap the harvest thereof, then ye shall bring a sheaf of the firstfruits of your harvest unto the priest* (Leviticus 23:10), and the wheat-harvest loaves fifty days on — *Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto Yahuah (LORD)* (Leviticus 23:17). This is Yoshi''s Appointed Times spine: the feast is not a later Jewish invention but kept by Abraham himself. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53359
  FROM _session251_ju15_lookup sv, _session251_ju15_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-15-election-spirits-over-nations',
       E'Israel chosen as Yahuah''s own — spirits over the nations, none over Israel',
       E'Jubilees grounds Israel''s election against the backdrop of the seed-war over the nations: *He chose Yashar''el (Israel) to be His people. And He sanctified it, and gathered it from amongst all the children of men; for there are many nations and many peoples, and all are His, and over all has He placed spirits in authority to lead them astray from Him. But over Yashar''el (Israel) He did not appoint any angel or spirit, for He alone is their ruler* (Jubilees 15:30-32). This is the apportioning of Deuteronomy 32 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* — and *the LORD''s portion is his people; Jacob is the lot of his inheritance* (Deuteronomy 32:8-9). The spirits set over the nations to lead them astray are the demonic powers of the live Enoch apparatus, where the idol-worshippers serve impure spirits — *And those who worship impure spirits and demons, And all kinds of idols not according to knowledge, shall get no manner of help from them* (1 Enoch 99:7). Election precedes confession; the seed is kept under Yahuah''s own hand. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53362
  FROM _session251_ju15_lookup sv, _session251_ju15_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=30
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=15 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-15-circumcision-eternal-sign
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:11 — *And ye shall circumcise the flesh of your foreskin; and it shall be a token of the covenant betwixt me and you.* Jubilees 15:11 carries the very words of the Genesis covenant — the foreskin circumcised as the token between Yahuah and Abraham''s seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-circumcision-eternal-sign'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:13 — *He that is born in thy house, and he that is bought with thy money, must needs be circumcised: and my covenant shall be in your flesh for an everlasting covenant.* Jubilees 15:13 echoes it exactly: the covenant in the flesh "for an eternal ordinance," and the uncircumcised soul cut off.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-circumcision-eternal-sign'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 12:3 — *And in the eighth day the flesh of his foreskin shall be circumcised.* Jubilees 15:12 fixes the same eighth-day timing the Torah commands — the sign given on the appointed day, never omitted.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-circumcision-eternal-sign'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 7:8 — *And he gave him the covenant of circumcision: and so Abraham begat Isaac, and circumcised him the eighth day; and Isaac begat Jacob; and Jacob begat the twelve patriarchs.* Stephen calls it "the covenant of circumcision" — the same eternal token Jubilees 15:11 places in Abraham''s keeping.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-circumcision-eternal-sign'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 4:11 — *And he received the sign of circumcision, a seal of the righteousness of the faith which he had yet being uncircumcised: that he might be the father of all them that believe, though they be not circumcised; that righteousness might be imputed unto them also.* Paul reads the sign of Jubilees 15:13 as a seal upon a faith already counted — the token of an eternal covenant, not its undoing.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-circumcision-eternal-sign'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-15-abram-to-abraham-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:1 — *And when Abram was ninety years old and nine, Yahuah (LORD) appeared to Abram, and said unto him, I am the El Shaddai (Almighty God); walk before me, and be thou perfect.* Jubilees 15:3 retells the same self-disclosure of El Shaddai and the call to be perfect.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-to-abraham-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:5 — *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee.* Jubilees 15:5 carries the renaming word for word — Abram becomes Abraham, father of many nations forever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-to-abraham-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* Jubilees 15:5 names the same everlasting covenant to Abraham and his seed throughout their generations.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-to-abraham-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 17:8 — *And I will give unto thee, and to thy seed after thee, the land wherein thou art a stranger, all the land of Canaan, for an everlasting possession; and I will be their Elohim (God).* Jubilees 15:10 grants the same land of Canaan to the seed for an everlasting possession.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-to-abraham-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 4:17 — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* Paul takes the "father of many nations" of Jubilees 15:5 as the seal of Abraham''s faith in the God who raises the dead.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-to-abraham-covenant'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-15-isaac-promised-everlasting
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:15 — *And Elohim (God) said unto Abraham, As for Sarai thy wife, thou shalt not call her name Sarai, but Sarah shall her name be.* Jubilees 15:15 retells the renaming of Sarai to Sarah, the mother of the promised seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-isaac-promised-everlasting'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:17 — *Then Abraham fell upon his face, and laughed, and said in his heart, Shall a child be born unto him that is an hundred years old? and shall Sarah, that is ninety years old, bear?* Jubilees 15:17 carries the same wonder of a hundred-year-old father and a ninety-year-old mother.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-isaac-promised-everlasting'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:19 — *And Elohim (God) said, Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him.* Jubilees 15:18 names Isaac and establishes the everlasting covenant in him exactly as Genesis does.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-isaac-promised-everlasting'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 4:19 — *And being not weak in faith, he considered not his own body now dead, when he was about an hundred years old, neither yet the deadness of Sara''s womb.* Paul turns the impossibility Abraham marvels at in Jubilees 15:17 into the very ground of his faith.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-isaac-promised-everlasting'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-15-abram-firstfruits-feast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:10 — *Speak unto the children of Yashar''el (Israel), and say unto them, When ye be come into the land which I give unto you, and shall reap the harvest thereof, then ye shall bring a sheaf of the firstfruits of your harvest unto the priest.* Abram''s feast of first-fruits in Jubilees 15:1 is the very harvest-offering the Torah later commands.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-firstfruits-feast'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 23:17 — *Ye shall bring out of your habitations two wave loaves of two tenth deals: they shall be of fine flour; they shall be baken with leaven; they are the firstfruits unto Yahuah (LORD).* The third-month grain first-fruits Abram keeps in Jubilees 15:1 is Shavuot, the feast of these wave-loaf firstfruits.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-firstfruits-feast'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:21 — *And ye shall proclaim on the selfsame day, that it may be an holy convocation unto you: ye shall do no servile work therein: it shall be a statute for ever in all your dwellings throughout your generations.* Abram''s new offerings of the first-fruits in Jubilees 15:2 keep the feast the Torah calls a statute for ever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-abram-firstfruits-feast'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-15-election-spirits-over-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* Jubilees 15:31''s apportioning of spirits over the many nations retells the Song of Moses'' division of the peoples.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-election-spirits-over-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:9 — *For the LORD''s portion is his people; Jacob is the lot of his inheritance.* Jubilees 15:32 says Yahuah alone is Israel''s ruler, appointing no angel over them — Israel is His own portion as the Song declares.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-election-spirits-over-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 99:7 — *And they who worship stones, and grave images of gold and silver and wood [and stone] and clay, And those who worship impure spirits and demons, And all kinds of idols not according to knowledge, shall get no manner of help from them.* The spirits set over the nations to lead them astray in Jubilees 15:31 are the impure spirits and demons behind the idols in the live Enoch apparatus.'
  FROM cross_reference_threads t, cross_references x, _session251_ju15_lookup sv, _session251_ju15_lookup tv
 WHERE t.slug='jubilees-15-election-spirits-over-nations'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=15 AND sv.verse_number=31
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=99 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jubilees_16.sql (session251 jubilees 16) -----
-- Source anchor: jubilees/jubilees ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju16 (view _session251_ju16_lookup). Sort band base 53375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-16-mamre-sarah-laughed
  ('jubilees', 'jubilees', 16, 1, 'canon', 'genesis', 18, 1, 'free', E'Genesis 18:1 — *And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day;* The Genesis source of Jubilees 16:1, the appearing at Mamre that opens the chapter.'),
  ('jubilees', 'jubilees', 16, 1, 'canon', 'genesis', 18, 10, 'free', E'Genesis 18:10 — *And he said, I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son. And Sarah heard it in the tent door, which was behind him.* The very promise Jubilees 16:1 announces — a son by Sarah his wife.'),
  ('jubilees', 'jubilees', 16, 2, 'canon', 'genesis', 18, 15, 'free', E'Genesis 18:15 — *Then Sarah denied, saying, I laughed not; for she was afraid. And he said, Nay; but thou didst laugh.* The laugh, the fear, and the denial of Jubilees 16:2 are kept verbatim from the Torah account.'),
  ('jubilees', 'jubilees', 16, 3, 'canon', 'genesis', 17, 19, 'free', E'Genesis 17:19 — *And Elohim (God) said, Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him.* Jubilees 16:3 says the name Isaac was ordained and written before his birth — Yahuah had already named him at the covenant of circumcision.'),
  -- thread: jubilees-16-sodom-overthrown-lot-delivered
  ('jubilees', 'jubilees', 16, 5, 'canon', 'genesis', 19, 24, 'free', E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven;* The fire and brimstone of Jubilees 16:5 is the Torah''s own overthrow of the cities of the plain.'),
  ('jubilees', 'jubilees', 16, 5, 'canon', 'genesis', 19, 25, 'free', E'Genesis 19:25 — *And he overthrew those cities, and all the plain, and all the inhabitants of the cities, and that which grew upon the ground.* Jubilees 16:5 names Sodom, Gomorrah, Zeboim and all the region of the Jordan — the same total overthrow.'),
  ('jubilees', 'jubilees', 16, 6, 'canon', 'genesis', 19, 29, 'free', E'Genesis 19:29 — *And it came to pass, when Elohim (God) destroyed the cities of the plain, that Elohim (God) remembered Abraham, and sent Lot out of the midst of the overthrow, when he overthrew the cities in the which Lot dwelt.* Lot is saved because Elohim remembered Abraham — Jubilees 16:6 keeps this Torah reason verbatim.'),
  ('jubilees', 'jubilees', 16, 9, 'enoch', '1-enoch', 10, 13, 'extras', E'1 Enoch 10:13 — *In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever.* Jubilees 16:9 says the judgment of Sodom was commanded and engraven on the heavenly tables — the same pre-written doom of the wicked the Watchers apparatus testifies to.'),
  -- thread: jubilees-16-isaac-born-circumcised-eighth-day
  ('jubilees', 'jubilees', 16, 12, 'canon', 'genesis', 21, 1, 'free', E'Genesis 21:1 — *And Yahuah (LORD) visited Sarah as he had said, and Yahuah (LORD) did unto Sarah as he had spoken.* Jubilees 16:12 keeps the Torah''s exact wording — Yahuah visited Sarah and did to her as He had spoken.'),
  ('jubilees', 'jubilees', 16, 12, 'canon', 'genesis', 21, 2, 'free', E'Genesis 21:2 — *For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him.* The set time of which Yahuah had spoken to Abraham is the same set time Jubilees 16:12 records for Isaac''s birth.'),
  ('jubilees', 'jubilees', 16, 14, 'canon', 'genesis', 21, 4, 'free', E'Genesis 21:4 — *And Abraham circumcised his son Isaac being eight days old, as Elohim (God) had commanded him.* The eighth-day circumcision of Jubilees 16:14 is Abraham''s Torah obedience to the covenant command.'),
  ('jubilees', 'jubilees', 16, 14, 'jubilees', 'jubilees', 15, 25, 'extras', E'Jubilees 15:25 — *This law is for all the generations for ever, and there is no circumcision of the days, and no omission of one day out of the eight days; for it is an eternal ordinance, ordained and written on the heavenly tables.* The covenant Jubilees 16:14 calls ordained for ever is engraved on the heavenly tables — the eternal sign in the flesh of the seed.'),
  -- thread: jubilees-16-holy-seed-kingdom-of-priests
  ('jubilees', 'jubilees', 16, 16, 'canon', 'genesis', 21, 12, 'free', E'Genesis 21:12 — *And Elohim (God) said unto Abraham, Let it not be grievous in thy sight because of the lad, and because of thy bondwoman; in all that Sarah hath said unto thee, hearken unto her voice; for in Isaac shall thy seed be called.* Jubilees 16:16 quotes this Torah word — in Isaac his name and seed are called, narrowing the line of election.'),
  ('jubilees', 'jubilees', 16, 17, 'canon', 'exodus', 19, 6, 'free', E'Exodus 19:6 — *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel).* The kingdom and priests and holy nation Jubilees 16:17 sees in Abraham''s holy seed is Sinai''s own charter for Israel.'),
  ('jubilees', 'jubilees', 16, 17, 'canon', '1-peter', 2, 9, 'free', E'1 Peter 2:9 — *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light:* The portion of the Most High, the kingdom and priests of Jubilees 16:17, is the same calling the apostle lays on the regathered remnant.'),
  ('jubilees', 'jubilees', 16, 17, 'canon', 'galatians', 3, 16, 'free', E'Galatians 3:16 — *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ).* The holy seed of Jubilees 16:17 narrows to the one Seed, Messiah, in whom the promise to Abraham is fulfilled.'),
  -- thread: jubilees-16-abraham-keeps-tabernacles-it-aint-new
  ('jubilees', 'jubilees', 16, 21, 'canon', 'leviticus', 23, 42, 'free', E'Leviticus 23:42 — *Ye shall dwell in booths seven days; all that are Israelites born shall dwell in booths:* The booths Abraham built in Jubilees 16:21 are the very booths the Torah later commands Israel to dwell in seven days — it ain''t new.'),
  ('jubilees', 'jubilees', 16, 30, 'canon', 'leviticus', 23, 40, 'free', E'Leviticus 23:40 — *And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem (the LORD your God) seven days.* The leafy boughs and willows from the brook of Jubilees 16:30 are the Torah''s own four species of the feast.'),
  ('jubilees', 'jubilees', 16, 20, 'canon', 'deuteronomy', 16, 13, 'free', E'Deuteronomy 16:13 — *Thou shalt observe the feast of tabernacles seven days, after that thou hast gathered in thy corn and thy wine:* Abraham''s seven-day festival of joy in Jubilees 16:20 is the feast of tabernacles the Torah commands for seven days after the harvest.'),
  ('jubilees', 'jubilees', 16, 29, 'canon', 'nehemiah', 8, 17, 'free', E'Nehemiah 8:17 — *And all the congregation of them that were come again out of the captivity made booths, and sat under the booths: for since the days of Jeshua the son of Nun unto that day had not the children of Yashar''el (Israel) done so. And there was very great gladness.* The statute for ever of Jubilees 16:29 is the same feast the returning remnant keeps with great gladness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-16-mamre-sarah-laughed',
       E'The Visit at Mamre — a son for Sarah, and the laugh',
       E'Jubilees opens chapter 16 with the visit at the oak of Mamre: *And on the new moon of the fourth month we appeared to Abraham, at the oak of Mamre, and we talked with him, and we announced to him that a son would be given to him by Sarah his wife* (Jubilees 16:1). This is the Genesis scene retold from the angels'' own mouth: *And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day* (Genesis 18:1), where the promise is spoken plainly — *and, lo, Sarah thy wife shall have a son* (Genesis 18:10). Jubilees keeps Sarah''s laugh and her fear: *And Sarah laughed, for she heard that we had spoken these words with Abraham... and she became afraid, and denied that she had laughed* (Jubilees 16:2), exactly as Genesis tells it — *Then Sarah denied, saying, I laughed not; for she was afraid. And he said, Nay; but thou didst laugh* (Genesis 18:15). And Jubilees fixes the name on the heavenly tables before the child is conceived — *And we told her the name of her son, as his name is ordained and written in the heavenly tables (i.e.) Isaac* (Jubilees 16:3) — the same name Yahuah had already given in the circumcision covenant: *thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant* (Genesis 17:19). It ain''t new — the laugh, the fear, the named son are all in the Torah.',
       sv.verse_id, ev.verse_id, 'extras', 53375
  FROM _session251_ju16_lookup sv, _session251_ju16_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-16-sodom-overthrown-lot-delivered',
       E'Sodom overthrown, Lot delivered — judgment engraved on the tables',
       E'In the same month judgment falls: *And in this month Yahuah (God) executed his judgments on Sodom, and Gomorrah, and Zeboim, and all the region of the Jordan, and He burned them with fire and brimstone, and destroyed them until this day* (Jubilees 16:5). This is the Genesis overthrow retold — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven; And he overthrew those cities, and all the plain* (Genesis 19:24-25). Jubilees keeps the deliverance of Lot for Abraham''s sake exactly as Genesis does: *But Lot we saved; for Elohim (God) remembered Abraham, and sent him out from the midst of the overthrow* (Jubilees 16:6) — word for word the Torah''s *and it came to pass, when Elohim (God) destroyed the cities of the plain, that Elohim (God) remembered Abraham, and sent Lot out of the midst of the overthrow* (Genesis 19:29). But Jubilees adds the heavenly-tables verdict the framework leans on — the uncleanness of Sodom is *commanded and engraven concerning all his seed, on the heavenly tables, to remove them and root them out* (Jubilees 16:9): the judgment of the wicked was written before it fell, as in the books of the Watchers'' doom (1 Enoch 10:14).',
       sv.verse_id, ev.verse_id, 'extras', 53378
  FROM _session251_ju16_lookup sv, _session251_ju16_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=16 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-16-isaac-born-circumcised-eighth-day',
       E'Isaac born and circumcised the eighth day — the first of the covenant',
       E'Yahuah keeps the word: *And in the middle of the sixth month Yahuah (God) visited Sarah and did to her as He had spoken, and she conceived... on the festival of the first-fruits of the harvest, Isaac was born* (Jubilees 16:12). This is the Torah''s *And Yahuah (LORD) visited Sarah as he had said, and Yahuah (LORD) did unto Sarah as he had spoken. For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him* (Genesis 21:1-2), the son named *Isaac* (Genesis 21:3). Then the eternal sign: *And Abraham circumcised his son on the eighth day: he was the first that was circumcised according to the covenant which is ordained for ever* (Jubilees 16:14) — the obedience Genesis records, *And Abraham circumcised his son Isaac being eight days old, as Elohim (God) had commanded him* (Genesis 21:4). Jubilees binds the eighth-day circumcision to the heavenly tables as an eternal ordinance in the previous chapter — *This law is for all the generations for ever... for it is an eternal ordinance, ordained and written on the heavenly tables* (Jubilees 15:25). Circumcision is the covenant SIGN kept in the flesh of the seed — it ain''t new, and it ain''t abolished.',
       sv.verse_id, ev.verse_id, 'extras', 53381
  FROM _session251_ju16_lookup sv, _session251_ju16_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=12
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=16 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-16-holy-seed-kingdom-of-priests',
       E'A holy seed — the portion of the Most High, a kingdom and priests',
       E'The angels announce the election that runs through the whole framework: of all Abraham''s offspring, *from the sons of Isaac one should become a holy seed, and should not be reckoned among the nations. For he should become the portion of the El Elyon (Most High)... that it should become a kingdom and priests and a holy nation* (Jubilees 16:17). This separation began with the word kept in the covenant — *in Isaac should his name and seed be called* (Jubilees 16:16) — the Torah''s *for in Isaac shall thy seed be called* (Genesis 21:12). The same language Yahuah spoke over Israel at Sinai is laid here over Abraham''s holy seed: *ye shall be unto me a kingdom of priests, and an holy nation* (Exodus 19:6). And the apostle carries it forward to the regathered remnant — *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9). The seed is kept and chosen out of the nations — election precedes confession, and the one true Seed in whom it all narrows is named in the gospel: *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ)* (Galatians 3:16).',
       sv.verse_id, ev.verse_id, 'extras', 53384
  FROM _session251_ju16_lookup sv, _session251_ju16_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=16 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-16-abraham-keeps-tabernacles-it-aint-new',
       E'Abraham keeps the Feast of Tabernacles — the first on the earth',
       E'Here is the calendar heart of the chapter, and the clearest ''it ain''t new'' in the book: *And he built there an altar to Yahuah (God) who had delivered him... and he celebrated a festival of joy in this month seven days, near the altar which he had built at the Well of the Oath. And he built booths for himself and for his servants on this festival, and he was the first to celebrate the feast of tabernacles on the earth* (Jubilees 16:20-21). Abraham keeps Sukkot — booths, branches, seven days of joy — long before Sinai, before Moses, before the Levitical statute. And what Abraham did, the Torah later commands in the very same shape: *Ye shall dwell in booths seven days... that your generations may know that I made the children of Yashar''el (Israel) to dwell in booths* (Leviticus 23:42-43), with the very boughs Jubilees names — *take leafy boughs, and willows from the brook* (Jubilees 16:30) — *And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem... seven days* (Leviticus 23:40). Deuteronomy commands the same seven days of joy: *Thou shalt observe the feast of tabernacles seven days, after that thou hast gathered in thy corn and thy wine* (Deuteronomy 16:13). And when the remnant returns from exile and rediscovers it, they keep it exactly so — *And all the congregation of them that were come again out of the captivity made booths, and sat under the booths... And there was very great gladness* (Nehemiah 8:17). Jubilees writes it onto the heavenly tables as a statute for ever: *For this reason it is ordained on the heavenly tables concerning Yashar''el (Israel), that they shall celebrate the feast of tabernacles seven days with joy, in the seventh month* (Jubilees 16:29). The Appointed Times were kept by Abraham — they are ancient, engraved before they were written, and never abolished.',
       sv.verse_id, ev.verse_id, 'extras', 53387
  FROM _session251_ju16_lookup sv, _session251_ju16_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=20
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=16 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-16-mamre-sarah-laughed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:1 — *And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day;* The Genesis source of Jubilees 16:1, the appearing at Mamre that opens the chapter.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-mamre-sarah-laughed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 18:10 — *And he said, I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son. And Sarah heard it in the tent door, which was behind him.* The very promise Jubilees 16:1 announces — a son by Sarah his wife.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-mamre-sarah-laughed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 18:15 — *Then Sarah denied, saying, I laughed not; for she was afraid. And he said, Nay; but thou didst laugh.* The laugh, the fear, and the denial of Jubilees 16:2 are kept verbatim from the Torah account.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-mamre-sarah-laughed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 17:19 — *And Elohim (God) said, Sarah thy wife shall bear thee a son indeed; and thou shalt call his name Isaac: and I will establish my covenant with him for an everlasting covenant, and with his seed after him.* Jubilees 16:3 says the name Isaac was ordained and written before his birth — Yahuah had already named him at the covenant of circumcision.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-mamre-sarah-laughed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-16-sodom-overthrown-lot-delivered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 19:24 — *Then Yahuah (LORD) rained upon Sodom and upon Gomorrah brimstone and fire from Yahuah (LORD) out of heaven;* The fire and brimstone of Jubilees 16:5 is the Torah''s own overthrow of the cities of the plain.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-sodom-overthrown-lot-delivered'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 19:25 — *And he overthrew those cities, and all the plain, and all the inhabitants of the cities, and that which grew upon the ground.* Jubilees 16:5 names Sodom, Gomorrah, Zeboim and all the region of the Jordan — the same total overthrow.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-sodom-overthrown-lot-delivered'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 19:29 — *And it came to pass, when Elohim (God) destroyed the cities of the plain, that Elohim (God) remembered Abraham, and sent Lot out of the midst of the overthrow, when he overthrew the cities in the which Lot dwelt.* Lot is saved because Elohim remembered Abraham — Jubilees 16:6 keeps this Torah reason verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-sodom-overthrown-lot-delivered'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:13 — *In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever.* Jubilees 16:9 says the judgment of Sodom was commanded and engraven on the heavenly tables — the same pre-written doom of the wicked the Watchers apparatus testifies to.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-sodom-overthrown-lot-delivered'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-16-isaac-born-circumcised-eighth-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:1 — *And Yahuah (LORD) visited Sarah as he had said, and Yahuah (LORD) did unto Sarah as he had spoken.* Jubilees 16:12 keeps the Torah''s exact wording — Yahuah visited Sarah and did to her as He had spoken.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-isaac-born-circumcised-eighth-day'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 21:2 — *For Sarah conceived, and bare Abraham a son in his old age, at the set time of which Elohim (God) had spoken to him.* The set time of which Yahuah had spoken to Abraham is the same set time Jubilees 16:12 records for Isaac''s birth.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-isaac-born-circumcised-eighth-day'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 21:4 — *And Abraham circumcised his son Isaac being eight days old, as Elohim (God) had commanded him.* The eighth-day circumcision of Jubilees 16:14 is Abraham''s Torah obedience to the covenant command.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-isaac-born-circumcised-eighth-day'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 15:25 — *This law is for all the generations for ever, and there is no circumcision of the days, and no omission of one day out of the eight days; for it is an eternal ordinance, ordained and written on the heavenly tables.* The covenant Jubilees 16:14 calls ordained for ever is engraved on the heavenly tables — the eternal sign in the flesh of the seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-isaac-born-circumcised-eighth-day'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=15 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-16-holy-seed-kingdom-of-priests
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 21:12 — *And Elohim (God) said unto Abraham, Let it not be grievous in thy sight because of the lad, and because of thy bondwoman; in all that Sarah hath said unto thee, hearken unto her voice; for in Isaac shall thy seed be called.* Jubilees 16:16 quotes this Torah word — in Isaac his name and seed are called, narrowing the line of election.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-holy-seed-kingdom-of-priests'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=21 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 19:6 — *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel).* The kingdom and priests and holy nation Jubilees 16:17 sees in Abraham''s holy seed is Sinai''s own charter for Israel.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-holy-seed-kingdom-of-priests'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 2:9 — *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light:* The portion of the Most High, the kingdom and priests of Jubilees 16:17, is the same calling the apostle lays on the regathered remnant.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-holy-seed-kingdom-of-priests'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 3:16 — *Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Messiah (Christ).* The holy seed of Jubilees 16:17 narrows to the one Seed, Messiah, in whom the promise to Abraham is fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-holy-seed-kingdom-of-priests'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-16-abraham-keeps-tabernacles-it-aint-new
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:42 — *Ye shall dwell in booths seven days; all that are Israelites born shall dwell in booths:* The booths Abraham built in Jubilees 16:21 are the very booths the Torah later commands Israel to dwell in seven days — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-abraham-keeps-tabernacles-it-aint-new'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 23:40 — *And ye shall take you on the first day the boughs of goodly trees, branches of palm trees, and the boughs of thick trees, and willows of the brook; and ye shall rejoice before Yahuah Elohaychem (the LORD your God) seven days.* The leafy boughs and willows from the brook of Jubilees 16:30 are the Torah''s own four species of the feast.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-abraham-keeps-tabernacles-it-aint-new'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 16:13 — *Thou shalt observe the feast of tabernacles seven days, after that thou hast gathered in thy corn and thy wine:* Abraham''s seven-day festival of joy in Jubilees 16:20 is the feast of tabernacles the Torah commands for seven days after the harvest.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-abraham-keeps-tabernacles-it-aint-new'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Nehemiah 8:17 — *And all the congregation of them that were come again out of the captivity made booths, and sat under the booths: for since the days of Jeshua the son of Nun unto that day had not the children of Yashar''el (Israel) done so. And there was very great gladness.* The statute for ever of Jubilees 16:29 is the same feast the returning remnant keeps with great gladness.'
  FROM cross_reference_threads t, cross_references x, _session251_ju16_lookup sv, _session251_ju16_lookup tv
 WHERE t.slug='jubilees-16-abraham-keeps-tabernacles-it-aint-new'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=16 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session251 — Jubilees cross-references complete.'
