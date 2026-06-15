-- =====================================================================
-- Session 412 — 2 Baruch FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session412_2baruch_extracanon_cross_references.sql
-- =====================================================================

\echo 'session412 — 2 Baruch cross-references starting...'
BEGIN;

-- ----- fragment: minion_2baruch_01.sql (session412 2-baruch 1) -----
-- Source anchor: pseudepigrapha/2-baruch ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar01 (view _session412_2bar01_lookup). Sort band base 84000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-1-chastened-not-cast-off
  ('pseudepigrapha', '2-baruch', 1, 4, 'canon', 'leviticus', 26, 33, 'free', E'Leviticus 26:33 — *And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste.* — Moses had already named the scattering Baruch now hears decreed.'),
  ('pseudepigrapha', '2-baruch', 1, 4, 'canon', 'deuteronomy', 28, 64, 'free', E'Deuteronomy 28:64 — *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other...* — the dispersion among the nations was written into the covenant curse.'),
  ('pseudepigrapha', '2-baruch', 1, 4, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations...* — the same Torah that decreed the scattering promised the regathering: chastening, not casting-off.'),
  ('pseudepigrapha', '2-baruch', 1, 4, 'canon', 'romans', 11, 2, 'free', E'Romans 11:2 — *Elohim (God) hath not cast away his people which he foreknew.* — Paul reads the exile exactly as Baruch does, a discipline that does not dissolve the calling.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-1-chastened-not-cast-off',
       E'Chastened, not cast off',
       E'At the word of Yahuah, Baruch hears the verdict on the city: *behold I bring evil upon this city ... and it shall be removed from before Me for a time, and I will scatter this people among the Gentiles ... And My people shall be chastened.* The accent is the same one Moses set in the Torah — exile is a rod, not a divorce; the scattering runs *for a time*, and the people are *chastened*, not abandoned. Paul will set his whole answer on this hinge: Elohim has not cast away the people He foreknew. It ain''t new — the sentence of the captivity was already framed as fatherly discipline before Baruch ever heard it.',
       sv.verse_id, ev.verse_id, 'extras', 84000
  FROM _session412_2bar01_lookup sv, _session412_2bar01_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-1-chastened-not-cast-off
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 26:33 — *And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste.* — Moses had already named the scattering Baruch now hears decreed.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar01_lookup sv, _session412_2bar01_lookup tv
 WHERE t.slug='2-baruch-1-chastened-not-cast-off'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 28:64 — *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other...* — the dispersion among the nations was written into the covenant curse.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar01_lookup sv, _session412_2bar01_lookup tv
 WHERE t.slug='2-baruch-1-chastened-not-cast-off'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=64
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations...* — the same Torah that decreed the scattering promised the regathering: chastening, not casting-off.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar01_lookup sv, _session412_2bar01_lookup tv
 WHERE t.slug='2-baruch-1-chastened-not-cast-off'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 11:2 — *Elohim (God) hath not cast away his people which he foreknew.* — Paul reads the exile exactly as Baruch does, a discipline that does not dissolve the calling.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar01_lookup sv, _session412_2bar01_lookup tv
 WHERE t.slug='2-baruch-1-chastened-not-cast-off'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_02.sql (session412 2-baruch 2) -----
-- Source anchor: pseudepigrapha/2-baruch ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar02 (view _session412_2bar02_lookup). Sort band base 84025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-2-prayers-a-wall
  ('pseudepigrapha', '2-baruch', 2, 2, 'canon', 'psalms', 106, 23, 'free', E'Psalms 106:23 — *Therefore he said that he would destroy them, had not Moses his chosen stood before him in the breach, to turn away his wrath, lest he should destroy them.* — one intercessor''s standing was a wall against the destroyer.'),
  ('pseudepigrapha', '2-baruch', 2, 2, 'canon', 'genesis', 18, 32, 'free', E'Genesis 18:32 — *And he said, Oh let not Yahuah (Lord) be angry, and I will speak yet but this once: Peradventure ten shall be found there. And he said, I will not destroy it for ten’s sake.* — the works and prayers of the few hold back judgment on a city.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-2-prayers-a-wall',
       E'The righteous as a wall for the city',
       E'Before the blow falls the righteous are bidden to withdraw, *for your works are to this city as a firm pillar, And your prayers as a strong wall.* While the intercessors stand, the city stands; the judgment waits on their leaving. It is the old pattern of Abraham at Sodom and Moses in the breach — a handful of the faithful holding back the wrath. It ain''t new — Elohim has always reckoned the prayers of His servants a defence stronger than stone.',
       sv.verse_id, ev.verse_id, 'extras', 84025
  FROM _session412_2bar02_lookup sv, _session412_2bar02_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-2-prayers-a-wall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 106:23 — *Therefore he said that he would destroy them, had not Moses his chosen stood before him in the breach, to turn away his wrath, lest he should destroy them.* — one intercessor''s standing was a wall against the destroyer.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar02_lookup sv, _session412_2bar02_lookup tv
 WHERE t.slug='2-baruch-2-prayers-a-wall'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 18:32 — *And he said, Oh let not Yahuah (Lord) be angry, and I will speak yet but this once: Peradventure ten shall be found there. And he said, I will not destroy it for ten’s sake.* — the works and prayers of the few hold back judgment on a city.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar02_lookup sv, _session412_2bar02_lookup tv
 WHERE t.slug='2-baruch-2-prayers-a-wall'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_03.sql (session412 2-baruch 3) -----
-- Source anchor: pseudepigrapha/2-baruch ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar03 (view _session412_2bar03_lookup). Sort band base 84050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-3-name-of-israel-remembered
  ('pseudepigrapha', '2-baruch', 3, 6, 'canon', 'jeremiah', 31, 36, 'free', E'Jeremiah 31:36 — *If those ordinances depart from before me, saith Yahuah (LORD), then the seed of Yashar''el (Israel) also shall cease from being a nation before me for ever.* — Israel''s remembrance is as sure as the fixed order of heaven.'),
  ('pseudepigrapha', '2-baruch', 3, 6, 'canon', 'romans', 11, 1, 'free', E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid.* — Paul gives Baruch''s worried question its settled answer.'),
  -- thread: 2-baruch-3-to-whom-the-law-explained
  ('pseudepigrapha', '2-baruch', 3, 7, 'canon', 'psalms', 119, 89, 'free', E'Psalms 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven.* — the law Baruch fears to lose is anchored beyond the reach of any conqueror.'),
  ('pseudepigrapha', '2-baruch', 3, 9, 'canon', 'deuteronomy', 30, 1, 'free', E'Deuteronomy 30:1 — *...the blessing and the curse, which I have set before thee, and thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee...* — the word given to Moses (which Baruch invokes in v9) is itself the thing kept alive in exile.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-3-name-of-israel-remembered',
       E'Shall the name of Yashar''el be remembered?',
       E'Baruch''s grief turns to a question that is really a plea: *if Thou destroyest Thy city, and deliverest up Thy land to those that hate us, how shall the name of Yashar''el (Israel) be again remembered?* He cannot imagine the covenant people simply erased — and he is right not to. The Prophets answer that the name endures because the calling does. It ain''t new — Israel''s continuance was never staked on the city''s walls but on the One who named her.',
       sv.verse_id, ev.verse_id, 'extras', 84050
  FROM _session412_2bar03_lookup sv, _session412_2bar03_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-3-to-whom-the-law-explained',
       E'To whom shall the law be explained?',
       E'Among his fears Baruch names the one that matters most: *to whom shall that which is in Thy law be explained?* He dreads a world with no one left to teach Torah — which betrays his deepest conviction, that the law is the thing worth preserving when the stones fall. The whole book''s burden is here in seed: the temple may go, the law abides. It ain''t new — the word is settled in heaven though the city be given over.',
       sv.verse_id, ev.verse_id, 'extras', 84053
  FROM _session412_2bar03_lookup sv, _session412_2bar03_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-3-name-of-israel-remembered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:36 — *If those ordinances depart from before me, saith Yahuah (LORD), then the seed of Yashar''el (Israel) also shall cease from being a nation before me for ever.* — Israel''s remembrance is as sure as the fixed order of heaven.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar03_lookup sv, _session412_2bar03_lookup tv
 WHERE t.slug='2-baruch-3-name-of-israel-remembered'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid.* — Paul gives Baruch''s worried question its settled answer.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar03_lookup sv, _session412_2bar03_lookup tv
 WHERE t.slug='2-baruch-3-name-of-israel-remembered'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-3-to-whom-the-law-explained
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven.* — the law Baruch fears to lose is anchored beyond the reach of any conqueror.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar03_lookup sv, _session412_2bar03_lookup tv
 WHERE t.slug='2-baruch-3-to-whom-the-law-explained'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=89
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:1 — *...the blessing and the curse, which I have set before thee, and thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee...* — the word given to Moses (which Baruch invokes in v9) is itself the thing kept alive in exile.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar03_lookup sv, _session412_2bar03_lookup tv
 WHERE t.slug='2-baruch-3-to-whom-the-law-explained'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_04.sql (session412 2-baruch 4) -----
-- Source anchor: pseudepigrapha/2-baruch ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar04 (view _session412_2bar04_lookup). Sort band base 84075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-4-graven-on-the-palms
  ('pseudepigrapha', '2-baruch', 4, 2, 'canon', 'isaiah', 49, 16, 'free', E'Isaiah 49:16 — *Behold, I have graven thee upon the palms of my hands; thy walls are continually before me.* — the very word Yahuah here quotes back to Baruch; the abiding Zion is held with Elohim.'),
  ('pseudepigrapha', '2-baruch', 4, 2, 'canon', 'hebrews', 12, 22, 'free', E'Hebrews 12:22 — *But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels...* — the heavenly Jerusalem kept above is the city 2 Baruch sets over against the falling one.'),
  -- thread: 2-baruch-4-paradise-shown-to-adam
  ('pseudepigrapha', '2-baruch', 4, 3, 'canon', 'genesis', 2, 8, 'free', E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* — the Paradise shown to Adam before he sinned.'),
  ('pseudepigrapha', '2-baruch', 4, 3, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* — when he transgressed the commandment it was removed from him, as Baruch says.'),
  -- thread: 2-baruch-4-pattern-shown-to-moses
  ('pseudepigrapha', '2-baruch', 4, 5, 'canon', 'exodus', 25, 40, 'free', E'Exodus 25:40 — *And look that thou make them after their pattern, which was shewed thee in the mount.* — the likeness of the tabernacle shown to Moses that Baruch names.'),
  ('pseudepigrapha', '2-baruch', 4, 6, 'canon', 'hebrews', 8, 5, 'free', E'Hebrews 8:5 — *...as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount.* — the earthly tent a copy of the heavenly kept with Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-4-graven-on-the-palms',
       E'Graven upon the palms of My hands',
       E'Yahuah comforts Baruch by lifting his eyes off the earthly stones: *Dost thou think that this is that city of which I said: "On the palms of My hands have I graven thee"?* The line is Isaiah''s word to Zion — the true city is kept with Elohim, not pulled down with the walls. It ain''t new — the city that endures was Isaiah''s promise long before Baruch grieved its shadow.',
       sv.verse_id, ev.verse_id, 'extras', 84075
  FROM _session412_2bar04_lookup sv, _session412_2bar04_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-4-paradise-shown-to-adam',
       E'Prepared before Paradise, shown to Adam',
       E'The hidden city, Yahuah says, was *prepared beforehand here from the time when I took counsel to make Paradise, and showed it to Adam before he sinned, but when he transgressed the commandment it was removed from him, as also Paradise.* The garden Adam lost and the city kept above are bound together — what transgression forfeited, mercy preserves to restore. It ain''t new — Eden''s loss and its keeping are written from Genesis on.',
       sv.verse_id, ev.verse_id, 'extras', 84078
  FROM _session412_2bar04_lookup sv, _session412_2bar04_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-4-pattern-shown-to-moses',
       E'The pattern shown to Moses on Sinai',
       E'The same hidden reality, Yahuah continues, *I showed to Moses on Mount Sinai when I showed to him the likeness of the tabernacle and all its vessels.* The earthly tent was built to a heavenly pattern; it was always a copy of what is kept above. The writer of Hebrews makes the very point — the tabernacle was a shadow of heavenly things. It ain''t new — Moses built to a pattern shown in the mount.',
       sv.verse_id, ev.verse_id, 'extras', 84081
  FROM _session412_2bar04_lookup sv, _session412_2bar04_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-4-graven-on-the-palms
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:16 — *Behold, I have graven thee upon the palms of my hands; thy walls are continually before me.* — the very word Yahuah here quotes back to Baruch; the abiding Zion is held with Elohim.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar04_lookup sv, _session412_2bar04_lookup tv
 WHERE t.slug='2-baruch-4-graven-on-the-palms'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 12:22 — *But ye are come unto mount Sion, and unto the city of the living Elohim (God), the heavenly Jerusalem, and to an innumerable company of angels...* — the heavenly Jerusalem kept above is the city 2 Baruch sets over against the falling one.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar04_lookup sv, _session412_2bar04_lookup tv
 WHERE t.slug='2-baruch-4-graven-on-the-palms'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-4-paradise-shown-to-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:8 — *And Yahuah Elohim (the LORD God) planted a garden eastward in Eden; and there he put the man whom he had formed.* — the Paradise shown to Adam before he sinned.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar04_lookup sv, _session412_2bar04_lookup tv
 WHERE t.slug='2-baruch-4-paradise-shown-to-adam'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* — when he transgressed the commandment it was removed from him, as Baruch says.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar04_lookup sv, _session412_2bar04_lookup tv
 WHERE t.slug='2-baruch-4-paradise-shown-to-adam'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-4-pattern-shown-to-moses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 25:40 — *And look that thou make them after their pattern, which was shewed thee in the mount.* — the likeness of the tabernacle shown to Moses that Baruch names.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar04_lookup sv, _session412_2bar04_lookup tv
 WHERE t.slug='2-baruch-4-pattern-shown-to-moses'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 8:5 — *...as Moses was admonished of Elohim (God) when he was about to make the tabernacle: for, See, saith he, that thou make all things according to the pattern shewed to thee in the mount.* — the earthly tent a copy of the heavenly kept with Elohim.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar04_lookup sv, _session412_2bar04_lookup tv
 WHERE t.slug='2-baruch-4-pattern-shown-to-moses'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_05.sql (session412 2-baruch 5) -----
-- Source anchor: pseudepigrapha/2-baruch ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar05 (view _session412_2bar05_lookup). Sort band base 84100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-5-enemy-ministers-of-the-judge
  ('pseudepigrapha', '2-baruch', 5, 3, 'canon', 'isaiah', 10, 5, 'free', E'Isaiah 10:5 — *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation.* — the conqueror is a minister of the Judge, not a master.'),
  ('pseudepigrapha', '2-baruch', 5, 3, 'canon', 'jeremiah', 25, 11, 'free', E'Jeremiah 25:11 — *And this whole land shall be a desolation, and an astonishment; and these nations shall serve the king of Babylon seventy years.* — the captivity is *for the time*, a measured span, not a final ruin.'),
  -- thread: 2-baruch-5-gathered-to-weep-and-fast
  ('pseudepigrapha', '2-baruch', 5, 7, 'canon', 'joel', 1, 14, 'free', E'Joel 1:14 — *Sanctify ye a fast, call a solemn assembly, gather the elders and all the inhabitants of the land into the house of Yahuah Elohaychem (the LORD your God), and cry unto Yahuah (LORD),* — the gathered elders, the fast, the cry that Baruch enacts.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-5-enemy-ministers-of-the-judge',
       E'The enemy, ministers of the Judge',
       E'Yahuah corrects the boast Baruch dreads: *the enemy will not overthrow Zion, Nor shall they burn Jerusalem, But be the ministers of the Judge for the time.* Babylon imagines it conquers; in truth it is only the rod in the hand of the Judge, wielded for a season and no longer. Isaiah said the same of Assyria — the axe does not boast against him that heweth. It ain''t new — the nations that strike Zion are instruments, never the author, of the judgment.',
       sv.verse_id, ev.verse_id, 'extras', 84100
  FROM _session412_2bar05_lookup sv, _session412_2bar05_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=5 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-5-gathered-to-weep-and-fast',
       E'The elders gathered to weep and fast',
       E'Baruch does what the prophets do when judgment nears — he gathers the honourable men, *and they lifted up their voice, and they all wept,* and *sat there and fasted until the evening.* It is the assembly Joel calls for: sanctify a fast, gather the people, weep between the porch and the altar. It ain''t new — mourning and fasting are the old liturgy of a people under the rod.',
       sv.verse_id, ev.verse_id, 'extras', 84103
  FROM _session412_2bar05_lookup sv, _session412_2bar05_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=5 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=5 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-5-enemy-ministers-of-the-judge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 10:5 — *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation.* — the conqueror is a minister of the Judge, not a master.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar05_lookup sv, _session412_2bar05_lookup tv
 WHERE t.slug='2-baruch-5-enemy-ministers-of-the-judge'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 25:11 — *And this whole land shall be a desolation, and an astonishment; and these nations shall serve the king of Babylon seventy years.* — the captivity is *for the time*, a measured span, not a final ruin.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar05_lookup sv, _session412_2bar05_lookup tv
 WHERE t.slug='2-baruch-5-enemy-ministers-of-the-judge'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-5-gathered-to-weep-and-fast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 1:14 — *Sanctify ye a fast, call a solemn assembly, gather the elders and all the inhabitants of the land into the house of Yahuah Elohaychem (the LORD your God), and cry unto Yahuah (LORD),* — the gathered elders, the fast, the cry that Baruch enacts.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar05_lookup sv, _session412_2bar05_lookup tv
 WHERE t.slug='2-baruch-5-gathered-to-weep-and-fast'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_06.sql (session412 2-baruch 6) -----
-- Source anchor: pseudepigrapha/2-baruch ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar06 (view _session412_2bar06_lookup). Sort band base 84125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-6-the-veil-and-the-holy-things
  ('pseudepigrapha', '2-baruch', 6, 7, 'canon', 'hebrews', 9, 3, 'free', E'Hebrews 9:3 — *And after the second veil, the tabernacle which is called the Holiest of all;* — the veil Baruch''s angel first removes.'),
  ('pseudepigrapha', '2-baruch', 6, 7, 'canon', 'hebrews', 9, 4, 'free', E'Hebrews 9:4 — *Which had the golden censer, and the ark of the covenant overlaid round about with gold, wherein was the golden pot that had manna, and Aaron’s rod that budded, and the tables of the covenant;* — the ark, the altar of incense, and the two tables, named in the same breath Baruch names them.'),
  ('pseudepigrapha', '2-baruch', 6, 7, 'canon', 'hebrews', 9, 5, 'free', E'Hebrews 9:5 — *And over it the cherubims of glory shadowing the mercyseat; of which we can not now speak particularly.* — the mercy-seat carried off by the angel.'),
  ('pseudepigrapha', '2-baruch', 6, 7, 'canon', 'matthew', 27, 51, 'free', E'Matthew 27:51 — *And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* — the veil of the holy place, removed again at the Messiah''s death.'),
  ('pseudepigrapha', '2-baruch', 6, 7, 'canon', 'exodus', 26, 33, 'free', E'Exodus 26:33 — *And thou shalt hang up the vail under the taches ... and the vail shall divide unto you between the holy place and the most holy.* — the veil and ark whose making 2 Baruch presupposes.'),
  ('pseudepigrapha', '2-baruch', 6, 7, 'canon', 'exodus', 25, 17, 'free', E'Exodus 25:17 — *And thou shalt make a mercy seat of pure gold...* — the mercy-seat the angel takes was made to this command.'),
  -- thread: 2-baruch-6-committed-to-the-earth
  ('pseudepigrapha', '2-baruch', 6, 8, 'apocrypha', '2-maccabees', 2, 5, 'free', E'2 Maccabees 2:5 — *And when Jeremy came thither, he found an hollow cave, in which he laid the tabernacle, and the ark, and the altar of incense, and so stopped the door.* — the same act: the holy things committed to the earth and sealed.'),
  ('pseudepigrapha', '2-baruch', 6, 8, 'apocrypha', '2-maccabees', 2, 7, 'free', E'2 Maccabees 2:7 — *...As for that place, it shall be unknown until the time that Yahuah (God) gather his people again together, and receive them to mercy.* — *guard them until the last times ... that thou mayst restore them*, almost word for word.'),
  ('pseudepigrapha', '2-baruch', 6, 8, 'apocrypha', '2-maccabees', 2, 8, 'free', E'2 Maccabees 2:8 — *Then shall Yahuah (God) shew them these things, and the glory of Yahuah (God) shall appear...* — the promised restoring of what the earth now hides.'),
  ('pseudepigrapha', '2-baruch', 6, 8, 'canon', 'jeremiah', 3, 16, 'free', E'Jeremiah 3:16 — *...they shall say no more, The ark of the covenant of Yahuah (LORD): neither shall it come to mind...* — the ark passes from sight, as Baruch''s earth swallows it, until its day.'),
  ('pseudepigrapha', '2-baruch', 6, 9, 'canon', 'revelation', 11, 19, 'free', E'Revelation 11:19 — *And the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament...* — *until it is said, that it is again restored for ever*: the ark seen at the last.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-6-the-veil-and-the-holy-things',
       E'The veil, the ark, the mercy-seat hidden',
       E'This is the chapter''s heart. An angel descends into the sanctuary and takes *the veil, and the holy ark, and the mercy-seat, and the two tables, and the holy raiment of the priests, and the altar of incense, and the forty-eight precious stones ... and all the holy vessels of the tabernacle.* Read against Hebrews it is uncanny: the writer of Hebrews lists the very furniture of the second tabernacle — the veil, the ark, the mercy-seat, the tables — and Matthew records the veil itself rent at the Messiah''s death, the holy place laid open. The vessels are not destroyed but committed to the earth till the last times. It ain''t new — the things of the sanctuary are hidden, not lost, awaiting the One who restores all.',
       sv.verse_id, ev.verse_id, 'extras', 84125
  FROM _session412_2bar06_lookup sv, _session412_2bar06_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-6-committed-to-the-earth',
       E'Earth, guard them until the last times',
       E'The angel cries to the ground, *Earth, earth, earth, hear the word of El Gibbor ... And receive what I commit to thee, And guard them until the last times, So that, when thou art ordered, thou mayst restore them.* This is the same tradition 2 Maccabees preserves of Jeremiah hiding the tabernacle and ark in the mountain until Elohim gathers His people — the holy things kept in the earth for the day of restoration. It ain''t new — the hiding of the vessels against the regathering was already the prophets'' hope.',
       sv.verse_id, ev.verse_id, 'extras', 84128
  FROM _session412_2bar06_lookup sv, _session412_2bar06_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=6 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-6-the-veil-and-the-holy-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 9:3 — *And after the second veil, the tabernacle which is called the Holiest of all;* — the veil Baruch''s angel first removes.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar06_lookup sv, _session412_2bar06_lookup tv
 WHERE t.slug='2-baruch-6-the-veil-and-the-holy-things'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 9:4 — *Which had the golden censer, and the ark of the covenant overlaid round about with gold, wherein was the golden pot that had manna, and Aaron’s rod that budded, and the tables of the covenant;* — the ark, the altar of incense, and the two tables, named in the same breath Baruch names them.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar06_lookup sv, _session412_2bar06_lookup tv
 WHERE t.slug='2-baruch-6-the-veil-and-the-holy-things'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 9:5 — *And over it the cherubims of glory shadowing the mercyseat; of which we can not now speak particularly.* — the mercy-seat carried off by the angel.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar06_lookup sv, _session412_2bar06_lookup tv
 WHERE t.slug='2-baruch-6-the-veil-and-the-holy-things'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 27:51 — *And, behold, the veil of the temple was rent in twain from the top to the bottom; and the earth did quake, and the rocks rent;* — the veil of the holy place, removed again at the Messiah''s death.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar06_lookup sv, _session412_2bar06_lookup tv
 WHERE t.slug='2-baruch-6-the-veil-and-the-holy-things'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 26:33 — *And thou shalt hang up the vail under the taches ... and the vail shall divide unto you between the holy place and the most holy.* — the veil and ark whose making 2 Baruch presupposes.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar06_lookup sv, _session412_2bar06_lookup tv
 WHERE t.slug='2-baruch-6-the-veil-and-the-holy-things'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=26 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Exodus 25:17 — *And thou shalt make a mercy seat of pure gold...* — the mercy-seat the angel takes was made to this command.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar06_lookup sv, _session412_2bar06_lookup tv
 WHERE t.slug='2-baruch-6-the-veil-and-the-holy-things'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=25 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-6-committed-to-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 2:5 — *And when Jeremy came thither, he found an hollow cave, in which he laid the tabernacle, and the ark, and the altar of incense, and so stopped the door.* — the same act: the holy things committed to the earth and sealed.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar06_lookup sv, _session412_2bar06_lookup tv
 WHERE t.slug='2-baruch-6-committed-to-the-earth'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 2:7 — *...As for that place, it shall be unknown until the time that Yahuah (God) gather his people again together, and receive them to mercy.* — *guard them until the last times ... that thou mayst restore them*, almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar06_lookup sv, _session412_2bar06_lookup tv
 WHERE t.slug='2-baruch-6-committed-to-the-earth'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 2:8 — *Then shall Yahuah (God) shew them these things, and the glory of Yahuah (God) shall appear...* — the promised restoring of what the earth now hides.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar06_lookup sv, _session412_2bar06_lookup tv
 WHERE t.slug='2-baruch-6-committed-to-the-earth'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 3:16 — *...they shall say no more, The ark of the covenant of Yahuah (LORD): neither shall it come to mind...* — the ark passes from sight, as Baruch''s earth swallows it, until its day.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar06_lookup sv, _session412_2bar06_lookup tv
 WHERE t.slug='2-baruch-6-committed-to-the-earth'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 11:19 — *And the temple of Elohim (God) was opened in heaven, and there was seen in his temple the ark of his testament...* — *until it is said, that it is again restored for ever*: the ark seen at the last.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar06_lookup sv, _session412_2bar06_lookup tv
 WHERE t.slug='2-baruch-6-committed-to-the-earth'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_07.sql (session412 2-baruch 7) -----
-- Source anchor: pseudepigrapha/2-baruch ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar07 (view _session412_2bar07_lookup). Sort band base 84150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-7-lest-the-enemy-boast
  ('pseudepigrapha', '2-baruch', 7, 1, 'canon', 'deuteronomy', 32, 27, 'free', E'Deuteronomy 32:27 — *...lest their adversaries should behave themselves strangely, and lest they should say, Our hand is high, and Yahuah (LORD) hath not done all this.* — Elohim guards His own glory against the enemy''s boast, the very motive Baruch''s angel voices.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-7-lest-the-enemy-boast',
       E'Lest the enemy boast over Zion',
       E'The angel orders the walls thrown down by heaven''s own hand, *lest the enemy should boast and say: "We have overthrown the wall of Zion, And we have burnt the place of El Gibbor (the mighty God)."* It is Elohim who gives the city over, not Babylon who takes it — the same jealousy for His name that runs through Deuteronomy, lest the adversary say *Our hand is high.* It ain''t new — the conqueror''s boast is forestalled because the judgment was the Judge''s, not the enemy''s.',
       sv.verse_id, ev.verse_id, 'extras', 84150
  FROM _session412_2bar07_lookup sv, _session412_2bar07_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-7-lest-the-enemy-boast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:27 — *...lest their adversaries should behave themselves strangely, and lest they should say, Our hand is high, and Yahuah (LORD) hath not done all this.* — Elohim guards His own glory against the enemy''s boast, the very motive Baruch''s angel voices.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar07_lookup sv, _session412_2bar07_lookup tv
 WHERE t.slug='2-baruch-7-lest-the-enemy-boast'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_08.sql (session412 2-baruch 8) -----
-- Source anchor: pseudepigrapha/2-baruch ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar08 (view _session412_2bar08_lookup). Sort band base 84175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-8-keeper-has-forsaken-the-house
  ('pseudepigrapha', '2-baruch', 8, 2, 'canon', 'ezekiel', 10, 18, 'free', E'Ezekiel 10:18 — *Then the glory of Yahuah (LORD) departed from off the threshold of the house, and stood over the cherubims.* — the Keeper forsakes the house, exactly as Baruch''s voice declares.'),
  ('pseudepigrapha', '2-baruch', 8, 2, 'canon', 'ezekiel', 11, 23, 'free', E'Ezekiel 11:23 — *And the glory of Yahuah (LORD) went up from the midst of the city, and stood upon the mountain which is on the east side of the city.* — the glory leaves before the enemy enters.'),
  -- thread: 2-baruch-8-zedekiah-bound-to-babylon
  ('pseudepigrapha', '2-baruch', 8, 5, 'canon', '2-kings', 25, 7, 'free', E'2 Kings 25:7 — *...and put out the eyes of Zedekiah, and bound him with fetters of brass, and carried him to Babylon.* — the binding and deportation of Zedekiah Baruch records.'),
  ('pseudepigrapha', '2-baruch', 8, 5, 'canon', 'jeremiah', 52, 11, 'free', E'Jeremiah 52:11 — *Then he put out the eyes of Zedekiah; and the king of Babylon bound him in chains, and carried him to Babylon...* — the same captivity attested by the prophet who lived it.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-8-keeper-has-forsaken-the-house',
       E'He who kept the house has forsaken it',
       E'As the wall falls a voice sounds from within the temple: *Enter, ye enemies, And come, ye adversaries; For he who kept the house has forsaken (it).* The city is not stormed; it is surrendered, because the Glory has departed. Ezekiel saw the very thing — the glory of Yahuah rising from the threshold and going up from the midst of the city before the blow fell. It ain''t new — the house is taken only after its Keeper withdraws.',
       sv.verse_id, ev.verse_id, 'extras', 84175
  FROM _session412_2bar08_lookup sv, _session412_2bar08_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=8 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-8-zedekiah-bound-to-babylon',
       E'Zedekiah bound, sent to Babylon',
       E'The narrative closes in the plain words of the histories: the Chaldees *led the people away captive and slew some of them, and bound Zedekiah the king, and sent him to the king of Babylon.* It is the very record of 2 Kings — Zedekiah taken, bound with fetters, carried to Babylon. The apocalypse stands on real history, not legend. It ain''t new — Baruch reports the captivity the Prophets and the chronicles already set down.',
       sv.verse_id, ev.verse_id, 'extras', 84178
  FROM _session412_2bar08_lookup sv, _session412_2bar08_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-8-keeper-has-forsaken-the-house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 10:18 — *Then the glory of Yahuah (LORD) departed from off the threshold of the house, and stood over the cherubims.* — the Keeper forsakes the house, exactly as Baruch''s voice declares.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar08_lookup sv, _session412_2bar08_lookup tv
 WHERE t.slug='2-baruch-8-keeper-has-forsaken-the-house'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 11:23 — *And the glory of Yahuah (LORD) went up from the midst of the city, and stood upon the mountain which is on the east side of the city.* — the glory leaves before the enemy enters.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar08_lookup sv, _session412_2bar08_lookup tv
 WHERE t.slug='2-baruch-8-keeper-has-forsaken-the-house'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-8-zedekiah-bound-to-babylon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 25:7 — *...and put out the eyes of Zedekiah, and bound him with fetters of brass, and carried him to Babylon.* — the binding and deportation of Zedekiah Baruch records.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar08_lookup sv, _session412_2bar08_lookup tv
 WHERE t.slug='2-baruch-8-zedekiah-bound-to-babylon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=25 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 52:11 — *Then he put out the eyes of Zedekiah; and the king of Babylon bound him in chains, and carried him to Babylon...* — the same captivity attested by the prophet who lived it.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar08_lookup sv, _session412_2bar08_lookup tv
 WHERE t.slug='2-baruch-8-zedekiah-bound-to-babylon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_09.sql (session412 2-baruch 9) -----
-- Source anchor: pseudepigrapha/2-baruch ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar09 (view _session412_2bar09_lookup). Sort band base 84200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-9-rent-garments-fasted-seven-days
  ('pseudepigrapha', '2-baruch', 9, 2, 'canon', 'joel', 1, 14, 'free', E'Joel 1:14 — *Sanctify ye a fast, call a solemn assembly, gather the elders and all the inhabitants of the land into the house of Yahuah Elohaychem (the LORD your God), and cry unto Yahuah (LORD)* — the appointed fast over a stricken land Baruch keeps.'),
  ('pseudepigrapha', '2-baruch', 9, 2, 'canon', 'joel', 2, 12, 'free', E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* — the same weeping-and-mourning fast Baruch and Jeremiah hold.'),
  ('pseudepigrapha', '2-baruch', 9, 2, 'canon', 'lamentations', 2, 10, 'free', E'Lamentations 2:10 — *The elders of the daughter of Zion sit upon the ground, and keep silence: they have cast up dust upon their heads; they have girded themselves with sackcloth* — Jeremiah''s own dirge of rent garments over fallen Zion.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-9-rent-garments-fasted-seven-days',
       E'They rent their garments and fasted seven days',
       E'With the city taken, Baruch and Jeremiah *rent our garments, we wept, and mourned, and fasted seven days*. This is no novel piety: when Zion is stricken the prophets call for the very same — *Sanctify ye a fast, call a solemn assembly, gather the elders* (Joel 1:14), *turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12). It ain''t new — the mourning fast over a fallen Jerusalem is Moses'' and the Prophets'' own response to chastening.',
       sv.verse_id, ev.verse_id, 'extras', 84200
  FROM _session412_2bar09_lookup sv, _session412_2bar09_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=9 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=9 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-9-rent-garments-fasted-seven-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 1:14 — *Sanctify ye a fast, call a solemn assembly, gather the elders and all the inhabitants of the land into the house of Yahuah Elohaychem (the LORD your God), and cry unto Yahuah (LORD)* — the appointed fast over a stricken land Baruch keeps.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar09_lookup sv, _session412_2bar09_lookup tv
 WHERE t.slug='2-baruch-9-rent-garments-fasted-seven-days'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* — the same weeping-and-mourning fast Baruch and Jeremiah hold.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar09_lookup sv, _session412_2bar09_lookup tv
 WHERE t.slug='2-baruch-9-rent-garments-fasted-seven-days'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Lamentations 2:10 — *The elders of the daughter of Zion sit upon the ground, and keep silence: they have cast up dust upon their heads; they have girded themselves with sackcloth* — Jeremiah''s own dirge of rent garments over fallen Zion.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar09_lookup sv, _session412_2bar09_lookup tv
 WHERE t.slug='2-baruch-9-rent-garments-fasted-seven-days'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_10.sql (session412 2-baruch 10) -----
-- Source anchor: pseudepigrapha/2-baruch ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar10 (view _session412_2bar10_lookup). Sort band base 84225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-10-blessed-is-he-who-was-not-born
  ('pseudepigrapha', '2-baruch', 10, 6, 'canon', 'job', 3, 3, 'free', E'Job 3:3 — *Let the day perish wherein I was born, and the night in which it was said, There is a man child conceived* — Job''s curse on his birthday, the root of Baruch''s cry.'),
  ('pseudepigrapha', '2-baruch', 10, 6, 'canon', 'job', 3, 11, 'free', E'Job 3:11 — *Why died I not from the womb? why did I not give up the ghost when I came out of the belly?* — the same wish to have died at birth.'),
  ('pseudepigrapha', '2-baruch', 10, 6, 'canon', 'ecclesiastes', 4, 2, 'free', E'Ecclesiastes 4:2 — *Wherefore I praised the dead which are already dead more than the living which are yet alive* — the Preacher counting the dead happier, as Baruch does.'),
  ('pseudepigrapha', '2-baruch', 10, 7, 'canon', 'ecclesiastes', 4, 3, 'free', E'Ecclesiastes 4:3 — *Yea, better is he than both they, which hath not yet been, who hath not seen the evil work that is done under the sun* — better never to have been, the very thought of Baruch''s verse 6.'),
  ('pseudepigrapha', '2-baruch', 10, 6, 'canon', 'luke', 23, 29, 'free', E'Luke 23:29 — *For, behold, the days are coming, in the which they shall say, Blessed are the barren, and the wombs that never bare* — the Messiah''s own lament over a doomed Jerusalem, the same blessing on the unborn.'),
  -- thread: 2-baruch-10-barren-shall-rejoice
  ('pseudepigrapha', '2-baruch', 10, 14, 'canon', 'matthew', 24, 19, 'free', E'Matthew 24:19 — *And woe unto them that are with child, and to them that give suck in those days!* — the Messiah''s woe over child-bearing in the day of Zion''s tribulation, Baruch''s lament exactly.'),
  ('pseudepigrapha', '2-baruch', 10, 14, 'canon', 'luke', 23, 29, 'free', E'Luke 23:29 — *they shall say, Blessed are the barren, and the wombs that never bare, and the paps which never gave suck* — the barren counted glad over a falling Jerusalem, as Baruch''s verse 14.'),
  ('pseudepigrapha', '2-baruch', 10, 15, 'canon', 'lamentations', 2, 20, 'free', E'Lamentations 2:20 — *Shall the women eat their fruit, and children of a span long?* — Jeremiah''s horror at child and mother in the siege, the grief behind Baruch''s ''bear in pain, only to bury in grief.'''),
  -- thread: 2-baruch-10-priests-cast-the-keys-to-heaven
  ('pseudepigrapha', '2-baruch', 10, 18, 'canon', 'lamentations', 2, 20, 'free', E'Lamentations 2:20 — *shall the priest and the prophet be slain in the sanctuary of Yahuah (Lord)?* — the priests of the sanctuary undone, the false-steward grief Baruch voices.'),
  ('pseudepigrapha', '2-baruch', 10, 18, 'canon', 'lamentations', 2, 18, 'free', E'Lamentations 2:18 — *Their heart cried unto Yahuah (Lord), O wall of the daughter of Zion, let tears run down like a river day and night* — Zion handed back to the LORD with weeping, Baruch''s ''Guard Thy house Thyself.'''),
  ('pseudepigrapha', '2-baruch', 10, 19, 'canon', 'jeremiah', 9, 1, 'free', E'Jeremiah 9:1 — *Oh that my head were waters, and mine eyes a fountain of tears, that I might weep day and night for the slain of the daughter of my people!* — Jeremiah''s tears over Zion, the grief framing Baruch''s whole lament.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-10-blessed-is-he-who-was-not-born',
       E'Blessed is he who was not born',
       E'Baruch lifts the bitterest cry of grief over Zion: *Blessed is he who was not born, Or he, who having been born, has died.* It is the cry of Job over his birthday and of the Preacher over the dead — *Let the day perish wherein I was born* (Job 3:3); *I praised the dead which are already dead more than the living which are yet alive* (Eccl 4:2). And the Messiah Himself takes it up over a Jerusalem about to fall: *Blessed are the barren, and the wombs that never bare* (Luke 23:29). It ain''t new — the lament that it were better not to have been born belongs to Job, the Preacher, and the words of Yahusha over Zion.',
       sv.verse_id, ev.verse_id, 'extras', 84225
  FROM _session412_2bar10_lookup sv, _session412_2bar10_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-10-barren-shall-rejoice',
       E'The barren shall above all rejoice',
       E'Baruch bids the bridegrooms not enter and the brides not deck themselves, *And, ye women, pray not that ye may bear. For the barren shall above all rejoice... For why should they bear in pain, Only to bury in grief?* The Prophets and the Messiah speak the same woe over a Zion handed to the enemy: *woe unto them that are with child, and to them that give suck in those days* (Matt 24:19); *Blessed are the barren* (Luke 23:29). It ain''t new — when judgment falls, the childless are counted spared, a sorrow the prophets and Yahusha already named.',
       sv.verse_id, ev.verse_id, 'extras', 84228
  FROM _session412_2bar10_lookup sv, _session412_2bar10_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=13
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=10 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-10-priests-cast-the-keys-to-heaven',
       E'Priests, cast the keys of the sanctuary to heaven',
       E'Baruch turns to the priests: *take ye the keys of the sanctuary, And cast them into the height of heaven, And give them to Yahuah (Lord) and say: ''Guard Thy house Thyself, For lo! we are found false stewards.''* The embellishment is Baruch''s, but the canonical root is Jeremiah''s own dirge that the stewards of Zion failed and the LORD Himself must judge His house — *Their heart cried unto Yahuah (Lord), O wall of the daughter of Zion* (Lam 2:18); *shall the priest and the prophet be slain in the sanctuary of Yahuah?* (Lam 2:20). It ain''t new — the confession that Zion''s stewards proved false, and the house given back to its Maker, is the burden of Lamentations.',
       sv.verse_id, ev.verse_id, 'extras', 84231
  FROM _session412_2bar10_lookup sv, _session412_2bar10_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=18
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=10 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-10-blessed-is-he-who-was-not-born
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 3:3 — *Let the day perish wherein I was born, and the night in which it was said, There is a man child conceived* — Job''s curse on his birthday, the root of Baruch''s cry.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar10_lookup sv, _session412_2bar10_lookup tv
 WHERE t.slug='2-baruch-10-blessed-is-he-who-was-not-born'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 3:11 — *Why died I not from the womb? why did I not give up the ghost when I came out of the belly?* — the same wish to have died at birth.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar10_lookup sv, _session412_2bar10_lookup tv
 WHERE t.slug='2-baruch-10-blessed-is-he-who-was-not-born'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiastes 4:2 — *Wherefore I praised the dead which are already dead more than the living which are yet alive* — the Preacher counting the dead happier, as Baruch does.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar10_lookup sv, _session412_2bar10_lookup tv
 WHERE t.slug='2-baruch-10-blessed-is-he-who-was-not-born'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiastes 4:3 — *Yea, better is he than both they, which hath not yet been, who hath not seen the evil work that is done under the sun* — better never to have been, the very thought of Baruch''s verse 6.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar10_lookup sv, _session412_2bar10_lookup tv
 WHERE t.slug='2-baruch-10-blessed-is-he-who-was-not-born'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 23:29 — *For, behold, the days are coming, in the which they shall say, Blessed are the barren, and the wombs that never bare* — the Messiah''s own lament over a doomed Jerusalem, the same blessing on the unborn.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar10_lookup sv, _session412_2bar10_lookup tv
 WHERE t.slug='2-baruch-10-blessed-is-he-who-was-not-born'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-10-barren-shall-rejoice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:19 — *And woe unto them that are with child, and to them that give suck in those days!* — the Messiah''s woe over child-bearing in the day of Zion''s tribulation, Baruch''s lament exactly.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar10_lookup sv, _session412_2bar10_lookup tv
 WHERE t.slug='2-baruch-10-barren-shall-rejoice'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 23:29 — *they shall say, Blessed are the barren, and the wombs that never bare, and the paps which never gave suck* — the barren counted glad over a falling Jerusalem, as Baruch''s verse 14.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar10_lookup sv, _session412_2bar10_lookup tv
 WHERE t.slug='2-baruch-10-barren-shall-rejoice'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=23 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Lamentations 2:20 — *Shall the women eat their fruit, and children of a span long?* — Jeremiah''s horror at child and mother in the siege, the grief behind Baruch''s ''bear in pain, only to bury in grief.'''
  FROM cross_reference_threads t, cross_references x, _session412_2bar10_lookup sv, _session412_2bar10_lookup tv
 WHERE t.slug='2-baruch-10-barren-shall-rejoice'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-10-priests-cast-the-keys-to-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lamentations 2:20 — *shall the priest and the prophet be slain in the sanctuary of Yahuah (Lord)?* — the priests of the sanctuary undone, the false-steward grief Baruch voices.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar10_lookup sv, _session412_2bar10_lookup tv
 WHERE t.slug='2-baruch-10-priests-cast-the-keys-to-heaven'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 2:18 — *Their heart cried unto Yahuah (Lord), O wall of the daughter of Zion, let tears run down like a river day and night* — Zion handed back to the LORD with weeping, Baruch''s ''Guard Thy house Thyself.'''
  FROM cross_reference_threads t, cross_references x, _session412_2bar10_lookup sv, _session412_2bar10_lookup tv
 WHERE t.slug='2-baruch-10-priests-cast-the-keys-to-heaven'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 9:1 — *Oh that my head were waters, and mine eyes a fountain of tears, that I might weep day and night for the slain of the daughter of my people!* — Jeremiah''s tears over Zion, the grief framing Baruch''s whole lament.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar10_lookup sv, _session412_2bar10_lookup tv
 WHERE t.slug='2-baruch-10-priests-cast-the-keys-to-heaven'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_11.sql (session412 2-baruch 11) -----
-- Source anchor: pseudepigrapha/2-baruch ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar11 (view _session412_2bar11_lookup). Sort band base 84250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-11-babylon-prospered-zion-desolate
  ('pseudepigrapha', '2-baruch', 11, 2, 'canon', 'psalms', 73, 3, 'free', E'Psalm 73:3 — *For I was envious at the foolish, when I saw the prosperity of the wicked* — the Psalmist''s grief at Babylon-like prospering, Baruch''s complaint exactly.'),
  ('pseudepigrapha', '2-baruch', 11, 2, 'canon', 'psalms', 73, 12, 'free', E'Psalm 73:12 — *Behold, these are the ungodly, who prosper in the world; they increase in riches* — the prospering wicked Baruch sees in prospering Babylon.'),
  ('pseudepigrapha', '2-baruch', 11, 3, 'canon', 'psalms', 73, 17, 'free', E'Psalm 73:17 — *Until I went into the sanctuary of Elohim (God); then understood I their end* — the resolution of Baruch''s ''who will be judge?'': their end is known before the LORD.'),
  -- thread: 2-baruch-11-blessed-are-the-dead
  ('pseudepigrapha', '2-baruch', 11, 7, 'canon', 'ecclesiastes', 4, 2, 'free', E'Ecclesiastes 4:2 — *Wherefore I praised the dead which are already dead more than the living which are yet alive* — the dead blessed above the living, Baruch''s word to Sheol.'),
  ('pseudepigrapha', '2-baruch', 11, 4, 'canon', 'proverbs', 14, 32, 'free', E'Proverbs 14:32 — *the righteous hath hope in his death* — the fathers who ''went to rest without grief'' do not rest in nothing but in hope, guarding Baruch''s lament from despair.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-11-babylon-prospered-zion-desolate',
       E'Babylon prospered and Zion desolate',
       E'Baruch arraigns the conqueror: *now, lo! the grief is infinite... For lo! thou art prospered And Zion desolate. Who will be judge regarding these things?* This is the ancient riddle of the Psalmist — *I was envious at the foolish, when I saw the prosperity of the wicked* (Ps 73:3) — answered only when he sees their end: *Until I went into the sanctuary of Elohim; then understood I their end* (Ps 73:17). It ain''t new — that the wicked flourish while the faithful are laid waste is the very ache the Psalms carry to Yahuah and trust Him to judge.',
       sv.verse_id, ev.verse_id, 'extras', 84250
  FROM _session412_2bar11_lookup sv, _session412_2bar11_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=11 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-11-blessed-are-the-dead',
       E'Blessed are the dead more than the living',
       E'Baruch calls down to Sheol: *say to the dead: ''Blessed are ye more than we who live.''* For the fathers *went to rest without grief... the righteous sleep in the earth in tranquillity*, having neither seen nor heard this anguish. The Preacher said it first — *I praised the dead which are already dead more than the living* (Eccl 4:2) — yet the righteous dead do not merely escape; they rest in hope, *the righteous hath hope in his death* (Prov 14:32). It ain''t new — that the faithful dead rest untroubled while the living mourn is the Preacher''s own word, and their rest is a hope, not a void.',
       sv.verse_id, ev.verse_id, 'extras', 84253
  FROM _session412_2bar11_lookup sv, _session412_2bar11_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=11 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=11 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-11-babylon-prospered-zion-desolate
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 73:3 — *For I was envious at the foolish, when I saw the prosperity of the wicked* — the Psalmist''s grief at Babylon-like prospering, Baruch''s complaint exactly.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar11_lookup sv, _session412_2bar11_lookup tv
 WHERE t.slug='2-baruch-11-babylon-prospered-zion-desolate'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=73 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 73:12 — *Behold, these are the ungodly, who prosper in the world; they increase in riches* — the prospering wicked Baruch sees in prospering Babylon.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar11_lookup sv, _session412_2bar11_lookup tv
 WHERE t.slug='2-baruch-11-babylon-prospered-zion-desolate'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=73 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 73:17 — *Until I went into the sanctuary of Elohim (God); then understood I their end* — the resolution of Baruch''s ''who will be judge?'': their end is known before the LORD.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar11_lookup sv, _session412_2bar11_lookup tv
 WHERE t.slug='2-baruch-11-babylon-prospered-zion-desolate'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=73 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-11-blessed-are-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 4:2 — *Wherefore I praised the dead which are already dead more than the living which are yet alive* — the dead blessed above the living, Baruch''s word to Sheol.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar11_lookup sv, _session412_2bar11_lookup tv
 WHERE t.slug='2-baruch-11-blessed-are-the-dead'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 14:32 — *the righteous hath hope in his death* — the fathers who ''went to rest without grief'' do not rest in nothing but in hope, guarding Baruch''s lament from despair.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar11_lookup sv, _session412_2bar11_lookup tv
 WHERE t.slug='2-baruch-11-blessed-are-the-dead'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=11 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_12.sql (session412 2-baruch 12) -----
-- Source anchor: pseudepigrapha/2-baruch ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar12 (view _session412_2bar12_lookup). Sort band base 84275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-12-wrath-awaits-in-its-season
  ('pseudepigrapha', '2-baruch', 12, 4, 'canon', 'habakkuk', 2, 3, 'free', E'Habakkuk 2:3 — *For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come* — the wrath that ''in its own season shall awake,'' the appointed delay Baruch describes.'),
  ('pseudepigrapha', '2-baruch', 12, 4, 'canon', 'deuteronomy', 32, 35, 'free', E'Deuteronomy 32:35 — *their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste* — Moses'' word that recompense waits its ''due time,'' Baruch''s wrath held by reins.'),
  ('pseudepigrapha', '2-baruch', 12, 4, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *The Lord is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward* — the ''long-suffering'' that holds the wrath by reins, named by the apostle.'),
  -- thread: 2-baruch-12-prosperity-is-fleeting-shadow
  ('pseudepigrapha', '2-baruch', 12, 2, 'canon', 'ecclesiastes', 8, 13, 'free', E'Ecclesiastes 8:13 — *it shall not be well with the wicked, neither shall he prolong his days, which are as a shadow; because he feareth not before Elohim (God)* — the prosperer''s day a fleeting shadow, Baruch''s noon that does not always burn.'),
  ('pseudepigrapha', '2-baruch', 12, 2, 'canon', 'psalms', 39, 5, 'free', E'Psalm 39:5 — *verily every man at his best state is altogether vanity* — even at his brightest the prosperer is vanity, the lesson of the fading noonday.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-12-wrath-awaits-in-its-season',
       E'The wrath awaits in its own season, held by reins',
       E'Baruch warns prospering Babylon not to be boastful, *For assuredly in its own season shall the (divine) wrath awake against thee, Which now in long-suffering is held in as it were by reins.* This is no new threat: the Prophet sees an appointed time — *the vision is yet for an appointed time... though it tarry, wait for it* (Hab 2:3) — and Moses warns that recompense waits in due time — *their foot shall slide in due time: for the day of their calamity is at hand* (Deut 32:35). The apostle names the reins as mercy: *the Lord is not slack... but is longsuffering* (2 Pet 3:9). It ain''t new — that judgment is held back in long-suffering and breaks in its appointed season is Moses, the Prophets, and the apostles together.',
       sv.verse_id, ev.verse_id, 'extras', 84275
  FROM _session412_2bar12_lookup sv, _session412_2bar12_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=12 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=12 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-12-prosperity-is-fleeting-shadow',
       E'The noonday does not always burn',
       E'Against the land that prospers Baruch sets a sober proverb: *The noonday does not always burn, Nor do the rays of the sun constantly give light. Do not expect... that thou wilt always be prosperous.* The Preacher saw the wicked''s days as exactly this passing brightness: *neither shall he prolong his days, which are as a shadow* (Eccl 8:13); and the Psalmist, *every man at his best state is altogether vanity* (Ps 39:5). It ain''t new — that worldly prosperity is a noon-light soon spent is the wisdom of the Preacher and the Psalms.',
       sv.verse_id, ev.verse_id, 'extras', 84278
  FROM _session412_2bar12_lookup sv, _session412_2bar12_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=12 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-12-wrath-awaits-in-its-season
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Habakkuk 2:3 — *For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come* — the wrath that ''in its own season shall awake,'' the appointed delay Baruch describes.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar12_lookup sv, _session412_2bar12_lookup tv
 WHERE t.slug='2-baruch-12-wrath-awaits-in-its-season'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:35 — *their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste* — Moses'' word that recompense waits its ''due time,'' Baruch''s wrath held by reins.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar12_lookup sv, _session412_2bar12_lookup tv
 WHERE t.slug='2-baruch-12-wrath-awaits-in-its-season'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:9 — *The Lord is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward* — the ''long-suffering'' that holds the wrath by reins, named by the apostle.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar12_lookup sv, _session412_2bar12_lookup tv
 WHERE t.slug='2-baruch-12-wrath-awaits-in-its-season'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-12-prosperity-is-fleeting-shadow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 8:13 — *it shall not be well with the wicked, neither shall he prolong his days, which are as a shadow; because he feareth not before Elohim (God)* — the prosperer''s day a fleeting shadow, Baruch''s noon that does not always burn.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar12_lookup sv, _session412_2bar12_lookup tv
 WHERE t.slug='2-baruch-12-prosperity-is-fleeting-shadow'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=8 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 39:5 — *verily every man at his best state is altogether vanity* — even at his brightest the prosperer is vanity, the lesson of the fading noonday.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar12_lookup sv, _session412_2bar12_lookup tv
 WHERE t.slug='2-baruch-12-prosperity-is-fleeting-shadow'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=39 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_13.sql (session412 2-baruch 13) -----
-- Source anchor: pseudepigrapha/2-baruch ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar13 (view _session412_2bar13_lookup). Sort band base 84300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-13-drink-the-dregs-no-respect-of-persons
  ('pseudepigrapha', '2-baruch', 13, 8, 'canon', 'psalms', 75, 8, 'free', E'Psalm 75:8 — *in the hand of Yahuah (LORD) there is a cup, and the wine is red; it is full of mixture... the wicked of the earth shall wring them out, and drink them* — the cup of wrath whose dregs the nations drink, Baruch''s very figure.'),
  ('pseudepigrapha', '2-baruch', 13, 8, 'canon', 'romans', 2, 11, 'free', E'Romans 2:11 — *For there is no respect of persons with Elohim (God)* — the impartial Judge, Baruch''s ''Lofty One who has no respect of persons.'''),
  ('pseudepigrapha', '2-baruch', 13, 8, 'canon', 'deuteronomy', 10, 17, 'free', E'Deuteronomy 10:17 — *Yahuah Elohaychem (the LORD your God)... regardeth not persons, nor taketh reward* — Moses'' word that the LORD shows no partiality, the root of Baruch''s impartial Judge.'),
  -- thread: 2-baruch-13-chastened-that-they-be-sanctified
  ('pseudepigrapha', '2-baruch', 13, 10, 'canon', 'proverbs', 3, 12, 'free', E'Proverbs 3:12 — *whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* — the Father''s chastening of His sons unto their good, Baruch''s ''chastened that they might be sanctified.'''),
  ('pseudepigrapha', '2-baruch', 13, 9, 'canon', 'deuteronomy', 8, 5, 'free', E'Deuteronomy 8:5 — *as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* — Moses'' word that the affliction of His sons is fatherly discipline, not enmity.'),
  -- thread: 2-baruch-13-used-the-creation-unrighteously
  ('pseudepigrapha', '2-baruch', 13, 12, 'canon', 'romans', 1, 21, 'free', E'Romans 1:21 — *when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful* — the nations ungrateful for the benefit, Baruch''s exact charge.'),
  ('pseudepigrapha', '2-baruch', 13, 11, 'canon', 'deuteronomy', 8, 11, 'free', E'Deuteronomy 8:11 — *Beware that thou forget not Yahuah Elohayka (the LORD thy God), in not keeping his commandments* — Moses'' warning against forgetting the Giver, behind Baruch''s ''ungrateful for the beneficence.''')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-13-drink-the-dregs-no-respect-of-persons',
       E'Drink also of the dregs — the Lofty One who has no respect of persons',
       E'The voice tells Baruch what to answer the prospering nations: *Ye who have drunk the strained wine, Drink ye also of its dregs, The judgement of the Lofty One Who has no respect of persons.* The cup of wrath with its dregs is the Prophets'' own image — *in the hand of Yahuah there is a cup... the wicked of the earth shall wring them out, and drink them* (Ps 75:8) — and that He shows no partiality is Moses'' and the apostle''s settled word: *there is no respect of persons with Elohim* (Rom 2:11). It ain''t new — the dregs of the cup poured out on every nation alike is the Prophets'' wine of wrath and the apostle''s impartial Judge.',
       sv.verse_id, ev.verse_id, 'extras', 84300
  FROM _session412_2bar13_lookup sv, _session412_2bar13_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=13 AND sv.verse_number=8
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=13 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-13-chastened-that-they-be-sanctified',
       E'He chastened His own sons that they be sanctified',
       E'Of Israel the voice says: *On this account he had aforetime no mercy on His own sons, But afflicted them as His enemies, because they sinned, Then therefore were they chastened That they might be sanctified.* This is the covenant logic of Moses and the Prophets — the LORD chastens the son He loves, not to cast off but to cleanse: *whom Yahuah loveth he correcteth; even as a father the son in whom he delighteth* (Prov 3:12); *As many as I love, I rebuke and chasten* (Rev 3:19). It ain''t new — that Zion''s affliction is a Father''s discipline unto holiness, never a casting-away, is the heart of the Torah''s covenant.',
       sv.verse_id, ev.verse_id, 'extras', 84303
  FROM _session412_2bar13_lookup sv, _session412_2bar13_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=13 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-13-used-the-creation-unrighteously',
       E'Ye have used the creation unrighteously',
       E'The charge against the nations: *ye are guilty Because ye have always trodden down the earth, And used the creation unrighteously. For I have always benefited you. And ye have always been ungrateful for the beneficence.* This is the apostle''s indictment of the nations — given so much good, they returned no thanks: *when they knew Elohim, they glorified him not as Elohim, neither were thankful* (Rom 1:21) — and Moses'' warning against forgetting the Giver: *thou forget Yahuah Elohaycha* (Deut 8:11). It ain''t new — that the nations are guilty for abusing a creation freely given and giving no thanks is the apostle''s word and Moses'' caution.',
       sv.verse_id, ev.verse_id, 'extras', 84306
  FROM _session412_2bar13_lookup sv, _session412_2bar13_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=13 AND sv.verse_number=11
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=13 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-13-drink-the-dregs-no-respect-of-persons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 75:8 — *in the hand of Yahuah (LORD) there is a cup, and the wine is red; it is full of mixture... the wicked of the earth shall wring them out, and drink them* — the cup of wrath whose dregs the nations drink, Baruch''s very figure.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar13_lookup sv, _session412_2bar13_lookup tv
 WHERE t.slug='2-baruch-13-drink-the-dregs-no-respect-of-persons'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=75 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 2:11 — *For there is no respect of persons with Elohim (God)* — the impartial Judge, Baruch''s ''Lofty One who has no respect of persons.'''
  FROM cross_reference_threads t, cross_references x, _session412_2bar13_lookup sv, _session412_2bar13_lookup tv
 WHERE t.slug='2-baruch-13-drink-the-dregs-no-respect-of-persons'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 10:17 — *Yahuah Elohaychem (the LORD your God)... regardeth not persons, nor taketh reward* — Moses'' word that the LORD shows no partiality, the root of Baruch''s impartial Judge.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar13_lookup sv, _session412_2bar13_lookup tv
 WHERE t.slug='2-baruch-13-drink-the-dregs-no-respect-of-persons'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-13-chastened-that-they-be-sanctified
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:12 — *whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth* — the Father''s chastening of His sons unto their good, Baruch''s ''chastened that they might be sanctified.'''
  FROM cross_reference_threads t, cross_references x, _session412_2bar13_lookup sv, _session412_2bar13_lookup tv
 WHERE t.slug='2-baruch-13-chastened-that-they-be-sanctified'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 8:5 — *as a man chasteneth his son, so Yahuah Elohayka (the LORD thy God) chasteneth thee* — Moses'' word that the affliction of His sons is fatherly discipline, not enmity.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar13_lookup sv, _session412_2bar13_lookup tv
 WHERE t.slug='2-baruch-13-chastened-that-they-be-sanctified'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-13-used-the-creation-unrighteously
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:21 — *when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful* — the nations ungrateful for the benefit, Baruch''s exact charge.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar13_lookup sv, _session412_2bar13_lookup tv
 WHERE t.slug='2-baruch-13-used-the-creation-unrighteously'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 8:11 — *Beware that thou forget not Yahuah Elohayka (the LORD thy God), in not keeping his commandments* — Moses'' warning against forgetting the Giver, behind Baruch''s ''ungrateful for the beneficence.'''
  FROM cross_reference_threads t, cross_references x, _session412_2bar13_lookup sv, _session412_2bar13_lookup tv
 WHERE t.slug='2-baruch-13-used-the-creation-unrighteously'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_14.sql (session412 2-baruch 14) -----
-- Source anchor: pseudepigrapha/2-baruch ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar14 (view _session412_2bar14_lookup). Sort band base 84325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-14-who-will-comprehend-thy-judgement
  ('pseudepigrapha', '2-baruch', 14, 8, 'canon', 'romans', 11, 33, 'free', E'Romans 11:33 — *O the depth of the riches both of the wisdom and knowledge of Elohim (God)! how unsearchable are his judgments, and his ways past finding out!* — Baruch''s ''who will comprehend Thy judgement'' in the apostle''s very words.'),
  ('pseudepigrapha', '2-baruch', 14, 9, 'canon', 'job', 38, 4, 'free', E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding* — the LORD''s rebuke of the creature who would search out His counsel, behind Baruch''s questions.'),
  -- thread: 2-baruch-14-made-like-a-breath
  ('pseudepigrapha', '2-baruch', 14, 10, 'canon', 'psalms', 144, 4, 'free', E'Psalm 144:4 — *Man is like to vanity: his days are as a shadow that passeth away* — man made like a breath, Baruch''s confession exactly.'),
  ('pseudepigrapha', '2-baruch', 14, 11, 'canon', 'psalms', 39, 5, 'free', E'Psalm 39:5 — *mine age is as nothing before thee: verily every man at his best state is altogether vanity* — the fleeting breath of man''s nature Baruch laments.'),
  -- thread: 2-baruch-14-righteous-have-works-in-treasuries
  ('pseudepigrapha', '2-baruch', 14, 13, 'canon', '1-peter', 1, 4, 'free', E'1 Peter 1:4 — *To an inheritance incorruptible, and undefiled, and that fadeth not away, reserved in heaven for you* — the promised world the righteous ''hope to receive,'' Baruch''s treasured hope.'),
  ('pseudepigrapha', '2-baruch', 14, 12, 'canon', 'revelation', 14, 13, 'free', E'Revelation 14:13 — *Blessed are the dead which die in Yahuah (Lord)... that they may rest from their labours; and their works do follow them* — the righteous departing without fear, their works ''preserved in treasuries.'''),
  -- thread: 2-baruch-14-world-made-on-account-of-man
  ('pseudepigrapha', '2-baruch', 14, 17, 'canon', 'psalms', 33, 6, 'free', E'Psalm 33:6 — *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* — creation that ''stood before Thee'' at His word, Baruch''s verse 17.'),
  ('pseudepigrapha', '2-baruch', 14, 17, 'canon', 'hebrews', 11, 3, 'free', E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God)* — the works of creation framed by a spoken word, as Baruch says.'),
  ('pseudepigrapha', '2-baruch', 14, 18, 'canon', 'isaiah', 45, 18, 'free', E'Isaiah 45:18 — *he created it not in vain, he formed it to be inhabited* — the world made not for itself but for man''s dwelling, Baruch''s ''the world on account of him.'''),
  ('pseudepigrapha', '2-baruch', 14, 18, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *Let us make man in our image... and let them have dominion... over all the earth* — man set as ''administrator of Thy works,'' the very stewardship Baruch names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-14-who-will-comprehend-thy-judgement',
       E'Who will comprehend Thy judgement?',
       E'Baruch bows before the unsearchable: *who, O Yahuah, my Lord, will comprehend Thy judgement, Or who will search out the profoundness of Thy way?... who will be able to think out Thy incomprehensible counsel?* This is the LORD''s own answer to Job and the apostle''s doxology — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding* (Job 38:4); *O the depth of the riches both of the wisdom and knowledge of Elohim! how unsearchable are his judgments, and his ways past finding out* (Rom 11:33). It ain''t new — that no man can search out the judgment and counsel of Yahuah is Job''s lesson and Paul''s worship.',
       sv.verse_id, ev.verse_id, 'extras', 84325
  FROM _session412_2bar14_lookup sv, _session412_2bar14_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=8
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=14 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-14-made-like-a-breath',
       E'We have all been made like a breath',
       E'Baruch confesses man''s frailty: *we have all been made like a breath. For as the breath ascends involuntarily, and again dies, so it is with the nature of men, who depart not according to their own will, and know not what will befall them in the end.* The Psalms say it word for word — *Man is like to vanity: his days are as a shadow that passeth away* (Ps 144:4); *every man at his best state is altogether vanity* (Ps 39:5). It ain''t new — that man is a passing breath who knows not his end is the Psalmist''s plain confession.',
       sv.verse_id, ev.verse_id, 'extras', 84328
  FROM _session412_2bar14_lookup sv, _session412_2bar14_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=10
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=14 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-14-righteous-have-works-in-treasuries',
       E'The righteous have a store of works in treasuries',
       E'Baruch sets the righteous over against the breath of men: *the righteous justly hope for the end, and without fear depart from this habitation, because they have with Thee a store of works preserved in treasuries... trusting with joy they hope to receive the world which Thou hast promised them.* This is the hope laid up for the faithful — *an inheritance incorruptible... reserved in heaven for you* (1 Pet 1:4) — and the works that follow them — *their works do follow them* (Rev 14:13). Their hope rests on Yahuah''s keeping, not on flesh-merit earning life. It ain''t new — that the righteous depart in hope toward a promised world, their faithful works treasured before Yahuah, is the apostles'' own comfort.',
       sv.verse_id, ev.verse_id, 'extras', 84331
  FROM _session412_2bar14_lookup sv, _session412_2bar14_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=12
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=14 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-14-world-made-on-account-of-man',
       E'The world was made on account of man',
       E'Baruch recalls the creation: *Thou didst devise and speak with a word, and forthwith the works of creation stood before Thee. And Thou didst say that Thou wouldst make... man as the administrator of Thy works... the world on account of him.* The world spoken into being by a word is the Psalmist''s and the apostle''s confession — *By the word of Yahuah were the heavens made* (Ps 33:6); *the worlds were framed by the word of Elohim* (Heb 11:3); and that it was formed to be inhabited, with man set over the works, is Genesis and Isaiah — *he created it not in vain, he formed it to be inhabited* (Isa 45:18); *let them have dominion... over all the earth* (Gen 1:26). It ain''t new — the world made by Yahuah''s word and given into man''s stewardship is the opening of Genesis itself.',
       sv.verse_id, ev.verse_id, 'extras', 84334
  FROM _session412_2bar14_lookup sv, _session412_2bar14_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=17
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=14 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-14-who-will-comprehend-thy-judgement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 11:33 — *O the depth of the riches both of the wisdom and knowledge of Elohim (God)! how unsearchable are his judgments, and his ways past finding out!* — Baruch''s ''who will comprehend Thy judgement'' in the apostle''s very words.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar14_lookup sv, _session412_2bar14_lookup tv
 WHERE t.slug='2-baruch-14-who-will-comprehend-thy-judgement'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding* — the LORD''s rebuke of the creature who would search out His counsel, behind Baruch''s questions.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar14_lookup sv, _session412_2bar14_lookup tv
 WHERE t.slug='2-baruch-14-who-will-comprehend-thy-judgement'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-14-made-like-a-breath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 144:4 — *Man is like to vanity: his days are as a shadow that passeth away* — man made like a breath, Baruch''s confession exactly.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar14_lookup sv, _session412_2bar14_lookup tv
 WHERE t.slug='2-baruch-14-made-like-a-breath'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=144 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 39:5 — *mine age is as nothing before thee: verily every man at his best state is altogether vanity* — the fleeting breath of man''s nature Baruch laments.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar14_lookup sv, _session412_2bar14_lookup tv
 WHERE t.slug='2-baruch-14-made-like-a-breath'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=39 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-14-righteous-have-works-in-treasuries
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 1:4 — *To an inheritance incorruptible, and undefiled, and that fadeth not away, reserved in heaven for you* — the promised world the righteous ''hope to receive,'' Baruch''s treasured hope.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar14_lookup sv, _session412_2bar14_lookup tv
 WHERE t.slug='2-baruch-14-righteous-have-works-in-treasuries'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 14:13 — *Blessed are the dead which die in Yahuah (Lord)... that they may rest from their labours; and their works do follow them* — the righteous departing without fear, their works ''preserved in treasuries.'''
  FROM cross_reference_threads t, cross_references x, _session412_2bar14_lookup sv, _session412_2bar14_lookup tv
 WHERE t.slug='2-baruch-14-righteous-have-works-in-treasuries'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-14-world-made-on-account-of-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 33:6 — *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth* — creation that ''stood before Thee'' at His word, Baruch''s verse 17.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar14_lookup sv, _session412_2bar14_lookup tv
 WHERE t.slug='2-baruch-14-world-made-on-account-of-man'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:3 — *Through faith we understand that the worlds were framed by the word of Elohim (God)* — the works of creation framed by a spoken word, as Baruch says.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar14_lookup sv, _session412_2bar14_lookup tv
 WHERE t.slug='2-baruch-14-world-made-on-account-of-man'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 45:18 — *he created it not in vain, he formed it to be inhabited* — the world made not for itself but for man''s dwelling, Baruch''s ''the world on account of him.'''
  FROM cross_reference_threads t, cross_references x, _session412_2bar14_lookup sv, _session412_2bar14_lookup tv
 WHERE t.slug='2-baruch-14-world-made-on-account-of-man'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 1:26 — *Let us make man in our image... and let them have dominion... over all the earth* — man set as ''administrator of Thy works,'' the very stewardship Baruch names.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar14_lookup sv, _session412_2bar14_lookup tv
 WHERE t.slug='2-baruch-14-world-made-on-account-of-man'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_15.sql (session412 2-baruch 15) -----
-- Source anchor: pseudepigrapha/2-baruch ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar15 (view _session412_2bar15_lookup). Sort band base 84350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-15-law-gives-understanding-of-judgement
  ('pseudepigrapha', '2-baruch', 15, 5, 'canon', 'psalms', 19, 7, 'free', E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the law that gives understanding, the LORD''s answer to Baruch.'),
  ('pseudepigrapha', '2-baruch', 15, 5, 'canon', 'deuteronomy', 4, 6, 'free', E'Deuteronomy 4:6 — *for this is your wisdom and your understanding in the sight of the nations* — Moses'' word that the law is Israel''s very understanding, behind Baruch''s ''unless he had accepted the law.'''),
  ('pseudepigrapha', '2-baruch', 15, 6, 'canon', 'romans', 7, 12, 'free', E'Romans 7:12 — *Wherefore the law is holy, and the commandment holy, and just, and good* — the law by which the knowing transgressor is justly judged, never abolished but upheld.'),
  -- thread: 2-baruch-15-strife-now-a-crown-with-glory
  ('pseudepigrapha', '2-baruch', 15, 8, 'canon', '2-corinthians', 4, 17, 'free', E'2 Corinthians 4:17 — *For our light affliction, which is but for a moment, worketh for us a far more exceeding and eternal weight of glory* — this world''s strife against the coming crown, Baruch''s two ages.'),
  ('pseudepigrapha', '2-baruch', 15, 8, 'canon', 'james', 1, 12, 'free', E'James 1:12 — *when he is tried, he shall receive the crown of life, which Yahuah (Lord) hath promised to them that love him* — the ''crown with great glory'' promised after the labour.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-15-law-gives-understanding-of-judgement',
       E'Man understands judgement only by the law',
       E'The LORD answers Baruch''s whole complaint with the law: *Man would not rightly have understood My judgement, unless he had accepted the law, and I had instructed him in understanding. But now, because he transgressed wittingly... he shall be tormented.* This is the Torah''s own claim — that the law gives wisdom and is itself life and understanding — *The law of Yahuah is perfect, converting the soul: the testimony of Yahuah is sure, making wise the simple* (Ps 19:7); *for it is your wisdom and your understanding in the sight of the nations* (Deut 4:6). The law is *holy, and just, and good* (Rom 7:12), and judges the man who sins against it knowingly. It ain''t new — that Yahuah''s judgment is understood only through His law, which abides as Israel''s light, is the testimony of Moses, the Psalms, and the apostle.',
       sv.verse_id, ev.verse_id, 'extras', 84350
  FROM _session412_2bar15_lookup sv, _session412_2bar15_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=15 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=15 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-15-strife-now-a-crown-with-glory',
       E'This world a strife, that to come a crown of glory',
       E'The LORD sets the two ages side by side: *For this world is to them a strife and a labour with much trouble; and that accordingly which is to come, a crown with great glory.* The apostles weigh them just so — *our light affliction, which is but for a moment, worketh for us a far more exceeding and eternal weight of glory* (2 Cor 4:17) — and name the prize a crown: *he shall receive the crown of life, which Yahuah hath promised to them that love him* (James 1:12). It ain''t new — that the present labour gives way to a crown of glory in the world to come is the apostles'' own hope.',
       sv.verse_id, ev.verse_id, 'extras', 84353
  FROM _session412_2bar15_lookup sv, _session412_2bar15_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=15 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=15 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-15-law-gives-understanding-of-judgement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the law that gives understanding, the LORD''s answer to Baruch.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar15_lookup sv, _session412_2bar15_lookup tv
 WHERE t.slug='2-baruch-15-law-gives-understanding-of-judgement'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:6 — *for this is your wisdom and your understanding in the sight of the nations* — Moses'' word that the law is Israel''s very understanding, behind Baruch''s ''unless he had accepted the law.'''
  FROM cross_reference_threads t, cross_references x, _session412_2bar15_lookup sv, _session412_2bar15_lookup tv
 WHERE t.slug='2-baruch-15-law-gives-understanding-of-judgement'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 7:12 — *Wherefore the law is holy, and the commandment holy, and just, and good* — the law by which the knowing transgressor is justly judged, never abolished but upheld.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar15_lookup sv, _session412_2bar15_lookup tv
 WHERE t.slug='2-baruch-15-law-gives-understanding-of-judgement'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=15 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-15-strife-now-a-crown-with-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 4:17 — *For our light affliction, which is but for a moment, worketh for us a far more exceeding and eternal weight of glory* — this world''s strife against the coming crown, Baruch''s two ages.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar15_lookup sv, _session412_2bar15_lookup tv
 WHERE t.slug='2-baruch-15-strife-now-a-crown-with-glory'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:12 — *when he is tried, he shall receive the crown of life, which Yahuah (Lord) hath promised to them that love him* — the ''crown with great glory'' promised after the labour.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar15_lookup sv, _session412_2bar15_lookup tv
 WHERE t.slug='2-baruch-15-strife-now-a-crown-with-glory'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_16.sql (session412 2-baruch 16) -----
-- Source anchor: pseudepigrapha/2-baruch ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar16 (view _session412_2bar16_lookup). Sort band base 84375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-16-years-few-and-evil
  ('pseudepigrapha', '2-baruch', 16, 1, 'canon', 'genesis', 47, 9, 'free', E'Genesis 47:9 — *few and evil have the days of the years of my life been* — Jacob''s word to Pharaoh, the exact phrase of Baruch''s ''few and evil'' years.'),
  ('pseudepigrapha', '2-baruch', 16, 1, 'canon', 'psalms', 90, 10, 'free', E'Psalm 90:10 — *The days of our years are threescore years and ten... yet is their strength labour and sorrow; for it is soon cut off* — man''s brief and toilsome span, Baruch''s ''little time.'''),
  ('pseudepigrapha', '2-baruch', 16, 1, 'canon', 'psalms', 90, 12, 'free', E'Psalm 90:12 — *So teach us to number our days, that we may apply our hearts unto wisdom* — the wise reckoning of a ''little time,'' the answer to Baruch''s question.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-16-years-few-and-evil',
       E'The years of this time are few and evil',
       E'Baruch answers: *lo! the years of this time are few and evil, and who is able in his little time to acquire that which is measureless?* The very phrase is Jacob''s before Pharaoh — *few and evil have the days of the years of my life been* (Gen 47:9) — and the burden of the Psalm: *The days of our years are threescore years and ten... yet is their strength labour and sorrow* (Ps 90:10). The wise answer is to *number our days, that we may apply our hearts unto wisdom* (Ps 90:12). It ain''t new — that man''s days are few and evil, too short for what is measureless, is Jacob''s confession and the Psalmist''s prayer.',
       sv.verse_id, ev.verse_id, 'extras', 84375
  FROM _session412_2bar16_lookup sv, _session412_2bar16_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=16 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-16-years-few-and-evil
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 47:9 — *few and evil have the days of the years of my life been* — Jacob''s word to Pharaoh, the exact phrase of Baruch''s ''few and evil'' years.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar16_lookup sv, _session412_2bar16_lookup tv
 WHERE t.slug='2-baruch-16-years-few-and-evil'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 90:10 — *The days of our years are threescore years and ten... yet is their strength labour and sorrow; for it is soon cut off* — man''s brief and toilsome span, Baruch''s ''little time.'''
  FROM cross_reference_threads t, cross_references x, _session412_2bar16_lookup sv, _session412_2bar16_lookup tv
 WHERE t.slug='2-baruch-16-years-few-and-evil'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 90:12 — *So teach us to number our days, that we may apply our hearts unto wisdom* — the wise reckoning of a ''little time,'' the answer to Baruch''s question.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar16_lookup sv, _session412_2bar16_lookup tv
 WHERE t.slug='2-baruch-16-years-few-and-evil'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_17.sql (session412 2-baruch 17) -----
-- Source anchor: pseudepigrapha/2-baruch ch17. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar17 (view _session412_2bar17_lookup). Sort band base 84400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-17-adam-brought-death
  ('pseudepigrapha', '2-baruch', 17, 2, 'canon', 'romans', 5, 12, 'free', E'Rom 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* — death entering by the one man''s transgression, the same root Baruch names.'),
  ('pseudepigrapha', '2-baruch', 17, 3, 'canon', 'romans', 5, 14, 'free', E'Rom 5:14 — *Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression* — death reigning over Adam''s seed, as Baruch says his years were cut off.'),
  -- thread: 2-baruch-17-moses-lighted-a-lamp
  ('pseudepigrapha', '2-baruch', 17, 4, 'canon', 'psalms', 119, 105, 'free', E'Ps 119:105 — *Thy word is a lamp unto my feet, and a light unto my path* — the law as the lamp Baruch says Moses lighted for Israel.'),
  ('pseudepigrapha', '2-baruch', 17, 4, 'canon', 'proverbs', 6, 23, 'free', E'Prov 6:23 — *For the commandment is a lamp; and the law is light; and reproofs of instruction are the way of life* — the commandment itself the lamp Moses lit.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-17-adam-brought-death',
       E'Adam brought death into the world',
       E'The Mighty One weighs not Adam''s long years but his transgression: *the multitude of time that he lived did not profit him, but brought death and cut off the years of those who were born from him.* By one man''s sin death passed upon all — Baruch reaches for the same root Paul names. It ain''t new — that death entered by Adam''s transgression is already the burden of Moses and the apostle.',
       sv.verse_id, ev.verse_id, 'extras', 84400
  FROM _session412_2bar17_lookup sv, _session412_2bar17_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=17 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=17 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-17-moses-lighted-a-lamp',
       E'Moses lighted a lamp for the nation',
       E'Against Adam''s loss stands Moses, who, *subject to Him who formed him, brought the law to the seed of Jacob, and lighted a lamp for the nation of Yashar''el.* The law is light to a people walking in the dark — the Psalmist and Proverbs say it first. It ain''t new — that the commandment is a lamp is the song of David and the wisdom of Solomon long before Baruch.',
       sv.verse_id, ev.verse_id, 'extras', 84403
  FROM _session412_2bar17_lookup sv, _session412_2bar17_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=17 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=17 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-17-adam-brought-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Rom 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* — death entering by the one man''s transgression, the same root Baruch names.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar17_lookup sv, _session412_2bar17_lookup tv
 WHERE t.slug='2-baruch-17-adam-brought-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=17 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Rom 5:14 — *Nevertheless death reigned from Adam to Moses, even over them that had not sinned after the similitude of Adam''s transgression* — death reigning over Adam''s seed, as Baruch says his years were cut off.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar17_lookup sv, _session412_2bar17_lookup tv
 WHERE t.slug='2-baruch-17-adam-brought-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=17 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-17-moses-lighted-a-lamp
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ps 119:105 — *Thy word is a lamp unto my feet, and a light unto my path* — the law as the lamp Baruch says Moses lighted for Israel.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar17_lookup sv, _session412_2bar17_lookup tv
 WHERE t.slug='2-baruch-17-moses-lighted-a-lamp'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=105
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Prov 6:23 — *For the commandment is a lamp; and the law is light; and reproofs of instruction are the way of life* — the commandment itself the lamp Moses lit.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar17_lookup sv, _session412_2bar17_lookup tv
 WHERE t.slug='2-baruch-17-moses-lighted-a-lamp'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=17 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_18.sql (session412 2-baruch 18) -----
-- Source anchor: pseudepigrapha/2-baruch ch18. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar18 (view _session412_2bar18_lookup). Sort band base 84425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-18-few-walk-in-the-light
  ('pseudepigrapha', '2-baruch', 18, 1, 'canon', 'proverbs', 6, 23, 'free', E'Prov 6:23 — *For the commandment is a lamp; and the law is light; and reproofs of instruction are the way of life* — the lamp of the law that few imitate.'),
  ('pseudepigrapha', '2-baruch', 18, 2, 'canon', 'john', 1, 17, 'free', E'John 1:17 — *For the law was given by Moses, but grace and truth came by Yahusha HaMashiach* — the light that came by Moses, which Baruch says the many would not rejoice in.'),
  ('pseudepigrapha', '2-baruch', 18, 2, 'canon', 'john', 1, 4, 'free', E'John 1:4 — *In him was life; and the life was the light of men* — the light men have, set against the darkness of Adam.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-18-few-walk-in-the-light',
       E'Few imitated the light of the lamp',
       E'Baruch answers: the lamp was lit, *but there are but few that have imitated him,* for the many *have taken from the darkness of Adam and have not rejoiced in the light of the lamp.* The light came, given by Moses, and men loved the dark — the very grief John names. It ain''t new — that the few walk in the light while the many cleave to Adam''s darkness is the apostle''s lament before it is Baruch''s.',
       sv.verse_id, ev.verse_id, 'extras', 84425
  FROM _session412_2bar18_lookup sv, _session412_2bar18_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=18 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=18 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-18-few-walk-in-the-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Prov 6:23 — *For the commandment is a lamp; and the law is light; and reproofs of instruction are the way of life* — the lamp of the law that few imitate.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar18_lookup sv, _session412_2bar18_lookup tv
 WHERE t.slug='2-baruch-18-few-walk-in-the-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=18 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:17 — *For the law was given by Moses, but grace and truth came by Yahusha HaMashiach* — the light that came by Moses, which Baruch says the many would not rejoice in.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar18_lookup sv, _session412_2bar18_lookup tv
 WHERE t.slug='2-baruch-18-few-walk-in-the-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:4 — *In him was life; and the life was the light of men* — the light men have, set against the darkness of Adam.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar18_lookup sv, _session412_2bar18_lookup tv
 WHERE t.slug='2-baruch-18-few-walk-in-the-light'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_19.sql (session412 2-baruch 19) -----
-- Source anchor: pseudepigrapha/2-baruch ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar19 (view _session412_2bar19_lookup). Sort band base 84450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-19-life-and-death-set-before-them
  ('pseudepigrapha', '2-baruch', 19, 1, 'canon', 'deuteronomy', 30, 19, 'free', E'Deut 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life* — the exact covenant words and witnesses Baruch ascribes to Moses.'),
  ('pseudepigrapha', '2-baruch', 19, 1, 'canon', 'deuteronomy', 30, 15, 'free', E'Deut 30:15 — *See, I have set before thee this day life and good, and death and evil* — the choice set before the nation that Baruch repeats.'),
  ('pseudepigrapha', '2-baruch', 19, 3, 'canon', 'deuteronomy', 32, 1, 'free', E'Deut 32:1 — *Give ear, O ye heavens, and I will speak; and hear, O earth, the words of my mouth* — the abiding heaven-and-earth witness that, Baruch says, testifies against those who transgressed.'),
  -- thread: 2-baruch-19-the-consummation-not-the-beginning
  ('pseudepigrapha', '2-baruch', 19, 5, 'canon', 'deuteronomy', 32, 29, 'free', E'Deut 32:29 — *O that they were wise, that they understood this, that they would consider their latter end!* — the very weighing of the end, not the beginning, that Baruch is told to make.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-19-life-and-death-set-before-them',
       E'Life and death set before them, heaven and earth as witness',
       E'The covenant Moses appointed is recalled: *"Behold I have placed before you life and death," And he called heaven and earth to witness against them.* The very words and witnesses of Deuteronomy stand behind Baruch''s line. It ain''t new — Moses set life and death before Israel and summoned heaven and earth to record it long before this book recounts it.',
       sv.verse_id, ev.verse_id, 'extras', 84450
  FROM _session412_2bar19_lookup sv, _session412_2bar19_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=19 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-19-the-consummation-not-the-beginning',
       E'The consummation, not the beginning, must be considered',
       E'Baruch is told to weigh the end and not the start: *it is the consummation of time that should be considered... and not the beginning thereof.* A man''s whole course is judged by where it ends — the wisdom Moses set down as the people''s latter end. It ain''t new — that the latter end, not the beginning, is what must be considered is the very counsel of the Song of Moses.',
       sv.verse_id, ev.verse_id, 'extras', 84453
  FROM _session412_2bar19_lookup sv, _session412_2bar19_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=19 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=19 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-19-life-and-death-set-before-them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deut 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life* — the exact covenant words and witnesses Baruch ascribes to Moses.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar19_lookup sv, _session412_2bar19_lookup tv
 WHERE t.slug='2-baruch-19-life-and-death-set-before-them'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deut 30:15 — *See, I have set before thee this day life and good, and death and evil* — the choice set before the nation that Baruch repeats.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar19_lookup sv, _session412_2bar19_lookup tv
 WHERE t.slug='2-baruch-19-life-and-death-set-before-them'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deut 32:1 — *Give ear, O ye heavens, and I will speak; and hear, O earth, the words of my mouth* — the abiding heaven-and-earth witness that, Baruch says, testifies against those who transgressed.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar19_lookup sv, _session412_2bar19_lookup tv
 WHERE t.slug='2-baruch-19-life-and-death-set-before-them'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-19-the-consummation-not-the-beginning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deut 32:29 — *O that they were wise, that they understood this, that they would consider their latter end!* — the very weighing of the end, not the beginning, that Baruch is told to make.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar19_lookup sv, _session412_2bar19_lookup tv
 WHERE t.slug='2-baruch-19-the-consummation-not-the-beginning'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=19 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_20.sql (session412 2-baruch 20) -----
-- Source anchor: pseudepigrapha/2-baruch ch20. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar20 (view _session412_2bar20_lookup). Sort band base 84475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-20-zion-taken-that-the-end-may-hasten
  ('pseudepigrapha', '2-baruch', 20, 1, 'canon', 'habakkuk', 2, 3, 'free', E'Hab 2:3 — *For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry* — the appointed end Baruch says will the more speedily come.'),
  ('pseudepigrapha', '2-baruch', 20, 2, 'canon', '2-peter', 3, 9, 'free', E'2 Pet 3:9 — *Yahuah (Lord) is not slack concerning his promise... but is longsuffering to us-ward* — the season''s swiftness held in the Most High''s longsuffering, as Baruch frames Zion''s removal.'),
  -- thread: 2-baruch-20-seal-it-in-thy-heart
  ('pseudepigrapha', '2-baruch', 20, 3, 'canon', 'deuteronomy', 30, 14, 'free', E'Deut 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* — the word sealed in the heart that Baruch is told to hold fast.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-20-zion-taken-that-the-end-may-hasten',
       E'Zion taken that the end may speedily come',
       E'The Mighty One discloses his purpose: *I have now taken away Zion, That I may the more speedily visit the world in its season.* The chastening is not delay but the hastening of the appointed end — the vision that yet tarries but will surely come. It ain''t new — that the appointed time presses to its end and is not slack is the word of Habakkuk and the comfort of the apostle.',
       sv.verse_id, ev.verse_id, 'extras', 84475
  FROM _session412_2bar20_lookup sv, _session412_2bar20_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=20 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-20-seal-it-in-thy-heart',
       E'Hold fast and seal the command in the heart',
       E'Baruch is charged: *hold fast in thy heart everything that I command thee, And seal it in the recesses of thy mind,* then fast seven days for the revelation. The command treasured in the heart is the discipline Moses set on Israel for life. It ain''t new — that the word be laid up and kept in the heart, that the man may choose life, is the charge of Deuteronomy before it is Baruch''s.',
       sv.verse_id, ev.verse_id, 'extras', 84478
  FROM _session412_2bar20_lookup sv, _session412_2bar20_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=20 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=20 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-20-zion-taken-that-the-end-may-hasten
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hab 2:3 — *For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry* — the appointed end Baruch says will the more speedily come.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar20_lookup sv, _session412_2bar20_lookup tv
 WHERE t.slug='2-baruch-20-zion-taken-that-the-end-may-hasten'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=20 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Pet 3:9 — *Yahuah (Lord) is not slack concerning his promise... but is longsuffering to us-ward* — the season''s swiftness held in the Most High''s longsuffering, as Baruch frames Zion''s removal.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar20_lookup sv, _session412_2bar20_lookup tv
 WHERE t.slug='2-baruch-20-zion-taken-that-the-end-may-hasten'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=20 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-20-seal-it-in-thy-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deut 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* — the word sealed in the heart that Baruch is told to hold fast.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar20_lookup sv, _session412_2bar20_lookup tv
 WHERE t.slug='2-baruch-20-seal-it-in-thy-heart'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=20 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_21.sql (session412 2-baruch 21) -----
-- Source anchor: pseudepigrapha/2-baruch ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar21 (view _session412_2bar21_lookup). Sort band base 84500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-21-who-calls-the-things-that-are-not
  ('pseudepigrapha', '2-baruch', 21, 4, 'canon', 'romans', 4, 17, 'free', E'Rom 4:17 — *even Elohim, who quickeneth the dead, and calleth those things which be not as though they were* — the very God who calls the non-existent into being whom Baruch invokes.'),
  ('pseudepigrapha', '2-baruch', 21, 4, 'canon', 'hebrews', 11, 3, 'free', E'Heb 11:3 — *the worlds were framed by the word of Elohim, so that things which are seen were not made of things which do appear* — the firmament fixed by the word, as Baruch prays.'),
  -- thread: 2-baruch-21-hosts-that-stand-before-thee
  ('pseudepigrapha', '2-baruch', 21, 6, 'canon', 'daniel', 7, 10, 'free', E'Dan 7:10 — *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him* — the countless hosts of fire that stand before the throne, as Baruch beholds them.'),
  ('pseudepigrapha', '2-baruch', 21, 6, 'canon', 'isaiah', 40, 26, 'free', E'Isa 40:26 — *behold who hath created these things, that bringeth out their host by number: he calleth them all by names* — the host made and ruled by Him whom Baruch addresses.'),
  ('pseudepigrapha', '2-baruch', 21, 6, 'canon', 'nehemiah', 9, 6, 'free', E'Neh 9:6 — *thou hast made heaven, the heaven of heavens, with all their host... and the host of heaven worshippeth thee* — the host that stands and obeys, as in Baruch''s prayer.'),
  -- thread: 2-baruch-21-who-quickens-the-dead
  ('pseudepigrapha', '2-baruch', 21, 23, 'canon', 'john', 5, 21, 'free', E'John 5:21 — *For as the Father raiseth up the dead, and quickeneth them; even so the Son quickeneth whom he will* — the raising of the dead Baruch asks the treasuries of souls to give back.'),
  ('pseudepigrapha', '2-baruch', 21, 24, 'canon', 'romans', 4, 17, 'free', E'Rom 4:17 — *Elohim, who quickeneth the dead* — the God of Abraham, Isaac, and Jacob who quickens those who sleep in the earth, as Baruch pleads.'),
  -- thread: 2-baruch-21-they-who-think-thy-longsuffering-weakness
  ('pseudepigrapha', '2-baruch', 21, 20, 'canon', '2-peter', 3, 9, 'free', E'2 Pet 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward* — the longsuffering mistaken for weakness that Baruch asks be vindicated.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-21-who-calls-the-things-that-are-not',
       E'He who called into being that which did not exist',
       E'Baruch''s great prayer opens by naming the Maker: *O Thou that hast made the earth... that hast called from the beginning of the world that which did not yet exist, and they obey Thee.* The One who calls into being what was not — the very Elohim of Abraham''s faith and the framing of the worlds by the word. It ain''t new — that He calls the things that are not as though they were, and frames the worlds by His word, is the faith Paul and Hebrews confess.',
       sv.verse_id, ev.verse_id, 'extras', 84500
  FROM _session412_2bar21_lookup sv, _session412_2bar21_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=21 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=21 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-21-hosts-that-stand-before-thee',
       E'The countless hosts that stand before the throne',
       E'The prayer beholds the heavenly court: *Thou that rulest with great thought the hosts that stand before Thee: also the countless holy beings... of flame and fire, which stand around Thy throne.* The myriads of fire before the throne are the host Daniel saw and the heaven Isaiah and Nehemiah confess. It ain''t new — the thousand thousands ministering and the host called out by number stand in the prophets long before Baruch numbers them.',
       sv.verse_id, ev.verse_id, 'extras', 84503
  FROM _session412_2bar21_lookup sv, _session412_2bar21_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=21 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-21-who-quickens-the-dead',
       E'Let the treasuries of souls restore the dead',
       E'Baruch pleads for the resurrection: *let Sheol be sealed... and let the treasuries of souls restore those which are enclosed in them,* on whose account, of Abraham and Isaac and Jacob who sleep in the earth, the world was made. The One who quickens the dead is the Father who raises and the Son who quickens. It ain''t new — that He gives life to the dead and the graves shall yield them is the hope of the prophets and the word of Messiah.',
       sv.verse_id, ev.verse_id, 'extras', 84506
  FROM _session412_2bar21_lookup sv, _session412_2bar21_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=21 AND sv.verse_number=23
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=21 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-21-they-who-think-thy-longsuffering-weakness',
       E'His longsuffering mistaken for weakness',
       E'Baruch prays that the Mighty One vindicate his patience: *that Thy might may be made known to those who think that Thy long-suffering is weakness.* What men despise as slowness is the Most High waiting in mercy — the very thing Peter answers the scoffers with. It ain''t new — that His longsuffering is not slackness but mercy, and will be shown to be might, is the apostle''s word before it is Baruch''s plea.',
       sv.verse_id, ev.verse_id, 'extras', 84509
  FROM _session412_2bar21_lookup sv, _session412_2bar21_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=21 AND sv.verse_number=19
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=21 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-21-who-calls-the-things-that-are-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Rom 4:17 — *even Elohim, who quickeneth the dead, and calleth those things which be not as though they were* — the very God who calls the non-existent into being whom Baruch invokes.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar21_lookup sv, _session412_2bar21_lookup tv
 WHERE t.slug='2-baruch-21-who-calls-the-things-that-are-not'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Heb 11:3 — *the worlds were framed by the word of Elohim, so that things which are seen were not made of things which do appear* — the firmament fixed by the word, as Baruch prays.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar21_lookup sv, _session412_2bar21_lookup tv
 WHERE t.slug='2-baruch-21-who-calls-the-things-that-are-not'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-21-hosts-that-stand-before-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Dan 7:10 — *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him* — the countless hosts of fire that stand before the throne, as Baruch beholds them.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar21_lookup sv, _session412_2bar21_lookup tv
 WHERE t.slug='2-baruch-21-hosts-that-stand-before-thee'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isa 40:26 — *behold who hath created these things, that bringeth out their host by number: he calleth them all by names* — the host made and ruled by Him whom Baruch addresses.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar21_lookup sv, _session412_2bar21_lookup tv
 WHERE t.slug='2-baruch-21-hosts-that-stand-before-thee'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Neh 9:6 — *thou hast made heaven, the heaven of heavens, with all their host... and the host of heaven worshippeth thee* — the host that stands and obeys, as in Baruch''s prayer.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar21_lookup sv, _session412_2bar21_lookup tv
 WHERE t.slug='2-baruch-21-hosts-that-stand-before-thee'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=21 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-21-who-quickens-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 5:21 — *For as the Father raiseth up the dead, and quickeneth them; even so the Son quickeneth whom he will* — the raising of the dead Baruch asks the treasuries of souls to give back.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar21_lookup sv, _session412_2bar21_lookup tv
 WHERE t.slug='2-baruch-21-who-quickens-the-dead'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=21 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Rom 4:17 — *Elohim, who quickeneth the dead* — the God of Abraham, Isaac, and Jacob who quickens those who sleep in the earth, as Baruch pleads.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar21_lookup sv, _session412_2bar21_lookup tv
 WHERE t.slug='2-baruch-21-who-quickens-the-dead'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=21 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-21-they-who-think-thy-longsuffering-weakness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Pet 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward* — the longsuffering mistaken for weakness that Baruch asks be vindicated.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar21_lookup sv, _session412_2bar21_lookup tv
 WHERE t.slug='2-baruch-21-they-who-think-thy-longsuffering-weakness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=21 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_22.sql (session412 2-baruch 22) -----
-- Source anchor: pseudepigrapha/2-baruch ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar22 (view _session412_2bar22_lookup). Sort band base 84525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-22-the-measure-must-be-filled
  ('pseudepigrapha', '2-baruch', 22, 4, 'canon', 'habakkuk', 2, 3, 'free', E'Hab 2:3 — *For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry* — the appointed season that must be reached, as the harvest that cannot be reaped before its time.'),
  ('pseudepigrapha', '2-baruch', 22, 4, 'canon', '2-peter', 3, 9, 'free', E'2 Pet 3:9 — *Yahuah (Lord) is not slack concerning his promise... but is longsuffering to us-ward, not willing that any should perish* — the patient waiting for the full measure that the heavenly voice presses on Baruch.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-22-the-measure-must-be-filled',
       E'The work must be completed before its fruit',
       E'From the opened heaven a voice answers Baruch with parables of unfinished things: the road not travelled to its end, the seed sown but not reaped *in its season,* the house not roofed — none may be reckoned complete before its time. So the age must run its full measure before the end. It ain''t new — that there is an appointed time, a vision that waits and will not fail at the end, is the word of Habakkuk before the heavens say it to Baruch.',
       sv.verse_id, ev.verse_id, 'extras', 84525
  FROM _session412_2bar22_lookup sv, _session412_2bar22_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=22 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-22-the-measure-must-be-filled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hab 2:3 — *For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry* — the appointed season that must be reached, as the harvest that cannot be reaped before its time.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar22_lookup sv, _session412_2bar22_lookup tv
 WHERE t.slug='2-baruch-22-the-measure-must-be-filled'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Pet 3:9 — *Yahuah (Lord) is not slack concerning his promise... but is longsuffering to us-ward, not willing that any should perish* — the patient waiting for the full measure that the heavenly voice presses on Baruch.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar22_lookup sv, _session412_2bar22_lookup tv
 WHERE t.slug='2-baruch-22-the-measure-must-be-filled'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_23.sql (session412 2-baruch 23) -----
-- Source anchor: pseudepigrapha/2-baruch ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar23 (view _session412_2bar23_lookup). Sort band base 84550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-23-adam-sinned-and-the-number-was-numbered
  ('pseudepigrapha', '2-baruch', 23, 3, 'canon', 'romans', 5, 12, 'free', E'Rom 5:12 — *as by one man sin entered into the world, and death by sin; and so death passed upon all men* — the decree of death at Adam''s sin that Baruch names as the start of the numbering.'),
  ('pseudepigrapha', '2-baruch', 23, 4, 'canon', 'revelation', 6, 11, 'free', E'Rev 6:11 — *they should rest yet for a little season, until their fellowservants also and their brethren... should be fulfilled* — the appointed number that must first be completed before the end, as Baruch says the creature will not live again till the number is fulfilled.'),
  -- thread: 2-baruch-23-my-redemption-has-drawn-nigh
  ('pseudepigrapha', '2-baruch', 23, 6, 'canon', 'habakkuk', 2, 3, 'free', E'Hab 2:3 — *though it tarry, wait for it; because it will surely come, it will not tarry* — the nearing deliverance that is no longer far distant, as Baruch is told.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-23-adam-sinned-and-the-number-was-numbered',
       E'Adam sinned, and the number of souls was numbered',
       E'The answer reaches back to the fall: *when Adam sinned and death was decreed against those who should be born, then the multitude of those who should be born was numbered,* and a place prepared *where the living might dwell and the dead might be guarded.* The end waits till that number is fulfilled — the souls kept under the altar are told to wait the same way. It ain''t new — that death came by Adam, and that the appointed number must first be filled, is the word of Paul and the cry beneath the altar.',
       sv.verse_id, ev.verse_id, 'extras', 84550
  FROM _session412_2bar23_lookup sv, _session412_2bar23_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=23 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=23 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-23-my-redemption-has-drawn-nigh',
       E'My redemption has drawn nigh',
       E'The Mighty One closes with comfort: *truly My redemption has drawn nigh, and is not far distant as aforetime.* The longed-for deliverance is near at hand — the same nearness Habakkuk waits for and Peter measures by the Most High''s reckoning of time. It ain''t new — that the redemption draws near and the appointed time will not tarry is the prophet''s assurance before it is Baruch''s.',
       sv.verse_id, ev.verse_id, 'extras', 84553
  FROM _session412_2bar23_lookup sv, _session412_2bar23_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=23 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=23 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-23-adam-sinned-and-the-number-was-numbered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Rom 5:12 — *as by one man sin entered into the world, and death by sin; and so death passed upon all men* — the decree of death at Adam''s sin that Baruch names as the start of the numbering.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar23_lookup sv, _session412_2bar23_lookup tv
 WHERE t.slug='2-baruch-23-adam-sinned-and-the-number-was-numbered'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Rev 6:11 — *they should rest yet for a little season, until their fellowservants also and their brethren... should be fulfilled* — the appointed number that must first be completed before the end, as Baruch says the creature will not live again till the number is fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar23_lookup sv, _session412_2bar23_lookup tv
 WHERE t.slug='2-baruch-23-adam-sinned-and-the-number-was-numbered'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-23-my-redemption-has-drawn-nigh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hab 2:3 — *though it tarry, wait for it; because it will surely come, it will not tarry* — the nearing deliverance that is no longer far distant, as Baruch is told.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar23_lookup sv, _session412_2bar23_lookup tv
 WHERE t.slug='2-baruch-23-my-redemption-has-drawn-nigh'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_24.sql (session412 2-baruch 24) -----
-- Source anchor: pseudepigrapha/2-baruch ch24. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar24 (view _session412_2bar24_lookup). Sort band base 84575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-24-the-books-shall-be-opened
  ('pseudepigrapha', '2-baruch', 24, 1, 'canon', 'daniel', 7, 10, 'free', E'Dan 7:10 — *the judgment was set, and the books were opened* — the very opening of the books at the consummation that Baruch foretells.'),
  ('pseudepigrapha', '2-baruch', 24, 1, 'canon', 'revelation', 20, 12, 'free', E'Rev 20:12 — *and the books were opened... and the dead were judged out of those things which were written in the books, according to their works* — the books of sins and the gathered righteousness Baruch names.'),
  ('pseudepigrapha', '2-baruch', 24, 1, 'canon', 'deuteronomy', 32, 34, 'free', E'Deut 32:34 — *Is not this laid up in store with me, and sealed up among my treasures?* — the treasuries where the record is laid up against the day, as Baruch''s treasuries of righteousness.'),
  -- thread: 2-baruch-24-the-longsuffering-of-the-most-high
  ('pseudepigrapha', '2-baruch', 24, 2, 'canon', '2-peter', 3, 9, 'free', E'2 Pet 3:9 — *Yahuah (Lord) is not slack concerning his promise... but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* — the longsuffering through all generations toward sinner and righteous that Baruch will see.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-24-the-books-shall-be-opened',
       E'The books opened and the treasuries of righteousness',
       E'The day of reckoning is shown: *the books shall be opened in which are written the sins of all those who have sinned, and again also the treasuries in which the righteousness of all those who have been righteous in creation is gathered.* The opened books at the judgment are exactly what Daniel saw and what John saw before the throne. It ain''t new — that the books are opened and the dead judged out of what is written is the vision of the prophet and the seer.',
       sv.verse_id, ev.verse_id, 'extras', 84575
  FROM _session412_2bar24_lookup sv, _session412_2bar24_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=24 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=24 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-24-the-longsuffering-of-the-most-high',
       E'The longsuffering of the Most High through all generations',
       E'Baruch is told he will see *the long-suffering of the El Elyon (Most High), which has been throughout all generations, who has been long-suffering towards all who are born, (alike) those who sin and (those who) are righteous.* The patience that bears with sinner and righteous alike until the appointed day is the same the apostle preaches against the scoffers. It ain''t new — that the Most High is longsuffering, not slack, waiting that none should perish, is the word of Peter before it is shown to Baruch.',
       sv.verse_id, ev.verse_id, 'extras', 84578
  FROM _session412_2bar24_lookup sv, _session412_2bar24_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=24 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=24 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-24-the-books-shall-be-opened
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Dan 7:10 — *the judgment was set, and the books were opened* — the very opening of the books at the consummation that Baruch foretells.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar24_lookup sv, _session412_2bar24_lookup tv
 WHERE t.slug='2-baruch-24-the-books-shall-be-opened'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=24 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Rev 20:12 — *and the books were opened... and the dead were judged out of those things which were written in the books, according to their works* — the books of sins and the gathered righteousness Baruch names.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar24_lookup sv, _session412_2bar24_lookup tv
 WHERE t.slug='2-baruch-24-the-books-shall-be-opened'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=24 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deut 32:34 — *Is not this laid up in store with me, and sealed up among my treasures?* — the treasuries where the record is laid up against the day, as Baruch''s treasuries of righteousness.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar24_lookup sv, _session412_2bar24_lookup tv
 WHERE t.slug='2-baruch-24-the-books-shall-be-opened'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=24 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-24-the-longsuffering-of-the-most-high
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Pet 3:9 — *Yahuah (Lord) is not slack concerning his promise... but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* — the longsuffering through all generations toward sinner and righteous that Baruch will see.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar24_lookup sv, _session412_2bar24_lookup tv
 WHERE t.slug='2-baruch-24-the-longsuffering-of-the-most-high'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=24 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_25.sql (session412 2-baruch 25) -----
-- Source anchor: pseudepigrapha/2-baruch ch25. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar25 (view _session412_2bar25_lookup). Sort band base 84600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar25_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-25-when-they-abandon-hope-the-time-awakes
  ('pseudepigrapha', '2-baruch', 25, 3, 'canon', 'matthew', 24, 6, 'free', E'Matthew 24:6 — *And ye shall hear of wars and rumours of wars: see that ye be not troubled: for all these things must come to pass, but the end is not yet.* The tribulations that seize the earth before the time awakes are the Messiah''s own sign of the age''s close — these things must come, but the end is not yet.'),
  ('pseudepigrapha', '2-baruch', 25, 3, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Baruch''s many tribulations before the time awakes are Daniel''s unequalled time of trouble out of which the people are delivered.'),
  ('pseudepigrapha', '2-baruch', 25, 4, 'canon', 'matthew', 24, 21, 'free', E'Matthew 24:21 — *For then shall be great tribulation, such as was not since the beginning of the world to this time, no, nor ever shall be.* The hour when men abandon hope by reason of much tribulation is the great tribulation the Messiah foretold, unmatched since the beginning of the world.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar25_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar25_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-25-when-they-abandon-hope-the-time-awakes',
       E'The sign in the end of days — tribulation, and then the time awakes',
       E'The Most High tells Baruch that he shall be kept until the sign He works in the end of days: *When a stupor shall seize the inhabitants of the earth, and they shall fall into many tribulations... it will come to pass when they abandon hope, that the time will then awake* (2 Baruch 25:3-4). This is the Messiah''s own word about the close of the age — *ye shall hear of wars and rumours of wars... but the end is not yet* (Matthew 24:6), and Daniel''s appointed deliverance after the worst distress, *there shall be a time of trouble, such as never was since there was a nation... and at that time thy people shall be delivered* (Daniel 12:1). It ain''t new — Moses'' prophets already set the tribulation before the deliverance.',
       sv.verse_id, ev.verse_id, 'extras', 84600
  FROM _session412_2bar25_lookup sv, _session412_2bar25_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=25 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=25 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-25-when-they-abandon-hope-the-time-awakes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:6 — *And ye shall hear of wars and rumours of wars: see that ye be not troubled: for all these things must come to pass, but the end is not yet.* The tribulations that seize the earth before the time awakes are the Messiah''s own sign of the age''s close — these things must come, but the end is not yet.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar25_lookup sv, _session412_2bar25_lookup tv
 WHERE t.slug='2-baruch-25-when-they-abandon-hope-the-time-awakes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=25 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Baruch''s many tribulations before the time awakes are Daniel''s unequalled time of trouble out of which the people are delivered.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar25_lookup sv, _session412_2bar25_lookup tv
 WHERE t.slug='2-baruch-25-when-they-abandon-hope-the-time-awakes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=25 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:21 — *For then shall be great tribulation, such as was not since the beginning of the world to this time, no, nor ever shall be.* The hour when men abandon hope by reason of much tribulation is the great tribulation the Messiah foretold, unmatched since the beginning of the world.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar25_lookup sv, _session412_2bar25_lookup tv
 WHERE t.slug='2-baruch-25-when-they-abandon-hope-the-time-awakes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=25 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_26.sql (session412 2-baruch 26) -----
-- Source anchor: pseudepigrapha/2-baruch ch26. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar26 (view _session412_2bar26_lookup). Sort band base 84625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar26_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-26-how-long-shall-the-tribulation-continue
  ('pseudepigrapha', '2-baruch', 26, 1, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Lord, holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* Baruch''s question whether the tribulation will continue many years is the same "how long" the martyred souls cry under the altar.'),
  ('pseudepigrapha', '2-baruch', 26, 1, 'canon', 'matthew', 24, 22, 'free', E'Matthew 24:22 — *And except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened.* The answer to whether that necessity embraces many years is the Messiah''s word that the days are measured and cut short for the elect''s sake.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar26_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar26_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-26-how-long-shall-the-tribulation-continue',
       E'How long shall that tribulation continue?',
       E'Baruch asks the question every sufferer asks of the appointed woes: *Will that tribulation which is to be continue a long time, and will that necessity embrace many years?* (2 Baruch 26:1). It is the cry of the souls under the altar — *How long, O Lord, holy and true, dost thou not judge and avenge our blood?* (Revelation 6:10) — and the answer the Messiah gives is that the days are measured and cut short, *except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened* (Matthew 24:22). It ain''t new — the saints have always asked how long, and the days are numbered.',
       sv.verse_id, ev.verse_id, 'extras', 84625
  FROM _session412_2bar26_lookup sv, _session412_2bar26_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=26 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=26 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-26-how-long-shall-the-tribulation-continue
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Lord, holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* Baruch''s question whether the tribulation will continue many years is the same "how long" the martyred souls cry under the altar.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar26_lookup sv, _session412_2bar26_lookup tv
 WHERE t.slug='2-baruch-26-how-long-shall-the-tribulation-continue'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=26 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:22 — *And except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened.* The answer to whether that necessity embraces many years is the Messiah''s word that the days are measured and cut short for the elect''s sake.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar26_lookup sv, _session412_2bar26_lookup tv
 WHERE t.slug='2-baruch-26-how-long-shall-the-tribulation-continue'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=26 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_27.sql (session412 2-baruch 27) -----
-- Source anchor: pseudepigrapha/2-baruch ch27. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar27 (view _session412_2bar27_lookup). Sort band base 84650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar27_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-27-the-twelve-parts-of-the-woes
  ('pseudepigrapha', '2-baruch', 27, 6, 'canon', 'matthew', 24, 7, 'free', E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The famine, withholding of rain, and earthquakes among Baruch''s twelve parts are the very famines and earthquakes the Messiah lists in the beginning of sorrows.'),
  ('pseudepigrapha', '2-baruch', 27, 7, 'canon', 'matthew', 24, 8, 'free', E'Matthew 24:8 — *All these are the beginning of sorrows.* The twelve parts of woe that mingle one with another and lead to the consummation are the beginning of sorrows the Messiah names.'),
  ('pseudepigrapha', '2-baruch', 27, 6, 'canon', 'mark', 13, 8, 'free', E'Mark 13:8 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be earthquakes in divers places, and there shall be famines and troubles: these are the beginnings of sorrows.* The earthquakes, famine, and terrors of the appointed parts are the earthquakes and famines Mark names as the beginnings of sorrows.'),
  -- thread: 2-baruch-27-the-sword-and-the-fall-by-death
  ('pseudepigrapha', '2-baruch', 27, 5, 'canon', 'revelation', 6, 8, 'free', E'Revelation 6:8 — *And I looked, and behold a pale horse: and his name that sat on him was Death, and Hell followed with him. And power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth.* The fall of many by death and the sending of the sword are John''s pale horse, Death given power to slay with sword and with hunger.'),
  ('pseudepigrapha', '2-baruch', 27, 5, 'canon', 'matthew', 24, 6, 'free', E'Matthew 24:6 — *And ye shall hear of wars and rumours of wars: see that ye be not troubled: for all these things must come to pass, but the end is not yet.* The sending of the sword among the appointed parts is the wars the Messiah said must come to pass before the end.'),
  -- thread: 2-baruch-27-this-is-the-consummation-of-the-times
  ('pseudepigrapha', '2-baruch', 27, 15, 'canon', 'matthew', 24, 36, 'free', E'Matthew 24:36 — *But of that day and hour knoweth no man, no, not the angels of heaven, but my Father only.* That men on the earth may not understand it is the consummation of the times is the hidden day and hour the Messiah said no man knows.'),
  ('pseudepigrapha', '2-baruch', 27, 15, 'canon', 'daniel', 12, 10, 'free', E'Daniel 12:10 — *Many shall be purified, and made white, and tried; but the wicked shall do wickedly: and none of the wicked shall understand; but the wise shall understand.* That the dwellers on the earth shall not understand it is the consummation echoes Daniel — none of the wicked understand, but the wise shall understand.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar27_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar27_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-27-the-twelve-parts-of-the-woes',
       E'The time divided into twelve parts — commotions, the sword, famine, earthquakes',
       E'The Most High divides the appointed time into twelve measured parts of woe: *In the first part there shall be the beginning of commotions... in the fifth part famine and the withholding of rain... in the sixth part earthquakes and terrors* (2 Baruch 27:2-7). This is the very catalogue the Messiah names as the birth-pangs of the age — *nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places. All these are the beginning of sorrows* (Matthew 24:7-8), and Mark''s like word, *there shall be earthquakes in divers places, and there shall be famines and troubles: these are the beginnings of sorrows* (Mark 13:8). It ain''t new — the woes Baruch numbers are the beginning of sorrows the prophets and the Messiah foretold.',
       sv.verse_id, ev.verse_id, 'extras', 84650
  FROM _session412_2bar27_lookup sv, _session412_2bar27_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=27 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=27 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-27-the-sword-and-the-fall-by-death',
       E'The sending of the sword and the fall of many by death',
       E'Among the measured parts come the slayings and the sword: *in the third part the fall of many by death... in the fourth part the sending of the sword* (2 Baruch 27:4-5). This is the fourth seal of the Revelation — Death riding forth, *power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death* (Revelation 6:8) — and the wars and rumours of wars the Messiah set at the head of the woes, *all these things must come to pass, but the end is not yet* (Matthew 24:6). It ain''t new — the sword and the fall by death are the seals John saw opened.',
       sv.verse_id, ev.verse_id, 'extras', 84653
  FROM _session412_2bar27_lookup sv, _session412_2bar27_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=27 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=27 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-27-this-is-the-consummation-of-the-times',
       E'The parts mingle so men know not it is the consummation',
       E'The parts are reserved to be mingled one with another, *so that those may not understand who are upon the earth in those days that this is the consummation of the times* (2 Baruch 27:14-15). The Messiah likewise warned that the end would come upon men unawares, *but of that day and hour knoweth no man* (Matthew 24:36), and Daniel sealed the words that the wise alone would discern, *none of the wicked shall understand; but the wise shall understand* (Daniel 12:10). It ain''t new — the appointed consummation is hidden from the careless and known to the wise.',
       sv.verse_id, ev.verse_id, 'extras', 84656
  FROM _session412_2bar27_lookup sv, _session412_2bar27_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=27 AND sv.verse_number=14
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=27 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-27-the-twelve-parts-of-the-woes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The famine, withholding of rain, and earthquakes among Baruch''s twelve parts are the very famines and earthquakes the Messiah lists in the beginning of sorrows.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar27_lookup sv, _session412_2bar27_lookup tv
 WHERE t.slug='2-baruch-27-the-twelve-parts-of-the-woes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=27 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:8 — *All these are the beginning of sorrows.* The twelve parts of woe that mingle one with another and lead to the consummation are the beginning of sorrows the Messiah names.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar27_lookup sv, _session412_2bar27_lookup tv
 WHERE t.slug='2-baruch-27-the-twelve-parts-of-the-woes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=27 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Mark 13:8 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be earthquakes in divers places, and there shall be famines and troubles: these are the beginnings of sorrows.* The earthquakes, famine, and terrors of the appointed parts are the earthquakes and famines Mark names as the beginnings of sorrows.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar27_lookup sv, _session412_2bar27_lookup tv
 WHERE t.slug='2-baruch-27-the-twelve-parts-of-the-woes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=27 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-27-the-sword-and-the-fall-by-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:8 — *And I looked, and behold a pale horse: and his name that sat on him was Death, and Hell followed with him. And power was given unto them over the fourth part of the earth, to kill with sword, and with hunger, and with death, and with the beasts of the earth.* The fall of many by death and the sending of the sword are John''s pale horse, Death given power to slay with sword and with hunger.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar27_lookup sv, _session412_2bar27_lookup tv
 WHERE t.slug='2-baruch-27-the-sword-and-the-fall-by-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=27 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:6 — *And ye shall hear of wars and rumours of wars: see that ye be not troubled: for all these things must come to pass, but the end is not yet.* The sending of the sword among the appointed parts is the wars the Messiah said must come to pass before the end.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar27_lookup sv, _session412_2bar27_lookup tv
 WHERE t.slug='2-baruch-27-the-sword-and-the-fall-by-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=27 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-27-this-is-the-consummation-of-the-times
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:36 — *But of that day and hour knoweth no man, no, not the angels of heaven, but my Father only.* That men on the earth may not understand it is the consummation of the times is the hidden day and hour the Messiah said no man knows.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar27_lookup sv, _session412_2bar27_lookup tv
 WHERE t.slug='2-baruch-27-this-is-the-consummation-of-the-times'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=27 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:10 — *Many shall be purified, and made white, and tried; but the wicked shall do wickedly: and none of the wicked shall understand; but the wise shall understand.* That the dwellers on the earth shall not understand it is the consummation echoes Daniel — none of the wicked understand, but the wise shall understand.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar27_lookup sv, _session412_2bar27_lookup tv
 WHERE t.slug='2-baruch-27-this-is-the-consummation-of-the-times'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=27 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_28.sql (session412 2-baruch 28) -----
-- Source anchor: pseudepigrapha/2-baruch ch28. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar28 (view _session412_2bar28_lookup). Sort band base 84675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar28_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-28-whosoever-understandeth-shall-be-wise
  ('pseudepigrapha', '2-baruch', 28, 1, 'canon', 'daniel', 12, 10, 'free', E'Daniel 12:10 — *Many shall be purified, and made white, and tried; but the wicked shall do wickedly: and none of the wicked shall understand; but the wise shall understand.* That whosoever understandeth shall then be wise is Daniel''s own word — the wicked understand not, but the wise shall understand the reckoning of the time.'),
  ('pseudepigrapha', '2-baruch', 28, 2, 'canon', 'matthew', 24, 33, 'free', E'Matthew 24:33 — *So likewise ye, when ye shall see all these things, know that it is near, even at the doors.* The reckoning of the measure of that time, given to be discerned by the wise, is the Messiah''s charge to know the season is near when these things appear.'),
  -- thread: 2-baruch-28-whole-earth-or-one-place
  ('pseudepigrapha', '2-baruch', 28, 7, 'canon', 'isaiah', 34, 2, 'free', E'Isaiah 34:2 — *For the indignation of Yahuah (LORD) is upon all nations, and his fury upon all their armies: he hath utterly destroyed them, he hath delivered them to the slaughter.* That the whole earth, not one place, shall experience these things is Isaiah''s word that the indignation of Yahuah is upon all nations.'),
  ('pseudepigrapha', '2-baruch', 28, 7, 'canon', 'matthew', 24, 14, 'free', E'Matthew 24:14 — *And this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come.* Baruch''s question whether the whole earth experiences these things is answered in the Messiah''s word that the end comes upon all nations together.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar28_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar28_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-28-whosoever-understandeth-shall-be-wise',
       E'Whosoever understandeth shall then be wise',
       E'Of the measured time the Most High says, *whosoever understandeth shall then be wise. For the measure and reckoning of that time are two parts a week of seven weeks* (2 Baruch 28:1-2). This is Daniel''s own counsel for the time of the end — *they that be wise shall shine as the brightness of the firmament... but the wise shall understand* (Daniel 12:3,10) — and the Messiah''s charge to discern the season, *when ye shall see all these things, know that it is near, even at the doors* (Matthew 24:33). It ain''t new — the wise alone read the reckoning of the appointed time.',
       sv.verse_id, ev.verse_id, 'extras', 84675
  FROM _session412_2bar28_lookup sv, _session412_2bar28_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=28 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=28 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-28-whole-earth-or-one-place',
       E'Will the whole earth experience these things?',
       E'Baruch asks whether the woes fall on one region or all the world: *Is it in one place or in one of the parts of the earth that those things are come to pass, or will the whole earth experience them?* (2 Baruch 28:7). The answer the prophets give is that the day of Yahuah is upon all the earth — *the indignation of Yahuah is upon all nations* (Isaiah 34:2) — and the Messiah''s gospel of the end is preached *in all the world for a witness unto all nations; and then shall the end come* (Matthew 24:14). It ain''t new — the consummation is appointed for the whole earth, not one corner.',
       sv.verse_id, ev.verse_id, 'extras', 84678
  FROM _session412_2bar28_lookup sv, _session412_2bar28_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=28 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=28 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-28-whosoever-understandeth-shall-be-wise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:10 — *Many shall be purified, and made white, and tried; but the wicked shall do wickedly: and none of the wicked shall understand; but the wise shall understand.* That whosoever understandeth shall then be wise is Daniel''s own word — the wicked understand not, but the wise shall understand the reckoning of the time.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar28_lookup sv, _session412_2bar28_lookup tv
 WHERE t.slug='2-baruch-28-whosoever-understandeth-shall-be-wise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=28 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:33 — *So likewise ye, when ye shall see all these things, know that it is near, even at the doors.* The reckoning of the measure of that time, given to be discerned by the wise, is the Messiah''s charge to know the season is near when these things appear.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar28_lookup sv, _session412_2bar28_lookup tv
 WHERE t.slug='2-baruch-28-whosoever-understandeth-shall-be-wise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=28 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-28-whole-earth-or-one-place
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 34:2 — *For the indignation of Yahuah (LORD) is upon all nations, and his fury upon all their armies: he hath utterly destroyed them, he hath delivered them to the slaughter.* That the whole earth, not one place, shall experience these things is Isaiah''s word that the indignation of Yahuah is upon all nations.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar28_lookup sv, _session412_2bar28_lookup tv
 WHERE t.slug='2-baruch-28-whole-earth-or-one-place'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=28 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=34 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:14 — *And this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come.* Baruch''s question whether the whole earth experiences these things is answered in the Messiah''s word that the end comes upon all nations together.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar28_lookup sv, _session412_2bar28_lookup tv
 WHERE t.slug='2-baruch-28-whole-earth-or-one-place'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=28 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_29.sql (session412 2-baruch 29) -----
-- Source anchor: pseudepigrapha/2-baruch ch29. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar29 (view _session412_2bar29_lookup). Sort band base 84700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar29_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-29-the-messiah-shall-begin-to-be-revealed
  ('pseudepigrapha', '2-baruch', 29, 3, 'canon', 'psalms', 2, 6, 'free', E'Psalms 2:6 — *Yet have I set my king upon my holy hill of Zion.* The Messiah who begins to be revealed in his season is the King the Father sets upon His holy hill, the Anointed of the second Psalm.'),
  ('pseudepigrapha', '2-baruch', 29, 3, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* Baruch''s revealed Messiah is Isaiah''s rod from Jesse who judges in righteousness and slays the wicked with the breath of his lips.'),
  -- thread: 2-baruch-29-behemoth-and-leviathan-given-for-food
  ('pseudepigrapha', '2-baruch', 29, 4, 'canon', 'psalms', 74, 14, 'free', E'Psalms 74:14 — *Thou brakest the heads of leviathan in pieces, and gavest him to be meat to the people inhabiting the wilderness.* Leviathan ascending to be food for all that are left is the Psalm''s own image — Yahuah brake the heads of leviathan and gave him to be meat to His people.'),
  ('pseudepigrapha', '2-baruch', 29, 4, 'canon', 'job', 41, 1, 'free', E'Job 41:1 — *Canst thou draw out leviathan with an hook? or his tongue with a cord which thou lettest down?* The great monster Leviathan that ascends from the sea is the creature no man can draw out, whom only the Most High masters, as Job confesses.'),
  ('pseudepigrapha', '2-baruch', 29, 4, 'canon', 'isaiah', 25, 8, 'free', E'Isaiah 25:8 — *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* The feast at which the monsters become food for the saints is Isaiah''s mountain banquet where death itself is swallowed up in victory.'),
  ('pseudepigrapha', '2-baruch', 29, 4, 'canon', 'revelation', 19, 17, 'free', E'Revelation 19:17 — *And I saw an angel standing in the sun; and he cried with a loud voice, saying to all the fowls that fly in the midst of heaven, Come and gather yourselves together unto the supper of the great Elohim (God).* The great feast at the Messiah''s revealing answers in John''s supper of the great Elohim at the day of the Anointed''s triumph.'),
  -- thread: 2-baruch-29-the-earth-yields-ten-thousandfold
  ('pseudepigrapha', '2-baruch', 29, 5, 'canon', 'amos', 9, 13, 'free', E'Amos 9:13 — *Behold, the days come, saith Yahuah (LORD), that the plowman shall overtake the reaper, and the treader of grapes him that soweth seed; and the mountains shall drop sweet wine, and all the hills shall melt.* The vine that bears a thousand clusters and each grape a cor of wine is Amos'' day when the mountains drop sweet wine and the harvest overflows.'),
  ('pseudepigrapha', '2-baruch', 29, 5, 'canon', 'isaiah', 65, 21, 'free', E'Isaiah 65:21 — *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them.* The earth yielding ten thousandfold in the Messiah''s day is Isaiah''s restored land where the people plant vineyards and eat the fruit of them.'),
  -- thread: 2-baruch-29-the-treasury-of-manna-descends-again
  ('pseudepigrapha', '2-baruch', 29, 8, 'canon', 'exodus', 16, 4, 'free', E'Exodus 16:4 — *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* The treasury of manna that descends again is the very bread from heaven Yahuah rained on Israel through Moses.'),
  ('pseudepigrapha', '2-baruch', 29, 8, 'canon', 'john', 6, 31, 'free', E'John 6:31 — *Our fathers did eat manna in the desert; as it is written, He gave them bread from heaven to eat.* The manna that comes down again at the consummation is the bread from heaven the fathers ate, which the Messiah takes up as the sign of Himself.'),
  ('pseudepigrapha', '2-baruch', 29, 8, 'canon', 'john', 6, 35, 'free', E'John 6:35 — *And Yahusha (Jesus) said unto them, I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst.* The descending manna of the Messiah''s years finds its substance in the Anointed Himself, the bread of life on whom the saved feed and never hunger.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar29_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar29_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-29-the-messiah-shall-begin-to-be-revealed',
       E'The Messiah shall then begin to be revealed',
       E'When the appointed measure is filled, *the Messiah shall then begin to be revealed* (2 Baruch 29:3). This is the Anointed of David''s hope, made manifest in his season — the One whom the Father sets forth, *I have set my king upon my holy hill of Zion* (Psalms 2:6), the rod out of the stem of Jesse, *with righteousness shall he judge the poor... and with the breath of his lips shall he slay the wicked* (Isaiah 11:4). His unveiling is the appearing the apostles waited for, *who shall be revealed in his time* (1 Timothy 6:14-15). It ain''t new — the Messiah revealed in the end is the King the Psalm and Isaiah already crowned.',
       sv.verse_id, ev.verse_id, 'extras', 84700
  FROM _session412_2bar29_lookup sv, _session412_2bar29_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=29 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-29-behemoth-and-leviathan-given-for-food',
       E'Behemoth and Leviathan given for food at the great feast',
       E'At the Messiah''s revealing the two primeval monsters are brought forth for the feast of the saints: *Behemoth shall be revealed from his place and Leviathan shall ascend from the sea... and then they shall be for food for all that are left* (2 Baruch 29:4). The Psalm already gave Leviathan to be meat, *thou brakest the heads of leviathan in pieces, and gavest him to be meat to the people inhabiting the wilderness* (Psalms 74:14); the creature Job names, *canst thou draw out leviathan with an hook?* (Job 41:1). And this banquet is Isaiah''s feast of fat things where death itself is swallowed up, *he will swallow up death in victory* (Isaiah 25:8) — answered in the Revelation''s supper of the great Elohim (Revelation 19:17). It ain''t new — the feast of the saints is Isaiah''s mountain table, and Leviathan was meat for the people before ever Baruch wrote.',
       sv.verse_id, ev.verse_id, 'extras', 84703
  FROM _session412_2bar29_lookup sv, _session412_2bar29_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=29 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-29-the-earth-yields-ten-thousandfold',
       E'The earth shall yield ten thousandfold',
       E'In the Messiah''s day the curse on the ground is lifted and the earth pours out abundance: *the earth also shall yield its fruit ten thousandfold and on each vine there shall be a thousand branches* (2 Baruch 29:5). This is the prophets'' picture of the restored land, *the mountains shall drop sweet wine, and all the hills shall melt* (Amos 9:13), the new heavens and new earth where *they shall plant vineyards, and eat the fruit of them* (Isaiah 65:21). It ain''t new — the teeming vine of the age to come is Isaiah''s and Amos'' restored land where the ground is no more cursed.',
       sv.verse_id, ev.verse_id, 'extras', 84706
  FROM _session412_2bar29_lookup sv, _session412_2bar29_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=29 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-29-the-treasury-of-manna-descends-again',
       E'The treasury of manna shall descend again',
       E'At the consummation the bread of heaven returns for the saved: *the treasury of manna shall again descend from on high, and they will eat of it in those years* (2 Baruch 29:8). Moses recorded the first rain of it, *I will rain bread from heaven for you* (Exodus 16:4) — and the Messiah declared Himself its true and final substance, *our fathers did eat manna in the desert... my Father giveth you the true bread from heaven* (John 6:31-32), *I am the bread of life: he that cometh to me shall never hunger* (John 6:35). It ain''t new — the manna that comes down again is Moses'' bread from heaven, and the Messiah is the true bread it foreshadowed.',
       sv.verse_id, ev.verse_id, 'extras', 84709
  FROM _session412_2bar29_lookup sv, _session412_2bar29_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=8
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=29 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-29-the-messiah-shall-begin-to-be-revealed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 2:6 — *Yet have I set my king upon my holy hill of Zion.* The Messiah who begins to be revealed in his season is the King the Father sets upon His holy hill, the Anointed of the second Psalm.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar29_lookup sv, _session412_2bar29_lookup tv
 WHERE t.slug='2-baruch-29-the-messiah-shall-begin-to-be-revealed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* Baruch''s revealed Messiah is Isaiah''s rod from Jesse who judges in righteousness and slays the wicked with the breath of his lips.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar29_lookup sv, _session412_2bar29_lookup tv
 WHERE t.slug='2-baruch-29-the-messiah-shall-begin-to-be-revealed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-29-behemoth-and-leviathan-given-for-food
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 74:14 — *Thou brakest the heads of leviathan in pieces, and gavest him to be meat to the people inhabiting the wilderness.* Leviathan ascending to be food for all that are left is the Psalm''s own image — Yahuah brake the heads of leviathan and gave him to be meat to His people.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar29_lookup sv, _session412_2bar29_lookup tv
 WHERE t.slug='2-baruch-29-behemoth-and-leviathan-given-for-food'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 41:1 — *Canst thou draw out leviathan with an hook? or his tongue with a cord which thou lettest down?* The great monster Leviathan that ascends from the sea is the creature no man can draw out, whom only the Most High masters, as Job confesses.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar29_lookup sv, _session412_2bar29_lookup tv
 WHERE t.slug='2-baruch-29-behemoth-and-leviathan-given-for-food'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=41 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 25:8 — *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it.* The feast at which the monsters become food for the saints is Isaiah''s mountain banquet where death itself is swallowed up in victory.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar29_lookup sv, _session412_2bar29_lookup tv
 WHERE t.slug='2-baruch-29-behemoth-and-leviathan-given-for-food'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 19:17 — *And I saw an angel standing in the sun; and he cried with a loud voice, saying to all the fowls that fly in the midst of heaven, Come and gather yourselves together unto the supper of the great Elohim (God).* The great feast at the Messiah''s revealing answers in John''s supper of the great Elohim at the day of the Anointed''s triumph.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar29_lookup sv, _session412_2bar29_lookup tv
 WHERE t.slug='2-baruch-29-behemoth-and-leviathan-given-for-food'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-29-the-earth-yields-ten-thousandfold
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 9:13 — *Behold, the days come, saith Yahuah (LORD), that the plowman shall overtake the reaper, and the treader of grapes him that soweth seed; and the mountains shall drop sweet wine, and all the hills shall melt.* The vine that bears a thousand clusters and each grape a cor of wine is Amos'' day when the mountains drop sweet wine and the harvest overflows.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar29_lookup sv, _session412_2bar29_lookup tv
 WHERE t.slug='2-baruch-29-the-earth-yields-ten-thousandfold'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:21 — *And they shall build houses, and inhabit them; and they shall plant vineyards, and eat the fruit of them.* The earth yielding ten thousandfold in the Messiah''s day is Isaiah''s restored land where the people plant vineyards and eat the fruit of them.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar29_lookup sv, _session412_2bar29_lookup tv
 WHERE t.slug='2-baruch-29-the-earth-yields-ten-thousandfold'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-29-the-treasury-of-manna-descends-again
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 16:4 — *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no.* The treasury of manna that descends again is the very bread from heaven Yahuah rained on Israel through Moses.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar29_lookup sv, _session412_2bar29_lookup tv
 WHERE t.slug='2-baruch-29-the-treasury-of-manna-descends-again'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 6:31 — *Our fathers did eat manna in the desert; as it is written, He gave them bread from heaven to eat.* The manna that comes down again at the consummation is the bread from heaven the fathers ate, which the Messiah takes up as the sign of Himself.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar29_lookup sv, _session412_2bar29_lookup tv
 WHERE t.slug='2-baruch-29-the-treasury-of-manna-descends-again'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 6:35 — *And Yahusha (Jesus) said unto them, I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst.* The descending manna of the Messiah''s years finds its substance in the Anointed Himself, the bread of life on whom the saved feed and never hunger.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar29_lookup sv, _session412_2bar29_lookup tv
 WHERE t.slug='2-baruch-29-the-treasury-of-manna-descends-again'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=29 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_30.sql (session412 2-baruch 30) -----
-- Source anchor: pseudepigrapha/2-baruch ch30. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar30 (view _session412_2bar30_lookup). Sort band base 84725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar30_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-30-the-messiah-returns-in-glory
  ('pseudepigrapha', '2-baruch', 30, 1, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* The Messiah returning in glory when His advent is fulfilled is Daniel''s Son of Adam coming with the clouds to receive dominion.'),
  ('pseudepigrapha', '2-baruch', 30, 1, 'canon', 'matthew', 24, 30, 'free', E'Matthew 24:30 — *And then shall appear the sign of the Son of Adam in heaven: and then shall all the tribes of the earth mourn, and they shall see the Son of Adam coming in the clouds of heaven with power and great glory.* That the Messiah shall return in glory is the Messiah''s own promise to come in the clouds with power and great glory.'),
  -- thread: 2-baruch-30-all-who-fallen-asleep-in-hope-shall-rise
  ('pseudepigrapha', '2-baruch', 30, 2, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* That all who fell asleep in hope of Him shall rise again is Daniel''s awakening of them that sleep in the dust to everlasting life.'),
  ('pseudepigrapha', '2-baruch', 30, 2, 'canon', '1-corinthians', 15, 23, 'free', E'1 Corinthians 15:23 — *But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* The sleepers who rise when the Messiah returns are Paul''s order of resurrection — they that are Messiah''s, raised at His coming.'),
  ('pseudepigrapha', '2-baruch', 30, 2, 'canon', '1-thessalonians', 4, 16, 'free', E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first.* That those asleep in hope of Him rise again at His glorious return is Paul''s word that at the descent from heaven the dead in Messiah rise first.'),
  ('pseudepigrapha', '2-baruch', 30, 2, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice.* The rising of all who slept in hope is the hour the Messiah named, when all in the graves shall hear His voice and come forth.'),
  -- thread: 2-baruch-30-the-treasuries-of-souls-opened
  ('pseudepigrapha', '2-baruch', 30, 2, 'canon', 'revelation', 20, 4, 'free', E'Revelation 20:4 — *And I saw thrones, and they sat upon them, and judgment was given unto them: and I saw the souls of them that were beheaded for the witness of Yahusha (Jesus)... and they lived and reigned with Messiah (Christ) a thousand years.* The treasuries opened to bring forth the souls of the righteous are John''s souls of the faithful who live and reign with the Messiah in the first resurrection.'),
  ('pseudepigrapha', '2-baruch', 30, 2, 'canon', 'revelation', 20, 6, 'free', E'Revelation 20:6 — *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years.* The righteous souls that come forth rejoicing, first and last together, are those John calls blessed in the first resurrection, untouched by the second death.'),
  ('pseudepigrapha', '2-baruch', 30, 2, 'canon', 'john', 5, 29, 'free', E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The righteous souls coming forth from the opened treasuries are the Messiah''s resurrection of life for them that have done good.'),
  -- thread: 2-baruch-30-the-souls-of-the-wicked-waste-away
  ('pseudepigrapha', '2-baruch', 30, 4, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* That the souls of the wicked waste away the more when they behold these things is Daniel''s awakening of some to shame and everlasting contempt.'),
  ('pseudepigrapha', '2-baruch', 30, 4, 'canon', 'john', 5, 29, 'free', E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The wicked wasting away as their torment comes is the Messiah''s resurrection of damnation for them that have done evil.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar30_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar30_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-30-the-messiah-returns-in-glory',
       E'When the advent of the Messiah is fulfilled, He returns in glory',
       E'After the Messiah''s appointed reign, *when the time of the advent of the Messiah is fulfilled... He shall return in glory* (2 Baruch 30:1). This is the Son of Adam coming as Daniel saw, *behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13), the very return the Messiah promised, *they shall see the Son of Adam coming in the clouds of heaven with power and great glory* (Matthew 24:30). It ain''t new — the Anointed who returns in glory is Daniel''s Son of Adam given everlasting dominion.',
       sv.verse_id, ev.verse_id, 'extras', 84725
  FROM _session412_2bar30_lookup sv, _session412_2bar30_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=30 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-30-all-who-fallen-asleep-in-hope-shall-rise',
       E'All who have fallen asleep in hope of Him shall rise again',
       E'At His return the dead in hope are raised: *Then all who have fallen asleep in hope of Him shall rise again* (2 Baruch 30:2). This is the resurrection Daniel foretold, *many of them that sleep in the dust of the earth shall awake* (Daniel 12:2), the order Paul set in the Messiah, *as in Adam all die, even so in Messiah shall all be made alive... they that are Messiah''s at his coming* (1 Corinthians 15:22-23), and the rising at the descent from heaven, *the dead in Messiah shall rise first* (1 Thessalonians 4:16). It ain''t new — those who sleep in hope and wake at His coming are Daniel''s awakened dust and Paul''s first-raised in the Messiah.',
       sv.verse_id, ev.verse_id, 'extras', 84728
  FROM _session412_2bar30_lookup sv, _session412_2bar30_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=30 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-30-the-treasuries-of-souls-opened',
       E'The treasuries of the souls of the righteous are opened',
       E'The hidden store of the faithful dead is unsealed: *the treasuries will be opened in which is preserved the number of the souls of the righteous, and they shall come forth* (2 Baruch 30:2). John saw those souls reign in the first resurrection, *I saw the souls of them that were beheaded for the witness of Yahusha... and they lived and reigned with Messiah a thousand years* (Revelation 20:4), the rising unto life the Messiah named, *they that have done good, unto the resurrection of life* (John 5:29). It ain''t new — the treasuries of righteous souls opened at the end are the first resurrection unto life John and the Messiah proclaimed.',
       sv.verse_id, ev.verse_id, 'extras', 84731
  FROM _session412_2bar30_lookup sv, _session412_2bar30_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=30 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-30-the-souls-of-the-wicked-waste-away',
       E'The souls of the wicked shall waste away the more',
       E'Over against the joy of the righteous stands the dread of the wicked: *the souls of the wicked, when they behold all these things, shall then waste away the more. For they shall know that their torment has come* (2 Baruch 30:4-5). This is the second half of Daniel''s awakening, *some to shame and everlasting contempt* (Daniel 12:2), and the Messiah''s resurrection of judgment, *they that have done evil, unto the resurrection of damnation* (John 5:29). It ain''t new — the wasting of the wicked at the resurrection is Daniel''s everlasting contempt and the Messiah''s resurrection of damnation.',
       sv.verse_id, ev.verse_id, 'extras', 84734
  FROM _session412_2bar30_lookup sv, _session412_2bar30_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=30 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-30-the-messiah-returns-in-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* The Messiah returning in glory when His advent is fulfilled is Daniel''s Son of Adam coming with the clouds to receive dominion.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar30_lookup sv, _session412_2bar30_lookup tv
 WHERE t.slug='2-baruch-30-the-messiah-returns-in-glory'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:30 — *And then shall appear the sign of the Son of Adam in heaven: and then shall all the tribes of the earth mourn, and they shall see the Son of Adam coming in the clouds of heaven with power and great glory.* That the Messiah shall return in glory is the Messiah''s own promise to come in the clouds with power and great glory.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar30_lookup sv, _session412_2bar30_lookup tv
 WHERE t.slug='2-baruch-30-the-messiah-returns-in-glory'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-30-all-who-fallen-asleep-in-hope-shall-rise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* That all who fell asleep in hope of Him shall rise again is Daniel''s awakening of them that sleep in the dust to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar30_lookup sv, _session412_2bar30_lookup tv
 WHERE t.slug='2-baruch-30-all-who-fallen-asleep-in-hope-shall-rise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:23 — *But every man in his own order: Messiah (Christ) the firstfruits; afterward they that are Messiah''s (Christ''s) at his coming.* The sleepers who rise when the Messiah returns are Paul''s order of resurrection — they that are Messiah''s, raised at His coming.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar30_lookup sv, _session412_2bar30_lookup tv
 WHERE t.slug='2-baruch-30-all-who-fallen-asleep-in-hope-shall-rise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Thessalonians 4:16 — *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first.* That those asleep in hope of Him rise again at His glorious return is Paul''s word that at the descent from heaven the dead in Messiah rise first.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar30_lookup sv, _session412_2bar30_lookup tv
 WHERE t.slug='2-baruch-30-all-who-fallen-asleep-in-hope-shall-rise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice.* The rising of all who slept in hope is the hour the Messiah named, when all in the graves shall hear His voice and come forth.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar30_lookup sv, _session412_2bar30_lookup tv
 WHERE t.slug='2-baruch-30-all-who-fallen-asleep-in-hope-shall-rise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-30-the-treasuries-of-souls-opened
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:4 — *And I saw thrones, and they sat upon them, and judgment was given unto them: and I saw the souls of them that were beheaded for the witness of Yahusha (Jesus)... and they lived and reigned with Messiah (Christ) a thousand years.* The treasuries opened to bring forth the souls of the righteous are John''s souls of the faithful who live and reign with the Messiah in the first resurrection.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar30_lookup sv, _session412_2bar30_lookup tv
 WHERE t.slug='2-baruch-30-the-treasuries-of-souls-opened'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:6 — *Blessed and holy is he that hath part in the first resurrection: on such the second death hath no power, but they shall be priests of Elohim (God) and of Messiah (Christ), and shall reign with him a thousand years.* The righteous souls that come forth rejoicing, first and last together, are those John calls blessed in the first resurrection, untouched by the second death.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar30_lookup sv, _session412_2bar30_lookup tv
 WHERE t.slug='2-baruch-30-the-treasuries-of-souls-opened'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The righteous souls coming forth from the opened treasuries are the Messiah''s resurrection of life for them that have done good.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar30_lookup sv, _session412_2bar30_lookup tv
 WHERE t.slug='2-baruch-30-the-treasuries-of-souls-opened'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-30-the-souls-of-the-wicked-waste-away
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* That the souls of the wicked waste away the more when they behold these things is Daniel''s awakening of some to shame and everlasting contempt.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar30_lookup sv, _session412_2bar30_lookup tv
 WHERE t.slug='2-baruch-30-the-souls-of-the-wicked-waste-away'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation.* The wicked wasting away as their torment comes is the Messiah''s resurrection of damnation for them that have done evil.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar30_lookup sv, _session412_2bar30_lookup tv
 WHERE t.slug='2-baruch-30-the-souls-of-the-wicked-waste-away'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_31.sql (session412 2-baruch 31) -----
-- Source anchor: pseudepigrapha/2-baruch ch31. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar31 (view _session412_2bar31_lookup). Sort band base 84750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar31_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-31-forget-not-zion
  ('pseudepigrapha', '2-baruch', 31, 4, 'canon', 'deuteronomy', 30, 1, 'free', E'Deuteronomy 30:1 — *thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee* — the loss is to be remembered, not forgotten, so it may turn the heart back.'),
  ('pseudepigrapha', '2-baruch', 31, 4, 'canon', 'psalms', 74, 2, 'free', E'Psalm 74:2 — *Remember thy congregation, which thou hast purchased of old... this mount Zion, wherein thou hast dwelt* — the same plea to hold Zion in remembrance amid its desolation.'),
  -- thread: 2-baruch-31-all-shall-be-as-though-it-had-not-been
  ('pseudepigrapha', '2-baruch', 31, 5, 'canon', 'deuteronomy', 30, 20, 'free', E'Deuteronomy 30:20 — *for he is thy life, and the length of thy days* — when all that is becomes corruption, Yahuah and his law remain the abiding portion.'),
  ('pseudepigrapha', '2-baruch', 31, 5, 'canon', 'psalms', 119, 89, 'free', E'Psalm 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven* — the word stands though everything that is passes away.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar31_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar31_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-31-forget-not-zion',
       E'Forget not Zion, hold the anguish in remembrance',
       E'Baruch gathers the elders and charges them, *Hear, O Yashar''el (Israel)... Forget not Zion, But hold in remembrance the anguish of Jerusalem.* He sets the chastening of the city before their hearts so that the loss may turn them, not break them. It ain''t new — Moses already bade a scattered people *call them to mind among all the nations* and return, that Yahuah might gather them again.',
       sv.verse_id, ev.verse_id, 'extras', 84750
  FROM _session412_2bar31_lookup sv, _session412_2bar31_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=31 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=31 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-31-all-shall-be-as-though-it-had-not-been',
       E'Everything that is shall become the prey of corruption',
       E'Baruch warns, *For lo! the days come, When everything that is shall become the prey of corruption And be as though it had not been.* The visible order is passing; only what is held fast in Yahuah endures. It ain''t new — the law itself already set life and death before Israel and bade them choose the One who *is thy life, and the length of thy days.*',
       sv.verse_id, ev.verse_id, 'extras', 84753
  FROM _session412_2bar31_lookup sv, _session412_2bar31_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=31 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=31 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-31-forget-not-zion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:1 — *thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee* — the loss is to be remembered, not forgotten, so it may turn the heart back.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar31_lookup sv, _session412_2bar31_lookup tv
 WHERE t.slug='2-baruch-31-forget-not-zion'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 74:2 — *Remember thy congregation, which thou hast purchased of old... this mount Zion, wherein thou hast dwelt* — the same plea to hold Zion in remembrance amid its desolation.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar31_lookup sv, _session412_2bar31_lookup tv
 WHERE t.slug='2-baruch-31-forget-not-zion'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=31 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-31-all-shall-be-as-though-it-had-not-been
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:20 — *for he is thy life, and the length of thy days* — when all that is becomes corruption, Yahuah and his law remain the abiding portion.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar31_lookup sv, _session412_2bar31_lookup tv
 WHERE t.slug='2-baruch-31-all-shall-be-as-though-it-had-not-been'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=31 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven* — the word stands though everything that is passes away.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar31_lookup sv, _session412_2bar31_lookup tv
 WHERE t.slug='2-baruch-31-all-shall-be-as-though-it-had-not-been'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=31 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=89
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_32.sql (session412 2-baruch 32) -----
-- Source anchor: pseudepigrapha/2-baruch ch32. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar32 (view _session412_2bar32_lookup). Sort band base 84775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar32_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-32-sow-the-fruits-of-the-law
  ('pseudepigrapha', '2-baruch', 32, 1, 'canon', 'deuteronomy', 30, 14, 'free', E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* — the law is to be sown in the heart, exactly as Baruch charges.'),
  ('pseudepigrapha', '2-baruch', 32, 1, 'canon', 'psalms', 119, 165, 'free', E'Psalm 119:165 — *Great peace have they which love thy law: and nothing shall offend them* — the law sown in the heart protects in the time of shaking.'),
  -- thread: 2-baruch-32-the-building-shaken-and-renewed
  ('pseudepigrapha', '2-baruch', 32, 4, 'canon', 'haggai', 2, 9, 'free', E'Haggai 2:9 — *The glory of this latter house shall be greater than of the former... and in this place will I give peace* — the rebuilt house renewed in a greater glory.'),
  ('pseudepigrapha', '2-baruch', 32, 6, 'canon', 'haggai', 2, 6, 'free', E'Haggai 2:6 — *Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land* — the Mighty One shaking the whole creation.'),
  ('pseudepigrapha', '2-baruch', 32, 6, 'canon', 'hebrews', 12, 27, 'free', E'Hebrews 12:27 — *Yet once more, signifieth the removing of those things that are shaken... that those things which cannot be shaken may remain* — the shaking that leaves only the abiding kingdom.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar32_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar32_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-32-sow-the-fruits-of-the-law',
       E'Sow in your hearts the fruits of the law',
       E'Baruch''s charge to the people: *if ye prepare your hearts, so as to sow in them the fruits of the law, it shall protect you in that time in which the Mighty One is to shake the whole creation.* The Torah is the shelter when all else is shaken. It ain''t new — the law was never far off but *very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it,* and great is the peace of them that love it.',
       sv.verse_id, ev.verse_id, 'extras', 84775
  FROM _session412_2bar32_lookup sv, _session412_2bar32_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=32 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=32 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-32-the-building-shaken-and-renewed',
       E'The building shaken, rebuilt, and renewed in glory',
       E'Baruch foretells, *the building of Zion will be shaken in order that it may be built again. But that building will not remain... And afterwards it must be renewed in glory, and perfected for evermore.* The present house is not the abiding one; a greater glory is appointed. It ain''t new — Haggai already promised *The glory of this latter house shall be greater than of the former,* and the Mighty One who *shake the heavens, and the earth* leaves standing only the things which cannot be shaken.',
       sv.verse_id, ev.verse_id, 'extras', 84778
  FROM _session412_2bar32_lookup sv, _session412_2bar32_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=32 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=32 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-32-sow-the-fruits-of-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* — the law is to be sown in the heart, exactly as Baruch charges.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar32_lookup sv, _session412_2bar32_lookup tv
 WHERE t.slug='2-baruch-32-sow-the-fruits-of-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:165 — *Great peace have they which love thy law: and nothing shall offend them* — the law sown in the heart protects in the time of shaking.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar32_lookup sv, _session412_2bar32_lookup tv
 WHERE t.slug='2-baruch-32-sow-the-fruits-of-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=165
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-32-the-building-shaken-and-renewed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Haggai 2:9 — *The glory of this latter house shall be greater than of the former... and in this place will I give peace* — the rebuilt house renewed in a greater glory.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar32_lookup sv, _session412_2bar32_lookup tv
 WHERE t.slug='2-baruch-32-the-building-shaken-and-renewed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=32 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Haggai 2:6 — *Yet once, it is a little while, and I will shake the heavens, and the earth, and the sea, and the dry land* — the Mighty One shaking the whole creation.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar32_lookup sv, _session412_2bar32_lookup tv
 WHERE t.slug='2-baruch-32-the-building-shaken-and-renewed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=32 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 12:27 — *Yet once more, signifieth the removing of those things that are shaken... that those things which cannot be shaken may remain* — the shaking that leaves only the abiding kingdom.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar32_lookup sv, _session412_2bar32_lookup tv
 WHERE t.slug='2-baruch-32-the-building-shaken-and-renewed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=32 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_34.sql (session412 2-baruch 34) -----
-- Source anchor: pseudepigrapha/2-baruch ch34. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar34 (view _session412_2bar34_lookup). Sort band base 84825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar34_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-34-into-the-holy-of-holies-to-inquire
  ('pseudepigrapha', '2-baruch', 34, 1, 'canon', 'psalms', 74, 1, 'free', E'Psalm 74:1 — *O Elohim (God), why hast thou cast us off for ever? why doth thine anger smoke against the sheep of thy pasture?* — the inquiry of the Mighty One over a desolate Zion.'),
  ('pseudepigrapha', '2-baruch', 34, 1, 'canon', 'psalms', 74, 2, 'free', E'Psalm 74:2 — *Remember thy congregation... this mount Zion, wherein thou hast dwelt* — pleading with Yahuah concerning Zion from the ruined holy place.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar34_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar34_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-34-into-the-holy-of-holies-to-inquire',
       E'I will go unto the Holy of Holies to inquire',
       E'Baruch reassures the people he will not forsake them, *but I will only go unto the Holy of Holies to inquire of the Mighty One concerning you and concerning Zion.* He seeks the word of Yahuah at the most holy place over the fate of his people. It ain''t new — when the sanctuary lay desolate, Asaph''s psalm cried from the same wreckage, *O Elohim (God), why hast thou cast us off for ever?... Remember thy congregation.*',
       sv.verse_id, ev.verse_id, 'extras', 84825
  FROM _session412_2bar34_lookup sv, _session412_2bar34_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=34 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=34 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-34-into-the-holy-of-holies-to-inquire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 74:1 — *O Elohim (God), why hast thou cast us off for ever? why doth thine anger smoke against the sheep of thy pasture?* — the inquiry of the Mighty One over a desolate Zion.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar34_lookup sv, _session412_2bar34_lookup tv
 WHERE t.slug='2-baruch-34-into-the-holy-of-holies-to-inquire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=34 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 74:2 — *Remember thy congregation... this mount Zion, wherein thou hast dwelt* — pleading with Yahuah concerning Zion from the ruined holy place.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar34_lookup sv, _session412_2bar34_lookup tv
 WHERE t.slug='2-baruch-34-into-the-holy-of-holies-to-inquire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=34 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_35.sql (session412 2-baruch 35) -----
-- Source anchor: pseudepigrapha/2-baruch ch35. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar35 (view _session412_2bar35_lookup). Sort band base 84850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar35_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-35-o-that-mine-eyes-were-springs
  ('pseudepigrapha', '2-baruch', 35, 3, 'canon', 'lamentations', 1, 1, 'free', E'Lamentations 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow!* — the same mourning over a desolate Jerusalem.'),
  ('pseudepigrapha', '2-baruch', 35, 2, 'canon', 'lamentations', 1, 2, 'free', E'Lamentations 1:2 — *She weepeth sore in the night, and her tears are on her cheeks* — the city''s unceasing weeping that Baruch makes his own.'),
  -- thread: 2-baruch-35-where-the-high-priest-offered
  ('pseudepigrapha', '2-baruch', 35, 5, 'canon', 'psalms', 74, 7, 'free', E'Psalm 74:7 — *They have cast fire into thy sanctuary, they have defiled by casting down the dwelling place of thy name to the ground* — the holy place of sacrifice laid in the dust.'),
  ('pseudepigrapha', '2-baruch', 35, 4, 'canon', 'psalms', 74, 3, 'free', E'Psalm 74:3 — *Lift up thy feet unto the perpetual desolations; even all that the enemy hath done wickedly in the sanctuary* — the desolation of the place where the priest once offered.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar35_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar35_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-35-o-that-mine-eyes-were-springs',
       E'O that mine eyes were a fount of tears for Zion',
       E'Baruch sits upon the ruins and weeps: *O that mine eyes were springs, And mine eyelids a fount of tears. For how shall I lament for Zion, And how shall I mourn for Jerusalem?* He grieves the city sitting solitary and the priesthood undone. It ain''t new — the prophet''s lament already wept, *How doth the city sit solitary, that was full of people!* and longed that his eyes might be a fountain of tears.',
       sv.verse_id, ev.verse_id, 'extras', 84850
  FROM _session412_2bar35_lookup sv, _session412_2bar35_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=35 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=35 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-35-where-the-high-priest-offered',
       E'Where the high priest offered, now dust and sand',
       E'Baruch laments the very spot: *in that place where I am now prostrate, Of old the high priest offered holy sacrifices, And placed thereon an incense of fragrant odours. But now our glorying has been made into dust.* The altar of incense is silenced and the sanctuary defiled. It ain''t new — Asaph''s psalm already cried from the burned sanctuary, *They have cast fire into thy sanctuary, they have defiled by casting down the dwelling place of thy name to the ground.*',
       sv.verse_id, ev.verse_id, 'extras', 84853
  FROM _session412_2bar35_lookup sv, _session412_2bar35_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=35 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=35 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-35-o-that-mine-eyes-were-springs
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lamentations 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow!* — the same mourning over a desolate Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar35_lookup sv, _session412_2bar35_lookup tv
 WHERE t.slug='2-baruch-35-o-that-mine-eyes-were-springs'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=35 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 1:2 — *She weepeth sore in the night, and her tears are on her cheeks* — the city''s unceasing weeping that Baruch makes his own.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar35_lookup sv, _session412_2bar35_lookup tv
 WHERE t.slug='2-baruch-35-o-that-mine-eyes-were-springs'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=35 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-35-where-the-high-priest-offered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 74:7 — *They have cast fire into thy sanctuary, they have defiled by casting down the dwelling place of thy name to the ground* — the holy place of sacrifice laid in the dust.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar35_lookup sv, _session412_2bar35_lookup tv
 WHERE t.slug='2-baruch-35-where-the-high-priest-offered'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=35 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 74:3 — *Lift up thy feet unto the perpetual desolations; even all that the enemy hath done wickedly in the sanctuary* — the desolation of the place where the priest once offered.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar35_lookup sv, _session412_2bar35_lookup tv
 WHERE t.slug='2-baruch-35-where-the-high-priest-offered'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=35 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_36.sql (session412 2-baruch 36) -----
-- Source anchor: pseudepigrapha/2-baruch ch36. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar36 (view _session412_2bar36_lookup). Sort band base 84875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar36_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-36-the-forest-of-the-kingdoms
  ('pseudepigrapha', '2-baruch', 36, 4, 'canon', 'daniel', 2, 34, 'free', E'Daniel 2:34 — *a stone was cut out without hands, which smote the image upon his feet... and brake them to pieces* — the kingdoms overthrown by a power not raised up by man.'),
  ('pseudepigrapha', '2-baruch', 36, 5, 'canon', 'daniel', 2, 35, 'free', E'Daniel 2:35 — *the stone that smote the image became a great mountain, and filled the whole earth* — the rising power that prevails over the whole forest of kingdoms.'),
  ('pseudepigrapha', '2-baruch', 36, 2, 'canon', 'daniel', 7, 17, 'free', E'Daniel 7:17 — *These great beasts, which are four, are four kings, which shall arise out of the earth* — the forest and its mountains as the succession of earthly kingdoms.'),
  -- thread: 2-baruch-36-the-vine-and-the-fountain
  ('pseudepigrapha', '2-baruch', 36, 3, 'canon', 'psalms', 80, 8, 'free', E'Psalm 80:8 — *Thou hast brought a vine out of Egypt: thou hast cast out the heathen, and planted it* — the vine as Yahuah''s own planting set over against the nations.'),
  ('pseudepigrapha', '2-baruch', 36, 6, 'canon', 'psalms', 80, 15, 'free', E'Psalm 80:15 — *the vineyard which thy right hand hath planted, and the branch that thou madest strong for thyself* — the vine that comes in peace, made strong by Yahuah.'),
  ('pseudepigrapha', '2-baruch', 36, 3, 'canon', 'ezekiel', 17, 6, 'free', E'Ezekiel 17:6 — *it became a vine, and brought forth branches, and shot forth sprigs* — the prophet''s vine-and-cedar riddle set before the house of Israel.'),
  -- thread: 2-baruch-36-the-last-cedar-cast-down
  ('pseudepigrapha', '2-baruch', 36, 7, 'canon', 'daniel', 7, 8, 'free', E'Daniel 7:8 — *there came up among them another little horn... and a mouth speaking great things* — the last ruler of wickedness, the cedar that uplifted itself.'),
  ('pseudepigrapha', '2-baruch', 36, 9, 'canon', 'daniel', 7, 11, 'free', E'Daniel 7:11 — *I beheld even till the beast was slain, and his body destroyed, and given to the burning flame* — the cedar''s hour come, cast down to become dust.'),
  ('pseudepigrapha', '2-baruch', 36, 10, 'canon', 'ezekiel', 17, 24, 'free', E'Ezekiel 17:24 — *I Yahuah (LORD) have brought down the high tree, have exalted the low tree* — the proud cedar humbled and the lowly vine exalted by Yahuah''s hand.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar36_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar36_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-36-the-forest-of-the-kingdoms',
       E'The forest, the mountains, and the fountain that overthrew them',
       E'Baruch sees in the night *a forest of trees... and lofty and rugged rocky mountains surrounded it,* and a fountain that *submerged that forest, and suddenly they rooted out the greater part of that forest, and overthrew all the mountains.* The forest of kingdoms is brought low by a power not its own. It ain''t new — Daniel saw the great image of the kingdoms broken to pieces by a stone *cut out without hands,* which *became a great mountain, and filled the whole earth.*',
       sv.verse_id, ev.verse_id, 'extras', 84875
  FROM _session412_2bar36_lookup sv, _session412_2bar36_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=36 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=36 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-36-the-vine-and-the-fountain',
       E'The vine and the fountain that rose against the forest',
       E'*Over against it arose a vine, and from under it there went forth a fountain peacefully,* which overwhelmed the forest and then *began to come with the fountain in peace and great tranquillity.* The vine is Yahuah''s own planting, rising in peace against the kingdoms. It ain''t new — Asaph sang of the vine Yahuah *brought... out of Egypt... and planted it,* and Ezekiel''s parable set a vine and a cedar before the house of Israel.',
       sv.verse_id, ev.verse_id, 'extras', 84878
  FROM _session412_2bar36_lookup sv, _session412_2bar36_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=36 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=36 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-36-the-last-cedar-cast-down',
       E'The one cedar of wickedness, cast down before the vine',
       E'The fountain leaves *nothing of that great forest save one cedar only,* and the vine arraigns it: *Art thou not that cedar which was left of the forest of wickedness, and by whose means wickedness persisted... now thy time has sped and thine hour is come. Do thou also therefore depart, O cedar... and become dust.* The last and harshest ruler is judged and undone. It ain''t new — Daniel saw the fourth beast''s horn *that spake very great things* slain and *given to the burning flame,* its dominion taken away for ever.',
       sv.verse_id, ev.verse_id, 'extras', 84881
  FROM _session412_2bar36_lookup sv, _session412_2bar36_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=36 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=36 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-36-the-forest-of-the-kingdoms
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:34 — *a stone was cut out without hands, which smote the image upon his feet... and brake them to pieces* — the kingdoms overthrown by a power not raised up by man.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar36_lookup sv, _session412_2bar36_lookup tv
 WHERE t.slug='2-baruch-36-the-forest-of-the-kingdoms'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=36 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:35 — *the stone that smote the image became a great mountain, and filled the whole earth* — the rising power that prevails over the whole forest of kingdoms.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar36_lookup sv, _session412_2bar36_lookup tv
 WHERE t.slug='2-baruch-36-the-forest-of-the-kingdoms'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=36 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:17 — *These great beasts, which are four, are four kings, which shall arise out of the earth* — the forest and its mountains as the succession of earthly kingdoms.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar36_lookup sv, _session412_2bar36_lookup tv
 WHERE t.slug='2-baruch-36-the-forest-of-the-kingdoms'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=36 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-36-the-vine-and-the-fountain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 80:8 — *Thou hast brought a vine out of Egypt: thou hast cast out the heathen, and planted it* — the vine as Yahuah''s own planting set over against the nations.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar36_lookup sv, _session412_2bar36_lookup tv
 WHERE t.slug='2-baruch-36-the-vine-and-the-fountain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=36 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 80:15 — *the vineyard which thy right hand hath planted, and the branch that thou madest strong for thyself* — the vine that comes in peace, made strong by Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar36_lookup sv, _session412_2bar36_lookup tv
 WHERE t.slug='2-baruch-36-the-vine-and-the-fountain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=36 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 17:6 — *it became a vine, and brought forth branches, and shot forth sprigs* — the prophet''s vine-and-cedar riddle set before the house of Israel.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar36_lookup sv, _session412_2bar36_lookup tv
 WHERE t.slug='2-baruch-36-the-vine-and-the-fountain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=36 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=17 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-36-the-last-cedar-cast-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:8 — *there came up among them another little horn... and a mouth speaking great things* — the last ruler of wickedness, the cedar that uplifted itself.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar36_lookup sv, _session412_2bar36_lookup tv
 WHERE t.slug='2-baruch-36-the-last-cedar-cast-down'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=36 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:11 — *I beheld even till the beast was slain, and his body destroyed, and given to the burning flame* — the cedar''s hour come, cast down to become dust.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar36_lookup sv, _session412_2bar36_lookup tv
 WHERE t.slug='2-baruch-36-the-last-cedar-cast-down'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=36 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 17:24 — *I Yahuah (LORD) have brought down the high tree, have exalted the low tree* — the proud cedar humbled and the lowly vine exalted by Yahuah''s hand.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar36_lookup sv, _session412_2bar36_lookup tv
 WHERE t.slug='2-baruch-36-the-last-cedar-cast-down'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=36 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=17 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_37.sql (session412 2-baruch 37) -----
-- Source anchor: pseudepigrapha/2-baruch ch37. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar37 (view _session412_2bar37_lookup). Sort band base 84900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar37_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-37-the-cedar-burning-the-vine-growing
  ('pseudepigrapha', '2-baruch', 37, 1, 'canon', 'isaiah', 11, 4, 'free', E'Isaiah 11:4 — *he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* — the Anointed''s word that consumes the burning cedar.'),
  ('pseudepigrapha', '2-baruch', 37, 1, 'canon', '2-thessalonians', 2, 8, 'free', E'2 Thessalonians 2:8 — *whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* — the last wicked one burned away before the reign that grows in peace.'),
  ('pseudepigrapha', '2-baruch', 37, 1, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *his dominion is an everlasting dominion, which shall not pass away* — the vine growing with unfading flowers, the Anointed''s enduring kingdom.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar37_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar37_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-37-the-cedar-burning-the-vine-growing',
       E'The cedar burning, the vine growing, the plain in flower',
       E'The vision closes: *I saw that cedar burning, and the vine growing, itself and all around it, the plain full of unfading flowers.* The last wicked ruler is consumed and the Anointed''s dominion springs up in unfading peace. It ain''t new — Isaiah foretold the Branch who would *smite the earth with the rod of his mouth, and with the breath of his lips... slay the wicked,* and the apostle saw that Wicked one *consume with the spirit of his mouth.*',
       sv.verse_id, ev.verse_id, 'extras', 84900
  FROM _session412_2bar37_lookup sv, _session412_2bar37_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=37 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=37 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-37-the-cedar-burning-the-vine-growing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:4 — *he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* — the Anointed''s word that consumes the burning cedar.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar37_lookup sv, _session412_2bar37_lookup tv
 WHERE t.slug='2-baruch-37-the-cedar-burning-the-vine-growing'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=37 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Thessalonians 2:8 — *whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* — the last wicked one burned away before the reign that grows in peace.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar37_lookup sv, _session412_2bar37_lookup tv
 WHERE t.slug='2-baruch-37-the-cedar-burning-the-vine-growing'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=37 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:14 — *his dominion is an everlasting dominion, which shall not pass away* — the vine growing with unfading flowers, the Anointed''s enduring kingdom.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar37_lookup sv, _session412_2bar37_lookup tv
 WHERE t.slug='2-baruch-37-the-cedar-burning-the-vine-growing'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=37 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_38.sql (session412 2-baruch 38) -----
-- Source anchor: pseudepigrapha/2-baruch ch38. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar38 (view _session412_2bar38_lookup). Sort band base 84925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar38_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-38-thy-law-is-life
  ('pseudepigrapha', '2-baruch', 38, 2, 'canon', 'deuteronomy', 30, 20, 'free', E'Deuteronomy 30:20 — *for he is thy life, and the length of thy days* — the law of Yahuah held up as Israel''s very life, just as Baruch confesses.'),
  ('pseudepigrapha', '2-baruch', 38, 2, 'canon', 'psalms', 119, 142, 'free', E'Psalm 119:142 — *thy law is the truth* — the Torah as the right guidance Baruch names wisdom.'),
  ('pseudepigrapha', '2-baruch', 38, 2, 'canon', 'psalms', 119, 105, 'free', E'Psalm 119:105 — *Thy word is a lamp unto my feet, and a light unto my path* — the law as the light that enlightens those led by understanding.'),
  -- thread: 2-baruch-38-my-soul-hath-walked-in-thy-law
  ('pseudepigrapha', '2-baruch', 38, 4, 'canon', 'psalms', 119, 34, 'free', E'Psalm 119:34 — *Give me understanding, and I shall keep thy law; yea, I shall observe it with my whole heart* — the prayer for understanding from one who walks in the law.'),
  ('pseudepigrapha', '2-baruch', 38, 4, 'canon', 'psalms', 119, 51, 'free', E'Psalm 119:51 — *yet have I not declined from thy law* — the lifelong fidelity Baruch claims as he asks for the vision''s meaning.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar38_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar38_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-38-thy-law-is-life',
       E'Thy law is life, and thy wisdom is right guidance',
       E'Baruch prays for the meaning of the vision: *O Yahuah (LORD), my Lord, Thou dost always enlighten those who are led by understanding. Thy law is life, and Thy wisdom is right guidance.* Even before the temple falls, the Torah remains Israel''s life and light. It ain''t new — Moses set the law before Israel as their very life, and the psalmist confessed *thy law is the truth* and *Thy word is a lamp unto my feet.*',
       sv.verse_id, ev.verse_id, 'extras', 84925
  FROM _session412_2bar38_lookup sv, _session412_2bar38_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=38 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=38 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-38-my-soul-hath-walked-in-thy-law',
       E'My soul hath always walked in thy law',
       E'Baruch grounds his plea for understanding in faithfulness: *For Thou knowest that my soul hath always walked in Thy law, and from my (earliest) days I departed not from Thy wisdom.* He asks for revelation as one who has kept the way. It ain''t new — the psalmist likewise pleaded, *Give me understanding, and I shall keep thy law,* binding the asking for light to a life that does not forsake it.',
       sv.verse_id, ev.verse_id, 'extras', 84928
  FROM _session412_2bar38_lookup sv, _session412_2bar38_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=38 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=38 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-38-thy-law-is-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:20 — *for he is thy life, and the length of thy days* — the law of Yahuah held up as Israel''s very life, just as Baruch confesses.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar38_lookup sv, _session412_2bar38_lookup tv
 WHERE t.slug='2-baruch-38-thy-law-is-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:142 — *thy law is the truth* — the Torah as the right guidance Baruch names wisdom.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar38_lookup sv, _session412_2bar38_lookup tv
 WHERE t.slug='2-baruch-38-thy-law-is-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=142
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 119:105 — *Thy word is a lamp unto my feet, and a light unto my path* — the law as the light that enlightens those led by understanding.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar38_lookup sv, _session412_2bar38_lookup tv
 WHERE t.slug='2-baruch-38-thy-law-is-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=38 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=105
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-38-my-soul-hath-walked-in-thy-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 119:34 — *Give me understanding, and I shall keep thy law; yea, I shall observe it with my whole heart* — the prayer for understanding from one who walks in the law.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar38_lookup sv, _session412_2bar38_lookup tv
 WHERE t.slug='2-baruch-38-my-soul-hath-walked-in-thy-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=38 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:51 — *yet have I not declined from thy law* — the lifelong fidelity Baruch claims as he asks for the vision''s meaning.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar38_lookup sv, _session412_2bar38_lookup tv
 WHERE t.slug='2-baruch-38-my-soul-hath-walked-in-thy-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=38 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_39.sql (session412 2-baruch 39) -----
-- Source anchor: pseudepigrapha/2-baruch ch39. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar39 (view _session412_2bar39_lookup). Sort band base 84950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar39_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-39-four-kingdoms-rise-and-fall
  ('pseudepigrapha', '2-baruch', 39, 4, 'canon', 'daniel', 2, 39, 'free', E'Dan 2:39 — *And after thee shall arise another kingdom inferior to thee, and another third kingdom of brass, which shall bear rule over all the earth* — the second and third kingdoms succeeding, as Baruch''s vision counts them off.'),
  ('pseudepigrapha', '2-baruch', 39, 5, 'canon', 'daniel', 2, 40, 'free', E'Dan 2:40 — *And the fourth kingdom shall be strong as iron: forasmuch as iron breaketh in pieces and subdueth all things... shall it break in pieces and bruise* — the harsh fourth kingdom far beyond the rest, the same Baruch names.'),
  ('pseudepigrapha', '2-baruch', 39, 5, 'canon', 'daniel', 7, 7, 'free', E'Dan 7:7 — *behold a fourth beast, dreadful and terrible, and strong exceedingly... it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it* — the fourth beast more evil than all before it, Baruch''s fourth kingdom in Daniel''s other vision.'),
  ('pseudepigrapha', '2-baruch', 39, 3, 'canon', 'daniel', 7, 17, 'free', E'Dan 7:17 — *These great beasts, which are four, are four kings, which shall arise out of the earth* — four kingdoms arising in succession, the frame Baruch''s angel interprets.'),
  -- thread: 2-baruch-39-then-my-messiah-will-be-revealed
  ('pseudepigrapha', '2-baruch', 39, 7, 'canon', 'daniel', 2, 34, 'free', E'Dan 2:34 — *Thou sawest till that a stone was cut out without hands, which smote the image upon his feet that were of iron and clay, and brake them to pieces* — the stone that smites the last kingdom at its hour, as the Messiah roots out the fourth kingdom''s host.'),
  ('pseudepigrapha', '2-baruch', 39, 7, 'canon', 'daniel', 2, 44, 'free', E'Dan 2:44 — *And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall break in pieces and consume all these kingdoms, and it shall stand for ever* — the kingdom revealed at the empires'' end, Baruch''s principate of the Messiah.'),
  ('pseudepigrapha', '2-baruch', 39, 7, 'canon', 'isaiah', 11, 1, 'free', E'Isa 11:1 — *And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* — the shoot of David''s hope, the vine and fountain Baruch sees rise as the Messiah''s principate.'),
  ('pseudepigrapha', '2-baruch', 39, 7, 'canon', 'psalms', 2, 6, 'free', E'Ps 2:6 — *Yet have I set my king upon my holy hill of Zion* — the Anointed installed by the Father, the principate revealed that Baruch names My Messiah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar39_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar39_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-39-four-kingdoms-rise-and-fall',
       E'Four kingdoms rise and fall',
       E'The angel reads the forest-vision as the march of empires: the kingdom that destroyed Zion will be subjected to a second, then *another, a third, will arise, and that also will have dominion for its time, and will be destroyed,* and *after these things a fourth kingdom will arise, whose power will be harsh and evil far beyond those which were before it.* This is Daniel''s image and Daniel''s four beasts told again. It ain''t new — the rise and fall of the four kingdoms was shown to Daniel in Babylon.',
       sv.verse_id, ev.verse_id, 'extras', 84950
  FROM _session412_2bar39_lookup sv, _session412_2bar39_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=39 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=39 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-39-then-my-messiah-will-be-revealed',
       E'Then My Messiah will be revealed',
       E'When the fourth kingdom''s hour of consummation has come, *then the principate of My Messiah will be revealed, which is like the fountain and the vine, and when it is revealed it will root out the multitude of its host.* The vine that rises against the cedar is the Anointed of David''s hope, who comes when the empire is ripe to fall and breaks it in pieces — the stone cut without hands, the everlasting dominion given to the Son of Adam. It ain''t new — that the Anointed is revealed in his season to bring down the last kingdom is Daniel''s stone and Daniel''s Son of Adam.',
       sv.verse_id, ev.verse_id, 'extras', 84953
  FROM _session412_2bar39_lookup sv, _session412_2bar39_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=39 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=39 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-39-four-kingdoms-rise-and-fall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Dan 2:39 — *And after thee shall arise another kingdom inferior to thee, and another third kingdom of brass, which shall bear rule over all the earth* — the second and third kingdoms succeeding, as Baruch''s vision counts them off.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar39_lookup sv, _session412_2bar39_lookup tv
 WHERE t.slug='2-baruch-39-four-kingdoms-rise-and-fall'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=39 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Dan 2:40 — *And the fourth kingdom shall be strong as iron: forasmuch as iron breaketh in pieces and subdueth all things... shall it break in pieces and bruise* — the harsh fourth kingdom far beyond the rest, the same Baruch names.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar39_lookup sv, _session412_2bar39_lookup tv
 WHERE t.slug='2-baruch-39-four-kingdoms-rise-and-fall'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=39 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Dan 7:7 — *behold a fourth beast, dreadful and terrible, and strong exceedingly... it devoured and brake in pieces, and stamped the residue with the feet of it: and it was diverse from all the beasts that were before it* — the fourth beast more evil than all before it, Baruch''s fourth kingdom in Daniel''s other vision.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar39_lookup sv, _session412_2bar39_lookup tv
 WHERE t.slug='2-baruch-39-four-kingdoms-rise-and-fall'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=39 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Dan 7:17 — *These great beasts, which are four, are four kings, which shall arise out of the earth* — four kingdoms arising in succession, the frame Baruch''s angel interprets.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar39_lookup sv, _session412_2bar39_lookup tv
 WHERE t.slug='2-baruch-39-four-kingdoms-rise-and-fall'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=39 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-39-then-my-messiah-will-be-revealed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Dan 2:34 — *Thou sawest till that a stone was cut out without hands, which smote the image upon his feet that were of iron and clay, and brake them to pieces* — the stone that smites the last kingdom at its hour, as the Messiah roots out the fourth kingdom''s host.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar39_lookup sv, _session412_2bar39_lookup tv
 WHERE t.slug='2-baruch-39-then-my-messiah-will-be-revealed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=39 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Dan 2:44 — *And in the days of these kings shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... it shall break in pieces and consume all these kingdoms, and it shall stand for ever* — the kingdom revealed at the empires'' end, Baruch''s principate of the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar39_lookup sv, _session412_2bar39_lookup tv
 WHERE t.slug='2-baruch-39-then-my-messiah-will-be-revealed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=39 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isa 11:1 — *And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* — the shoot of David''s hope, the vine and fountain Baruch sees rise as the Messiah''s principate.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar39_lookup sv, _session412_2bar39_lookup tv
 WHERE t.slug='2-baruch-39-then-my-messiah-will-be-revealed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=39 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ps 2:6 — *Yet have I set my king upon my holy hill of Zion* — the Anointed installed by the Father, the principate revealed that Baruch names My Messiah.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar39_lookup sv, _session412_2bar39_lookup tv
 WHERE t.slug='2-baruch-39-then-my-messiah-will-be-revealed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=39 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_40.sql (session412 2-baruch 40) -----
-- Source anchor: pseudepigrapha/2-baruch ch40. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar40 (view _session412_2bar40_lookup). Sort band base 84975, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar40_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-40-the-last-ruler-brought-to-zion-and-slain
  ('pseudepigrapha', '2-baruch', 40, 2, 'canon', 'isaiah', 11, 4, 'free', E'Isa 11:4 — *he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* — the Anointed putting the impious ruler to death, exactly the deed Baruch''s Messiah does on Zion.'),
  ('pseudepigrapha', '2-baruch', 40, 2, 'canon', '2-thessalonians', 2, 8, 'free', E'2 Thess 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* — the lawless one slain by the Messiah''s word, the same convicting-and-slaying Baruch describes.'),
  ('pseudepigrapha', '2-baruch', 40, 1, 'canon', 'daniel', 7, 11, 'free', E'Dan 7:11 — *I beheld even till the beast was slain, and his body destroyed, and given to the burning flame* — the last ruler convicted and put to death, Baruch''s leader taken up to Zion and slain.'),
  ('pseudepigrapha', '2-baruch', 40, 1, 'canon', 'revelation', 19, 20, 'free', E'Rev 19:20 — *And the beast was taken, and with him the false prophet... These both were cast alive into a lake of fire burning with brimstone* — the last leader taken and his host destroyed, as Baruch''s vision ends.'),
  -- thread: 2-baruch-40-his-principate-will-stand-for-ever
  ('pseudepigrapha', '2-baruch', 40, 3, 'canon', 'daniel', 7, 14, 'free', E'Dan 7:14 — *And there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* — the principate that stands for ever, Baruch''s word for the Messiah''s reign.'),
  ('pseudepigrapha', '2-baruch', 40, 3, 'canon', 'daniel', 7, 27, 'free', E'Dan 7:27 — *whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him* — the enduring kingdom given to the saints under their King, the dominion Baruch says will stand for ever.'),
  ('pseudepigrapha', '2-baruch', 40, 3, 'canon', 'daniel', 2, 44, 'free', E'Dan 2:44 — *shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... and it shall stand for ever* — the kingdom that stands for ever, the very promise Baruch makes of the Messiah''s principate.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar40_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar40_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-40-the-last-ruler-brought-to-zion-and-slain',
       E'The last ruler brought to Zion and slain',
       E'The last leader is left alive when his hosts fall by the sword, and *they will take him up to Mount Zion, and My Messiah will convict him of all his impieties, and will gather and set before him all the works of his hosts. And afterwards he will put him to death.* This is the wicked one slain by the breath of the Messiah''s lips, the beast taken and the kings of the earth judged before the throne. It ain''t new — that the Anointed slays the lawless one with the word of his mouth is Isaiah''s hope and the apostle''s gospel.',
       sv.verse_id, ev.verse_id, 'extras', 84975
  FROM _session412_2bar40_lookup sv, _session412_2bar40_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=40 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=40 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-40-his-principate-will-stand-for-ever',
       E'His principate will stand for ever',
       E'After the wicked ruler is judged, the Messiah will *protect the rest of My people which shall be found in the place which I have chosen,* and *his principate will stand for ever, until the world of corruption is at an end.* The dominion given to the Son of Adam does not pass away — it is the everlasting kingdom set up by the Elohim of heaven that shall never be destroyed. It ain''t new — the everlasting dominion of the Anointed is Daniel''s vision of the Son of Adam.',
       sv.verse_id, ev.verse_id, 'extras', 84978
  FROM _session412_2bar40_lookup sv, _session412_2bar40_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=40 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=40 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-40-the-last-ruler-brought-to-zion-and-slain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isa 11:4 — *he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* — the Anointed putting the impious ruler to death, exactly the deed Baruch''s Messiah does on Zion.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar40_lookup sv, _session412_2bar40_lookup tv
 WHERE t.slug='2-baruch-40-the-last-ruler-brought-to-zion-and-slain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=40 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Thess 2:8 — *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* — the lawless one slain by the Messiah''s word, the same convicting-and-slaying Baruch describes.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar40_lookup sv, _session412_2bar40_lookup tv
 WHERE t.slug='2-baruch-40-the-last-ruler-brought-to-zion-and-slain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=40 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Dan 7:11 — *I beheld even till the beast was slain, and his body destroyed, and given to the burning flame* — the last ruler convicted and put to death, Baruch''s leader taken up to Zion and slain.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar40_lookup sv, _session412_2bar40_lookup tv
 WHERE t.slug='2-baruch-40-the-last-ruler-brought-to-zion-and-slain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Rev 19:20 — *And the beast was taken, and with him the false prophet... These both were cast alive into a lake of fire burning with brimstone* — the last leader taken and his host destroyed, as Baruch''s vision ends.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar40_lookup sv, _session412_2bar40_lookup tv
 WHERE t.slug='2-baruch-40-the-last-ruler-brought-to-zion-and-slain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-40-his-principate-will-stand-for-ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Dan 7:14 — *And there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed* — the principate that stands for ever, Baruch''s word for the Messiah''s reign.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar40_lookup sv, _session412_2bar40_lookup tv
 WHERE t.slug='2-baruch-40-his-principate-will-stand-for-ever'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=40 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Dan 7:27 — *whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him* — the enduring kingdom given to the saints under their King, the dominion Baruch says will stand for ever.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar40_lookup sv, _session412_2bar40_lookup tv
 WHERE t.slug='2-baruch-40-his-principate-will-stand-for-ever'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=40 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Dan 2:44 — *shall the Elohim (God) of heaven set up a kingdom, which shall never be destroyed... and it shall stand for ever* — the kingdom that stands for ever, the very promise Baruch makes of the Messiah''s principate.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar40_lookup sv, _session412_2bar40_lookup tv
 WHERE t.slug='2-baruch-40-his-principate-will-stand-for-ever'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=40 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_41.sql (session412 2-baruch 41) -----
-- Source anchor: pseudepigrapha/2-baruch ch41. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar41 (view _session412_2bar41_lookup). Sort band base 85000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar41_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-41-some-cast-off-the-yoke-some-took-it-up
  ('pseudepigrapha', '2-baruch', 41, 3, 'canon', 'romans', 11, 20, 'free', E'Rom 11:20 — *because of unbelief they were broken off, and thou standest by faith. Be not highminded, but fear* — the natural branches broken off, Baruch''s people who cast off the yoke of the law.'),
  ('pseudepigrapha', '2-baruch', 41, 4, 'canon', 'romans', 11, 17, 'free', E'Rom 11:17 — *And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root and fatness of the olive tree* — the stranger grafted in, Baruch''s refugees fled beneath the wings.'),
  ('pseudepigrapha', '2-baruch', 41, 4, 'canon', 'isaiah', 56, 6, 'free', E'Isa 56:6 — *Also the sons of the stranger, that join themselves to Yahuah (LORD), to serve him... that keepeth the sabbath from polluting it, and taketh hold of my covenant* — the stranger who takes up the covenant, the ones Baruch sees fled for refuge.'),
  ('pseudepigrapha', '2-baruch', 41, 4, 'canon', 'ruth', 1, 16, 'free', E'Ruth 1:16 — *whither thou goest, I will go... thy people shall be my people, and thy Elohim (God) my Elohim (God)* — the outsider fleeing beneath the wings of Israel''s Elohim, Baruch''s refuge picture.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar41_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar41_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-41-some-cast-off-the-yoke-some-took-it-up',
       E'Some cast off the yoke, some took it up',
       E'Baruch asks who will be worthy at that time, for *I see many of Thy people who have withdrawn from Thy covenant, and cast from them the yoke of Thy law. But others again I have seen who have forsaken their vanity, and fled for refuge beneath Thy wings.* Native branches broken off through unbelief, and strangers grafted in who came under the wings of Israel''s Elohim — Paul''s olive tree and Ruth''s confession say the same. It ain''t new — that some are broken off and others taken in is the mercy and severity Moses and the prophets already taught.',
       sv.verse_id, ev.verse_id, 'extras', 85000
  FROM _session412_2bar41_lookup sv, _session412_2bar41_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=41 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=41 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-41-some-cast-off-the-yoke-some-took-it-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Rom 11:20 — *because of unbelief they were broken off, and thou standest by faith. Be not highminded, but fear* — the natural branches broken off, Baruch''s people who cast off the yoke of the law.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar41_lookup sv, _session412_2bar41_lookup tv
 WHERE t.slug='2-baruch-41-some-cast-off-the-yoke-some-took-it-up'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=41 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Rom 11:17 — *And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root and fatness of the olive tree* — the stranger grafted in, Baruch''s refugees fled beneath the wings.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar41_lookup sv, _session412_2bar41_lookup tv
 WHERE t.slug='2-baruch-41-some-cast-off-the-yoke-some-took-it-up'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=41 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isa 56:6 — *Also the sons of the stranger, that join themselves to Yahuah (LORD), to serve him... that keepeth the sabbath from polluting it, and taketh hold of my covenant* — the stranger who takes up the covenant, the ones Baruch sees fled for refuge.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar41_lookup sv, _session412_2bar41_lookup tv
 WHERE t.slug='2-baruch-41-some-cast-off-the-yoke-some-took-it-up'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=41 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ruth 1:16 — *whither thou goest, I will go... thy people shall be my people, and thy Elohim (God) my Elohim (God)* — the outsider fleeing beneath the wings of Israel''s Elohim, Baruch''s refuge picture.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar41_lookup sv, _session412_2bar41_lookup tv
 WHERE t.slug='2-baruch-41-some-cast-off-the-yoke-some-took-it-up'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=41 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_42.sql (session412 2-baruch 42) -----
-- Source anchor: pseudepigrapha/2-baruch ch42. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar42 (view _session412_2bar42_lookup). Sort band base 85025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar42_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-42-those-who-drew-near-and-those-who-withdrew
  ('pseudepigrapha', '2-baruch', 42, 5, 'canon', 'exodus', 12, 48, 'free', E'Exod 12:48 — *And when a stranger shall sojourn with thee, and will keep the passover... let all his males be circumcised, and then let him come near... and he shall be as one that is born in the land* — the stranger drawn near to the separated people, Baruch''s proselytes joined to the covenant.'),
  ('pseudepigrapha', '2-baruch', 42, 5, 'canon', 'exodus', 12, 49, 'free', E'Exod 12:49 — *One law shall be to him that is homeborn, and unto the stranger that sojourneth among you* — one Torah for native and joiner alike, the ground on which Baruch''s withdrawn and drawn-near are weighed.'),
  ('pseudepigrapha', '2-baruch', 42, 4, 'canon', 'isaiah', 56, 3, 'free', E'Isa 56:3 — *Neither let the son of the stranger, that hath joined himself to Yahuah (LORD), speak, saying, Yahuah (LORD) hath utterly separated me from his people* — the joiner not cut off and the apostate not secure, the reckoning Baruch sets out.'),
  ('pseudepigrapha', '2-baruch', 42, 4, 'canon', 'romans', 11, 23, 'free', E'Rom 11:23 — *And they also, if they abide not still in unbelief, shall be graffed in: for Elohim (God) is able to graff them in again* — withdrawal and return both possible, the same weighing of times Baruch describes.'),
  -- thread: 2-baruch-42-the-dust-shall-give-back-what-it-kept
  ('pseudepigrapha', '2-baruch', 42, 8, 'canon', 'daniel', 12, 2, 'free', E'Dan 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the dust commanded to give back its dead, Baruch''s word that the grave must raise up what it kept.'),
  ('pseudepigrapha', '2-baruch', 42, 7, 'canon', 'isaiah', 26, 19, 'free', E'Isa 26:19 — *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust... and the earth shall cast out the dead* — the earth casting out its dead, the very giving-back Baruch commands of the dust.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar42_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar42_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-42-those-who-drew-near-and-those-who-withdrew',
       E'Those who drew near and those who withdrew',
       E'The angel answers Baruch''s question about the apostates and the proselytes: those once subject who *afterwards withdrew and mingled themselves with the seed of mingled peoples,* and those who once knew not but *afterwards knew life, and mingled (only) with the seed of the people which had separated itself.* The stranger may draw near and the native may fall away — but the door is the covenant, kept by the one law for homeborn and sojourner alike. It ain''t new — that one who joins himself to the people keeps the same Torah is the law of the Passover given at the Exodus.',
       sv.verse_id, ev.verse_id, 'extras', 85025
  FROM _session412_2bar42_lookup sv, _session412_2bar42_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=42 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=42 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-42-the-dust-shall-give-back-what-it-kept',
       E'The dust shall give back what it kept',
       E'At the consummation everything is compared by the measure of the times, *for corruption shall take those that belong to it, and life those that belong to it. And the dust shall be called, and there shall be said to it: ''Give back that which is not thine, and raise up all that thou hast kept until its time.''* The grave is no keeper of the righteous — it is commanded to render up the dead it holds. It ain''t new — that the dust gives back its dead and they that sleep awake is the resurrection hope of Daniel.',
       sv.verse_id, ev.verse_id, 'extras', 85028
  FROM _session412_2bar42_lookup sv, _session412_2bar42_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=42 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=42 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-42-those-who-drew-near-and-those-who-withdrew
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exod 12:48 — *And when a stranger shall sojourn with thee, and will keep the passover... let all his males be circumcised, and then let him come near... and he shall be as one that is born in the land* — the stranger drawn near to the separated people, Baruch''s proselytes joined to the covenant.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar42_lookup sv, _session412_2bar42_lookup tv
 WHERE t.slug='2-baruch-42-those-who-drew-near-and-those-who-withdrew'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=42 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exod 12:49 — *One law shall be to him that is homeborn, and unto the stranger that sojourneth among you* — one Torah for native and joiner alike, the ground on which Baruch''s withdrawn and drawn-near are weighed.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar42_lookup sv, _session412_2bar42_lookup tv
 WHERE t.slug='2-baruch-42-those-who-drew-near-and-those-who-withdrew'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=42 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isa 56:3 — *Neither let the son of the stranger, that hath joined himself to Yahuah (LORD), speak, saying, Yahuah (LORD) hath utterly separated me from his people* — the joiner not cut off and the apostate not secure, the reckoning Baruch sets out.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar42_lookup sv, _session412_2bar42_lookup tv
 WHERE t.slug='2-baruch-42-those-who-drew-near-and-those-who-withdrew'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=42 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Rom 11:23 — *And they also, if they abide not still in unbelief, shall be graffed in: for Elohim (God) is able to graff them in again* — withdrawal and return both possible, the same weighing of times Baruch describes.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar42_lookup sv, _session412_2bar42_lookup tv
 WHERE t.slug='2-baruch-42-those-who-drew-near-and-those-who-withdrew'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=42 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-42-the-dust-shall-give-back-what-it-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Dan 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the dust commanded to give back its dead, Baruch''s word that the grave must raise up what it kept.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar42_lookup sv, _session412_2bar42_lookup tv
 WHERE t.slug='2-baruch-42-the-dust-shall-give-back-what-it-kept'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=42 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isa 26:19 — *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust... and the earth shall cast out the dead* — the earth casting out its dead, the very giving-back Baruch commands of the dust.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar42_lookup sv, _session412_2bar42_lookup tv
 WHERE t.slug='2-baruch-42-the-dust-shall-give-back-what-it-kept'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=42 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_43.sql (session412 2-baruch 43) -----
-- Source anchor: pseudepigrapha/2-baruch ch43. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar43 (view _session412_2bar43_lookup). Sort band base 85050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar43_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-43-many-eternal-consolations
  ('pseudepigrapha', '2-baruch', 43, 1, 'canon', '1-peter', 1, 4, 'free', E'1 Pet 1:4 — *To an inheritance incorruptible, and undefiled, and that fadeth not away, reserved in heaven for you* — the eternal consolation laid up beyond corruption, the very hope Baruch is told awaits him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar43_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar43_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-43-many-eternal-consolations',
       E'Many eternal consolations await thee',
       E'The angel bids Baruch fix his heart on what has been shown, *for there are many eternal consolations for thee. For thou shalt depart from this place... and thou shalt forget whatever is corruptible.* The hope set before him is an inheritance that does not fade — kept beyond the reach of corruption. It ain''t new — that an incorruptible inheritance is reserved for the faithful is the apostle Peter''s word.',
       sv.verse_id, ev.verse_id, 'extras', 85050
  FROM _session412_2bar43_lookup sv, _session412_2bar43_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=43 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=43 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-43-many-eternal-consolations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Pet 1:4 — *To an inheritance incorruptible, and undefiled, and that fadeth not away, reserved in heaven for you* — the eternal consolation laid up beyond corruption, the very hope Baruch is told awaits him.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar43_lookup sv, _session412_2bar43_lookup tv
 WHERE t.slug='2-baruch-43-many-eternal-consolations'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=43 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_44.sql (session412 2-baruch 44) -----
-- Source anchor: pseudepigrapha/2-baruch ch44. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar44 (view _session412_2bar44_lookup). Sort band base 85075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar44_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-44-withdraw-not-from-the-way-of-the-law
  ('pseudepigrapha', '2-baruch', 44, 3, 'canon', 'joshua', 1, 8, 'free', E'Josh 1:8 — *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein* — the law not to be withdrawn from, the same charge Baruch lays on his son and the elders.'),
  ('pseudepigrapha', '2-baruch', 44, 3, 'canon', 'deuteronomy', 6, 6, 'free', E'Deut 6:6 — *And these words, which I command thee this day, shall be in thine heart* — the commandments guarded and not forgotten, Baruch''s way of the law admonished to the people who remain.'),
  ('pseudepigrapha', '2-baruch', 44, 7, 'canon', 'deuteronomy', 6, 2, 'free', E'Deut 6:2 — *That thou mightest fear Yahuah Elohayka (the LORD thy God), to keep all his statutes and his commandments... that thy days may be prolonged* — enduring in His fear and keeping the law that the times may turn for good, exactly Baruch''s promise.'),
  -- thread: 2-baruch-44-they-shall-inherit-the-world-to-come
  ('pseudepigrapha', '2-baruch', 44, 14, 'canon', 'psalms', 19, 11, 'free', E'Ps 19:11 — *Moreover by them is thy servant warned: and in keeping of them there is great reward* — great reward bound to keeping the law, the inheritance Baruch gives those who preserved the truth of the law.'),
  ('pseudepigrapha', '2-baruch', 44, 14, 'canon', 'psalms', 19, 7, 'free', E'Ps 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the law that gives wisdom, Baruch''s treasures of wisdom and the truth of the law preserved.'),
  ('pseudepigrapha', '2-baruch', 44, 13, 'canon', 'matthew', 5, 19, 'free', E'Matt 5:19 — *whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* — those who do and teach the commandments inherit greatly, Baruch''s heirs of the world to come who kept the law.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar44_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar44_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-44-withdraw-not-from-the-way-of-the-law',
       E'Withdraw not from the way of the law',
       E'Going the way of all the earth, Baruch charges his son and the elders: *withdraw ye not from the way of the law, but guard and admonish the people which remain, lest they withdraw from the commandments of the Mighty One. For if ye endure and persevere in His fear, and do not forget His law, the times shall change over you for good.* The temple is fallen, yet the Torah abides as Israel''s anchor — not abolished but the one thing to hold fast. It ain''t new — that the law is not to depart and is to be done day and night is the charge to Joshua and the song of David.',
       sv.verse_id, ev.verse_id, 'extras', 85075
  FROM _session412_2bar44_lookup sv, _session412_2bar44_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=44 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=44 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-44-they-shall-inherit-the-world-to-come',
       E'They shall inherit the world to come',
       E'Against the present age that passes Baruch sets the age to come: *these are they who shall inherit that time which has been spoken of... these are they who have acquired for themselves treasures of wisdom... and the truth of the law have they preserved. For to them shall be given the world to come.* The reward of the righteous is bound to the law they kept — its statutes are right and in keeping them there is great reward. It ain''t new — that there is great reward in keeping the law of Yahuah is the song of David.',
       sv.verse_id, ev.verse_id, 'extras', 85078
  FROM _session412_2bar44_lookup sv, _session412_2bar44_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=44 AND sv.verse_number=13
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=44 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-44-withdraw-not-from-the-way-of-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Josh 1:8 — *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do according to all that is written therein* — the law not to be withdrawn from, the same charge Baruch lays on his son and the elders.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar44_lookup sv, _session412_2bar44_lookup tv
 WHERE t.slug='2-baruch-44-withdraw-not-from-the-way-of-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=44 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deut 6:6 — *And these words, which I command thee this day, shall be in thine heart* — the commandments guarded and not forgotten, Baruch''s way of the law admonished to the people who remain.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar44_lookup sv, _session412_2bar44_lookup tv
 WHERE t.slug='2-baruch-44-withdraw-not-from-the-way-of-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=44 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deut 6:2 — *That thou mightest fear Yahuah Elohayka (the LORD thy God), to keep all his statutes and his commandments... that thy days may be prolonged* — enduring in His fear and keeping the law that the times may turn for good, exactly Baruch''s promise.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar44_lookup sv, _session412_2bar44_lookup tv
 WHERE t.slug='2-baruch-44-withdraw-not-from-the-way-of-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=44 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-44-they-shall-inherit-the-world-to-come
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ps 19:11 — *Moreover by them is thy servant warned: and in keeping of them there is great reward* — great reward bound to keeping the law, the inheritance Baruch gives those who preserved the truth of the law.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar44_lookup sv, _session412_2bar44_lookup tv
 WHERE t.slug='2-baruch-44-they-shall-inherit-the-world-to-come'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=44 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ps 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the law that gives wisdom, Baruch''s treasures of wisdom and the truth of the law preserved.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar44_lookup sv, _session412_2bar44_lookup tv
 WHERE t.slug='2-baruch-44-they-shall-inherit-the-world-to-come'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=44 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matt 5:19 — *whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* — those who do and teach the commandments inherit greatly, Baruch''s heirs of the world to come who kept the law.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar44_lookup sv, _session412_2bar44_lookup tv
 WHERE t.slug='2-baruch-44-they-shall-inherit-the-world-to-come'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=44 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_45.sql (session412 2-baruch 45) -----
-- Source anchor: pseudepigrapha/2-baruch ch45. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar45 (view _session412_2bar45_lookup). Sort band base 85100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar45_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-45-teach-them-and-ye-will-quicken-them
  ('pseudepigrapha', '2-baruch', 45, 2, 'canon', 'psalms', 19, 7, 'free', E'Ps 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the law that quickens the soul, the very life Baruch says teaching gives the people.'),
  ('pseudepigrapha', '2-baruch', 45, 2, 'canon', 'deuteronomy', 6, 7, 'free', E'Deut 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house* — the law diligently taught, Baruch''s labour of instructing the people.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar45_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar45_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-45-teach-them-and-ye-will-quicken-them',
       E'Teach them and ye will quicken them',
       E'Baruch lays the work on the elders: *do ye therefore so far as ye are able instruct the people, for that labour is ours. For if ye teach them, ye will quicken them.* To teach the law is to give life — the statutes of Yahuah revive the soul, and they are commanded to be taught diligently to the children. It ain''t new — that the law converts the soul and is to be taught diligently is the song of David and the charge of Moses.',
       sv.verse_id, ev.verse_id, 'extras', 85100
  FROM _session412_2bar45_lookup sv, _session412_2bar45_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=45 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=45 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-45-teach-them-and-ye-will-quicken-them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ps 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the law that quickens the soul, the very life Baruch says teaching gives the people.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar45_lookup sv, _session412_2bar45_lookup tv
 WHERE t.slug='2-baruch-45-teach-them-and-ye-will-quicken-them'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=45 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deut 6:7 — *And thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house* — the law diligently taught, Baruch''s labour of instructing the people.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar45_lookup sv, _session412_2bar45_lookup tv
 WHERE t.slug='2-baruch-45-teach-them-and-ye-will-quicken-them'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=45 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_46.sql (session412 2-baruch 46) -----
-- Source anchor: pseudepigrapha/2-baruch ch46. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar46 (view _session412_2bar46_lookup). Sort band base 85125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar46_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-46-there-shall-not-be-wanting-a-son-of-the-law
  ('pseudepigrapha', '2-baruch', 46, 3, 'canon', 'deuteronomy', 6, 7, 'free', E'Deut 6:7 — *And thou shalt teach them diligently unto thy children... when thou sittest in thine house, and when thou walkest by the way* — the law to be passed on lest it be lost, the lack the elders fear and Baruch answers.'),
  ('pseudepigrapha', '2-baruch', 46, 4, 'canon', 'matthew', 5, 17, 'free', E'Matt 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil* — the law not failing nor passing, Baruch''s son of the law never wanting to Jacob.'),
  -- thread: 2-baruch-46-prepare-your-hearts-to-obey-the-law
  ('pseudepigrapha', '2-baruch', 46, 5, 'canon', 'deuteronomy', 6, 24, 'free', E'Deut 6:24 — *And Yahuah (LORD) commanded us to do all these statutes, to fear Yahuah Eloheinu (the LORD our God), for our good always, that he might preserve us alive* — keeping the law for good and life, Baruch''s good tidings to those who obey.'),
  ('pseudepigrapha', '2-baruch', 46, 6, 'canon', 'psalms', 19, 11, 'free', E'Ps 19:11 — *Moreover by them is thy servant warned: and in keeping of them there is great reward* — good coming to those who keep the commandments, the good tidings Baruch promises hearts prepared to obey.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar46_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar46_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-46-there-shall-not-be-wanting-a-son-of-the-law',
       E'There shall not be wanting a son of the law',
       E'The elders fear that with Baruch gone, *where again shall we seek the law, or who will distinguish for us between death and life?* Baruch answers that the throne of the Mighty One he cannot resist, *nevertheless, there shall not be wanting to Yashar''el a wise man nor a son of the law to the race of Jacob.* The teacher dies, but the law does not fail Israel — it remains the way set before them between death and life. It ain''t new — that the law is set before Israel as life and death, to be chosen and lived, is the charge of Moses.',
       sv.verse_id, ev.verse_id, 'extras', 85125
  FROM _session412_2bar46_lookup sv, _session412_2bar46_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=46 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=46 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-46-prepare-your-hearts-to-obey-the-law',
       E'Prepare your hearts to obey the law',
       E'Baruch''s last charge is plain: *only prepare ye your hearts, that ye may obey the law, and be subject to those who in fear are wise and understanding... for if ye do these things, good tidings shall come unto you.* The hearts set to keep the commandments find good — for fearing Yahuah and keeping His statutes is for the good of the people always. It ain''t new — that obeying the commandments is set before Israel for their good is the word of Moses.',
       sv.verse_id, ev.verse_id, 'extras', 85128
  FROM _session412_2bar46_lookup sv, _session412_2bar46_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=46 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=46 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-46-there-shall-not-be-wanting-a-son-of-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deut 6:7 — *And thou shalt teach them diligently unto thy children... when thou sittest in thine house, and when thou walkest by the way* — the law to be passed on lest it be lost, the lack the elders fear and Baruch answers.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar46_lookup sv, _session412_2bar46_lookup tv
 WHERE t.slug='2-baruch-46-there-shall-not-be-wanting-a-son-of-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=46 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matt 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil* — the law not failing nor passing, Baruch''s son of the law never wanting to Jacob.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar46_lookup sv, _session412_2bar46_lookup tv
 WHERE t.slug='2-baruch-46-there-shall-not-be-wanting-a-son-of-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=46 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-46-prepare-your-hearts-to-obey-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deut 6:24 — *And Yahuah (LORD) commanded us to do all these statutes, to fear Yahuah Eloheinu (the LORD our God), for our good always, that he might preserve us alive* — keeping the law for good and life, Baruch''s good tidings to those who obey.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar46_lookup sv, _session412_2bar46_lookup tv
 WHERE t.slug='2-baruch-46-prepare-your-hearts-to-obey-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=46 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ps 19:11 — *Moreover by them is thy servant warned: and in keeping of them there is great reward* — good coming to those who keep the commandments, the good tidings Baruch promises hearts prepared to obey.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar46_lookup sv, _session412_2bar46_lookup tv
 WHERE t.slug='2-baruch-46-prepare-your-hearts-to-obey-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=46 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_47.sql (session412 2-baruch 47) -----
-- Source anchor: pseudepigrapha/2-baruch ch47. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar47 (view _session412_2bar47_lookup). Sort band base 85150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar47_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-47-to-hebron-i-fasted
  ('pseudepigrapha', '2-baruch', 47, 2, 'canon', 'daniel', 10, 3, 'free', E'Dan 10:3 — *I ate no pleasant bread, neither came flesh nor wine in my mouth, neither did I anoint myself at all, till three whole weeks were fulfilled* — the seer fasts in mourning before the vision is unsealed.'),
  ('pseudepigrapha', '2-baruch', 47, 2, 'canon', 'exodus', 34, 28, 'free', E'Exod 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water* — Moses fasts at the appointed place before the words of the covenant are given.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar47_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar47_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-47-to-hebron-i-fasted',
       E'To Hebron, and there he fasted seven days',
       E'Baruch goes to the place the Mighty One appointed and *fasted seven days* before he is given the great prayer and the answer about the resurrection. The set-apart fast before a word from heaven is the old pattern — Moses on the mount, Daniel mourning three weeks. It ain''t new — the seer humbles himself and waits, and the word comes.',
       sv.verse_id, ev.verse_id, 'extras', 85150
  FROM _session412_2bar47_lookup sv, _session412_2bar47_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=47 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=47 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-47-to-hebron-i-fasted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Dan 10:3 — *I ate no pleasant bread, neither came flesh nor wine in my mouth, neither did I anoint myself at all, till three whole weeks were fulfilled* — the seer fasts in mourning before the vision is unsealed.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar47_lookup sv, _session412_2bar47_lookup tv
 WHERE t.slug='2-baruch-47-to-hebron-i-fasted'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=47 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exod 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water* — Moses fasts at the appointed place before the words of the covenant are given.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar47_lookup sv, _session412_2bar47_lookup tv
 WHERE t.slug='2-baruch-47-to-hebron-i-fasted'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=47 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_48.sql (session412 2-baruch 48) -----
-- Source anchor: pseudepigrapha/2-baruch ch48. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar48 (view _session412_2bar48_lookup). Sort band base 85175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar48_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-48-the-times-stand-before-thee
  ('pseudepigrapha', '2-baruch', 48, 2, 'canon', 'daniel', 2, 21, 'free', E'Dan 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding* — the ages and seasons obey the Most High alone.'),
  ('pseudepigrapha', '2-baruch', 48, 4, 'canon', 'daniel', 7, 10, 'free', E'Dan 7:10 — *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* — the duration of the generations is in His hand.'),
  ('pseudepigrapha', '2-baruch', 48, 3, 'canon', 'psalms', 74, 16, 'free', E'Ps 74:16 — *The day is thine, the night also is thine: thou hast prepared the light and the sun* — He arranges the method of the seasons, and they obey.'),
  -- thread: 2-baruch-48-thou-knowest-the-number
  ('pseudepigrapha', '2-baruch', 48, 5, 'canon', 'job', 38, 4, 'free', E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding* — the LORD answers out of the whirlwind with the very measures Baruch confesses he cannot reach.'),
  ('pseudepigrapha', '2-baruch', 48, 6, 'canon', 'job', 38, 5, 'free', E'Job 38:5 — *Who hath laid the measures thereof, if thou knowest? or who hath stretched the line upon it?* — the limit of the heights and the depths belong to the Maker alone.'),
  ('pseudepigrapha', '2-baruch', 48, 9, 'canon', 'psalms', 104, 4, 'free', E'Ps 104:4 — *Who maketh his angels spirits; his ministers a flaming fire* — the flames change into spirits at His command.'),
  ('pseudepigrapha', '2-baruch', 48, 11, 'canon', 'nehemiah', 9, 6, 'free', E'Neh 9:6 — *thou hast made heaven, the heaven of heavens, with all their host... and thou preservest them all; and the host of heaven worshippeth thee* — the innumerable armies stand and minister before Him.'),
  ('pseudepigrapha', '2-baruch', 48, 9, 'canon', 'romans', 4, 17, 'free', E'Rom 4:17 — *even God, who quickeneth the dead, and calleth those things which be not as though they were* — with a word He quickens that which was not.'),
  -- thread: 2-baruch-48-with-thee-is-the-law-of-life
  ('pseudepigrapha', '2-baruch', 48, 22, 'canon', 'deuteronomy', 30, 20, 'free', E'Deut 30:20 — *for he is thy life, and the length of thy days: that thou mayest dwell in the land* — with Him is the law of life; keeping His statutes is life itself.'),
  ('pseudepigrapha', '2-baruch', 48, 22, 'canon', 'deuteronomy', 30, 11, 'free', E'Deut 30:11 — *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off* — the law is with us, near and able to aid us.'),
  ('pseudepigrapha', '2-baruch', 48, 24, 'canon', 'romans', 7, 12, 'free', E'Rom 7:12 — *Wherefore the law is holy, and the commandment holy, and just, and good* — the one law received from One is no burden but the people''s surpassing wisdom.'),
  ('pseudepigrapha', '2-baruch', 48, 24, 'canon', 'psalms', 119, 89, 'free', E'Ps 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven* — the law amongst us abides; therefore we shall not fall.'),
  -- thread: 2-baruch-48-for-he-is-nothing
  ('pseudepigrapha', '2-baruch', 48, 13, 'canon', 'psalms', 103, 15, 'free', E'Ps 103:15 — *As for man, his days are as grass: as a flower of the field, so he flourisheth* — in a little time are we born and return.'),
  ('pseudepigrapha', '2-baruch', 48, 14, 'canon', 'psalms', 90, 4, 'free', E'Ps 90:4 — *For a thousand years in thy sight are but as yesterday when it is past, and as a watch in the night* — with Thee hours are as a time, and days as generations.'),
  ('pseudepigrapha', '2-baruch', 48, 19, 'canon', 'psalms', 103, 14, 'free', E'Ps 103:14 — *For he knoweth our frame; he remembereth that we are dust* — protect us in Thy compassions, for he is nothing.'),
  -- thread: 2-baruch-48-the-visitation-of-the-times
  ('pseudepigrapha', '2-baruch', 48, 39, 'canon', 'malachi', 4, 1, 'free', E'Mal 4:1 — *behold, the day cometh, that shall burn as an oven... and the day that cometh shall burn them up* — a fire shall consume the thoughts of the proud who knew not His law.'),
  ('pseudepigrapha', '2-baruch', 48, 39, 'canon', 'james', 5, 9, 'free', E'Jas 5:9 — *behold, the judge standeth before the door* — the Judge shall come and will not tarry.'),
  ('pseudepigrapha', '2-baruch', 48, 40, 'canon', 'malachi', 4, 4, 'free', E'Mal 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments* — they perish because they remembered not the law of the Mighty One.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar48_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar48_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-48-the-times-stand-before-thee',
       E'The advent of the times stands before Thee',
       E'Baruch opens his prayer confessing that the Mighty One *summonest the advent of the times, And they stand before Thee*, He *causest the power of the ages to pass away*, and *arrangest the method of the seasons, And they obey Thee*. The Most High alone governs the calendar of the ages — He changes the times and seasons, removes and sets up kings. It ain''t new — the seer prays to the One in whose hand the times are.',
       sv.verse_id, ev.verse_id, 'extras', 85175
  FROM _session412_2bar48_lookup sv, _session412_2bar48_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=48 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-48-thou-knowest-the-number',
       E'Thou knowest, Thou weighest, Thou numberest',
       E'The prayer rises through creation''s measures: *Thou makest known the multitude of the fire, And Thou weighest the lightness of the wind. Thou explorest the limit of the heights, And Thou scrutinizest the depths of the darkness.* With a word He *quickenest that which was not*, and *Armies innumerable stand before Thee And minister in their orders.* This is Job''s whirlwind and the psalmist''s heaven of hosts. It ain''t new — He who numbers the stars and weighs the wind sustains the world by His mercy.',
       sv.verse_id, ev.verse_id, 'extras', 85178
  FROM _session412_2bar48_lookup sv, _session412_2bar48_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=48 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-48-with-thee-is-the-law-of-life',
       E'Thy law is with us — and we shall not fall',
       E'The heart of the prayer: *In Thee do we trust, for lo! Thy law is with us, And we know that we shall not fall so long as we keep Thy statutes... we are all one celebrated people, Who have received one law from One: And the law which is amongst us will aid us.* This is Moses'' own charge — the commandment is not far off, it is life, therefore choose life. It ain''t new — the Torah is Israel''s hope, and the law is holy and just and good.',
       sv.verse_id, ev.verse_id, 'extras', 85181
  FROM _session412_2bar48_lookup sv, _session412_2bar48_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=22
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=48 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-48-for-he-is-nothing',
       E'In a little time are we born — be not wroth with man',
       E'Baruch pleads the frailty of man: *For in a little time are we born, And in a little time do we return. But with Thee hours are as a time, And days as generations. Be not therefore wroth with man; for he is nothing... Protect us in Thy compassions, And in Thy mercy help us.* This is the psalmist''s dust-and-grass and Peter''s thousand years as a day. It ain''t new — short-lived man casts himself on the everlasting mercy.',
       sv.verse_id, ev.verse_id, 'extras', 85184
  FROM _session412_2bar48_lookup sv, _session412_2bar48_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=12
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=48 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-48-the-visitation-of-the-times',
       E'The visitation of the times — when they remembered not the law',
       E'The Mighty One answers with the appointed affliction: *that time shall arise which brings affliction... all the inhabitants of the earth shall be moved one against another, because they know not that My judgement has drawn nigh*, for *they remembered not the law of the Mighty One*, therefore *a fire shall consume their thoughts... For the Judge shall come and will not tarry.* This is the day that burns as an oven and the Judge at the door. It ain''t new — judgment falls because the law was forgotten, not because it passed away.',
       sv.verse_id, ev.verse_id, 'extras', 85187
  FROM _session412_2bar48_lookup sv, _session412_2bar48_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=31
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=48 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-48-the-times-stand-before-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Dan 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding* — the ages and seasons obey the Most High alone.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-the-times-stand-before-thee'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Dan 7:10 — *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* — the duration of the generations is in His hand.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-the-times-stand-before-thee'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ps 74:16 — *The day is thine, the night also is thine: thou hast prepared the light and the sun* — He arranges the method of the seasons, and they obey.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-the-times-stand-before-thee'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-48-thou-knowest-the-number
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding* — the LORD answers out of the whirlwind with the very measures Baruch confesses he cannot reach.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-thou-knowest-the-number'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:5 — *Who hath laid the measures thereof, if thou knowest? or who hath stretched the line upon it?* — the limit of the heights and the depths belong to the Maker alone.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-thou-knowest-the-number'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ps 104:4 — *Who maketh his angels spirits; his ministers a flaming fire* — the flames change into spirits at His command.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-thou-knowest-the-number'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Neh 9:6 — *thou hast made heaven, the heaven of heavens, with all their host... and thou preservest them all; and the host of heaven worshippeth thee* — the innumerable armies stand and minister before Him.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-thou-knowest-the-number'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Rom 4:17 — *even God, who quickeneth the dead, and calleth those things which be not as though they were* — with a word He quickens that which was not.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-thou-knowest-the-number'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-48-with-thee-is-the-law-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deut 30:20 — *for he is thy life, and the length of thy days: that thou mayest dwell in the land* — with Him is the law of life; keeping His statutes is life itself.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-with-thee-is-the-law-of-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deut 30:11 — *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off* — the law is with us, near and able to aid us.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-with-thee-is-the-law-of-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Rom 7:12 — *Wherefore the law is holy, and the commandment holy, and just, and good* — the one law received from One is no burden but the people''s surpassing wisdom.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-with-thee-is-the-law-of-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ps 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven* — the law amongst us abides; therefore we shall not fall.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-with-thee-is-the-law-of-life'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=89
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-48-for-he-is-nothing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ps 103:15 — *As for man, his days are as grass: as a flower of the field, so he flourisheth* — in a little time are we born and return.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-for-he-is-nothing'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ps 90:4 — *For a thousand years in thy sight are but as yesterday when it is past, and as a watch in the night* — with Thee hours are as a time, and days as generations.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-for-he-is-nothing'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=90 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ps 103:14 — *For he knoweth our frame; he remembereth that we are dust* — protect us in Thy compassions, for he is nothing.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-for-he-is-nothing'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-48-the-visitation-of-the-times
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Mal 4:1 — *behold, the day cometh, that shall burn as an oven... and the day that cometh shall burn them up* — a fire shall consume the thoughts of the proud who knew not His law.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-the-visitation-of-the-times'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jas 5:9 — *behold, the judge standeth before the door* — the Judge shall come and will not tarry.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-the-visitation-of-the-times'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Mal 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments* — they perish because they remembered not the law of the Mighty One.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar48_lookup sv, _session412_2bar48_lookup tv
 WHERE t.slug='2-baruch-48-the-visitation-of-the-times'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=48 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_49.sql (session412 2-baruch 49) -----
-- Source anchor: pseudepigrapha/2-baruch ch49. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar49 (view _session412_2bar49_lookup). Sort band base 85200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar49_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-49-in-what-shape-will-the-dead-rise
  ('pseudepigrapha', '2-baruch', 49, 2, 'canon', '1-corinthians', 15, 35, 'free', E'1 Cor 15:35 — *But some man will say, How are the dead raised up? and with what body do they come?* — the identical question: in what shape will the dead live.'),
  ('pseudepigrapha', '2-baruch', 49, 3, 'canon', '1-corinthians', 15, 51, 'free', E'1 Cor 15:51 — *Behold, I shew you a mystery; We shall not all sleep, but we shall all be changed* — these things which have been in the world shall be changed, as Baruch wonders.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar49_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar49_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-49-in-what-shape-will-the-dead-rise',
       E'In what shape will those live in Thy day?',
       E'Baruch asks the very question Paul will frame: *In what shape will those live who live in Thy day? Or how will the splendour of those who (are) after that time continue? Will they then resume this form of the present... Or wilt Thou perchance change these things which have been in the world?* The mocker at Corinth asks the same — how are the dead raised, and with what body? It ain''t new — the question of the resurrection-body was already pressing in Baruch''s mouth.',
       sv.verse_id, ev.verse_id, 'extras', 85200
  FROM _session412_2bar49_lookup sv, _session412_2bar49_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=49 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=49 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-49-in-what-shape-will-the-dead-rise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Cor 15:35 — *But some man will say, How are the dead raised up? and with what body do they come?* — the identical question: in what shape will the dead live.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar49_lookup sv, _session412_2bar49_lookup tv
 WHERE t.slug='2-baruch-49-in-what-shape-will-the-dead-rise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=49 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Cor 15:51 — *Behold, I shew you a mystery; We shall not all sleep, but we shall all be changed* — these things which have been in the world shall be changed, as Baruch wonders.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar49_lookup sv, _session412_2bar49_lookup tv
 WHERE t.slug='2-baruch-49-in-what-shape-will-the-dead-rise'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=49 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_50.sql (session412 2-baruch 50) -----
-- Source anchor: pseudepigrapha/2-baruch ch50. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar50 (view _session412_2bar50_lookup). Sort band base 85225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar50_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-50-the-earth-shall-restore-the-dead
  ('pseudepigrapha', '2-baruch', 50, 2, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *the hour is coming, in the which all that are in the graves shall hear his voice* — the earth restores the dead it received.'),
  ('pseudepigrapha', '2-baruch', 50, 4, 'canon', 'john', 5, 29, 'free', E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation* — they are raised and then judgment grows strong.'),
  ('pseudepigrapha', '2-baruch', 50, 3, 'canon', '1-corinthians', 15, 36, 'free', E'1 Cor 15:36 — *Thou fool, that which thou sowest is not quickened, except it die* — the departed have returned, the sown seed quickened to life again.'),
  ('pseudepigrapha', '2-baruch', 50, 2, 'canon', 'daniel', 12, 2, 'free', E'Dan 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the dust restores both the just and the condemned for judgment.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar50_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar50_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-50-the-earth-shall-restore-the-dead',
       E'The earth shall restore the dead as it received them',
       E'The answer begins: *the earth shall then assuredly restore the dead... It shall make no change in their form, But as it has received, so shall it restore them, And as I delivered them unto it, so also shall it raise them.* The dead first rise in their own recognizable form so that the living may know the dead are alive again. This is Yahusha''s word that all in the graves shall hear his voice and come forth. It ain''t new — the resurrection is bodily, and they that did good rise to life.',
       sv.verse_id, ev.verse_id, 'extras', 85225
  FROM _session412_2bar50_lookup sv, _session412_2bar50_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=50 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-50-the-earth-shall-restore-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 5:28 — *the hour is coming, in the which all that are in the graves shall hear his voice* — the earth restores the dead it received.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar50_lookup sv, _session412_2bar50_lookup tv
 WHERE t.slug='2-baruch-50-the-earth-shall-restore-the-dead'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 5:29 — *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation* — they are raised and then judgment grows strong.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar50_lookup sv, _session412_2bar50_lookup tv
 WHERE t.slug='2-baruch-50-the-earth-shall-restore-the-dead'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=50 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Cor 15:36 — *Thou fool, that which thou sowest is not quickened, except it die* — the departed have returned, the sown seed quickened to life again.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar50_lookup sv, _session412_2bar50_lookup tv
 WHERE t.slug='2-baruch-50-the-earth-shall-restore-the-dead'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=50 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Dan 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the dust restores both the just and the condemned for judgment.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar50_lookup sv, _session412_2bar50_lookup tv
 WHERE t.slug='2-baruch-50-the-earth-shall-restore-the-dead'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=50 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_51.sql (session412 2-baruch 51) -----
-- Source anchor: pseudepigrapha/2-baruch ch51. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar51 (view _session412_2bar51_lookup). Sort band base 85250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar51_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-51-justified-in-my-law-their-splendour-glorified
  ('pseudepigrapha', '2-baruch', 51, 3, 'canon', 'daniel', 12, 3, 'free', E'Dan 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* — the form of their face turned into the light of their beauty.'),
  ('pseudepigrapha', '2-baruch', 51, 3, 'canon', 'matthew', 13, 43, 'free', E'Matt 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear* — the splendour of those justified in His law, glorified.'),
  ('pseudepigrapha', '2-baruch', 51, 3, 'canon', 'psalms', 1, 2, 'free', E'Ps 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* — the root of wisdom planted in the heart is delight in the Torah.'),
  -- thread: 2-baruch-51-transformed-into-the-splendour-of-angels
  ('pseudepigrapha', '2-baruch', 51, 10, 'canon', 'matthew', 22, 30, 'free', E'Matt 22:30 — *For in the resurrection they neither marry, nor are given in marriage, but are as the angels of Elohim (God) in heaven* — they shall be made like unto the angels.'),
  ('pseudepigrapha', '2-baruch', 51, 10, 'canon', '1-corinthians', 15, 41, 'free', E'1 Cor 15:41 — *There is one glory of the sun, and another glory of the moon, and another glory of the stars: for one star differeth from another star in glory* — made equal to the stars, from light into the splendour of glory.'),
  ('pseudepigrapha', '2-baruch', 51, 10, 'canon', '1-corinthians', 15, 40, 'free', E'1 Cor 15:40 — *There are also celestial bodies, and bodies terrestrial: but the glory of the celestial is one, and the glory of the terrestrial is another* — the risen are clothed with the heavenly glory.'),
  ('pseudepigrapha', '2-baruch', 51, 10, 'canon', '1-corinthians', 15, 44, 'free', E'1 Cor 15:44 — *It is sown a natural body; it is raised a spiritual body. There is a natural body, and there is a spiritual body* — changed into every form they desire, into the splendour of glory.'),
  ('pseudepigrapha', '2-baruch', 51, 5, 'canon', '1-corinthians', 15, 52, 'free', E'1 Cor 15:52 — *In a moment, in the twinkling of an eye, at the last trump... the dead shall be raised incorruptible, and we shall be changed* — they shall respectively be transformed at the appointed day.'),
  ('pseudepigrapha', '2-baruch', 51, 3, 'canon', 'philippians', 3, 21, 'free', E'Phil 3:21 — *Who shall change our vile body, that it may be fashioned like unto his glorious body* — the form of their face turned into the splendour of glory.'),
  -- thread: 2-baruch-51-the-image-of-the-heavenly
  ('pseudepigrapha', '2-baruch', 51, 10, 'canon', '1-corinthians', 15, 49, 'free', E'1 Cor 15:49 — *And as we have borne the image of the earthy, we shall also bear the image of the heavenly* — they dwell in the heights of that world, ageless.'),
  ('pseudepigrapha', '2-baruch', 51, 9, 'canon', '1-corinthians', 15, 42, 'free', E'1 Cor 15:42 — *So also is the resurrection of the dead. It is sown in corruption; it is raised in incorruption* — time shall no longer age them.'),
  -- thread: 2-baruch-51-the-law-a-hope-wisdom-a-confidence
  ('pseudepigrapha', '2-baruch', 51, 7, 'canon', 'psalms', 19, 7, 'free', E'Ps 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — to them the law has been a hope and wisdom a confidence.'),
  ('pseudepigrapha', '2-baruch', 51, 4, 'canon', 'romans', 2, 13, 'free', E'Rom 2:13 — *For not the hearers of the law are just before Elohim (God), but the doers of the law shall be justified* — the lost stopped their ears against the law and so were condemned.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar51_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar51_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-51-justified-in-my-law-their-splendour-glorified',
       E'Justified in My law — their splendour glorified',
       E'After the recognizing comes the changing: the glory of *those who have now been justified in My law, who have had understanding in their life, and who have planted in their heart the root of wisdom, then their splendour shall be glorified in changes, and the form of their face shall be turned into the light of their beauty.* The faces of the righteous are turned to light — Daniel''s wise who shine, the just who shine forth as the sun. It ain''t new, and note the ground: justified IN His law, the root of wisdom planted in the heart.',
       sv.verse_id, ev.verse_id, 'extras', 85250
  FROM _session412_2bar51_lookup sv, _session412_2bar51_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=51 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-51-transformed-into-the-splendour-of-angels',
       E'Transformed into the splendour of angels',
       E'The wicked who were once exalted shall see the lowly *exalted and glorified more than they, they shall respectively be transformed, the latter into the splendour of angels, and the former shall yet more waste away.* The righteous *shall be made like unto the angels, And be made equal to the stars, And they shall be changed into every form they desire, From beauty into loveliness, And from light into the splendour of glory.* This is Paul''s celestial body and Yahusha''s word that in the resurrection they are as the angels. It ain''t new — the risen righteous shine like the stars they are made equal to.',
       sv.verse_id, ev.verse_id, 'extras', 85253
  FROM _session412_2bar51_lookup sv, _session412_2bar51_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=51 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-51-the-image-of-the-heavenly',
       E'They shall bear the image of the heavenly',
       E'The risen are given to *behold the world which is now invisible to them*, *time shall no longer age them*, and *in the heights of that world shall they dwell.* They put off the earthy and are clothed with the heavenly — Paul''s promise that as we have borne the image of the earthy we shall bear the image of the heavenly, the corruptible putting on incorruption. It ain''t new — the saints inherit the unaging world that does not die.',
       sv.verse_id, ev.verse_id, 'extras', 85256
  FROM _session412_2bar51_lookup sv, _session412_2bar51_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=8
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=51 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-51-the-law-a-hope-wisdom-a-confidence',
       E'To whom the law has been a hope',
       E'Baruch names the inheritance of *those who have been saved by their works, And to whom the law has been now a hope, And understanding an expectation, And wisdom a confidence.* By contrast the lost *rejected My law, and stopped their ears that they might not hear wisdom.* The reward turns on the law held as hope — the same Torah Moses set as life, and the doers, not the hearers only, are justified. It ain''t new — the law is the saint''s hope, never abolished but vindicated in the world to come.',
       sv.verse_id, ev.verse_id, 'extras', 85259
  FROM _session412_2bar51_lookup sv, _session412_2bar51_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=51 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-51-justified-in-my-law-their-splendour-glorified
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Dan 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* — the form of their face turned into the light of their beauty.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar51_lookup sv, _session412_2bar51_lookup tv
 WHERE t.slug='2-baruch-51-justified-in-my-law-their-splendour-glorified'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matt 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear* — the splendour of those justified in His law, glorified.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar51_lookup sv, _session412_2bar51_lookup tv
 WHERE t.slug='2-baruch-51-justified-in-my-law-their-splendour-glorified'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ps 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* — the root of wisdom planted in the heart is delight in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar51_lookup sv, _session412_2bar51_lookup tv
 WHERE t.slug='2-baruch-51-justified-in-my-law-their-splendour-glorified'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-51-transformed-into-the-splendour-of-angels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matt 22:30 — *For in the resurrection they neither marry, nor are given in marriage, but are as the angels of Elohim (God) in heaven* — they shall be made like unto the angels.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar51_lookup sv, _session412_2bar51_lookup tv
 WHERE t.slug='2-baruch-51-transformed-into-the-splendour-of-angels'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Cor 15:41 — *There is one glory of the sun, and another glory of the moon, and another glory of the stars: for one star differeth from another star in glory* — made equal to the stars, from light into the splendour of glory.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar51_lookup sv, _session412_2bar51_lookup tv
 WHERE t.slug='2-baruch-51-transformed-into-the-splendour-of-angels'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Cor 15:40 — *There are also celestial bodies, and bodies terrestrial: but the glory of the celestial is one, and the glory of the terrestrial is another* — the risen are clothed with the heavenly glory.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar51_lookup sv, _session412_2bar51_lookup tv
 WHERE t.slug='2-baruch-51-transformed-into-the-splendour-of-angels'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Cor 15:44 — *It is sown a natural body; it is raised a spiritual body. There is a natural body, and there is a spiritual body* — changed into every form they desire, into the splendour of glory.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar51_lookup sv, _session412_2bar51_lookup tv
 WHERE t.slug='2-baruch-51-transformed-into-the-splendour-of-angels'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Cor 15:52 — *In a moment, in the twinkling of an eye, at the last trump... the dead shall be raised incorruptible, and we shall be changed* — they shall respectively be transformed at the appointed day.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar51_lookup sv, _session412_2bar51_lookup tv
 WHERE t.slug='2-baruch-51-transformed-into-the-splendour-of-angels'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Phil 3:21 — *Who shall change our vile body, that it may be fashioned like unto his glorious body* — the form of their face turned into the splendour of glory.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar51_lookup sv, _session412_2bar51_lookup tv
 WHERE t.slug='2-baruch-51-transformed-into-the-splendour-of-angels'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-51-the-image-of-the-heavenly
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Cor 15:49 — *And as we have borne the image of the earthy, we shall also bear the image of the heavenly* — they dwell in the heights of that world, ageless.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar51_lookup sv, _session412_2bar51_lookup tv
 WHERE t.slug='2-baruch-51-the-image-of-the-heavenly'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Cor 15:42 — *So also is the resurrection of the dead. It is sown in corruption; it is raised in incorruption* — time shall no longer age them.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar51_lookup sv, _session412_2bar51_lookup tv
 WHERE t.slug='2-baruch-51-the-image-of-the-heavenly'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-51-the-law-a-hope-wisdom-a-confidence
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ps 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — to them the law has been a hope and wisdom a confidence.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar51_lookup sv, _session412_2bar51_lookup tv
 WHERE t.slug='2-baruch-51-the-law-a-hope-wisdom-a-confidence'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Rom 2:13 — *For not the hearers of the law are just before Elohim (God), but the doers of the law shall be justified* — the lost stopped their ears against the law and so were condemned.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar51_lookup sv, _session412_2bar51_lookup tv
 WHERE t.slug='2-baruch-51-the-law-a-hope-wisdom-a-confidence'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=51 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_52.sql (session412 2-baruch 52) -----
-- Source anchor: pseudepigrapha/2-baruch ch52. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar52 (view _session412_2bar52_lookup). Sort band base 85275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar52_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-52-rejoice-in-the-suffering
  ('pseudepigrapha', '2-baruch', 52, 6, 'canon', 'romans', 5, 3, 'free', E'Rom 5:3 — *we glory in tribulations also: knowing that tribulation worketh patience* — rejoice ye in the suffering which ye now suffer.'),
  ('pseudepigrapha', '2-baruch', 52, 7, 'canon', '1-peter', 1, 4, 'free', E'1 Pet 1:4 — *To an inheritance incorruptible, and undefiled, and that fadeth not away, reserved in heaven for you* — the reward which is laid up for you.'),
  ('pseudepigrapha', '2-baruch', 52, 6, 'canon', 'matthew', 5, 12, 'free', E'Matt 5:12 — *Rejoice, and be exceeding glad: for great is your reward in heaven* — make ready your soul for that which is reserved.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar52_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar52_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-52-rejoice-in-the-suffering',
       E'Rejoice in the suffering ye now suffer',
       E'The vision turns to charge: *And as for the righteous, what will they do now? Rejoice ye in the suffering which ye now suffer... Make ready your soul for that which is reserved for you, And prepare your souls for the reward which is laid up for you.* This is the apostles'' own counsel — rejoice in tribulation, for the light affliction works an eternal weight of glory, and the reward is reserved in heaven. It ain''t new — the righteous suffer now and look to the reward laid up for them.',
       sv.verse_id, ev.verse_id, 'extras', 85275
  FROM _session412_2bar52_lookup sv, _session412_2bar52_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=52 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=52 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-52-rejoice-in-the-suffering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Rom 5:3 — *we glory in tribulations also: knowing that tribulation worketh patience* — rejoice ye in the suffering which ye now suffer.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar52_lookup sv, _session412_2bar52_lookup tv
 WHERE t.slug='2-baruch-52-rejoice-in-the-suffering'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=52 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Pet 1:4 — *To an inheritance incorruptible, and undefiled, and that fadeth not away, reserved in heaven for you* — the reward which is laid up for you.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar52_lookup sv, _session412_2bar52_lookup tv
 WHERE t.slug='2-baruch-52-rejoice-in-the-suffering'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=52 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matt 5:12 — *Rejoice, and be exceeding glad: for great is your reward in heaven* — make ready your soul for that which is reserved.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar52_lookup sv, _session412_2bar52_lookup tv
 WHERE t.slug='2-baruch-52-rejoice-in-the-suffering'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=52 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_53.sql (session412 2-baruch 53) -----
-- Source anchor: pseudepigrapha/2-baruch ch53. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar53 (view _session412_2bar53_lookup). Sort band base 85300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar53_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-53-cloud-of-black-and-bright-waters
  ('pseudepigrapha', '2-baruch', 53, 6, 'canon', 'daniel', 2, 21, 'free', E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise* — the twelve alternating rains are the times and seasons the Most High governs.'),
  ('pseudepigrapha', '2-baruch', 53, 1, 'canon', 'daniel', 2, 22, 'free', E'Daniel 2:22 — *He revealeth the deep and secret things: he knoweth what is in the darkness, and the light dwelleth with him* — the same unveiling of black and bright that Baruch receives in the cloud.'),
  ('pseudepigrapha', '2-baruch', 53, 1, 'canon', 'amos', 4, 13, 'free', E'Amos 4:13 — *he that formeth the mountains, and createth the wind, and declareth unto man what is his thought, that maketh the morning darkness... Yahuah (LORD), The Elohim (God) of hosts, is his name* — the One who shows mortals his counsel and turns morning to darkness.'),
  -- thread: 2-baruch-53-the-lightning-that-healed-the-earth
  ('pseudepigrapha', '2-baruch', 53, 9, 'canon', 'psalms', 36, 9, 'free', E'Psalms 36:9 — *For with thee is the fountain of life: in thy light shall we see light* — the healing lightning that illumines the whole earth is the light of Yahuah by which the nations see.'),
  ('pseudepigrapha', '2-baruch', 53, 10, 'canon', 'daniel', 2, 22, 'free', E'Daniel 2:22 — *he knoweth what is in the darkness, and the light dwelleth with him* — the dominion-taking light that overcomes the darkness of the last black waters.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar53_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar53_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-53-cloud-of-black-and-bright-waters',
       E'The cloud of black and bright waters — twelve rains over all the earth',
       E'Baruch sees *a cloud was ascending from a very great sea... full of waters white and black*, that rained twelve times — *the black were always more numerous than the bright* — and at the end *it rained black waters... and fire was mingled with them*. The whole pageant of the ages, calamity and blessing alternating from Adam to the end, is shown in a figure before it is told. Daniel was given the same kind of unveiling: *He revealeth the deep and secret things: he knoweth what is in the darkness, and the light dwelleth with him* (Dan 2:22), and *he changeth the times and the seasons* (Dan 2:21). It ain''t new — the El Elyon who *declareth unto man what is his thought* (Amos 4:13) shows his servants the shape of the times before they come.',
       sv.verse_id, ev.verse_id, 'extras', 85300
  FROM _session412_2bar53_lookup sv, _session412_2bar53_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=53 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=53 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-53-the-lightning-that-healed-the-earth',
       E'The lightning at the summit heals the earth and has dominion',
       E'After the last and darkest rain, *that lightning which I had seen on the summit of the cloud* is hurled to the earth, *shone exceedingly, so as to illuminate the whole earth, and it healed those regions where the last waters had descended*, and *took hold of the whole earth, and had dominion over it* while twelve rivers come up to be subject to it. The figure is the reign of the Anointed at the end of the ages, when calamity is healed and his dominion stands. It ain''t new — *in thy light shall we see light* (Ps 36:9), and the kingdom given is one *which shall not be destroyed... and it shall stand for ever* (cf. Dan 2:22, the light that dwells with him).',
       sv.verse_id, ev.verse_id, 'extras', 85303
  FROM _session412_2bar53_lookup sv, _session412_2bar53_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=53 AND sv.verse_number=8
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=53 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-53-cloud-of-black-and-bright-waters
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise* — the twelve alternating rains are the times and seasons the Most High governs.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar53_lookup sv, _session412_2bar53_lookup tv
 WHERE t.slug='2-baruch-53-cloud-of-black-and-bright-waters'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=53 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:22 — *He revealeth the deep and secret things: he knoweth what is in the darkness, and the light dwelleth with him* — the same unveiling of black and bright that Baruch receives in the cloud.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar53_lookup sv, _session412_2bar53_lookup tv
 WHERE t.slug='2-baruch-53-cloud-of-black-and-bright-waters'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 4:13 — *he that formeth the mountains, and createth the wind, and declareth unto man what is his thought, that maketh the morning darkness... Yahuah (LORD), The Elohim (God) of hosts, is his name* — the One who shows mortals his counsel and turns morning to darkness.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar53_lookup sv, _session412_2bar53_lookup tv
 WHERE t.slug='2-baruch-53-cloud-of-black-and-bright-waters'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=53 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-53-the-lightning-that-healed-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 36:9 — *For with thee is the fountain of life: in thy light shall we see light* — the healing lightning that illumines the whole earth is the light of Yahuah by which the nations see.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar53_lookup sv, _session412_2bar53_lookup tv
 WHERE t.slug='2-baruch-53-the-lightning-that-healed-the-earth'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=53 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=36 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:22 — *he knoweth what is in the darkness, and the light dwelleth with him* — the dominion-taking light that overcomes the darkness of the last black waters.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar53_lookup sv, _session412_2bar53_lookup tv
 WHERE t.slug='2-baruch-53-the-lightning-that-healed-the-earth'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=53 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_54.sql (session412 2-baruch 54) -----
-- Source anchor: pseudepigrapha/2-baruch ch54. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar54 (view _session412_2bar54_lookup). Sort band base 85325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar54_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-54-thou-alone-knowest-the-deep-things
  ('pseudepigrapha', '2-baruch', 54, 1, 'canon', 'deuteronomy', 29, 29, 'free', E'Deuteronomy 29:29 — *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us... that we may do all the words of this law* — the deep things of the world are the Most High''s own secret, revealed for obedience.'),
  ('pseudepigrapha', '2-baruch', 54, 3, 'canon', '1-corinthians', 2, 10, 'free', E'1 Corinthians 2:10 — *Elohim (God) hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of Elohim (God)* — the very depths Baruch says come as the heights to the One who alone knows them.'),
  -- thread: 2-baruch-54-revealest-what-is-hidden-to-the-pure
  ('pseudepigrapha', '2-baruch', 54, 5, 'canon', '1-corinthians', 2, 9, 'free', E'1 Corinthians 2:9 — *Eye hath not seen, nor ear heard, neither have entered into the heart of man, the things which Elohim (God) hath prepared for them that love him* — what is hidden, revealed to the pure who submit to him and his law.'),
  ('pseudepigrapha', '2-baruch', 54, 4, 'canon', 'psalms', 36, 9, 'free', E'Psalms 36:9 — *in thy light shall we see light* — the One who lights up what is dark and reveals what is prepared to those who fear him.'),
  -- thread: 2-baruch-54-each-the-adam-of-his-own-soul
  ('pseudepigrapha', '2-baruch', 54, 15, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* — Adam brought untimely death upon all, yet all sinned and each answers for himself, exactly Baruch''s balance.'),
  ('pseudepigrapha', '2-baruch', 54, 15, 'canon', '1-corinthians', 15, 22, 'free', E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive* — the death from the one man, and the life that answers it in the Anointed.'),
  ('pseudepigrapha', '2-baruch', 54, 14, 'canon', 'psalms', 19, 7, 'free', E'Psalms 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul* — those who perish are they *who have not loved Thy law* (54:14); the law is the standard each soul is measured by, not a thing passed away.'),
  -- thread: 2-baruch-54-vengeance-and-glory-at-the-consummation
  ('pseudepigrapha', '2-baruch', 54, 21, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *death passed upon all men, for that all have sinned* — the wickedness that earns vengeance at the consummation is each soul''s own, the ground Baruch lays in 54:19.'),
  ('pseudepigrapha', '2-baruch', 54, 22, 'canon', 'psalms', 19, 9, 'free', E'Psalms 19:9 — *the judgments of Yahuah (LORD) are true and righteous altogether* — the consummation when he glorifies the faithful and blots out those who sin is righteous judgement, not caprice.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar54_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar54_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-54-thou-alone-knowest-the-deep-things',
       E'Thou alone knowest the deep things of the world',
       E'Baruch prays to the One who *knowest of aforetime the deep things of the world*, for whom *nothing is too hard*, *to whom the depths come as the heights*. The secret of the times is the El Elyon''s own keeping: *The secret things belong unto Yahuah Eloheinu (the LORD our God)* (Deut 29:29). When he discloses them it is by his own giving — *Elohim hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of Elohim* (1 Cor 2:10). It ain''t new — the apostle''s *deep things of Elohim* is Baruch''s *deep things of the world*, opened only by the One who knows the end of the seasons.',
       sv.verse_id, ev.verse_id, 'extras', 85325
  FROM _session412_2bar54_lookup sv, _session412_2bar54_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=54 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=54 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-54-revealest-what-is-hidden-to-the-pure',
       E'Thou lightest up what is dark, and revealest what is hidden to the pure',
       E'*Thou showest great acts to those who know not; Thou breakest up the enclosure of those who are ignorant, And lightest up what is dark, And revealest what is hidden to the pure, who in faith have submitted themselves to Thee and Thy law.* The hidden things are opened to those who fear and keep the law, never severed from it. It ain''t new — *Eye hath not seen, nor ear heard... the things which Elohim hath prepared for them that love him* (1 Cor 2:9), and *thou... revealest to those who fear Thee what is prepared for them* (54:4) is the same promise to those who walk in his law.',
       sv.verse_id, ev.verse_id, 'extras', 85328
  FROM _session412_2bar54_lookup sv, _session412_2bar54_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=54 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=54 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-54-each-the-adam-of-his-own-soul',
       E'Adam first sinned, yet each is the Adam of his own soul',
       E'Baruch holds two truths together: *though Adam first sinned And brought untimely death upon all*, yet *each one of them has prepared for his own soul torment to come* — *Adam is therefore not the cause, save only of his own soul, But each of us has been the Adam of his own soul.* One man''s transgression let death in; each soul still answers for its own sin. It ain''t new — *as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Rom 5:12), and *as in Adam all die, even so in Messiah shall all be made alive* (1 Cor 15:22).',
       sv.verse_id, ev.verse_id, 'extras', 85331
  FROM _session412_2bar54_lookup sv, _session412_2bar54_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=54 AND sv.verse_number=15
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=54 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-54-vengeance-and-glory-at-the-consummation',
       E'At the consummation, vengeance on the wicked and glory for the faithful',
       E'*For at the consummation of the world vengeance shall be taken upon those who have done wickedness according to their wickedness, And Thou wilt glorify the faithful according to their faithfulness.* The end is a true reckoning, each rewarded as he walked. It ain''t new — *he which believeth will receive reward* (54:16) is the prophets'' own measure: judgement that *blottest out from amongst Thine own* those who sin, and crowns those who kept faith.',
       sv.verse_id, ev.verse_id, 'extras', 85334
  FROM _session412_2bar54_lookup sv, _session412_2bar54_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=54 AND sv.verse_number=21
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=54 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-54-thou-alone-knowest-the-deep-things
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 29:29 — *The secret things belong unto Yahuah Eloheinu (the LORD our God): but those things which are revealed belong unto us... that we may do all the words of this law* — the deep things of the world are the Most High''s own secret, revealed for obedience.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar54_lookup sv, _session412_2bar54_lookup tv
 WHERE t.slug='2-baruch-54-thou-alone-knowest-the-deep-things'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=54 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 2:10 — *Elohim (God) hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of Elohim (God)* — the very depths Baruch says come as the heights to the One who alone knows them.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar54_lookup sv, _session412_2bar54_lookup tv
 WHERE t.slug='2-baruch-54-thou-alone-knowest-the-deep-things'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=54 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-54-revealest-what-is-hidden-to-the-pure
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 2:9 — *Eye hath not seen, nor ear heard, neither have entered into the heart of man, the things which Elohim (God) hath prepared for them that love him* — what is hidden, revealed to the pure who submit to him and his law.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar54_lookup sv, _session412_2bar54_lookup tv
 WHERE t.slug='2-baruch-54-revealest-what-is-hidden-to-the-pure'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=54 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 36:9 — *in thy light shall we see light* — the One who lights up what is dark and reveals what is prepared to those who fear him.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar54_lookup sv, _session412_2bar54_lookup tv
 WHERE t.slug='2-baruch-54-revealest-what-is-hidden-to-the-pure'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=54 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=36 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-54-each-the-adam-of-his-own-soul
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 5:12 — *as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* — Adam brought untimely death upon all, yet all sinned and each answers for himself, exactly Baruch''s balance.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar54_lookup sv, _session412_2bar54_lookup tv
 WHERE t.slug='2-baruch-54-each-the-adam-of-his-own-soul'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=54 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive* — the death from the one man, and the life that answers it in the Anointed.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar54_lookup sv, _session412_2bar54_lookup tv
 WHERE t.slug='2-baruch-54-each-the-adam-of-his-own-soul'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=54 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul* — those who perish are they *who have not loved Thy law* (54:14); the law is the standard each soul is measured by, not a thing passed away.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar54_lookup sv, _session412_2bar54_lookup tv
 WHERE t.slug='2-baruch-54-each-the-adam-of-his-own-soul'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=54 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-54-vengeance-and-glory-at-the-consummation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 5:12 — *death passed upon all men, for that all have sinned* — the wickedness that earns vengeance at the consummation is each soul''s own, the ground Baruch lays in 54:19.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar54_lookup sv, _session412_2bar54_lookup tv
 WHERE t.slug='2-baruch-54-vengeance-and-glory-at-the-consummation'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=54 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 19:9 — *the judgments of Yahuah (LORD) are true and righteous altogether* — the consummation when he glorifies the faithful and blots out those who sin is righteous judgement, not caprice.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar54_lookup sv, _session412_2bar54_lookup tv
 WHERE t.slug='2-baruch-54-vengeance-and-glory-at-the-consummation'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=54 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_55.sql (session412 2-baruch 55) -----
-- Source anchor: pseudepigrapha/2-baruch ch55. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar55 (view _session412_2bar55_lookup). Sort band base 85350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar55_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-55-ramael-angel-over-true-visions
  ('pseudepigrapha', '2-baruch', 55, 3, 'canon', 'daniel', 2, 22, 'free', E'Daniel 2:22 — *He revealeth the deep and secret things... the light dwelleth with him* — the true vision is opened by the One who reveals secrets, here through his angel Ramael.'),
  -- thread: 2-baruch-55-the-day-of-the-mighty-one-comes
  ('pseudepigrapha', '2-baruch', 55, 6, 'canon', 'amos', 4, 13, 'free', E'Amos 4:13 — *Yahuah (LORD), The Elohim (God) of hosts, is his name* (with v12, *prepare to meet thy Elohim*) — the advent of the day of the Mighty One that Baruch dreads to behold manifestly.'),
  ('pseudepigrapha', '2-baruch', 55, 8, 'canon', 'psalms', 19, 9, 'free', E'Psalms 19:9 — *the judgments of Yahuah (LORD) are true and righteous altogether* — the majesty''s revealing that *shall convict these and cause those to rejoice* is righteous judgement.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar55_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar55_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-55-ramael-angel-over-true-visions',
       E'Ramael, the angel set over true visions, is sent to interpret',
       E'As Baruch ponders *the multitude of goodness which sinners... have rejected*, *the angel Ramiel who presides over true visions was sent to me*. The dream is no private fancy: it is read by an angel set over true visions, as Daniel''s was read by *the man Gabriel... caused to fly swiftly* (cf. Dan), and as the host stands ready before the throne. It ain''t new — the El Elyon sends his messengers to open the meaning of what he shows his servants, so the vision is sure and not the dreamer''s own invention.',
       sv.verse_id, ev.verse_id, 'extras', 85350
  FROM _session412_2bar55_lookup sv, _session412_2bar55_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=55 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=55 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-55-the-day-of-the-mighty-one-comes',
       E'What wilt thou be when thou shalt see the day of the Mighty One?',
       E'Ramael presses Baruch: if the mere *report... of judgement* so moves him, *what wilt thou be when thou shalt see it manifestly with thine eyes?* — *when thou shalt come to its advent?* The day of the Mighty One is no rumour but a coming event that will *convict these and cause those to rejoice*. It ain''t new — the prophets warned that *the day of Yahuah* comes as a reckoning that divides the convicted from the glad (Amos 4:12-13, *prepare to meet thy Elohim*), and the report a man only half-believes he will one day behold with his eyes.',
       sv.verse_id, ev.verse_id, 'extras', 85353
  FROM _session412_2bar55_lookup sv, _session412_2bar55_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=55 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=55 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-55-ramael-angel-over-true-visions
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:22 — *He revealeth the deep and secret things... the light dwelleth with him* — the true vision is opened by the One who reveals secrets, here through his angel Ramael.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar55_lookup sv, _session412_2bar55_lookup tv
 WHERE t.slug='2-baruch-55-ramael-angel-over-true-visions'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=55 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-55-the-day-of-the-mighty-one-comes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 4:13 — *Yahuah (LORD), The Elohim (God) of hosts, is his name* (with v12, *prepare to meet thy Elohim*) — the advent of the day of the Mighty One that Baruch dreads to behold manifestly.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar55_lookup sv, _session412_2bar55_lookup tv
 WHERE t.slug='2-baruch-55-the-day-of-the-mighty-one-comes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=55 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 19:9 — *the judgments of Yahuah (LORD) are true and righteous altogether* — the majesty''s revealing that *shall convict these and cause those to rejoice* is righteous judgement.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar55_lookup sv, _session412_2bar55_lookup tv
 WHERE t.slug='2-baruch-55-the-day-of-the-mighty-one-comes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=55 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_56.sql (session412 2-baruch 56) -----
-- Source anchor: pseudepigrapha/2-baruch ch56. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar56 (view _session412_2bar56_lookup). Sort band base 85375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar56_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-56-first-black-waters-adams-transgression
  ('pseudepigrapha', '2-baruch', 56, 5, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* — the first black waters, Adam''s transgression bringing untimely death.'),
  ('pseudepigrapha', '2-baruch', 56, 5, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *the woman saw that the tree was good for food... she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat* — the transgression itself that Ramael names.'),
  ('pseudepigrapha', '2-baruch', 56, 6, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground... for dust thou art, and unto dust shalt thou return* — the untimely death, grief, and toil born of the transgression.'),
  ('pseudepigrapha', '2-baruch', 56, 6, 'canon', '1-corinthians', 15, 21, 'free', E'1 Corinthians 15:21 — *For since by man came death, by man came also the resurrection of the dead* — death entered by the one man, the very darkness of the first black waters.'),
  -- thread: 2-baruch-56-angels-who-mingled-with-the-women
  ('pseudepigrapha', '2-baruch', 56, 12, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* — the angels who descended and mingled with the women.'),
  ('pseudepigrapha', '2-baruch', 56, 12, 'enoch', '1-enoch', 6, 2, 'free', E'1 Enoch 6:2 — *the angels, the children of the heaven, saw and lusted after them, and said to one another: Come, let us choose us wives from among the children of men* — the watchers'' descent the same scene Baruch''s vision recalls.'),
  ('pseudepigrapha', '2-baruch', 56, 15, 'canon', '1-peter', 3, 20, 'free', E'1 Peter 3:20 — *when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water* — the deluge that destroyed those who dwelt on the earth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar56_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar56_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-56-first-black-waters-adams-transgression',
       E'The first black waters — Adam''s transgression and untimely death',
       E'Ramael reads the first rain: *the black waters which descended previously on the earth, this is the transgression wherewith Adam the first man transgressed.* By it *Untimely death came into being, Grief was named And anguish was prepared, And pain was created... And the greatness of humanity was humiliated.* This is the source of every later darkness — *from these black waters again were black derived*. It ain''t new — *by one man sin entered into the world, and death by sin; and so death passed upon all men* (Rom 5:12); the fall begins where Moses set it, *she took of the fruit thereof, and did eat, and gave also unto her husband* (Gen 3:6).',
       sv.verse_id, ev.verse_id, 'extras', 85375
  FROM _session412_2bar56_lookup sv, _session412_2bar56_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=56 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=56 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-56-angels-who-mingled-with-the-women',
       E'The angels who descended and mingled with the women',
       E'The darkness deepens: *some of them descended, and mingled with the women. And then those who did so were tormented in chains*, while *those who dwelt on the earth perished together with them through the waters of the deluge.* The book reaches for the old account of the watchers and the flood. It ain''t new — *the sons of Elohim saw the daughters of men that they were fair; and they took them wives* (Gen 6:2), the same the Enoch scroll tells: *the angels, the children of the heaven, saw and lusted after them* (1 Enoch 6:2); and Noah''s flood swept the earth when *the longsuffering of Elohim waited... while the ark was a preparing* (1 Pet 3:20).',
       sv.verse_id, ev.verse_id, 'extras', 85378
  FROM _session412_2bar56_lookup sv, _session412_2bar56_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=56 AND sv.verse_number=12
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=56 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-56-first-black-waters-adams-transgression
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 5:12 — *as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* — the first black waters, Adam''s transgression bringing untimely death.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar56_lookup sv, _session412_2bar56_lookup tv
 WHERE t.slug='2-baruch-56-first-black-waters-adams-transgression'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=56 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:6 — *the woman saw that the tree was good for food... she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat* — the transgression itself that Ramael names.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar56_lookup sv, _session412_2bar56_lookup tv
 WHERE t.slug='2-baruch-56-first-black-waters-adams-transgression'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=56 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground... for dust thou art, and unto dust shalt thou return* — the untimely death, grief, and toil born of the transgression.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar56_lookup sv, _session412_2bar56_lookup tv
 WHERE t.slug='2-baruch-56-first-black-waters-adams-transgression'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=56 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 15:21 — *For since by man came death, by man came also the resurrection of the dead* — death entered by the one man, the very darkness of the first black waters.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar56_lookup sv, _session412_2bar56_lookup tv
 WHERE t.slug='2-baruch-56-first-black-waters-adams-transgression'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=56 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-56-angels-who-mingled-with-the-women
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* — the angels who descended and mingled with the women.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar56_lookup sv, _session412_2bar56_lookup tv
 WHERE t.slug='2-baruch-56-angels-who-mingled-with-the-women'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=56 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 6:2 — *the angels, the children of the heaven, saw and lusted after them, and said to one another: Come, let us choose us wives from among the children of men* — the watchers'' descent the same scene Baruch''s vision recalls.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar56_lookup sv, _session412_2bar56_lookup tv
 WHERE t.slug='2-baruch-56-angels-who-mingled-with-the-women'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=56 AND sv.verse_number=12
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 3:20 — *when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water* — the deluge that destroyed those who dwelt on the earth.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar56_lookup sv, _session412_2bar56_lookup tv
 WHERE t.slug='2-baruch-56-angels-who-mingled-with-the-women'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=56 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_57.sql (session412 2-baruch 57) -----
-- Source anchor: pseudepigrapha/2-baruch ch57. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar57 (view _session412_2bar57_lookup). Sort band base 85400, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar57_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-57-bright-waters-the-fount-of-abraham
  ('pseudepigrapha', '2-baruch', 57, 1, 'canon', 'genesis', 15, 6, 'free', E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness* — the fount of Abraham, the bright waters of faith that Ramael names.'),
  ('pseudepigrapha', '2-baruch', 57, 2, 'canon', 'galatians', 3, 6, 'free', E'Galatians 3:6 — *Even as Abraham believed Elohim (God), and it was accounted to him for righteousness* — the unwritten law and works of the commandments fulfilled in the patriarch''s faith.'),
  ('pseudepigrapha', '2-baruch', 57, 2, 'canon', 'romans', 4, 13, 'free', E'Romans 4:13 — *the promise, that he should be the heir of the world, was... through the righteousness of faith* — Baruch''s hope of the world that was to be renewed, built up in Abraham.'),
  ('pseudepigrapha', '2-baruch', 57, 2, 'canon', 'hebrews', 11, 10, 'free', E'Hebrews 11:10 — *For he looked for a city which hath foundations, whose builder and maker is Elohim (God)* — the promise of the life that should come hereafter, implanted in Abraham.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar57_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar57_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-57-bright-waters-the-fount-of-abraham',
       E'The bright waters — the fount of Abraham and the unwritten law',
       E'The first bright rain is *the fount of Abraham, also his generations*, when *the unwritten law was named amongst them, And the works of the commandments were then fulfilled, And belief in the coming judgement was then generated, And hope of the world that was to be renewed was then built up.* Before Sinai, the patriarch kept the way of Yahuah in faith and obedience. It ain''t new — *Abraham believed Elohim, and it was accounted to him for righteousness* (Gal 3:6; Gen 15:6), and *he looked for a city which hath foundations, whose builder and maker is Elohim* (Heb 11:10) — Baruch''s hope of the world to come.',
       sv.verse_id, ev.verse_id, 'extras', 85400
  FROM _session412_2bar57_lookup sv, _session412_2bar57_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=57 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=57 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-57-bright-waters-the-fount-of-abraham
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness* — the fount of Abraham, the bright waters of faith that Ramael names.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar57_lookup sv, _session412_2bar57_lookup tv
 WHERE t.slug='2-baruch-57-bright-waters-the-fount-of-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=57 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 3:6 — *Even as Abraham believed Elohim (God), and it was accounted to him for righteousness* — the unwritten law and works of the commandments fulfilled in the patriarch''s faith.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar57_lookup sv, _session412_2bar57_lookup tv
 WHERE t.slug='2-baruch-57-bright-waters-the-fount-of-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=57 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 4:13 — *the promise, that he should be the heir of the world, was... through the righteousness of faith* — Baruch''s hope of the world that was to be renewed, built up in Abraham.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar57_lookup sv, _session412_2bar57_lookup tv
 WHERE t.slug='2-baruch-57-bright-waters-the-fount-of-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=57 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:10 — *For he looked for a city which hath foundations, whose builder and maker is Elohim (God)* — the promise of the life that should come hereafter, implanted in Abraham.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar57_lookup sv, _session412_2bar57_lookup tv
 WHERE t.slug='2-baruch-57-bright-waters-the-fount-of-abraham'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=57 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_58.sql (session412 2-baruch 58) -----
-- Source anchor: pseudepigrapha/2-baruch ch58. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar58 (view _session412_2bar58_lookup). Sort band base 85425, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar58_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-58-black-waters-the-wickedness-of-egypt
  ('pseudepigrapha', '2-baruch', 58, 1, 'canon', 'exodus', 1, 14, 'free', E'Exodus 1:14 — *they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field... was with rigour* — the wickedness of Egypt, the service wherewith they made Israel serve.'),
  ('pseudepigrapha', '2-baruch', 58, 1, 'canon', 'exodus', 1, 22, 'free', E'Exodus 1:22 — *Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river* — *they made their sons to serve* and worse, the black third waters of the nations'' wickedness.'),
  ('pseudepigrapha', '2-baruch', 58, 2, 'canon', 'psalms', 105, 25, 'free', E'Psalms 105:25 — *He turned their heart to hate his people, to deal subtilly with his servants* — Egypt''s subtle dealing that, as Baruch says, perished at last.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar58_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar58_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-58-black-waters-the-wickedness-of-egypt',
       E'The black third waters — the sins of the nations and the bondage of Egypt',
       E'The third rain is black: *the mingling of all sins, which the nations afterwards wrought after the death of those righteous men, and the wickedness of the land of Egypt, wherein they did wickedly in the service wherewith they made their sons to serve.* The cruelty of Egypt''s bondage is the darkness here named. It ain''t new — *the Egyptians made the children of Yashar''el to serve with rigour... and made their lives bitter with hard bondage* (Exod 1:13-14), and *Pharaoh charged all his people... Every son that is born ye shall cast into the river* (Exod 1:22); yet *these also perished at last*, as Yahuah remembered his own.',
       sv.verse_id, ev.verse_id, 'extras', 85425
  FROM _session412_2bar58_lookup sv, _session412_2bar58_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=58 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=58 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-58-black-waters-the-wickedness-of-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:14 — *they made their lives bitter with hard bondage, in morter, and in brick, and in all manner of service in the field... was with rigour* — the wickedness of Egypt, the service wherewith they made Israel serve.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar58_lookup sv, _session412_2bar58_lookup tv
 WHERE t.slug='2-baruch-58-black-waters-the-wickedness-of-egypt'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=58 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:22 — *Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river* — *they made their sons to serve* and worse, the black third waters of the nations'' wickedness.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar58_lookup sv, _session412_2bar58_lookup tv
 WHERE t.slug='2-baruch-58-black-waters-the-wickedness-of-egypt'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=58 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 105:25 — *He turned their heart to hate his people, to deal subtilly with his servants* — Egypt''s subtle dealing that, as Baruch says, perished at last.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar58_lookup sv, _session412_2bar58_lookup tv
 WHERE t.slug='2-baruch-58-black-waters-the-wickedness-of-egypt'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=58 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_59.sql (session412 2-baruch 59) -----
-- Source anchor: pseudepigrapha/2-baruch ch59. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar59 (view _session412_2bar59_lookup). Sort band base 85450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar59_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-59-bright-waters-moses-and-the-lamp-of-the-law
  ('pseudepigrapha', '2-baruch', 59, 2, 'canon', 'psalms', 19, 7, 'free', E'Psalms 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the lamp of the eternal law shining on those who sat in darkness, counted among the bright waters.'),
  ('pseudepigrapha', '2-baruch', 59, 2, 'canon', 'psalms', 19, 8, 'free', E'Psalms 19:8 — *The statutes of Yahuah (LORD) are right, rejoicing the heart: the commandment of Yahuah (LORD) is pure, enlightening the eyes* — the law as light, exactly Baruch''s bright fourth waters.'),
  ('pseudepigrapha', '2-baruch', 59, 1, 'canon', 'exodus', 20, 1, 'free', E'Exodus 20:1 — *And Elohim (God) spake all these words, saying* — the advent of Moses and the giving of the commandments, the bright waters of Sinai.'),
  -- thread: 2-baruch-59-the-heavens-shaken-when-moses-taken-up
  ('pseudepigrapha', '2-baruch', 59, 3, 'canon', 'exodus', 19, 18, 'free', E'Exodus 19:18 — *mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire... and the whole mount quaked greatly* — the heavens and the mount shaken when Moses was taken up.'),
  ('pseudepigrapha', '2-baruch', 59, 3, 'canon', 'deuteronomy', 4, 12, 'free', E'Deuteronomy 4:12 — *Yahuah (LORD) spake unto you out of the midst of the fire: ye heard the voice of the words, but saw no similitude; only ye heard a voice* — Moses receiving the principles of the law amid the shaken heavens.'),
  ('pseudepigrapha', '2-baruch', 59, 4, 'canon', 'hebrews', 12, 21, 'free', E'Hebrews 12:21 — *And so terrible was the sight, that Moses said, I exceedingly fear and quake* — the quaking of Sinai when He took Moses unto Himself and showed him the pattern of Zion.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar59_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar59_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-59-bright-waters-moses-and-the-lamp-of-the-law',
       E'The bright fourth waters — Moses, and the lamp of the eternal law',
       E'The fourth rain is bright: *the advent of Moses and Aaron and Miriam and Joshua... For at that time the lamp of the eternal law shone on all those who sat in darkness.* The giving of the Torah is counted among the bright waters, a blessing and a light, not a burden. It ain''t new — *The law of Yahuah is perfect, converting the soul... enlightening the eyes* (Ps 19:7-8); the lamp that shone on those who sat in darkness is the very law Israel was given at Sinai, the eternal hope of the obedient.',
       sv.verse_id, ev.verse_id, 'extras', 85450
  FROM _session412_2bar59_lookup sv, _session412_2bar59_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=59 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=59 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-59-the-heavens-shaken-when-moses-taken-up',
       E'The heavens shaken when Moses was taken up to be shown the pattern',
       E'*The heavens at that time were shaken from their place... when He was taking Moses unto Himself. For He showed him many admonitions together with the principles of the law and the consummation of the times... and likewise the pattern of Zion and its measures, in the pattern of which the sanctuary of the present time was to be made.* Sinai shook and Moses was shown the heavenly pattern. It ain''t new — *mount Sinai was altogether on a smoke, because Yahuah descended upon it in fire... and the whole mount quaked greatly* (Exod 19:18), and the writer to the Hebrews recalls the same terror: *so terrible was the sight, that Moses said, I exceedingly fear and quake* (Heb 12:21).',
       sv.verse_id, ev.verse_id, 'extras', 85453
  FROM _session412_2bar59_lookup sv, _session412_2bar59_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=59 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=59 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-59-bright-waters-moses-and-the-lamp-of-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the lamp of the eternal law shining on those who sat in darkness, counted among the bright waters.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar59_lookup sv, _session412_2bar59_lookup tv
 WHERE t.slug='2-baruch-59-bright-waters-moses-and-the-lamp-of-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=59 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 19:8 — *The statutes of Yahuah (LORD) are right, rejoicing the heart: the commandment of Yahuah (LORD) is pure, enlightening the eyes* — the law as light, exactly Baruch''s bright fourth waters.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar59_lookup sv, _session412_2bar59_lookup tv
 WHERE t.slug='2-baruch-59-bright-waters-moses-and-the-lamp-of-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=59 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 20:1 — *And Elohim (God) spake all these words, saying* — the advent of Moses and the giving of the commandments, the bright waters of Sinai.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar59_lookup sv, _session412_2bar59_lookup tv
 WHERE t.slug='2-baruch-59-bright-waters-moses-and-the-lamp-of-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=59 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-59-the-heavens-shaken-when-moses-taken-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:18 — *mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire... and the whole mount quaked greatly* — the heavens and the mount shaken when Moses was taken up.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar59_lookup sv, _session412_2bar59_lookup tv
 WHERE t.slug='2-baruch-59-the-heavens-shaken-when-moses-taken-up'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=59 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:12 — *Yahuah (LORD) spake unto you out of the midst of the fire: ye heard the voice of the words, but saw no similitude; only ye heard a voice* — Moses receiving the principles of the law amid the shaken heavens.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar59_lookup sv, _session412_2bar59_lookup tv
 WHERE t.slug='2-baruch-59-the-heavens-shaken-when-moses-taken-up'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=59 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 12:21 — *And so terrible was the sight, that Moses said, I exceedingly fear and quake* — the quaking of Sinai when He took Moses unto Himself and showed him the pattern of Zion.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar59_lookup sv, _session412_2bar59_lookup tv
 WHERE t.slug='2-baruch-59-the-heavens-shaken-when-moses-taken-up'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=59 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_60.sql (session412 2-baruch 60) -----
-- Source anchor: pseudepigrapha/2-baruch ch60. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar60 (view _session412_2bar60_lookup). Sort band base 85475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar60_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-60-black-waters-the-works-of-the-amorites
  ('pseudepigrapha', '2-baruch', 60, 1, 'canon', 'deuteronomy', 9, 4, 'free', E'Deuteronomy 9:4 — *for the wickedness of these nations Yahuah (LORD) doth drive them out from before thee* — the works of the Amorites, the black fifth waters of incantation and pollution.'),
  ('pseudepigrapha', '2-baruch', 60, 2, 'canon', 'judges', 2, 11, 'free', E'Judges 2:11 — *the children of Yashar''el (Israel) did evil in the sight of Yahuah (LORD), and served Baalim* — Israel polluted by sins in the days of the judges, just as Baruch says.'),
  ('pseudepigrapha', '2-baruch', 60, 2, 'canon', 'judges', 2, 12, 'free', E'Judges 2:12 — *they forsook Yahuah Elohim (the LORD God) of their fathers... and followed other gods... and provoked Yahuah (LORD) to anger* — Israel drawn after the Amorites'' pollution though they had seen many signs.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar60_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar60_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-60-black-waters-the-works-of-the-amorites',
       E'The black fifth waters — the works of the Amorites and Israel''s defilement in the days of the judges',
       E'The fifth rain is black: *the works which the Amorites wrought, and the spells of their incantations... and the wickedness of their mysteries, and the mingling of their pollution. But even Yashar''el was then polluted by sins in the days of the judges, though they saw many signs.* The land''s idolatry drew Israel after it. It ain''t new — Moses warned the nations were driven out *for the wickedness of these nations* (Deut 9:4-5), yet in Judges *the children of Yashar''el did evil in the sight of Yahuah, and served Baalim... and forsook Yahuah Elohim of their fathers* (Judg 2:11-12) — the very pollution Ramael names.',
       sv.verse_id, ev.verse_id, 'extras', 85475
  FROM _session412_2bar60_lookup sv, _session412_2bar60_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=60 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=60 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-60-black-waters-the-works-of-the-amorites
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 9:4 — *for the wickedness of these nations Yahuah (LORD) doth drive them out from before thee* — the works of the Amorites, the black fifth waters of incantation and pollution.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar60_lookup sv, _session412_2bar60_lookup tv
 WHERE t.slug='2-baruch-60-black-waters-the-works-of-the-amorites'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=60 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 2:11 — *the children of Yashar''el (Israel) did evil in the sight of Yahuah (LORD), and served Baalim* — Israel polluted by sins in the days of the judges, just as Baruch says.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar60_lookup sv, _session412_2bar60_lookup tv
 WHERE t.slug='2-baruch-60-black-waters-the-works-of-the-amorites'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=60 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judges 2:12 — *they forsook Yahuah Elohim (the LORD God) of their fathers... and followed other gods... and provoked Yahuah (LORD) to anger* — Israel drawn after the Amorites'' pollution though they had seen many signs.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar60_lookup sv, _session412_2bar60_lookup tv
 WHERE t.slug='2-baruch-60-black-waters-the-works-of-the-amorites'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=60 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_61.sql (session412 2-baruch 61) -----
-- Source anchor: pseudepigrapha/2-baruch ch61. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar61 (view _session412_2bar61_lookup). Sort band base 85500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar61_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-61-david-solomon-the-building-of-zion
  ('pseudepigrapha', '2-baruch', 61, 1, 'canon', '2-samuel', 7, 13, 'free', E'2 Sam 7:13 — *He shall build an house for my name, and I will stablish the throne of his kingdom for ever* — the covenant to David''s son under which Zion was built, the bright sixth waters Baruch reads.'),
  ('pseudepigrapha', '2-baruch', 61, 2, 'canon', '1-kings', 8, 1, 'free', E'1 Kgs 8:1 — *that they might bring up the ark of the covenant of Yahuah out of the city of David, which is Zion* — the dedication of the sanctuary that the bright waters recall.'),
  ('pseudepigrapha', '2-baruch', 61, 1, 'canon', '1-chronicles', 22, 10, 'free', E'1 Chr 22:10 — *He shall build an house for my name, and he shall be my son, and I will be his father; and I will establish the throne of his kingdom over Yashar''el for ever* — David charging Solomon to build, the time the bright waters name.'),
  -- thread: 2-baruch-61-the-offerings-and-the-festivals
  ('pseudepigrapha', '2-baruch', 61, 2, 'canon', '1-kings', 8, 63, 'free', E'1 Kgs 8:63 — *Solomon offered a sacrifice of peace offerings... two and twenty thousand oxen, and an hundred and twenty thousand sheep. So the king and all the children of Yashar''el dedicated the house of Yahuah* — the many offerings of the dedication Baruch recalls.'),
  ('pseudepigrapha', '2-baruch', 61, 5, 'canon', '1-kings', 8, 65, 'free', E'1 Kgs 8:65 — *at that time Solomon held a feast, and all Yashar''el with him, a great congregation... seven days and seven days, even fourteen days* — the holy festival fulfilled in joy of which the bright waters speak.'),
  -- thread: 2-baruch-61-peace-and-righteous-rule
  ('pseudepigrapha', '2-baruch', 61, 3, 'canon', 'psalms', 72, 7, 'free', E'Ps 72:7 — *In his days shall the righteous flourish; and abundance of peace so long as the moon endureth* — the peace and tranquillity of the bright waters, the prayer for the king''s son.'),
  ('pseudepigrapha', '2-baruch', 61, 6, 'canon', 'psalms', 72, 2, 'free', E'Ps 72:2 — *He shall judge thy people with righteousness, and thy poor with judgment* — the judgement of the rulers without guile that the bright waters commend.'),
  ('pseudepigrapha', '2-baruch', 61, 7, 'canon', '1-chronicles', 22, 9, 'free', E'1 Chr 22:9 — *he shall be a man of rest... and I will give peace and quietness unto Yashar''el in his days* — Solomon, the man of rest, in whose days the land was beloved and glorified, as Baruch tells.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar61_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar61_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-61-david-solomon-the-building-of-zion',
       E'David and Solomon, and the building of Zion',
       E'The bright sixth waters are read: *this is the time in which David and Solomon were born. And there was at that time the building of Zion, And the dedication of the sanctuary.* The throne and the house belong together — David the man of war who could not build, Solomon the man of rest who reared the temple, the kingdom established for ever. It ain''t new — that David''s son should build the house for the Name and have his throne stablished for ever is the covenant Nathan brought long before Baruch names the bright waters.',
       sv.verse_id, ev.verse_id, 'extras', 85500
  FROM _session412_2bar61_lookup sv, _session412_2bar61_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=61 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=61 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-61-the-offerings-and-the-festivals',
       E'The offerings and the holy festivals fulfilled',
       E'The bright waters tell of worship at its height: *And many offerings which were offered then in the dedication of the sanctuary... And the holy festivals were fulfilled in blessedness and in much joy.* When Solomon dedicated the house the sacrifices could not be numbered and the feast was kept fourteen days. It ain''t new — the peace-offerings beyond counting and the seven-day feast of joy at the dedication stand in Kings before Baruch calls them blessed.',
       sv.verse_id, ev.verse_id, 'extras', 85503
  FROM _session412_2bar61_lookup sv, _session412_2bar61_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=61 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=61 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-61-peace-and-righteous-rule',
       E'Peace, righteous rule, and Zion glorified',
       E'The bright waters crown the reign with peace: *And peace and tranquillity existed at that time... And the judgement of the rulers was then seen to be without guile, And the righteousness of the precepts of the Mighty One was accomplished with truth.* The king who judges the poor with righteousness and brings abundance of peace is the hope sung of David''s son. It ain''t new — that the king''s son should judge in righteousness and peace flourish in his days stands in the Psalm before Baruch reads it in the bright waters.',
       sv.verse_id, ev.verse_id, 'extras', 85506
  FROM _session412_2bar61_lookup sv, _session412_2bar61_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=61 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=61 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-61-david-solomon-the-building-of-zion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Sam 7:13 — *He shall build an house for my name, and I will stablish the throne of his kingdom for ever* — the covenant to David''s son under which Zion was built, the bright sixth waters Baruch reads.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar61_lookup sv, _session412_2bar61_lookup tv
 WHERE t.slug='2-baruch-61-david-solomon-the-building-of-zion'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=61 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kgs 8:1 — *that they might bring up the ark of the covenant of Yahuah out of the city of David, which is Zion* — the dedication of the sanctuary that the bright waters recall.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar61_lookup sv, _session412_2bar61_lookup tv
 WHERE t.slug='2-baruch-61-david-solomon-the-building-of-zion'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=61 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Chr 22:10 — *He shall build an house for my name, and he shall be my son, and I will be his father; and I will establish the throne of his kingdom over Yashar''el for ever* — David charging Solomon to build, the time the bright waters name.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar61_lookup sv, _session412_2bar61_lookup tv
 WHERE t.slug='2-baruch-61-david-solomon-the-building-of-zion'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=61 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=22 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-61-the-offerings-and-the-festivals
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kgs 8:63 — *Solomon offered a sacrifice of peace offerings... two and twenty thousand oxen, and an hundred and twenty thousand sheep. So the king and all the children of Yashar''el dedicated the house of Yahuah* — the many offerings of the dedication Baruch recalls.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar61_lookup sv, _session412_2bar61_lookup tv
 WHERE t.slug='2-baruch-61-the-offerings-and-the-festivals'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=61 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=63
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kgs 8:65 — *at that time Solomon held a feast, and all Yashar''el with him, a great congregation... seven days and seven days, even fourteen days* — the holy festival fulfilled in joy of which the bright waters speak.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar61_lookup sv, _session412_2bar61_lookup tv
 WHERE t.slug='2-baruch-61-the-offerings-and-the-festivals'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=61 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=65
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-61-peace-and-righteous-rule
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ps 72:7 — *In his days shall the righteous flourish; and abundance of peace so long as the moon endureth* — the peace and tranquillity of the bright waters, the prayer for the king''s son.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar61_lookup sv, _session412_2bar61_lookup tv
 WHERE t.slug='2-baruch-61-peace-and-righteous-rule'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=61 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ps 72:2 — *He shall judge thy people with righteousness, and thy poor with judgment* — the judgement of the rulers without guile that the bright waters commend.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar61_lookup sv, _session412_2bar61_lookup tv
 WHERE t.slug='2-baruch-61-peace-and-righteous-rule'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=61 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=72 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Chr 22:9 — *he shall be a man of rest... and I will give peace and quietness unto Yashar''el in his days* — Solomon, the man of rest, in whose days the land was beloved and glorified, as Baruch tells.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar61_lookup sv, _session412_2bar61_lookup tv
 WHERE t.slug='2-baruch-61-peace-and-righteous-rule'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=61 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=22 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_62.sql (session412 2-baruch 62) -----
-- Source anchor: pseudepigrapha/2-baruch ch62. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar62 (view _session412_2bar62_lookup). Sort band base 85525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar62_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-62-jeroboam-and-the-two-calves
  ('pseudepigrapha', '2-baruch', 62, 1, 'canon', '1-kings', 12, 28, 'free', E'1 Kgs 12:28 — *the king took counsel, and made two calves of gold, and said unto them, It is too much for you to go up to Jerusalem: behold thy gods, O Yashar''el* — the very counsel and the two calves Baruch reads in the black waters.'),
  ('pseudepigrapha', '2-baruch', 62, 1, 'canon', '1-kings', 12, 26, 'free', E'1 Kgs 12:26 — *Jeroboam said in his heart, Now shall the kingdom return to the house of David* — the counsel of the heart that bred the schism, the perversion the black waters name.'),
  -- thread: 2-baruch-62-the-idolatry-and-captivity-of-the-nine-tribes
  ('pseudepigrapha', '2-baruch', 62, 3, 'canon', '2-kings', 17, 16, 'free', E'2 Kgs 17:16 — *they left all the commandments of Yahuah their Elohim, and made them molten images, even two calves... and served Baal* — the idolatry of Israel the black waters recall.'),
  ('pseudepigrapha', '2-baruch', 62, 5, 'canon', '2-kings', 17, 18, 'free', E'2 Kgs 17:18 — *Therefore Yahuah was very angry with Yashar''el, and removed them out of his sight: there was none left but the tribe of Yahudah only* — the captivity of the nine tribes and a half Baruch names.'),
  ('pseudepigrapha', '2-baruch', 62, 6, 'canon', '2-kings', 17, 7, 'free', E'2 Kgs 17:7 — *the children of Yashar''el had sinned against Yahuah their Elohim... and had feared other gods* — the cause of the captivity that came upon the nine tribes, as the black waters tell.'),
  -- thread: 2-baruch-62-the-two-houses-divided
  ('pseudepigrapha', '2-baruch', 62, 5, 'canon', 'ezekiel', 37, 19, 'free', E'Ezek 37:19 — *I will take the stick of Joseph, which is in the hand of Ephraim... and will put them with him, even with the stick of Yahudah... and they shall be one in mine hand* — the healing of the very division the black waters mourn, the nine tribes and a half carried away.'),
  ('pseudepigrapha', '2-baruch', 62, 5, 'canon', 'ezekiel', 37, 22, 'free', E'Ezek 37:22 — *I will make them one nation in the land... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* — the promise over the captive houses Baruch''s black waters record being torn apart.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar62_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar62_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-62-jeroboam-and-the-two-calves',
       E'Jeroboam''s schism and the two calves of gold',
       E'The black seventh waters are read: *this is the perversion (brought about) by the counsel of Jeroboam, who took counsel to make two calves of gold.* When the kingdom was rent, Jeroboam feared the people''s hearts would turn back at Jerusalem and set up golden calves at Bethel and Dan. It ain''t new — the counsel of Jeroboam''s heart and the two calves that became a sin to Israel stand in Kings before Baruch names the black waters.',
       sv.verse_id, ev.verse_id, 'extras', 85525
  FROM _session412_2bar62_lookup sv, _session412_2bar62_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=62 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=62 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-62-the-idolatry-and-captivity-of-the-nine-tribes',
       E'The idolatry of the kings and the captivity of the nine tribes',
       E'The black waters run on to ruin: *And the curse of Jezebel and the worship of idols which Yashar''el practised at that time... And the time of their captivity which came upon the nine tribes and a half... And Salmanasar king of Assyria came and led them away captive.* Israel forsook the commandments, served other gods, and Assyria carried them away. It ain''t new — that they left all the commandments, made molten calves, and were removed out of His sight is written in Kings before Baruch reads the seventh black waters.',
       sv.verse_id, ev.verse_id, 'extras', 85528
  FROM _session412_2bar62_lookup sv, _session412_2bar62_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=62 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=62 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-62-the-two-houses-divided',
       E'The two houses divided — the sticks not yet one',
       E'Baruch''s seventh black waters mark the day the one nation became two — the nine tribes and a half torn off and carried away, the kingdom split that the prophet promises to mend. Where Baruch records the rending, Ezekiel holds the cure: two sticks, Judah and Joseph, made one in the Mighty One''s hand. It ain''t new — that the divided houses shall be gathered and made one nation, no more two kingdoms, is the prophet''s word standing against the very schism the black waters mourn.',
       sv.verse_id, ev.verse_id, 'extras', 85531
  FROM _session412_2bar62_lookup sv, _session412_2bar62_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=62 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=62 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-62-jeroboam-and-the-two-calves
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kgs 12:28 — *the king took counsel, and made two calves of gold, and said unto them, It is too much for you to go up to Jerusalem: behold thy gods, O Yashar''el* — the very counsel and the two calves Baruch reads in the black waters.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar62_lookup sv, _session412_2bar62_lookup tv
 WHERE t.slug='2-baruch-62-jeroboam-and-the-two-calves'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kgs 12:26 — *Jeroboam said in his heart, Now shall the kingdom return to the house of David* — the counsel of the heart that bred the schism, the perversion the black waters name.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar62_lookup sv, _session412_2bar62_lookup tv
 WHERE t.slug='2-baruch-62-jeroboam-and-the-two-calves'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=62 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-62-the-idolatry-and-captivity-of-the-nine-tribes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kgs 17:16 — *they left all the commandments of Yahuah their Elohim, and made them molten images, even two calves... and served Baal* — the idolatry of Israel the black waters recall.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar62_lookup sv, _session412_2bar62_lookup tv
 WHERE t.slug='2-baruch-62-the-idolatry-and-captivity-of-the-nine-tribes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=62 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kgs 17:18 — *Therefore Yahuah was very angry with Yashar''el, and removed them out of his sight: there was none left but the tribe of Yahudah only* — the captivity of the nine tribes and a half Baruch names.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar62_lookup sv, _session412_2bar62_lookup tv
 WHERE t.slug='2-baruch-62-the-idolatry-and-captivity-of-the-nine-tribes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=62 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kgs 17:7 — *the children of Yashar''el had sinned against Yahuah their Elohim... and had feared other gods* — the cause of the captivity that came upon the nine tribes, as the black waters tell.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar62_lookup sv, _session412_2bar62_lookup tv
 WHERE t.slug='2-baruch-62-the-idolatry-and-captivity-of-the-nine-tribes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=62 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-62-the-two-houses-divided
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezek 37:19 — *I will take the stick of Joseph, which is in the hand of Ephraim... and will put them with him, even with the stick of Yahudah... and they shall be one in mine hand* — the healing of the very division the black waters mourn, the nine tribes and a half carried away.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar62_lookup sv, _session412_2bar62_lookup tv
 WHERE t.slug='2-baruch-62-the-two-houses-divided'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=62 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezek 37:22 — *I will make them one nation in the land... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* — the promise over the captive houses Baruch''s black waters record being torn apart.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar62_lookup sv, _session412_2bar62_lookup tv
 WHERE t.slug='2-baruch-62-the-two-houses-divided'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=62 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_63.sql (session412 2-baruch 63) -----
-- Source anchor: pseudepigrapha/2-baruch ch63. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar63 (view _session412_2bar63_lookup). Sort band base 85550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar63_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-63-hezekiah-trusted-and-prayed
  ('pseudepigrapha', '2-baruch', 63, 3, 'canon', '2-chronicles', 32, 20, 'free', E'2 Chr 32:20 — *Hezekiah the king, and the prophet Isaiah the son of Amoz, prayed and cried to heaven* — the king''s prayer against Sennacherib that the bright waters commend.'),
  ('pseudepigrapha', '2-baruch', 63, 4, 'canon', '2-kings', 19, 32, 'free', E'2 Kgs 19:32 — *thus saith Yahuah concerning the king of Assyria, He shall not come into this city, nor shoot an arrow there* — the answer to Hezekiah over the threat to Zion the bright waters recall.'),
  -- thread: 2-baruch-63-the-angel-destroyed-the-host
  ('pseudepigrapha', '2-baruch', 63, 7, 'canon', '2-kings', 19, 35, 'free', E'2 Kgs 19:35 — *the angel of Yahuah went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses* — the very number and the angel Baruch''s bright waters name.'),
  ('pseudepigrapha', '2-baruch', 63, 7, 'canon', 'isaiah', 37, 36, 'free', E'Isa 37:36 — *Then the angel of Yahuah went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand* — the destruction of the host the bright waters recount.'),
  ('pseudepigrapha', '2-baruch', 63, 7, 'canon', '2-chronicles', 32, 21, 'free', E'2 Chr 32:21 — *Yahuah sent an angel, which cut off all the mighty men of valour, and the leaders and captains in the camp of the king of Assyria* — the angel''s stroke on Sennacherib''s multitude Baruch recalls.'),
  -- thread: 2-baruch-63-zion-saved-the-name-glorified
  ('pseudepigrapha', '2-baruch', 63, 9, 'canon', 'psalms', 76, 3, 'free', E'Ps 76:3 — *There brake he the arrows of the bow, the shield, and the sword, and the battle* — the deliverance of Zion the bright waters celebrate, the host broken before the city.'),
  ('pseudepigrapha', '2-baruch', 63, 10, 'canon', 'psalms', 76, 1, 'free', E'Ps 76:1 — *In Yahudah is Elohim known: his name is great in Yashar''el* — the Name glorified throughout the land of which Baruch''s bright waters speak.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar63_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar63_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-63-hezekiah-trusted-and-prayed',
       E'Hezekiah trusted in his righteousness and prayed',
       E'The bright eighth waters are read: *this is the rectitude and uprightness of Hezekiah king of Yahudah... then Hezekiah trusted in his works, and had hope in his righteousness, and spake with the Mighty One.* When Sennacherib threatened Zion the king turned to prayer, and the Mighty One had respect unto it because he was righteous. It ain''t new — that Hezekiah the king prayed and cried to heaven against Assyria stands in the Chronicle before Baruch reads it in the bright waters.',
       sv.verse_id, ev.verse_id, 'extras', 85550
  FROM _session412_2bar63_lookup sv, _session412_2bar63_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=63 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=63 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-63-the-angel-destroyed-the-host',
       E'The angel destroyed Sennacherib''s host',
       E'The bright waters tell the deliverance: *thereupon the Mighty One commanded Ramiel His angel... And I went forth and destroyed their multitude, the number of whose chiefs only was a hundred and eighty-five thousand.* In one night the angel of Yahuah smote the camp of Assyria and they were all dead corpses. It ain''t new — the angel that went forth and smote a hundred fourscore and five thousand stands in Kings and Isaiah before Baruch''s Ramiel recounts the deed.',
       sv.verse_id, ev.verse_id, 'extras', 85553
  FROM _session412_2bar63_lookup sv, _session412_2bar63_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=63 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=63 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-63-zion-saved-the-name-glorified',
       E'Zion saved and the Name glorified',
       E'The bright waters close in deliverance: *And Zion was saved and Jerusalem delivered: Yashar''el also was freed from tribulation... and the name of the Mighty One was glorified so that it was spoken of.* In Judah is Elohim known; in Salem his dwelling; there he broke the arrows of the bow and the battle. It ain''t new — that He breaks the shield and the sword and is feared from heaven, the earth still before Him, is the Psalm''s praise before Baruch reads Zion saved.',
       sv.verse_id, ev.verse_id, 'extras', 85556
  FROM _session412_2bar63_lookup sv, _session412_2bar63_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=63 AND sv.verse_number=9
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=63 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-63-hezekiah-trusted-and-prayed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chr 32:20 — *Hezekiah the king, and the prophet Isaiah the son of Amoz, prayed and cried to heaven* — the king''s prayer against Sennacherib that the bright waters commend.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar63_lookup sv, _session412_2bar63_lookup tv
 WHERE t.slug='2-baruch-63-hezekiah-trusted-and-prayed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=63 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=32 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kgs 19:32 — *thus saith Yahuah concerning the king of Assyria, He shall not come into this city, nor shoot an arrow there* — the answer to Hezekiah over the threat to Zion the bright waters recall.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar63_lookup sv, _session412_2bar63_lookup tv
 WHERE t.slug='2-baruch-63-hezekiah-trusted-and-prayed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=63 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-63-the-angel-destroyed-the-host
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kgs 19:35 — *the angel of Yahuah went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses* — the very number and the angel Baruch''s bright waters name.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar63_lookup sv, _session412_2bar63_lookup tv
 WHERE t.slug='2-baruch-63-the-angel-destroyed-the-host'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=63 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isa 37:36 — *Then the angel of Yahuah went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand* — the destruction of the host the bright waters recount.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar63_lookup sv, _session412_2bar63_lookup tv
 WHERE t.slug='2-baruch-63-the-angel-destroyed-the-host'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=63 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chr 32:21 — *Yahuah sent an angel, which cut off all the mighty men of valour, and the leaders and captains in the camp of the king of Assyria* — the angel''s stroke on Sennacherib''s multitude Baruch recalls.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar63_lookup sv, _session412_2bar63_lookup tv
 WHERE t.slug='2-baruch-63-the-angel-destroyed-the-host'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=63 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=32 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-63-zion-saved-the-name-glorified
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ps 76:3 — *There brake he the arrows of the bow, the shield, and the sword, and the battle* — the deliverance of Zion the bright waters celebrate, the host broken before the city.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar63_lookup sv, _session412_2bar63_lookup tv
 WHERE t.slug='2-baruch-63-zion-saved-the-name-glorified'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=63 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=76 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ps 76:1 — *In Yahudah is Elohim known: his name is great in Yashar''el* — the Name glorified throughout the land of which Baruch''s bright waters speak.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar63_lookup sv, _session412_2bar63_lookup tv
 WHERE t.slug='2-baruch-63-zion-saved-the-name-glorified'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=63 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=76 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_64.sql (session412 2-baruch 64) -----
-- Source anchor: pseudepigrapha/2-baruch ch64. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar64 (view _session412_2bar64_lookup). Sort band base 85575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar64_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-64-the-wickedness-of-manasseh
  ('pseudepigrapha', '2-baruch', 64, 1, 'canon', '2-kings', 21, 2, 'free', E'2 Kgs 21:2 — *he did that which was evil in the sight of Yahuah, after the abominations of the heathen, whom Yahuah cast out before the children of Yashar''el* — the wickedness of Manasseh the black waters name.'),
  ('pseudepigrapha', '2-baruch', 64, 2, 'canon', '2-kings', 21, 9, 'free', E'2 Kgs 21:9 — *Manasseh seduced them to do more evil than did the nations whom Yahuah destroyed before the children of Yashar''el* — the much impiety and slaying of the righteous the black waters recall.'),
  -- thread: 2-baruch-64-the-idol-and-the-wrath
  ('pseudepigrapha', '2-baruch', 64, 3, 'canon', '2-chronicles', 33, 7, 'free', E'2 Chr 33:7 — *he set a carved image, the idol which he had made, in the house of Elohim, of which Elohim had said to David and to Solomon his son... will I put my name for ever* — the abominable image Baruch''s black waters describe.'),
  ('pseudepigrapha', '2-baruch', 64, 4, 'canon', '2-kings', 21, 13, 'free', E'2 Kgs 21:13 — *I will stretch over Jerusalem the line of Samaria... and I will wipe Jerusalem as a man wipeth a dish* — the wrath gone forth to root out Zion the black waters foretell.'),
  ('pseudepigrapha', '2-baruch', 64, 4, 'canon', 'deuteronomy', 4, 25, 'free', E'Deut 4:25 — *and shall corrupt yourselves, and make a graven image... and shall do evil in the sight of Yahuah Elohayka, to provoke him to anger* — the law''s warning against the very idolatry that brought the wrath Baruch reads.'),
  -- thread: 2-baruch-64-manasseh-heard-yet-tormented
  ('pseudepigrapha', '2-baruch', 64, 8, 'canon', '2-chronicles', 33, 12, 'free', E'2 Chr 33:12 — *when he was in affliction, he besought Yahuah Elohav, and humbled himself greatly before the Elohim of his fathers* — the prayer of Manasseh that was heard, of which the black waters speak.'),
  ('pseudepigrapha', '2-baruch', 64, 8, 'apocrypha', 'the-prayer-of-manasseh', 1, 1, 'free', E'Prayer of Manasseh 1 — *O Yahuah, Almighty Yahuah of our fathers, Abraham, Isaac, and Jacob, and of their righteous seed* — the captive king''s own prayer that Baruch says was heard with the Most High.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar64_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar64_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-64-the-wickedness-of-manasseh',
       E'The wickedness of Manasseh, son of Hezekiah',
       E'The black ninth waters are read: *this is all the wickedness which was in the days of Manasseh the son of Hezekiah. For he wrought much impiety, and he slew the righteous... and he shed the blood of the innocent.* The son of the righteous king became the worst of the black waters — shedding innocent blood till Jerusalem overflowed. It ain''t new — that Manasseh did evil after the abominations of the heathen and filled Jerusalem with innocent blood is written in Kings before Baruch reads the ninth black waters.',
       sv.verse_id, ev.verse_id, 'extras', 85575
  FROM _session412_2bar64_lookup sv, _session412_2bar64_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=64 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=64 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-64-the-idol-and-the-wrath',
       E'The graven image and the wrath that uprooted Zion',
       E'The black waters tell the abomination that brought ruin: *And he made an image with five faces... And then wrath went forth from the presence of the Mighty One to the intent that Zion should be rooted out.* Manasseh set a carved image in the house where the Name was to dwell, and the decree of forsaking went out against the people. It ain''t new — that he set a graven image in the house and made Judah to sin, so that the line of Samaria was stretched over Jerusalem, is in Kings before Baruch reads the wrath go forth.',
       sv.verse_id, ev.verse_id, 'extras', 85578
  FROM _session412_2bar64_lookup sv, _session412_2bar64_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=64 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=64 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-64-manasseh-heard-yet-tormented',
       E'His prayer heard, yet he was not worthy',
       E'The black waters give a strange mercy: *For though his prayer was heard with the El Elyon, finally, when he was cast into the brazen horse and the brazen horse was melted, it served as a sign unto him... For he who is able to benefit is also able to torment.* The book records the prayer of the captive king — heard, yet leaving him unworthy. It ain''t new — that Manasseh in affliction besought Yahuah and humbled himself greatly is in the Chronicle; weave the canonical root, not the brazen-horse embellishment.',
       sv.verse_id, ev.verse_id, 'extras', 85581
  FROM _session412_2bar64_lookup sv, _session412_2bar64_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=64 AND sv.verse_number=8
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=64 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-64-the-wickedness-of-manasseh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kgs 21:2 — *he did that which was evil in the sight of Yahuah, after the abominations of the heathen, whom Yahuah cast out before the children of Yashar''el* — the wickedness of Manasseh the black waters name.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar64_lookup sv, _session412_2bar64_lookup tv
 WHERE t.slug='2-baruch-64-the-wickedness-of-manasseh'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=64 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=21 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kgs 21:9 — *Manasseh seduced them to do more evil than did the nations whom Yahuah destroyed before the children of Yashar''el* — the much impiety and slaying of the righteous the black waters recall.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar64_lookup sv, _session412_2bar64_lookup tv
 WHERE t.slug='2-baruch-64-the-wickedness-of-manasseh'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=64 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=21 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-64-the-idol-and-the-wrath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chr 33:7 — *he set a carved image, the idol which he had made, in the house of Elohim, of which Elohim had said to David and to Solomon his son... will I put my name for ever* — the abominable image Baruch''s black waters describe.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar64_lookup sv, _session412_2bar64_lookup tv
 WHERE t.slug='2-baruch-64-the-idol-and-the-wrath'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=64 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=33 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kgs 21:13 — *I will stretch over Jerusalem the line of Samaria... and I will wipe Jerusalem as a man wipeth a dish* — the wrath gone forth to root out Zion the black waters foretell.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar64_lookup sv, _session412_2bar64_lookup tv
 WHERE t.slug='2-baruch-64-the-idol-and-the-wrath'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=64 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=21 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deut 4:25 — *and shall corrupt yourselves, and make a graven image... and shall do evil in the sight of Yahuah Elohayka, to provoke him to anger* — the law''s warning against the very idolatry that brought the wrath Baruch reads.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar64_lookup sv, _session412_2bar64_lookup tv
 WHERE t.slug='2-baruch-64-the-idol-and-the-wrath'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=64 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-64-manasseh-heard-yet-tormented
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chr 33:12 — *when he was in affliction, he besought Yahuah Elohav, and humbled himself greatly before the Elohim of his fathers* — the prayer of Manasseh that was heard, of which the black waters speak.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar64_lookup sv, _session412_2bar64_lookup tv
 WHERE t.slug='2-baruch-64-manasseh-heard-yet-tormented'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=64 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=33 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Prayer of Manasseh 1 — *O Yahuah, Almighty Yahuah of our fathers, Abraham, Isaac, and Jacob, and of their righteous seed* — the captive king''s own prayer that Baruch says was heard with the Most High.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar64_lookup sv, _session412_2bar64_lookup tv
 WHERE t.slug='2-baruch-64-manasseh-heard-yet-tormented'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=64 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-prayer-of-manasseh' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_65.sql (session412 2-baruch 65) -----
-- Source anchor: pseudepigrapha/2-baruch ch65. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar65 (view _session412_2bar65_lookup). Sort band base 85600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar65_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-65-he-thought-the-mighty-one-would-not-inquire
  ('pseudepigrapha', '2-baruch', 65, 1, 'canon', '2-kings', 21, 11, 'free', E'2 Kgs 21:11 — *Because Manasseh king of Yahudah hath done these abominations... and hath made Yahudah also to sin with his idols* — the very impiety Baruch says Manasseh thought would go uninquired.'),
  ('pseudepigrapha', '2-baruch', 65, 1, 'canon', '2-kings', 21, 12, 'free', E'2 Kgs 21:12 — *Behold, I am bringing such evil upon Jerusalem and Yahudah, that whosoever heareth of it, both his ears shall tingle* — the Mighty One inquiring after all, against the lie that He would not, which the black waters expose.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar65_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar65_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-65-he-thought-the-mighty-one-would-not-inquire',
       E'He thought the Mighty One would not inquire',
       E'The ninth black waters close on the heart of Manasseh''s sin: *Manasseh act impiously, and thought that in his time the Mighty One would not inquire into these things.* The worst of the black waters is not only the deed but the lie beneath it — that the Most High does not see and will not call to account. It ain''t new — that the wicked say in their heart He will not require it, while He surely visits the abomination of the idolater, stands in Kings before Baruch reads it in the black waters.',
       sv.verse_id, ev.verse_id, 'extras', 85600
  FROM _session412_2bar65_lookup sv, _session412_2bar65_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=65 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=65 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-65-he-thought-the-mighty-one-would-not-inquire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kgs 21:11 — *Because Manasseh king of Yahudah hath done these abominations... and hath made Yahudah also to sin with his idols* — the very impiety Baruch says Manasseh thought would go uninquired.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar65_lookup sv, _session412_2bar65_lookup tv
 WHERE t.slug='2-baruch-65-he-thought-the-mighty-one-would-not-inquire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=65 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=21 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kgs 21:12 — *Behold, I am bringing such evil upon Jerusalem and Yahudah, that whosoever heareth of it, both his ears shall tingle* — the Mighty One inquiring after all, against the lie that He would not, which the black waters expose.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar65_lookup sv, _session412_2bar65_lookup tv
 WHERE t.slug='2-baruch-65-he-thought-the-mighty-one-would-not-inquire'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=65 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=21 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_66.sql (session412 2-baruch 66) -----
-- Source anchor: pseudepigrapha/2-baruch ch66. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar66 (view _session412_2bar66_lookup). Sort band base 85625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar66_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-66-josiah-submitted-with-all-his-heart
  ('pseudepigrapha', '2-baruch', 66, 1, 'canon', '2-chronicles', 34, 31, 'free', E'2 Chr 34:31 — *the king stood in his place, and made a covenant before Yahuah, to walk after Yahuah, and to keep his commandments... with all his heart, and with all his soul* — the wholehearted submission of Josiah the bright waters commend.'),
  ('pseudepigrapha', '2-baruch', 66, 1, 'canon', 'deuteronomy', 30, 2, 'free', E'Deut 30:2 — *And shalt return unto Yahuah Elohayka, and shalt obey his voice... with all thine heart, and with all thy soul* — the law''s own call to return that Josiah, the bright waters, embodied.'),
  -- thread: 2-baruch-66-the-law-found-and-the-land-cleansed
  ('pseudepigrapha', '2-baruch', 66, 2, 'canon', '2-kings', 22, 8, 'free', E'2 Kgs 22:8 — *Hilkiah the high priest said unto Shaphan the scribe, I have found the book of the law in the house of Yahuah* — the finding of the law behind the cleansing the bright waters describe.'),
  ('pseudepigrapha', '2-baruch', 66, 2, 'canon', '2-kings', 23, 24, 'free', E'2 Kgs 23:24 — *the workers with familiar spirits, and the wizards, and the images, and the idols... did Josiah put away, that he might perform the words of the law* — the magicians and necromancers removed of which the bright waters speak.'),
  ('pseudepigrapha', '2-baruch', 66, 5, 'canon', '2-chronicles', 34, 33, 'free', E'2 Chr 34:33 — *Josiah took away all the abominations out of all the countries... and made all that were present in Yashar''el to serve, even to serve Yahuah their Elohim* — the king alone firm in the law, leaving none that wrought impiety, as Baruch tells.'),
  -- thread: 2-baruch-66-the-passover-kept
  ('pseudepigrapha', '2-baruch', 66, 4, 'canon', '2-kings', 23, 21, 'free', E'2 Kgs 23:21 — *the king commanded all the people, saying, Keep the passover unto Yahuah Elohaychem, as it is written in the book of this covenant* — the festivals restored in their sanctity the bright waters name.'),
  ('pseudepigrapha', '2-baruch', 66, 4, 'canon', '2-chronicles', 35, 1, 'free', E'2 Chr 35:1 — *Josiah kept a passover unto Yahuah in Jerusalem: and they killed the passover on the fourteenth day of the first month* — the kept feast behind the bright waters'' restored festivals.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar66_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar66_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-66-josiah-submitted-with-all-his-heart',
       E'Josiah, who submitted with all his heart',
       E'The bright tenth waters are read: *this is the purity of the generations of Josiah king of Yahudah, who was the only one at the time who submitted himself to the Mighty One with all his heart and with all his soul.* When he heard the words of the law he rent his clothes and made a covenant to walk after Yahuah with all his heart. It ain''t new — that Josiah turned to Yahuah with all his heart, soul, and might, walking in all the law of Moses, stands in Kings before Baruch reads him as the bright waters.',
       sv.verse_id, ev.verse_id, 'extras', 85625
  FROM _session412_2bar66_lookup sv, _session412_2bar66_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=66 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=66 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-66-the-law-found-and-the-land-cleansed',
       E'The law found, the land cleansed of idols',
       E'The bright waters tell the reform: *And he cleansed the land from idols, and hallowed all the vessels which had been polluted, and restored the offerings to the altar... and brought back the priests to their ministry.* When the book of the law was found in the house of Yahuah, the king purged the high places and the necromancers from the land. It ain''t new — that Hilkiah found the book of the law in the house of Yahuah, and Josiah put away the workers with familiar spirits to perform its words, stands in Kings before the bright waters record it.',
       sv.verse_id, ev.verse_id, 'extras', 85628
  FROM _session412_2bar66_lookup sv, _session412_2bar66_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=66 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=66 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-66-the-passover-kept',
       E'The Passover kept as it was written',
       E'Behind the bright waters'' purified festivals — *the festivals and the sabbaths he established in their sanctity* — stands the great Passover of Josiah, kept as none had been since the days of the judges. It ain''t new — that Josiah commanded all the people, Keep the passover unto Yahuah your Elohim, as it is written in the book of this covenant, is in Kings before Baruch reads the festivals restored in the tenth bright waters.',
       sv.verse_id, ev.verse_id, 'extras', 85631
  FROM _session412_2bar66_lookup sv, _session412_2bar66_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=66 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=66 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-66-josiah-submitted-with-all-his-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chr 34:31 — *the king stood in his place, and made a covenant before Yahuah, to walk after Yahuah, and to keep his commandments... with all his heart, and with all his soul* — the wholehearted submission of Josiah the bright waters commend.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar66_lookup sv, _session412_2bar66_lookup tv
 WHERE t.slug='2-baruch-66-josiah-submitted-with-all-his-heart'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=66 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=34 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deut 30:2 — *And shalt return unto Yahuah Elohayka, and shalt obey his voice... with all thine heart, and with all thy soul* — the law''s own call to return that Josiah, the bright waters, embodied.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar66_lookup sv, _session412_2bar66_lookup tv
 WHERE t.slug='2-baruch-66-josiah-submitted-with-all-his-heart'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=66 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-66-the-law-found-and-the-land-cleansed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kgs 22:8 — *Hilkiah the high priest said unto Shaphan the scribe, I have found the book of the law in the house of Yahuah* — the finding of the law behind the cleansing the bright waters describe.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar66_lookup sv, _session412_2bar66_lookup tv
 WHERE t.slug='2-baruch-66-the-law-found-and-the-land-cleansed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=66 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kgs 23:24 — *the workers with familiar spirits, and the wizards, and the images, and the idols... did Josiah put away, that he might perform the words of the law* — the magicians and necromancers removed of which the bright waters speak.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar66_lookup sv, _session412_2bar66_lookup tv
 WHERE t.slug='2-baruch-66-the-law-found-and-the-land-cleansed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=66 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chr 34:33 — *Josiah took away all the abominations out of all the countries... and made all that were present in Yashar''el to serve, even to serve Yahuah their Elohim* — the king alone firm in the law, leaving none that wrought impiety, as Baruch tells.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar66_lookup sv, _session412_2bar66_lookup tv
 WHERE t.slug='2-baruch-66-the-law-found-and-the-land-cleansed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=66 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=34 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-66-the-passover-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kgs 23:21 — *the king commanded all the people, saying, Keep the passover unto Yahuah Elohaychem, as it is written in the book of this covenant* — the festivals restored in their sanctity the bright waters name.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar66_lookup sv, _session412_2bar66_lookup tv
 WHERE t.slug='2-baruch-66-the-passover-kept'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=66 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chr 35:1 — *Josiah kept a passover unto Yahuah in Jerusalem: and they killed the passover on the fourteenth day of the first month* — the kept feast behind the bright waters'' restored festivals.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar66_lookup sv, _session412_2bar66_lookup tv
 WHERE t.slug='2-baruch-66-the-passover-kept'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=66 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=35 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_67.sql (session412 2-baruch 67) -----
-- Source anchor: pseudepigrapha/2-baruch ch67. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar67 (view _session412_2bar67_lookup). Sort band base 85650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar67_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-67-the-calamity-befalling-zion
  ('pseudepigrapha', '2-baruch', 67, 1, 'canon', 'lamentations', 1, 1, 'free', E'Lam 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations* — the calamity befalling Zion the black waters mourn.'),
  ('pseudepigrapha', '2-baruch', 67, 2, 'canon', 'lamentations', 2, 1, 'free', E'Lam 2:1 — *How hath Yahuah covered the daughter of Zion with a cloud in his anger, and cast down from heaven unto the earth the beauty of Yashar''el* — Zion delivered up, as the black waters tell.'),
  -- thread: 2-baruch-67-the-burning-of-the-temple
  ('pseudepigrapha', '2-baruch', 67, 6, 'canon', '2-kings', 25, 9, 'free', E'2 Kgs 25:9 — *he burnt the house of Yahuah, and the king''s house, and all the houses of Jerusalem... burnt he with fire* — the laying waste of Jerusalem the black waters lament.'),
  ('pseudepigrapha', '2-baruch', 67, 6, 'canon', 'jeremiah', 52, 13, 'free', E'Jer 52:13 — *And burned the house of Yahuah, and the king''s house; and all the houses of Jerusalem... burned he with fire* — the temple''s burning behind the smoke extinguished in Zion that Baruch reads.'),
  -- thread: 2-baruch-67-the-king-of-babylon-shall-fall
  ('pseudepigrapha', '2-baruch', 67, 7, 'canon', 'psalms', 137, 1, 'free', E'Ps 137:1 — *By the rivers of Babylon, there we sat down, yea, we wept, when we remembered Zion* — the captivity under the king who boasts, the black waters of Zion delivered up.'),
  ('pseudepigrapha', '2-baruch', 67, 8, 'canon', 'psalms', 137, 8, 'free', E'Ps 137:8 — *O daughter of Babylon, who art to be destroyed; happy shall he be, that rewardeth thee as thou hast served us* — Babylon''s appointed fall, the king who shall fall at last as Baruch foretells.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar67_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar67_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-67-the-calamity-befalling-zion',
       E'The calamity now befalling Zion',
       E'The black eleventh waters are read as the present grief: *this is the calamity which is now befalling Zion... That Zion was so delivered up, And that lo! the Gentiles boast in their hearts.* The city that was great among the nations sits solitary as a widow, trodden down by her enemies. It ain''t new — that the city full of people is become as a widow, weeping in the night with none to comfort her, is Jeremiah''s lament before Baruch reads the black waters of Zion''s fall.',
       sv.verse_id, ev.verse_id, 'extras', 85650
  FROM _session412_2bar67_lookup sv, _session412_2bar67_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=67 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=67 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-67-the-burning-of-the-temple',
       E'Jerusalem laid waste, the smoke of the law extinguished',
       E'The black waters tell the desolation: *Because so far as Zion is delivered up And Jerusalem laid waste... the vapour of the smoke of the incense of the righteousness which is by the law is extinguished in Zion.* The captain of the guard burned the house of Yahuah and broke down the walls of Jerusalem. It ain''t new — that Nebuzar-adan burned the house of Yahuah and the army of the Chaldees brake down the walls of Jerusalem is in Kings before Baruch reads the smoke of impiety where the incense had risen.',
       sv.verse_id, ev.verse_id, 'extras', 85653
  FROM _session412_2bar67_lookup sv, _session412_2bar67_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=67 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=67 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-67-the-king-of-babylon-shall-fall',
       E'The king of Babylon shall boast, but fall at last',
       E'The black waters end with the oppressor''s pride and doom: *the king of Babylon will arise who has now destroyed Zion, And he will boast over the people, And he will speak great things in his heart... But he also shall fall at last.* They wept by the rivers of Babylon, remembering Zion; yet the daughter of Babylon is appointed to be destroyed. It ain''t new — that by the rivers of Babylon they sat and wept, and Babylon is to be repaid, is the Psalm''s word before Baruch declares the king of Babylon shall fall.',
       sv.verse_id, ev.verse_id, 'extras', 85656
  FROM _session412_2bar67_lookup sv, _session412_2bar67_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=67 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=67 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-67-the-calamity-befalling-zion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lam 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations* — the calamity befalling Zion the black waters mourn.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar67_lookup sv, _session412_2bar67_lookup tv
 WHERE t.slug='2-baruch-67-the-calamity-befalling-zion'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=67 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lam 2:1 — *How hath Yahuah covered the daughter of Zion with a cloud in his anger, and cast down from heaven unto the earth the beauty of Yashar''el* — Zion delivered up, as the black waters tell.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar67_lookup sv, _session412_2bar67_lookup tv
 WHERE t.slug='2-baruch-67-the-calamity-befalling-zion'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=67 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-67-the-burning-of-the-temple
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kgs 25:9 — *he burnt the house of Yahuah, and the king''s house, and all the houses of Jerusalem... burnt he with fire* — the laying waste of Jerusalem the black waters lament.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar67_lookup sv, _session412_2bar67_lookup tv
 WHERE t.slug='2-baruch-67-the-burning-of-the-temple'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=67 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=25 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jer 52:13 — *And burned the house of Yahuah, and the king''s house; and all the houses of Jerusalem... burned he with fire* — the temple''s burning behind the smoke extinguished in Zion that Baruch reads.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar67_lookup sv, _session412_2bar67_lookup tv
 WHERE t.slug='2-baruch-67-the-burning-of-the-temple'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=67 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-67-the-king-of-babylon-shall-fall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ps 137:1 — *By the rivers of Babylon, there we sat down, yea, we wept, when we remembered Zion* — the captivity under the king who boasts, the black waters of Zion delivered up.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar67_lookup sv, _session412_2bar67_lookup tv
 WHERE t.slug='2-baruch-67-the-king-of-babylon-shall-fall'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=67 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=137 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ps 137:8 — *O daughter of Babylon, who art to be destroyed; happy shall he be, that rewardeth thee as thou hast served us* — Babylon''s appointed fall, the king who shall fall at last as Baruch foretells.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar67_lookup sv, _session412_2bar67_lookup tv
 WHERE t.slug='2-baruch-67-the-king-of-babylon-shall-fall'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=67 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=137 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_68.sql (session412 2-baruch 68) -----
-- Source anchor: pseudepigrapha/2-baruch ch68. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar68 (view _session412_2bar68_lookup). Sort band base 85675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar68_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-68-zion-builded-again
  ('pseudepigrapha', '2-baruch', 68, 5, 'canon', 'ezra', 1, 2, 'free', E'Ezra 1:2 — *Yahuah Elohim of heaven... hath charged me to build him an house at Jerusalem, which is in Yahudah* — the rebuilding of Zion the bright twelfth waters foretell.'),
  ('pseudepigrapha', '2-baruch', 68, 5, 'canon', 'isaiah', 44, 28, 'free', E'Isa 44:28 — *That saith of Cyrus, He is my shepherd... even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid* — the word over Cyrus behind the return the bright waters describe.'),
  ('pseudepigrapha', '2-baruch', 68, 5, 'canon', 'zechariah', 4, 9, 'free', E'Zech 4:9 — *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it* — the restored ministry and rebuilt house of which the bright waters speak.'),
  -- thread: 2-baruch-68-not-fully-as-in-the-beginning
  ('pseudepigrapha', '2-baruch', 68, 6, 'canon', 'haggai', 2, 3, 'free', E'Hag 2:3 — *Who is left among you that saw this house in her first glory? and how do ye see it now? is it not in your eyes in comparison of it as nothing?* — the second house not fully as the first, as Baruch''s bright waters confess.'),
  ('pseudepigrapha', '2-baruch', 68, 6, 'canon', 'haggai', 2, 7, 'free', E'Hag 2:7 — *I will shake all nations, and the desire of all nations shall come: and I will fill this house with glory* — the promise over the rebuilt house that lies beyond the bright waters'' ''not fully as in the beginning.''')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar68_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar68_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-68-zion-builded-again',
       E'Zion builded again, the offerings restored',
       E'The bright twelfth waters are read as the return: *at that time after a little interval Zion will again be builded, and its offerings will again be restored, and the priests will return to their ministry, and also the Gentiles will come to glorify it.* After the captivity Cyrus stirred to send Judah home to build the house at Jerusalem. It ain''t new — that Yahuah stirred up the spirit of Cyrus to proclaim, Build the house at Jerusalem, is in Ezra before Baruch reads Zion builded again in the bright waters.',
       sv.verse_id, ev.verse_id, 'extras', 85675
  FROM _session412_2bar68_lookup sv, _session412_2bar68_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=68 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=68 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-68-not-fully-as-in-the-beginning',
       E'Not fully as in the beginning',
       E'The bright waters temper the return with a sober word: *Nevertheless, not fully as in the beginning.* The second house would rise, but its glory would not match the first — yet the promise hangs over it that its latter glory shall be greater. It ain''t new — that the elders who saw the first house wept at the second, and Yahuah said, Yet once, I will fill this house with glory, stands in Haggai before Baruch reads the rebuilding that is not fully as before.',
       sv.verse_id, ev.verse_id, 'extras', 85678
  FROM _session412_2bar68_lookup sv, _session412_2bar68_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=68 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=68 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-68-zion-builded-again
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 1:2 — *Yahuah Elohim of heaven... hath charged me to build him an house at Jerusalem, which is in Yahudah* — the rebuilding of Zion the bright twelfth waters foretell.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar68_lookup sv, _session412_2bar68_lookup tv
 WHERE t.slug='2-baruch-68-zion-builded-again'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=68 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isa 44:28 — *That saith of Cyrus, He is my shepherd... even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid* — the word over Cyrus behind the return the bright waters describe.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar68_lookup sv, _session412_2bar68_lookup tv
 WHERE t.slug='2-baruch-68-zion-builded-again'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=68 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zech 4:9 — *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it* — the restored ministry and rebuilt house of which the bright waters speak.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar68_lookup sv, _session412_2bar68_lookup tv
 WHERE t.slug='2-baruch-68-zion-builded-again'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=68 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-68-not-fully-as-in-the-beginning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hag 2:3 — *Who is left among you that saw this house in her first glory? and how do ye see it now? is it not in your eyes in comparison of it as nothing?* — the second house not fully as the first, as Baruch''s bright waters confess.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar68_lookup sv, _session412_2bar68_lookup tv
 WHERE t.slug='2-baruch-68-not-fully-as-in-the-beginning'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=68 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hag 2:7 — *I will shake all nations, and the desire of all nations shall come: and I will fill this house with glory* — the promise over the rebuilt house that lies beyond the bright waters'' ''not fully as in the beginning.'''
  FROM cross_reference_threads t, cross_references x, _session412_2bar68_lookup sv, _session412_2bar68_lookup tv
 WHERE t.slug='2-baruch-68-not-fully-as-in-the-beginning'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=68 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_69.sql (session412 2-baruch 69) -----
-- Source anchor: pseudepigrapha/2-baruch ch69. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar69 (view _session412_2bar69_lookup). Sort band base 85700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar69_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-69-the-last-waters-darker-than-all
  ('pseudepigrapha', '2-baruch', 69, 1, 'canon', 'daniel', 12, 1, 'free', E'Dan 12:1 — *there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered* — the last waters darker than all before, before the consummation Baruch reads.'),
  ('pseudepigrapha', '2-baruch', 69, 1, 'canon', 'matthew', 24, 21, 'free', E'Matt 24:21 — *For then shall be great tribulation, such as was not since the beginning of the world to this time, no, nor ever shall be* — the darkest waters before the end that Baruch beholds.'),
  -- thread: 2-baruch-69-six-kinds-of-impiety-foreseen
  ('pseudepigrapha', '2-baruch', 69, 3, 'canon', 'matthew', 24, 12, 'free', E'Matt 24:12 — *And because iniquity shall abound, the love of many shall wax cold* — the impieties of the last black waters Baruch says were foreseen.'),
  ('pseudepigrapha', '2-baruch', 69, 3, 'canon', '2-timothy', 3, 1, 'free', E'2 Tim 3:1 — *This know also, that in the last days perilous times shall come* — the gathered enormities of the end the darkest waters foresee.'),
  ('pseudepigrapha', '2-baruch', 69, 3, 'canon', '2-timothy', 3, 2, 'free', E'2 Tim 3:2 — *For men shall be lovers of their own selves, covetous, boasters, proud, blasphemers* — the kinds of impiety foreseen before the consummation, as Baruch''s last waters tell.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar69_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar69_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-69-the-last-waters-darker-than-all',
       E'The last waters, darker than all before them',
       E'The last black waters are read as the worst of the age: *the last waters which thou hast seen which were darker than all that were before them... belong to the whole world.* Before the consummation comes a darkness deeper than any black waters of history, the time of trouble such as never was. It ain''t new — that there shall be a time of trouble such as never was since there was a nation, and a great tribulation such as was not since the beginning of the world, stands in Daniel and the words of Messiah before Baruch reads the darkest waters.',
       sv.verse_id, ev.verse_id, 'extras', 85700
  FROM _session412_2bar69_lookup sv, _session412_2bar69_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=69 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=69 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-69-six-kinds-of-impiety-foreseen',
       E'The impieties foreseen before the consummation',
       E'The angel tells that the darkness is no surprise to the Most High: *as to the enormities and the impieties which should be wrought before Him, He foresaw six kinds of them.* The last black waters gather the world''s iniquity into a flood at the end, the love of many waxing cold, men lovers of themselves in the last days. It ain''t new — that iniquity shall abound and the love of many wax cold, and that in the last days perilous times shall come, is the word of Messiah and the apostle before Baruch reads the impieties foreseen.',
       sv.verse_id, ev.verse_id, 'extras', 85703
  FROM _session412_2bar69_lookup sv, _session412_2bar69_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=69 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=69 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-69-the-last-waters-darker-than-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Dan 12:1 — *there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered* — the last waters darker than all before, before the consummation Baruch reads.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar69_lookup sv, _session412_2bar69_lookup tv
 WHERE t.slug='2-baruch-69-the-last-waters-darker-than-all'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=69 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matt 24:21 — *For then shall be great tribulation, such as was not since the beginning of the world to this time, no, nor ever shall be* — the darkest waters before the end that Baruch beholds.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar69_lookup sv, _session412_2bar69_lookup tv
 WHERE t.slug='2-baruch-69-the-last-waters-darker-than-all'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=69 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-69-six-kinds-of-impiety-foreseen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matt 24:12 — *And because iniquity shall abound, the love of many shall wax cold* — the impieties of the last black waters Baruch says were foreseen.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar69_lookup sv, _session412_2bar69_lookup tv
 WHERE t.slug='2-baruch-69-six-kinds-of-impiety-foreseen'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=69 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Tim 3:1 — *This know also, that in the last days perilous times shall come* — the gathered enormities of the end the darkest waters foresee.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar69_lookup sv, _session412_2bar69_lookup tv
 WHERE t.slug='2-baruch-69-six-kinds-of-impiety-foreseen'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=69 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Tim 3:2 — *For men shall be lovers of their own selves, covetous, boasters, proud, blasphemers* — the kinds of impiety foreseen before the consummation, as Baruch''s last waters tell.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar69_lookup sv, _session412_2bar69_lookup tv
 WHERE t.slug='2-baruch-69-six-kinds-of-impiety-foreseen'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=69 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_70.sql (session412 2-baruch 70) -----
-- Source anchor: pseudepigrapha/2-baruch ch70. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar70 (view _session412_2bar70_lookup). Sort band base 85725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar70_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-70-the-harvest-of-the-age
  ('pseudepigrapha', '2-baruch', 70, 2, 'canon', 'matthew', 13, 39, 'free', E'Matt 13:39 — *the harvest is the end of the world; and the reapers are the angels* — the ripening field of good and evil seed brought to its harvest, exactly Baruch''s frame for the consummation.'),
  ('pseudepigrapha', '2-baruch', 70, 2, 'canon', 'matthew', 9, 37, 'free', E'Matt 9:37 — *The harvest truly is plenteous, but the labourers are few* — the world named a harvest waiting to be reaped, the very image Baruch sees ripen.'),
  ('pseudepigrapha', '2-baruch', 70, 2, 'canon', 'matthew', 9, 38, 'free', E'Matt 9:38 — *Pray ye therefore Yahuah (Lord) of the harvest, that he will send forth labourers into his harvest* — the Lord of the harvest who brings in the ripened age, the Mighty One of Baruch''s vision.'),
  ('pseudepigrapha', '2-baruch', 70, 2, 'canon', 'isaiah', 17, 5, 'free', E'Isa 17:5 — *And it shall be as when the harvestman gathereth the corn, and reapeth the ears with his arm* — the prophet''s harvest-figure for the day of reckoning, the ripened time Baruch describes.'),
  -- thread: 2-baruch-70-thrust-in-the-sickle-for-the-harvest-is-ripe
  ('pseudepigrapha', '2-baruch', 70, 2, 'canon', 'revelation', 14, 15, 'free', E'Rev 14:15 — *Thrust in thy sickle, and reap: for the time is come for thee to reap; for the harvest of the earth is ripe* — the harvest reaped when the time has ripened, Baruch''s consummation in John''s vision.'),
  ('pseudepigrapha', '2-baruch', 70, 2, 'canon', 'revelation', 14, 16, 'free', E'Rev 14:16 — *And he that sat on the cloud thrust in his sickle on the earth; and the earth was reaped* — the earth brought in at the end of the age, as Baruch''s good and evil seeds are gathered.'),
  ('pseudepigrapha', '2-baruch', 70, 2, 'canon', 'joel', 3, 13, 'free', E'Joel 3:13 — *Put ye in the sickle, for the harvest is ripe: come, get you down; for the press is full* — the prophet''s call to reap the ripe harvest of judgment, the word Baruch''s angel speaks.'),
  -- thread: 2-baruch-70-confusion-and-strife-upon-all-men
  ('pseudepigrapha', '2-baruch', 70, 3, 'canon', 'zechariah', 14, 13, 'free', E'Zech 14:13 — *a great tumult from Yahuah (LORD) shall be among them; and they shall lay hold every one on the hand of his neighbour, and his hand shall rise up against the hand of his neighbour* — the mutual strife that breaks out in the last day, the hating and provoking of Baruch''s vision.'),
  -- thread: 2-baruch-70-delivered-into-the-hands-of-my-servant-messiah
  ('pseudepigrapha', '2-baruch', 70, 9, 'canon', 'isaiah', 11, 4, 'free', E'Isa 11:4 — *with righteousness shall he judge the poor... and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* — the Anointed into whose hands the survivors are delivered, the Servant Messiah of David''s shoot.'),
  ('pseudepigrapha', '2-baruch', 70, 7, 'canon', 'joel', 3, 13, 'free', E'Joel 3:13 — *Put ye in the sickle, for the harvest is ripe... for their wickedness is great* — the Most High gathering the nations he has prepared for judgment, as Baruch''s prepared peoples come to make war.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar70_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar70_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-70-the-harvest-of-the-age',
       E'The harvest of the age',
       E'The angel reads the last black waters as the consummation: *it shall be when the time of the age has ripened, And the harvest of its evil and good seeds has come, That the Mighty One will bring upon the earth and its inhabitants... Perturbation of spirit and stupor of heart.* The world is a field sown with good and evil seed, and the end of the age is its harvest. It ain''t new — Yahusha said the harvest is the end of the age, and bade his own pray the Lord of the harvest to send forth reapers.',
       sv.verse_id, ev.verse_id, 'extras', 85725
  FROM _session412_2bar70_lookup sv, _session412_2bar70_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=70 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-70-thrust-in-the-sickle-for-the-harvest-is-ripe',
       E'Thrust in the sickle, for the harvest is ripe',
       E'When the appointed seeds have ripened, the Mighty One reaps. It ain''t new — John saw the sickle thrust into the earth and the prophet Joel heard the same word over the valley of decision, that the harvest of judgment comes when the time is full.',
       sv.verse_id, ev.verse_id, 'extras', 85728
  FROM _session412_2bar70_lookup sv, _session412_2bar70_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=70 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-70-confusion-and-strife-upon-all-men',
       E'Confusion and strife upon all men',
       E'Before the harvest comes the unravelling: *they shall hate one another, And provoke one another to fight... Then shall confusion fall upon all men, And some of them shall fall in battle.* Neighbour turns on neighbour, the mean rule over the honourable, and the survivors of war fall to earthquake, fire and famine. It ain''t new — Zechariah foresaw a great tumult in which every man''s hand rises against his neighbour''s in that day.',
       sv.verse_id, ev.verse_id, 'extras', 85731
  FROM _session412_2bar70_lookup sv, _session412_2bar70_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=70 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-70-delivered-into-the-hands-of-my-servant-messiah',
       E'Delivered into the hands of My servant Messiah',
       E'After war and earthquake and fire and famine have run their course, *whosoever... gets safe out of and escapes all these things aforesaid will be delivered into the hands of My servant Messiah.* The survivors of the harvest''s wrath are not lost to chance but given over to the Anointed — the servant of David''s hope who reigns when the age has ripened. It ain''t new — the Most High reveals the peoples he has prepared and brings the remnant under his appointed Servant.',
       sv.verse_id, ev.verse_id, 'extras', 85734
  FROM _session412_2bar70_lookup sv, _session412_2bar70_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=70 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-70-the-harvest-of-the-age
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matt 13:39 — *the harvest is the end of the world; and the reapers are the angels* — the ripening field of good and evil seed brought to its harvest, exactly Baruch''s frame for the consummation.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar70_lookup sv, _session412_2bar70_lookup tv
 WHERE t.slug='2-baruch-70-the-harvest-of-the-age'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matt 9:37 — *The harvest truly is plenteous, but the labourers are few* — the world named a harvest waiting to be reaped, the very image Baruch sees ripen.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar70_lookup sv, _session412_2bar70_lookup tv
 WHERE t.slug='2-baruch-70-the-harvest-of-the-age'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matt 9:38 — *Pray ye therefore Yahuah (Lord) of the harvest, that he will send forth labourers into his harvest* — the Lord of the harvest who brings in the ripened age, the Mighty One of Baruch''s vision.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar70_lookup sv, _session412_2bar70_lookup tv
 WHERE t.slug='2-baruch-70-the-harvest-of-the-age'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isa 17:5 — *And it shall be as when the harvestman gathereth the corn, and reapeth the ears with his arm* — the prophet''s harvest-figure for the day of reckoning, the ripened time Baruch describes.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar70_lookup sv, _session412_2bar70_lookup tv
 WHERE t.slug='2-baruch-70-the-harvest-of-the-age'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-70-thrust-in-the-sickle-for-the-harvest-is-ripe
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Rev 14:15 — *Thrust in thy sickle, and reap: for the time is come for thee to reap; for the harvest of the earth is ripe* — the harvest reaped when the time has ripened, Baruch''s consummation in John''s vision.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar70_lookup sv, _session412_2bar70_lookup tv
 WHERE t.slug='2-baruch-70-thrust-in-the-sickle-for-the-harvest-is-ripe'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Rev 14:16 — *And he that sat on the cloud thrust in his sickle on the earth; and the earth was reaped* — the earth brought in at the end of the age, as Baruch''s good and evil seeds are gathered.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar70_lookup sv, _session412_2bar70_lookup tv
 WHERE t.slug='2-baruch-70-thrust-in-the-sickle-for-the-harvest-is-ripe'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 3:13 — *Put ye in the sickle, for the harvest is ripe: come, get you down; for the press is full* — the prophet''s call to reap the ripe harvest of judgment, the word Baruch''s angel speaks.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar70_lookup sv, _session412_2bar70_lookup tv
 WHERE t.slug='2-baruch-70-thrust-in-the-sickle-for-the-harvest-is-ripe'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-70-confusion-and-strife-upon-all-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zech 14:13 — *a great tumult from Yahuah (LORD) shall be among them; and they shall lay hold every one on the hand of his neighbour, and his hand shall rise up against the hand of his neighbour* — the mutual strife that breaks out in the last day, the hating and provoking of Baruch''s vision.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar70_lookup sv, _session412_2bar70_lookup tv
 WHERE t.slug='2-baruch-70-confusion-and-strife-upon-all-men'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-70-delivered-into-the-hands-of-my-servant-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isa 11:4 — *with righteousness shall he judge the poor... and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* — the Anointed into whose hands the survivors are delivered, the Servant Messiah of David''s shoot.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar70_lookup sv, _session412_2bar70_lookup tv
 WHERE t.slug='2-baruch-70-delivered-into-the-hands-of-my-servant-messiah'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 3:13 — *Put ye in the sickle, for the harvest is ripe... for their wickedness is great* — the Most High gathering the nations he has prepared for judgment, as Baruch''s prepared peoples come to make war.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar70_lookup sv, _session412_2bar70_lookup tv
 WHERE t.slug='2-baruch-70-delivered-into-the-hands-of-my-servant-messiah'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=70 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_71.sql (session412 2-baruch 71) -----
-- Source anchor: pseudepigrapha/2-baruch ch71. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar71 (view _session412_2bar71_lookup). Sort band base 85750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar71_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-71-the-holy-land-shall-shelter-its-own
  ('pseudepigrapha', '2-baruch', 71, 1, 'canon', 'isaiah', 26, 20, 'free', E'Isa 26:20 — *Come, my people, enter thou into thy chambers, and shut thy doors about thee: hide thyself as it were for a little moment, until the indignation be overpast* — the people sheltered while wrath passes, the holy land''s protection Baruch names.'),
  ('pseudepigrapha', '2-baruch', 71, 1, 'canon', 'daniel', 12, 1, 'free', E'Dan 12:1 — *there shall be a time of trouble, such as never was... and at that time thy people shall be delivered, every one that shall be found written in the book* — the deliverance of the covenant people in the worst hour, the mercy on its own that Baruch sees.'),
  ('pseudepigrapha', '2-baruch', 71, 1, 'canon', 'revelation', 7, 3, 'free', E'Rev 7:3 — *Hurt not the earth, neither the sea, nor the trees, till we have sealed the servants of our Elohim (God) in their foreheads* — the harm withheld until the Most High''s own are secured, the sheltering Baruch promises the inhabiters of the holy land.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar71_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar71_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-71-the-holy-land-shall-shelter-its-own',
       E'The holy land shall shelter its own',
       E'In the day of confusion and harvest the angel adds a word of mercy: *the holy land shall have mercy on its own, And it shall protect its inhabiters at that time.* When the earth devours its inhabitants, the holy land is a chamber of refuge for the people of the covenant. It ain''t new — the prophet bade Yahuah''s people enter their chambers and hide for a little moment until the indignation be overpast, and Daniel saw the people delivered in the time of trouble, every one found written in the book.',
       sv.verse_id, ev.verse_id, 'extras', 85750
  FROM _session412_2bar71_lookup sv, _session412_2bar71_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=71 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=71 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-71-the-holy-land-shall-shelter-its-own
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isa 26:20 — *Come, my people, enter thou into thy chambers, and shut thy doors about thee: hide thyself as it were for a little moment, until the indignation be overpast* — the people sheltered while wrath passes, the holy land''s protection Baruch names.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar71_lookup sv, _session412_2bar71_lookup tv
 WHERE t.slug='2-baruch-71-the-holy-land-shall-shelter-its-own'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=71 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Dan 12:1 — *there shall be a time of trouble, such as never was... and at that time thy people shall be delivered, every one that shall be found written in the book* — the deliverance of the covenant people in the worst hour, the mercy on its own that Baruch sees.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar71_lookup sv, _session412_2bar71_lookup tv
 WHERE t.slug='2-baruch-71-the-holy-land-shall-shelter-its-own'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=71 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Rev 7:3 — *Hurt not the earth, neither the sea, nor the trees, till we have sealed the servants of our Elohim (God) in their foreheads* — the harm withheld until the Most High''s own are secured, the sheltering Baruch promises the inhabiters of the holy land.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar71_lookup sv, _session412_2bar71_lookup tv
 WHERE t.slug='2-baruch-71-the-holy-land-shall-shelter-its-own'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=71 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_72.sql (session412 2-baruch 72) -----
-- Source anchor: pseudepigrapha/2-baruch ch72. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar72 (view _session412_2bar72_lookup). Sort band base 85775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar72_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-72-the-bright-lightning-the-time-of-my-messiah
  ('pseudepigrapha', '2-baruch', 72, 2, 'canon', 'isaiah', 11, 10, 'free', E'Isa 11:10 — *And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek* — the Anointed who summons all the nations, Baruch''s Messiah revealed at the consummation.'),
  ('pseudepigrapha', '2-baruch', 72, 2, 'canon', 'isaiah', 11, 4, 'free', E'Isa 11:4 — *with righteousness shall he judge the poor... and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* — the Messiah who spares some and slays some, judging the nations by his word.'),
  ('pseudepigrapha', '2-baruch', 72, 2, 'canon', 'zechariah', 14, 9, 'free', E'Zech 14:9 — *And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* — the kingship that follows the summoning of the nations, the reign of Baruch''s Anointed.'),
  -- thread: 2-baruch-72-the-nations-spared-or-given-to-the-sword
  ('pseudepigrapha', '2-baruch', 72, 6, 'canon', 'isaiah', 11, 4, 'free', E'Isa 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth* — the just discernment of the Anointed, sparing the unoffending and giving the oppressor to the sword as Baruch tells.'),
  ('pseudepigrapha', '2-baruch', 72, 4, 'canon', 'zechariah', 14, 9, 'free', E'Zech 14:9 — *And Yahuah (LORD) shall be king over all the earth* — the kingdom established over the spared nations, the Messiah''s reign Baruch''s sparing prepares.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar72_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar72_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-72-the-bright-lightning-the-time-of-my-messiah',
       E'The bright lightning: the time of My Messiah',
       E'The angel turns from the black waters to *the bright lightning which is to come at the consummation*: when the nations are turbulent, *the time of My Messiah is come, he shall both summon all the nations, and some of them he shall spare, and some of them he shall slay.* The Anointed of David''s hope is revealed in his season to gather and to judge the peoples. It ain''t new — Isaiah saw the shoot of Jesse stand as an ensign to whom the nations seek, judging with righteousness and slaying the wicked with the breath of his lips.',
       sv.verse_id, ev.verse_id, 'extras', 85775
  FROM _session412_2bar72_lookup sv, _session412_2bar72_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=72 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=72 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-72-the-nations-spared-or-given-to-the-sword',
       E'The nations spared or given to the sword',
       E'The Anointed divides the peoples by how they dealt with Israel: *Every nation, which knows not Yashar''el (Israel) and has not trodden down the seed of Jacob, shall indeed be spared... But all those who have ruled over you, or have known you, shall be given up to the sword.* The measure is justice toward the covenant people. It ain''t new — Yahuah makes himself king over all the earth in that day, and Isaiah''s branch judges the nations with equity, smiting the oppressor and sparing the meek.',
       sv.verse_id, ev.verse_id, 'extras', 85778
  FROM _session412_2bar72_lookup sv, _session412_2bar72_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=72 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=72 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-72-the-bright-lightning-the-time-of-my-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isa 11:10 — *And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek* — the Anointed who summons all the nations, Baruch''s Messiah revealed at the consummation.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar72_lookup sv, _session412_2bar72_lookup tv
 WHERE t.slug='2-baruch-72-the-bright-lightning-the-time-of-my-messiah'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=72 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isa 11:4 — *with righteousness shall he judge the poor... and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* — the Messiah who spares some and slays some, judging the nations by his word.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar72_lookup sv, _session412_2bar72_lookup tv
 WHERE t.slug='2-baruch-72-the-bright-lightning-the-time-of-my-messiah'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=72 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zech 14:9 — *And Yahuah (LORD) shall be king over all the earth: in that day shall there be one Yahuah (LORD), and his name one* — the kingship that follows the summoning of the nations, the reign of Baruch''s Anointed.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar72_lookup sv, _session412_2bar72_lookup tv
 WHERE t.slug='2-baruch-72-the-bright-lightning-the-time-of-my-messiah'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=72 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-72-the-nations-spared-or-given-to-the-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isa 11:4 — *But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth* — the just discernment of the Anointed, sparing the unoffending and giving the oppressor to the sword as Baruch tells.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar72_lookup sv, _session412_2bar72_lookup tv
 WHERE t.slug='2-baruch-72-the-nations-spared-or-given-to-the-sword'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=72 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zech 14:9 — *And Yahuah (LORD) shall be king over all the earth* — the kingdom established over the spared nations, the Messiah''s reign Baruch''s sparing prepares.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar72_lookup sv, _session412_2bar72_lookup tv
 WHERE t.slug='2-baruch-72-the-nations-spared-or-given-to-the-sword'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=72 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_73.sql (session412 2-baruch 73) -----
-- Source anchor: pseudepigrapha/2-baruch ch73. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar73 (view _session412_2bar73_lookup). Sort band base 85800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar73_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-73-joy-and-healing-no-more-untimely-death
  ('pseudepigrapha', '2-baruch', 73, 1, 'canon', 'isaiah', 65, 19, 'free', E'Isa 65:19 — *And I will rejoice in Jerusalem, and joy in my people: and the voice of weeping shall be no more heard in her, nor the voice of crying* — the joy revealed and grief banished in the kingdom, Baruch''s gladness through the whole earth.'),
  ('pseudepigrapha', '2-baruch', 73, 3, 'canon', 'isaiah', 65, 20, 'free', E'Isa 65:20 — *There shall be no more thence an infant of days, nor an old man that hath not filled his days* — untimely death undone in the age of the Anointed, the very promise Baruch makes.'),
  ('pseudepigrapha', '2-baruch', 73, 2, 'canon', 'revelation', 21, 4, 'free', E'Rev 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain* — anguish and lamentation passing from among men, healing descending as Baruch foretells.'),
  -- thread: 2-baruch-73-the-beasts-shall-serve-and-women-bear-without-pain
  ('pseudepigrapha', '2-baruch', 73, 6, 'canon', 'isaiah', 65, 25, 'free', E'Isa 65:25 — *The wolf and the lamb shall feed together, and the lion shall eat straw like the bullock... They shall not hurt nor destroy in all my holy mountain* — the beasts at peace and serving, the asp and dragon tamed in Baruch''s kingdom.'),
  ('pseudepigrapha', '2-baruch', 73, 6, 'canon', 'isaiah', 11, 9, 'free', E'Isa 11:9 — *They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD)* — the creation reconciled under the Anointed, the little child to whom the serpents submit in Baruch''s vision.'),
  ('pseudepigrapha', '2-baruch', 73, 6, 'canon', 'hosea', 2, 18, 'free', E'Hos 2:18 — *in that day will I make a covenant for them with the beasts of the field, and with the fowls of heaven, and with the creeping things of the ground... and will make them to lie down safely* — the covenant with the beasts that makes them minister to men, exactly Baruch''s reconciled creation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar73_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar73_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-73-joy-and-healing-no-more-untimely-death',
       E'Joy and healing, no more untimely death',
       E'When the Anointed has sat down in peace on the throne of his kingdom, *joy shall then be revealed, And rest shall appear. And then healing shall descend in dew, And disease shall withdraw... And no one shall again die untimely.* The reign brings gladness, health, and the end of premature death. It ain''t new — Isaiah saw Yahuah rejoice in his people with the voice of weeping heard no more, the infant of days and the unfulfilled old man gone, and John saw all tears wiped away with no more death nor sorrow nor crying.',
       sv.verse_id, ev.verse_id, 'extras', 85800
  FROM _session412_2bar73_lookup sv, _session412_2bar73_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=73 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=73 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-73-the-beasts-shall-serve-and-women-bear-without-pain',
       E'The beasts shall serve and women bear without pain',
       E'In the peace of the kingdom even the creation is reconciled: *wild beasts shall come from the forest and minister unto men, And asps and dragons shall come forth from their holes to submit themselves to a little child. And women shall no longer then have pain when they bear.* The curse upon the ground and upon the womb is rolled back. It ain''t new — Isaiah saw the wolf and the lamb feed together and nothing hurt nor destroy in all the holy mountain, and Hosea heard Yahuah make a covenant with the beasts of the field that day.',
       sv.verse_id, ev.verse_id, 'extras', 85803
  FROM _session412_2bar73_lookup sv, _session412_2bar73_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=73 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=73 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-73-joy-and-healing-no-more-untimely-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isa 65:19 — *And I will rejoice in Jerusalem, and joy in my people: and the voice of weeping shall be no more heard in her, nor the voice of crying* — the joy revealed and grief banished in the kingdom, Baruch''s gladness through the whole earth.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar73_lookup sv, _session412_2bar73_lookup tv
 WHERE t.slug='2-baruch-73-joy-and-healing-no-more-untimely-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=73 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isa 65:20 — *There shall be no more thence an infant of days, nor an old man that hath not filled his days* — untimely death undone in the age of the Anointed, the very promise Baruch makes.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar73_lookup sv, _session412_2bar73_lookup tv
 WHERE t.slug='2-baruch-73-joy-and-healing-no-more-untimely-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=73 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Rev 21:4 — *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain* — anguish and lamentation passing from among men, healing descending as Baruch foretells.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar73_lookup sv, _session412_2bar73_lookup tv
 WHERE t.slug='2-baruch-73-joy-and-healing-no-more-untimely-death'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=73 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-73-the-beasts-shall-serve-and-women-bear-without-pain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isa 65:25 — *The wolf and the lamb shall feed together, and the lion shall eat straw like the bullock... They shall not hurt nor destroy in all my holy mountain* — the beasts at peace and serving, the asp and dragon tamed in Baruch''s kingdom.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar73_lookup sv, _session412_2bar73_lookup tv
 WHERE t.slug='2-baruch-73-the-beasts-shall-serve-and-women-bear-without-pain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=73 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isa 11:9 — *They shall not hurt nor destroy in all my holy mountain: for the earth shall be full of the knowledge of Yahuah (LORD)* — the creation reconciled under the Anointed, the little child to whom the serpents submit in Baruch''s vision.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar73_lookup sv, _session412_2bar73_lookup tv
 WHERE t.slug='2-baruch-73-the-beasts-shall-serve-and-women-bear-without-pain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=73 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hos 2:18 — *in that day will I make a covenant for them with the beasts of the field, and with the fowls of heaven, and with the creeping things of the ground... and will make them to lie down safely* — the covenant with the beasts that makes them minister to men, exactly Baruch''s reconciled creation.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar73_lookup sv, _session412_2bar73_lookup tv
 WHERE t.slug='2-baruch-73-the-beasts-shall-serve-and-women-bear-without-pain'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=73 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_74.sql (session412 2-baruch 74) -----
-- Source anchor: pseudepigrapha/2-baruch ch74. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar74 (view _session412_2bar74_lookup). Sort band base 85825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar74_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-74-the-passing-of-the-corruptible-into-the-incorruptible
  ('pseudepigrapha', '2-baruch', 74, 2, 'canon', 'revelation', 21, 4, 'free', E'Rev 21:4 — *there shall be no more death... for the former things are passed away* — the corruptible consummated and the incorruptible begun, Baruch''s near-to-things-which-die-not.'),
  ('pseudepigrapha', '2-baruch', 74, 2, 'pseudepigrapha', '2-enoch', 65, 6, 'free', E'2 Enoch 65:6 — *There will be one aeon, and all the righteous who shall escape Yahuah''s (Lord''s) great judgment, shall be collected in the great aeon... and they will live eternally* — the great age beyond corruption that Enoch was shown, the incorruptible beginning Baruch names (self-link).'),
  ('pseudepigrapha', '2-baruch', 74, 2, 'pseudepigrapha', '2-enoch', 65, 7, 'free', E'2 Enoch 65:7 — *for all corruptible things shall pass away, and there will be eternal life* — the corruptible passing into the deathless age, the very turn of Baruch''s bright lightning (self-link).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar74_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar74_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-74-the-passing-of-the-corruptible-into-the-incorruptible',
       E'The passing of the corruptible into the incorruptible',
       E'The angel closes the bright lightning: *that time is the consummation of that which is corruptible, And the beginning of that which is not corruptible. Therefore... it is far away from evils, and near to those things which die not. This is the bright lightning which came after the last dark waters.* The Anointed''s reign is the threshold of the deathless age. It ain''t new — John saw the former things pass away with no more death, and the great aeon of the righteous, where corruptible things pass and there is eternal life, was shown to Enoch.',
       sv.verse_id, ev.verse_id, 'extras', 85825
  FROM _session412_2bar74_lookup sv, _session412_2bar74_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=74 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=74 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-74-the-passing-of-the-corruptible-into-the-incorruptible
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Rev 21:4 — *there shall be no more death... for the former things are passed away* — the corruptible consummated and the incorruptible begun, Baruch''s near-to-things-which-die-not.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar74_lookup sv, _session412_2bar74_lookup tv
 WHERE t.slug='2-baruch-74-the-passing-of-the-corruptible-into-the-incorruptible'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=74 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Enoch 65:6 — *There will be one aeon, and all the righteous who shall escape Yahuah''s (Lord''s) great judgment, shall be collected in the great aeon... and they will live eternally* — the great age beyond corruption that Enoch was shown, the incorruptible beginning Baruch names (self-link).'
  FROM cross_reference_threads t, cross_references x, _session412_2bar74_lookup sv, _session412_2bar74_lookup tv
 WHERE t.slug='2-baruch-74-the-passing-of-the-corruptible-into-the-incorruptible'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=74 AND sv.verse_number=2
   AND tv.edition_slug='pseudepigrapha' AND tv.book_slug='2-enoch' AND tv.chapter_number=65 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Enoch 65:7 — *for all corruptible things shall pass away, and there will be eternal life* — the corruptible passing into the deathless age, the very turn of Baruch''s bright lightning (self-link).'
  FROM cross_reference_threads t, cross_references x, _session412_2bar74_lookup sv, _session412_2bar74_lookup tv
 WHERE t.slug='2-baruch-74-the-passing-of-the-corruptible-into-the-incorruptible'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=74 AND sv.verse_number=2
   AND tv.edition_slug='pseudepigrapha' AND tv.book_slug='2-enoch' AND tv.chapter_number=65 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_75.sql (session412 2-baruch 75) -----
-- Source anchor: pseudepigrapha/2-baruch ch75. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar75 (view _session412_2bar75_lookup). Sort band base 85850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar75_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-75-who-can-search-his-compassions
  ('pseudepigrapha', '2-baruch', 75, 1, 'canon', 'romans', 11, 33, 'free', E'Rom 11:33 — *O the depth of the riches both of the wisdom and knowledge of Elohim (God)! how unsearchable are his judgments, and his ways past finding out!* — the incomprehensible goodness Baruch confesses none can search out.'),
  ('pseudepigrapha', '2-baruch', 75, 5, 'canon', 'deuteronomy', 7, 8, 'free', E'Deut 7:8 — *But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers* — the people come not by merit but by the mercy and grace Baruch says is the only door to the age to come.'),
  -- thread: 2-baruch-75-him-who-brought-us-out-of-egypt
  ('pseudepigrapha', '2-baruch', 75, 7, 'canon', 'exodus', 20, 2, 'free', E'Exod 20:2 — *I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt, out of the house of bondage* — the Redeemer to whom Baruch bids the people submit and so rejoice, the opening word of the law itself.'),
  ('pseudepigrapha', '2-baruch', 75, 7, 'canon', 'deuteronomy', 30, 20, 'free', E'Deut 30:20 — *That thou mayest love Yahuah Elohayka (the LORD thy God)... and that thou mayest cleave unto him: for he is thy life, and the length of thy days* — to submit to and remember the Redeemer is life, the joy Baruch sets against grief.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar75_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar75_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-75-who-can-search-his-compassions',
       E'Who can search His compassions',
       E'Baruch answers the vision with praise of the unsearchable mercy: *Who can understand, O Yahuah (Lord), Thy goodness?... Or who can search into thy compassions, Which are infinite?... Unless he is one to whom Thou art merciful and gracious.* None come to the age to come but by the compassion of the Most High. It ain''t new — this is the mercy Yahuah proclaimed at Sinai and the unsearchable judgments the apostle adored.',
       sv.verse_id, ev.verse_id, 'extras', 85850
  FROM _session412_2bar75_lookup sv, _session412_2bar75_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=75 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=75 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-75-him-who-brought-us-out-of-egypt',
       E'Him who brought us out of Egypt',
       E'Baruch grounds hope in remembering the Redeemer: *if, indeed, we who exist know wherefore we have come, And submit ourselves to Him who brought us out of Egypt, We shall come again and remember those things which have passed, And shall rejoice.* To know and submit to the One who redeemed Israel from Egypt is to rejoice in the end; to forget him is to come again in grief. It ain''t new — this is the first word of the Ten Commandments, Yahuah who brought Israel out of the house of bondage, the ground of all the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 85853
  FROM _session412_2bar75_lookup sv, _session412_2bar75_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=75 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=75 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-75-who-can-search-his-compassions
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Rom 11:33 — *O the depth of the riches both of the wisdom and knowledge of Elohim (God)! how unsearchable are his judgments, and his ways past finding out!* — the incomprehensible goodness Baruch confesses none can search out.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar75_lookup sv, _session412_2bar75_lookup tv
 WHERE t.slug='2-baruch-75-who-can-search-his-compassions'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=75 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deut 7:8 — *But because Yahuah (LORD) loved you, and because he would keep the oath which he had sworn unto your fathers* — the people come not by merit but by the mercy and grace Baruch says is the only door to the age to come.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar75_lookup sv, _session412_2bar75_lookup tv
 WHERE t.slug='2-baruch-75-who-can-search-his-compassions'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=75 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-75-him-who-brought-us-out-of-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exod 20:2 — *I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt, out of the house of bondage* — the Redeemer to whom Baruch bids the people submit and so rejoice, the opening word of the law itself.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar75_lookup sv, _session412_2bar75_lookup tv
 WHERE t.slug='2-baruch-75-him-who-brought-us-out-of-egypt'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=75 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deut 30:20 — *That thou mayest love Yahuah Elohayka (the LORD thy God)... and that thou mayest cleave unto him: for he is thy life, and the length of thy days* — to submit to and remember the Redeemer is life, the joy Baruch sets against grief.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar75_lookup sv, _session412_2bar75_lookup tv
 WHERE t.slug='2-baruch-75-him-who-brought-us-out-of-egypt'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=75 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_76.sql (session412 2-baruch 76) -----
-- Source anchor: pseudepigrapha/2-baruch ch76. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar76 (view _session412_2bar76_lookup). Sort band base 85875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar76_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-76-instruct-the-people-that-they-may-live
  ('pseudepigrapha', '2-baruch', 76, 4, 'canon', 'deuteronomy', 30, 19, 'free', E'Deut 30:19 — *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* — instruction given that the people may live and not die, the charge Baruch is sent to deliver.'),
  ('pseudepigrapha', '2-baruch', 76, 4, 'canon', 'deuteronomy', 30, 20, 'free', E'Deut 30:20 — *for he is thy life, and the length of thy days* — the word learned and kept is the people''s life at the last times, as Baruch is charged to teach.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar76_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar76_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-76-instruct-the-people-that-they-may-live',
       E'Instruct the people that they may live',
       E'Before Baruch is taken up the Most High charges him: *instruct the people so far as thou art able, that they may learn so as not to die at the last time, but may learn in order that they may live at the last times.* The remnant''s life hangs on learning and keeping the word. It ain''t new — Moses set life and death before Israel and bade them choose life, and the law was given that the people might live and not die.',
       sv.verse_id, ev.verse_id, 'extras', 85875
  FROM _session412_2bar76_lookup sv, _session412_2bar76_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=76 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=76 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-76-instruct-the-people-that-they-may-live
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deut 30:19 — *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* — instruction given that the people may live and not die, the charge Baruch is sent to deliver.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar76_lookup sv, _session412_2bar76_lookup tv
 WHERE t.slug='2-baruch-76-instruct-the-people-that-they-may-live'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=76 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deut 30:20 — *for he is thy life, and the length of thy days* — the word learned and kept is the people''s life at the last times, as Baruch is charged to teach.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar76_lookup sv, _session412_2bar76_lookup tv
 WHERE t.slug='2-baruch-76-instruct-the-people-that-they-may-live'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=76 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_77.sql (session412 2-baruch 77) -----
-- Source anchor: pseudepigrapha/2-baruch ch77. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar77 (view _session412_2bar77_lookup). Sort band base 85900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar77_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-77-a-law-more-excellent-than-to-all-peoples
  ('pseudepigrapha', '2-baruch', 77, 3, 'canon', 'deuteronomy', 4, 8, 'free', E'Deut 4:8 — *And what nation is there so great, that hath statutes and judgments so righteous as all this law, which I set before you this day?* — the law more excellent than to all peoples, the gift Baruch sets before the remnant.'),
  ('pseudepigrapha', '2-baruch', 77, 3, 'canon', 'psalms', 19, 7, 'free', E'Ps 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the surpassing worth of the law Baruch names Israel''s portion above the nations.'),
  -- thread: 2-baruch-77-choose-the-law-and-live
  ('pseudepigrapha', '2-baruch', 77, 6, 'canon', 'deuteronomy', 30, 19, 'free', E'Deut 30:19 — *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* — the choosing of the right way that the remnant may not depart, Baruch''s call to direct their ways aright.'),
  -- thread: 2-baruch-77-the-shepherds-the-lamps-the-fountains-come-from-the-law
  ('pseudepigrapha', '2-baruch', 77, 13, 'canon', 'jeremiah', 23, 4, 'free', E'Jer 23:4 — *And I will set up shepherds over them which shall feed them: and they shall fear no more, nor be dismayed* — the shepherds restored from Yahuah''s word, the want Baruch says the law supplies.'),
  ('pseudepigrapha', '2-baruch', 77, 13, 'canon', 'psalms', 119, 105, 'free', E'Ps 119:105 — *Thy word is a lamp unto my feet, and a light unto my path* — the lamp that does not fail because it comes from the law, as Baruch declares to the remnant.'),
  ('pseudepigrapha', '2-baruch', 77, 16, 'canon', 'proverbs', 6, 23, 'free', E'Prov 6:23 — *For the commandment is a lamp; and the law is light; and reproofs of instruction are the way of life* — the commandment itself the lamp and the light, the law that abides though the leaders depart.'),
  ('pseudepigrapha', '2-baruch', 77, 13, 'canon', 'isaiah', 12, 3, 'free', E'Isa 12:3 — *Therefore with joy shall ye draw water out of the wells of salvation* — the fountain that does not dry up, the stream the law supplies in Baruch''s answer.'),
  -- thread: 2-baruch-77-write-to-our-brethren-the-epistle-of-hope
  ('pseudepigrapha', '2-baruch', 77, 17, 'canon', 'jeremiah', 23, 3, 'free', E'Jer 23:3 — *And I will gather the remnant of my flock out of all countries whither I have driven them, and will bring them again to their folds* — the scattered tribes gathered, the hope Baruch''s epistle to the nine and a half tribes proclaims.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar77_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar77_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-77-a-law-more-excellent-than-to-all-peoples',
       E'A law more excellent than to all peoples',
       E'Baruch gathers the remnant and reminds them of their inheritance: *to you and to your fathers Yahuah (Lord) gave a law more excellent than to all peoples.* The chastening fell because the brethren transgressed the commandments, yet the law itself is Israel''s surpassing gift. It ain''t new — Moses asked what nation had statutes so righteous, and the psalmist called Yahuah''s law perfect, restoring the soul.',
       sv.verse_id, ev.verse_id, 'extras', 85900
  FROM _session412_2bar77_lookup sv, _session412_2bar77_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=77 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=77 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-77-choose-the-law-and-live',
       E'Choose the law and live',
       E'Baruch sets the way of return before them: *If, therefore, ye direct your ways aright, Ye also shall not depart as your brethren departed.* The merciful and true One they worship will do good and not evil to those who turn. It ain''t new — this is Moses'' covenant choice set before Israel, life against death, and the call to direct one''s ways by the law that they may live.',
       sv.verse_id, ev.verse_id, 'extras', 85903
  FROM _session412_2bar77_lookup sv, _session412_2bar77_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=77 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=77 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-77-the-shepherds-the-lamps-the-fountains-come-from-the-law',
       E'The shepherds, the lamps, the fountains come from the law',
       E'The people lament that *the shepherds of Yashar''el (Israel) have perished, And the lamps which gave light are extinguished, And the fountains have withheld their stream*, and Baruch answers: *Shepherds and lamps and fountains come from the law: And though we depart, yet the law abideth.* The leaders pass, but the law endures and supplies the want. It ain''t new — Yahuah promised to set up faithful shepherds over his flock, his word is a lamp to the feet, and with joy the people draw water from the wells of salvation.',
       sv.verse_id, ev.verse_id, 'extras', 85906
  FROM _session412_2bar77_lookup sv, _session412_2bar77_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=77 AND sv.verse_number=13
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=77 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-77-write-to-our-brethren-the-epistle-of-hope',
       E'Write to our brethren the epistle of hope',
       E'The people ask Baruch to *write also to our brethren in Babylon an epistle of doctrine and a scroll of hope*, and he answers that he will write *in like manner to the nine tribes and a half, and send by means of a bird* — one letter by eagle, one to Babylon by three men. The scattered tribes are addressed as one body with Judah, looking to be gathered. It ain''t new — Yahuah promised to gather the remnant of his flock from all countries and bring them again to their folds, the hope the epistle carries to the exiles.',
       sv.verse_id, ev.verse_id, 'extras', 85909
  FROM _session412_2bar77_lookup sv, _session412_2bar77_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=77 AND sv.verse_number=12
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=77 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-77-a-law-more-excellent-than-to-all-peoples
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deut 4:8 — *And what nation is there so great, that hath statutes and judgments so righteous as all this law, which I set before you this day?* — the law more excellent than to all peoples, the gift Baruch sets before the remnant.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar77_lookup sv, _session412_2bar77_lookup tv
 WHERE t.slug='2-baruch-77-a-law-more-excellent-than-to-all-peoples'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=77 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ps 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the surpassing worth of the law Baruch names Israel''s portion above the nations.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar77_lookup sv, _session412_2bar77_lookup tv
 WHERE t.slug='2-baruch-77-a-law-more-excellent-than-to-all-peoples'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=77 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-77-choose-the-law-and-live
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deut 30:19 — *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* — the choosing of the right way that the remnant may not depart, Baruch''s call to direct their ways aright.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar77_lookup sv, _session412_2bar77_lookup tv
 WHERE t.slug='2-baruch-77-choose-the-law-and-live'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=77 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-77-the-shepherds-the-lamps-the-fountains-come-from-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jer 23:4 — *And I will set up shepherds over them which shall feed them: and they shall fear no more, nor be dismayed* — the shepherds restored from Yahuah''s word, the want Baruch says the law supplies.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar77_lookup sv, _session412_2bar77_lookup tv
 WHERE t.slug='2-baruch-77-the-shepherds-the-lamps-the-fountains-come-from-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=77 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ps 119:105 — *Thy word is a lamp unto my feet, and a light unto my path* — the lamp that does not fail because it comes from the law, as Baruch declares to the remnant.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar77_lookup sv, _session412_2bar77_lookup tv
 WHERE t.slug='2-baruch-77-the-shepherds-the-lamps-the-fountains-come-from-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=77 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=105
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Prov 6:23 — *For the commandment is a lamp; and the law is light; and reproofs of instruction are the way of life* — the commandment itself the lamp and the light, the law that abides though the leaders depart.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar77_lookup sv, _session412_2bar77_lookup tv
 WHERE t.slug='2-baruch-77-the-shepherds-the-lamps-the-fountains-come-from-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=77 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isa 12:3 — *Therefore with joy shall ye draw water out of the wells of salvation* — the fountain that does not dry up, the stream the law supplies in Baruch''s answer.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar77_lookup sv, _session412_2bar77_lookup tv
 WHERE t.slug='2-baruch-77-the-shepherds-the-lamps-the-fountains-come-from-the-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=77 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-77-write-to-our-brethren-the-epistle-of-hope
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jer 23:3 — *And I will gather the remnant of my flock out of all countries whither I have driven them, and will bring them again to their folds* — the scattered tribes gathered, the hope Baruch''s epistle to the nine and a half tribes proclaims.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar77_lookup sv, _session412_2bar77_lookup tv
 WHERE t.slug='2-baruch-77-write-to-our-brethren-the-epistle-of-hope'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=77 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_78.sql (session412 2-baruch 78) -----
-- Source anchor: pseudepigrapha/2-baruch ch78. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar78 (view _session412_2bar78_lookup). Sort band base 85925, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar78_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-78-mercy-and-peace-to-the-captive-tribes
  ('pseudepigrapha', '2-baruch', 78, 1, 'canon', 'james', 1, 1, 'free', E'James 1:1 — *James, a servant of Elohim (God) and of the Lord Yahusha HaMashiach (Lord Jesus Christ), to the twelve tribes which are scattered abroad, greeting* — the direct apostolic sibling: an epistle to the scattered tribes of Israel.'),
  ('pseudepigrapha', '2-baruch', 78, 2, 'canon', '1-peter', 1, 1, 'free', E'1 Pet 1:1 — *Peter, an apostle of Yahusha HaMashiach (Jesus Christ), to the strangers scattered throughout Pontus, Galatia, Cappadocia, Asia, and Bithynia* — the apostle likewise writes to the dispersion as kin in exile.'),
  -- thread: 2-baruch-78-all-twelve-tribes-bound-by-one-bond
  ('pseudepigrapha', '2-baruch', 78, 3, 'canon', 'ezekiel', 37, 19, 'free', E'Ezek 37:19 — *Behold, I will take the stick of Joseph, which is in the hand of Ephraim... and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* — the two houses made one bond.'),
  ('pseudepigrapha', '2-baruch', 78, 3, 'canon', 'ezekiel', 37, 22, 'free', E'Ezek 37:22 — *I will make them one nation in the land... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* — the one bond restored, never two peoples again.'),
  ('pseudepigrapha', '2-baruch', 78, 3, 'canon', 'isaiah', 11, 12, 'free', E'Isa 11:12 — *he shall... assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* — both houses gathered as one from the four corners.'),
  ('pseudepigrapha', '2-baruch', 78, 3, 'canon', 'isaiah', 11, 13, 'free', E'Isa 11:13 — *Ephraim shall not envy Yahudah (Judah), and Yahudah (Judah) shall not vex Ephraim* — the old rivalry of the two houses healed in the one bond.'),
  -- thread: 2-baruch-78-he-will-gather-the-dispersed-with-much-mercy
  ('pseudepigrapha', '2-baruch', 78, 7, 'canon', 'deuteronomy', 30, 3, 'free', E'Deut 30:3 — *then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* — the Torah''s own oath to gather the dispersed with mercy.'),
  ('pseudepigrapha', '2-baruch', 78, 7, 'canon', 'deuteronomy', 30, 4, 'free', E'Deut 30:4 — *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee* — no exile is too far to be regathered.'),
  ('pseudepigrapha', '2-baruch', 78, 7, 'canon', 'jeremiah', 31, 10, 'free', E'Jer 31:10 — *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* — the One who scattered is the One who gathers with much mercy.'),
  ('pseudepigrapha', '2-baruch', 78, 5, 'canon', 'isaiah', 11, 11, 'free', E'Isa 11:11 — *Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left* — the promised second gathering of the worn remnant at the last times.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar78_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar78_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-78-mercy-and-peace-to-the-captive-tribes',
       E'Mercy and peace — the epistle to the nine and a half tribes',
       E'The book turns to its crown: Baruch writes an epistle *to the brethren carried into captivity* across the Euphrates, the nine and a half tribes torn away long before, and greets them *Mercy and peace*. He addresses the scattered northern house as kin still bound to Judah. The apostles write the very same way — James and Peter address the dispersion of Israel as one covenant family abroad. It ain''t new — the letter to the exiled tribes is the apostolic letter before the apostles.',
       sv.verse_id, ev.verse_id, 'extras', 85925
  FROM _session412_2bar78_lookup sv, _session412_2bar78_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=78 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=78 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-78-all-twelve-tribes-bound-by-one-bond',
       E'All the twelve tribes bound by one bond',
       E'Baruch insists the scattered north and the captive south are not two peoples but one: *behold all we the twelve tribes are bound by one bond, inasmuch as we are born from one father*. This is the two-house hope — Ephraim and Judah, never replaced, gathered back into one body. The prophets sealed it: two sticks made one stick in the hand, the dispersed of Israel and the outcasts of Judah gathered together. It ain''t new — the whole house of Jacob is one bond, and the scattering does not break it.',
       sv.verse_id, ev.verse_id, 'extras', 85928
  FROM _session412_2bar78_lookup sv, _session412_2bar78_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=78 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=78 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-78-he-will-gather-the-dispersed-with-much-mercy',
       E'He will never forsake — with much mercy will gather the dispersed',
       E'Baruch comforts the exiles with the bedrock promise: *He will never forget or forsake us, but with much mercy will gather together again those who were dispersed*. The chastening was for cleansing, not casting-off, that *at the last times* they be found worthy of their fathers. This is the very oath of the Torah and the Prophets — when scattered to the ends of heaven, the Father turns the captivity and gathers his people home. It ain''t new — the gathering of the dispersed with mercy is sworn from Moses onward.',
       sv.verse_id, ev.verse_id, 'extras', 85931
  FROM _session412_2bar78_lookup sv, _session412_2bar78_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=78 AND sv.verse_number=5
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=78 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-78-mercy-and-peace-to-the-captive-tribes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:1 — *James, a servant of Elohim (God) and of the Lord Yahusha HaMashiach (Lord Jesus Christ), to the twelve tribes which are scattered abroad, greeting* — the direct apostolic sibling: an epistle to the scattered tribes of Israel.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar78_lookup sv, _session412_2bar78_lookup tv
 WHERE t.slug='2-baruch-78-mercy-and-peace-to-the-captive-tribes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=78 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Pet 1:1 — *Peter, an apostle of Yahusha HaMashiach (Jesus Christ), to the strangers scattered throughout Pontus, Galatia, Cappadocia, Asia, and Bithynia* — the apostle likewise writes to the dispersion as kin in exile.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar78_lookup sv, _session412_2bar78_lookup tv
 WHERE t.slug='2-baruch-78-mercy-and-peace-to-the-captive-tribes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=78 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-78-all-twelve-tribes-bound-by-one-bond
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezek 37:19 — *Behold, I will take the stick of Joseph, which is in the hand of Ephraim... and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* — the two houses made one bond.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar78_lookup sv, _session412_2bar78_lookup tv
 WHERE t.slug='2-baruch-78-all-twelve-tribes-bound-by-one-bond'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=78 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezek 37:22 — *I will make them one nation in the land... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* — the one bond restored, never two peoples again.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar78_lookup sv, _session412_2bar78_lookup tv
 WHERE t.slug='2-baruch-78-all-twelve-tribes-bound-by-one-bond'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=78 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isa 11:12 — *he shall... assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* — both houses gathered as one from the four corners.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar78_lookup sv, _session412_2bar78_lookup tv
 WHERE t.slug='2-baruch-78-all-twelve-tribes-bound-by-one-bond'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=78 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isa 11:13 — *Ephraim shall not envy Yahudah (Judah), and Yahudah (Judah) shall not vex Ephraim* — the old rivalry of the two houses healed in the one bond.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar78_lookup sv, _session412_2bar78_lookup tv
 WHERE t.slug='2-baruch-78-all-twelve-tribes-bound-by-one-bond'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=78 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-78-he-will-gather-the-dispersed-with-much-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deut 30:3 — *then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* — the Torah''s own oath to gather the dispersed with mercy.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar78_lookup sv, _session412_2bar78_lookup tv
 WHERE t.slug='2-baruch-78-he-will-gather-the-dispersed-with-much-mercy'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=78 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deut 30:4 — *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee* — no exile is too far to be regathered.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar78_lookup sv, _session412_2bar78_lookup tv
 WHERE t.slug='2-baruch-78-he-will-gather-the-dispersed-with-much-mercy'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=78 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jer 31:10 — *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* — the One who scattered is the One who gathers with much mercy.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar78_lookup sv, _session412_2bar78_lookup tv
 WHERE t.slug='2-baruch-78-he-will-gather-the-dispersed-with-much-mercy'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=78 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isa 11:11 — *Yahuah (Lord) shall set his hand again the second time to recover the remnant of his people, which shall be left* — the promised second gathering of the worn remnant at the last times.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar78_lookup sv, _session412_2bar78_lookup tv
 WHERE t.slug='2-baruch-78-he-will-gather-the-dispersed-with-much-mercy'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=78 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_79.sql (session412 2-baruch 79) -----
-- Source anchor: pseudepigrapha/2-baruch ch79. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar79 (view _session412_2bar79_lookup). Sort band base 85950, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar79_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-79-we-have-sinned-yet-not-chastened-as-we-deserved
  ('pseudepigrapha', '2-baruch', 79, 1, 'canon', 'lamentations', 1, 1, 'free', E'Lam 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow!* — the lament over the same fallen Zion Baruch recounts to the exiles.'),
  ('pseudepigrapha', '2-baruch', 79, 2, 'canon', '2-kings', 25, 9, 'free', E'2 Kgs 25:9 — *And he burnt the house of Yahuah (LORD), and the king''s house, and all the houses of Jerusalem* — the historical fall of the city under Nebuchadnezzar that Baruch reports to the tribes.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar79_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar79_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-79-we-have-sinned-yet-not-chastened-as-we-deserved',
       E'We have sinned, yet not chastened as we deserved',
       E'Baruch tells the scattered tribes what befell Zion when *Nebuchadnezzar king of Babylon came up against us*: *we have sinned against Him who made us, and we have not kept the commandments... yet he hath not chastened us as we deserved*. The lament owns the broken Torah but confesses mercy in the measure of the rod — the very voice of Lamentations over the fallen city. It ain''t new — the city falls for forsaking the commandments, yet the chastening is less than the guilt.',
       sv.verse_id, ev.verse_id, 'extras', 85950
  FROM _session412_2bar79_lookup sv, _session412_2bar79_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=79 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=79 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-79-we-have-sinned-yet-not-chastened-as-we-deserved
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lam 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow!* — the lament over the same fallen Zion Baruch recounts to the exiles.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar79_lookup sv, _session412_2bar79_lookup tv
 WHERE t.slug='2-baruch-79-we-have-sinned-yet-not-chastened-as-we-deserved'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=79 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kgs 25:9 — *And he burnt the house of Yahuah (LORD), and the king''s house, and all the houses of Jerusalem* — the historical fall of the city under Nebuchadnezzar that Baruch reports to the tribes.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar79_lookup sv, _session412_2bar79_lookup tv
 WHERE t.slug='2-baruch-79-we-have-sinned-yet-not-chastened-as-we-deserved'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=79 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=25 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_80.sql (session412 2-baruch 80) -----
-- Source anchor: pseudepigrapha/2-baruch ch80. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar80 (view _session412_2bar80_lookup). Sort band base 85975, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar80_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-80-the-angels-overthrew-the-wall-and-hid-the-vessels
  ('pseudepigrapha', '2-baruch', 80, 1, 'canon', '2-kings', 25, 10, 'free', E'2 Kgs 25:10 — *And all the army of the Chaldees... brake down the walls of Jerusalem round about* — the overthrow of the strong wall, which Baruch ascribes to heaven''s hand.'),
  ('pseudepigrapha', '2-baruch', 80, 1, 'canon', 'lamentations', 2, 8, 'free', E'Lam 2:8 — *Yahuah (LORD) hath purposed to destroy the wall of the daughter of Zion: he hath stretched out a line, he hath not withdrawn his hand from destroying* — the wall fell by the Most High''s purpose, not the enemy''s strength.'),
  -- thread: 2-baruch-80-your-brethren-led-away-to-babylon
  ('pseudepigrapha', '2-baruch', 80, 4, 'canon', 'psalms', 137, 1, 'free', E'Ps 137:1 — *By the rivers of Babylon, there we sat down, yea, we wept, when we remembered Zion* — the captivity to Babylon Baruch recounts to his brethren.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar80_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar80_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-80-the-angels-overthrew-the-wall-and-hid-the-vessels',
       E'The angels overthrew the wall and hid the holy vessels',
       E'Baruch makes known how the city truly fell: *the angels of the El Elyon (Most High) were sent, and they overthrew the fortifications of the strong wall*, and first *they hid all the vessels of the sanctuary, lest the enemy should get possession of them*, only then delivering the broken wall and burnt temple to Babylon, so the enemy could not boast. The book embellishes the angels'' hand; the canonical root is plain — Babylon broke down the walls because the Most High purposed it, and the vessels were taken from the enemy''s grasp. It ain''t new — Zion fell by heaven''s decree, not the enemy''s might.',
       sv.verse_id, ev.verse_id, 'extras', 85975
  FROM _session412_2bar80_lookup sv, _session412_2bar80_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=80 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=80 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-80-your-brethren-led-away-to-babylon',
       E'Your brethren bound and led away to Babylon',
       E'Baruch reminds the exiles that the rest of the people were carried off too: *Your brethren also have they bound and led away to Babylon, and have caused them to dwell there. But we have been left here, being very few*. This is the very grief of the captivity Psalm, the harp hung up by the rivers of a strange land. It ain''t new — the sorrow of the few left and the many led away is the song of Babylon''s rivers.',
       sv.verse_id, ev.verse_id, 'extras', 85978
  FROM _session412_2bar80_lookup sv, _session412_2bar80_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=80 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=80 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-80-the-angels-overthrew-the-wall-and-hid-the-vessels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kgs 25:10 — *And all the army of the Chaldees... brake down the walls of Jerusalem round about* — the overthrow of the strong wall, which Baruch ascribes to heaven''s hand.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar80_lookup sv, _session412_2bar80_lookup tv
 WHERE t.slug='2-baruch-80-the-angels-overthrew-the-wall-and-hid-the-vessels'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=80 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=25 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lam 2:8 — *Yahuah (LORD) hath purposed to destroy the wall of the daughter of Zion: he hath stretched out a line, he hath not withdrawn his hand from destroying* — the wall fell by the Most High''s purpose, not the enemy''s strength.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar80_lookup sv, _session412_2bar80_lookup tv
 WHERE t.slug='2-baruch-80-the-angels-overthrew-the-wall-and-hid-the-vessels'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=80 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-80-your-brethren-led-away-to-babylon
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ps 137:1 — *By the rivers of Babylon, there we sat down, yea, we wept, when we remembered Zion* — the captivity to Babylon Baruch recounts to his brethren.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar80_lookup sv, _session412_2bar80_lookup tv
 WHERE t.slug='2-baruch-80-your-brethren-led-away-to-babylon'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=80 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=137 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_81.sql (session412 2-baruch 81) -----
-- Source anchor: pseudepigrapha/2-baruch ch81. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar81 (view _session412_2bar81_lookup). Sort band base 86000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar81_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-81-how-long-the-mystery-of-the-times-revealed
  ('pseudepigrapha', '2-baruch', 81, 3, 'canon', 'habakkuk', 2, 3, 'free', E'Hab 2:3 — *For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry* — the answer to ''how long'': an appointed end that will not fail.'),
  ('pseudepigrapha', '2-baruch', 81, 4, 'canon', 'daniel', 12, 1, 'free', E'Dan 12:1 — *And at that time shall Michael stand up... and at that time thy people shall be delivered, every one that shall be found written in the book* — the mystery of the times and the deliverance shown to the seer for comfort.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar81_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar81_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-81-how-long-the-mystery-of-the-times-revealed',
       E'How long? — the mystery of the times revealed for consolation',
       E'Baruch turns to consolation: mourning over Zion he prayed *How long will these things endure for us?*, and the Most High *made known to me the mystery of the times, And the advent of the hours he showed me*, that he should not again endure anguish. The seer''s *how long* and the answer of an appointed, hastening end is the prophet''s own consolation — the vision is for a set time and will surely come. It ain''t new — the appointed times are a sealed mystery shown to comfort the mourner.',
       sv.verse_id, ev.verse_id, 'extras', 86000
  FROM _session412_2bar81_lookup sv, _session412_2bar81_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=81 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=81 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-81-how-long-the-mystery-of-the-times-revealed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hab 2:3 — *For the vision is yet for an appointed time, but at the end it shall speak, and not lie: though it tarry, wait for it; because it will surely come, it will not tarry* — the answer to ''how long'': an appointed end that will not fail.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar81_lookup sv, _session412_2bar81_lookup tv
 WHERE t.slug='2-baruch-81-how-long-the-mystery-of-the-times-revealed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=81 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Dan 12:1 — *And at that time shall Michael stand up... and at that time thy people shall be delivered, every one that shall be found written in the book* — the mystery of the times and the deliverance shown to the seer for comfort.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar81_lookup sv, _session412_2bar81_lookup tv
 WHERE t.slug='2-baruch-81-how-long-the-mystery-of-the-times-revealed'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=81 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_82.sql (session412 2-baruch 82) -----
-- Source anchor: pseudepigrapha/2-baruch ch82. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar82 (view _session412_2bar82_lookup). Sort band base 86025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar82_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-82-the-consummation-is-very-nigh
  ('pseudepigrapha', '2-baruch', 82, 2, 'canon', '2-peter', 3, 8, 'free', E'2 Pet 3:8 — *one day is with Yahuah (Lord) as a thousand years, and a thousand years as one day* — the consummation seems far but is near in the Most High''s measure of time.'),
  ('pseudepigrapha', '2-baruch', 82, 2, 'canon', '2-peter', 3, 9, 'free', E'2 Pet 3:9 — *Yahuah (Lord) is not slack concerning his promise... but is longsuffering to us-ward, not willing that any should perish* — His coming mercy delays the consummation, it does not cancel it.'),
  -- thread: 2-baruch-82-the-gentiles-pass-as-vapour-and-smoke
  ('pseudepigrapha', '2-baruch', 82, 7, 'canon', 'psalms', 37, 2, 'free', E'Ps 37:2 — *For they shall soon be cut down like the grass, and wither as the green herb* — the prosperity of the wicked fades like the grass that withers.'),
  ('pseudepigrapha', '2-baruch', 82, 9, 'canon', 'ecclesiastes', 12, 14, 'free', E'Eccl 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* — the boastful who deny the Giver pass away to judgement.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar82_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar82_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-82-the-consummation-is-very-nigh',
       E'The consummation is very nigh — His mercy and judgement come',
       E'Baruch comforts the exiles that the Maker *will assuredly avenge us on all our enemies... also that the consummation which the El Elyon (Most High) will make is very nigh, and His mercy that is coming... is by no means far off*. The apostle echoes the same patience and nearness — the Day is not slack, a thousand years are as a day, and judgement and mercy come together. It ain''t new — the consummation tarries to the eye but is near in the Mighty One''s reckoning.',
       sv.verse_id, ev.verse_id, 'extras', 86025
  FROM _session412_2bar82_lookup sv, _session412_2bar82_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=82 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=82 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-82-the-gentiles-pass-as-vapour-and-smoke',
       E'The Gentiles'' prosperity passes as vapour, smoke, and a fading cloud',
       E'Against the *multitude of the prosperity of the Gentiles* who *do not keep the statutes of the El Elyon (Most High)*, Baruch sets their end: they shall be *like a vapour*, *as smoke shall they pass away*, *as grass that withers shall they fade away*, *as a passing cloud*. The wisdom of Moses and Solomon is the same — the proud who forget the end fade like grass, and every secret work is brought into judgement. It ain''t new — the splendour of the wicked withers, and Elohim brings every work to account.',
       sv.verse_id, ev.verse_id, 'extras', 86028
  FROM _session412_2bar82_lookup sv, _session412_2bar82_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=82 AND sv.verse_number=6
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=82 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-82-the-consummation-is-very-nigh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Pet 3:8 — *one day is with Yahuah (Lord) as a thousand years, and a thousand years as one day* — the consummation seems far but is near in the Most High''s measure of time.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar82_lookup sv, _session412_2bar82_lookup tv
 WHERE t.slug='2-baruch-82-the-consummation-is-very-nigh'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=82 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Pet 3:9 — *Yahuah (Lord) is not slack concerning his promise... but is longsuffering to us-ward, not willing that any should perish* — His coming mercy delays the consummation, it does not cancel it.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar82_lookup sv, _session412_2bar82_lookup tv
 WHERE t.slug='2-baruch-82-the-consummation-is-very-nigh'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=82 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-82-the-gentiles-pass-as-vapour-and-smoke
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ps 37:2 — *For they shall soon be cut down like the grass, and wither as the green herb* — the prosperity of the wicked fades like the grass that withers.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar82_lookup sv, _session412_2bar82_lookup tv
 WHERE t.slug='2-baruch-82-the-gentiles-pass-as-vapour-and-smoke'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=82 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Eccl 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* — the boastful who deny the Giver pass away to judgement.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar82_lookup sv, _session412_2bar82_lookup tv
 WHERE t.slug='2-baruch-82-the-gentiles-pass-as-vapour-and-smoke'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=82 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_83.sql (session412 2-baruch 83) -----
-- Source anchor: pseudepigrapha/2-baruch ch83. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar83 (view _session412_2bar83_lookup). Sort band base 86050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar83_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-83-the-most-high-will-hasten-his-times-and-judge
  ('pseudepigrapha', '2-baruch', 83, 1, 'canon', 'habakkuk', 2, 3, 'free', E'Hab 2:3 — *For the vision is yet for an appointed time, but at the end it shall speak, and not lie... it will surely come, it will not tarry* — the Most High hastens His appointed times to their certain end.'),
  ('pseudepigrapha', '2-baruch', 83, 3, 'canon', 'ecclesiastes', 12, 14, 'free', E'Eccl 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* — the secret thoughts of every man made manifest with reproof.'),
  -- thread: 2-baruch-83-look-not-to-the-present-but-to-what-is-promised
  ('pseudepigrapha', '2-baruch', 83, 4, 'canon', '2-peter', 3, 13, 'free', E'2 Pet 3:13 — *Nevertheless we, according to his promise, look for new heavens and a new earth, wherein dwelleth righteousness* — be expectant of what is promised, not the present delights.'),
  ('pseudepigrapha', '2-baruch', 83, 4, 'canon', 'isaiah', 40, 1, 'free', E'Isa 40:1 — *Comfort ye, comfort ye my people, saith your Elohim (God)* — the consolation of the captives rests on the promise that surely comes.'),
  -- thread: 2-baruch-83-all-the-glory-of-this-time-turns-to-dust
  ('pseudepigrapha', '2-baruch', 83, 16, 'canon', 'ecclesiastes', 1, 2, 'free', E'Eccl 1:2 — *Vanity of vanities, saith the Preacher, vanity of vanities; all is vanity* — every glory of this time turns to dust and stillness.'),
  -- thread: 2-baruch-83-the-consummation-of-all-things-comes-to-truth
  ('pseudepigrapha', '2-baruch', 83, 7, 'canon', '2-peter', 3, 12, 'free', E'2 Pet 3:12 — *Looking for and hasting unto the coming of the day of Elohim (God), wherein the heavens being on fire shall be dissolved* — the consummation of the age shows the might of its ruler when all comes to judgement.'),
  ('pseudepigrapha', '2-baruch', 83, 22, 'canon', 'daniel', 12, 2, 'free', E'Dan 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the consummation comes to the truth, when all things come to judgement.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar83_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar83_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-83-the-most-high-will-hasten-his-times-and-judge',
       E'The Most High will hasten His times and judge the secret things',
       E'Baruch sets the exiles'' hope on the swift, certain end: *the El Elyon (Most High) will assuredly hasten His times... And He will assuredly judge those who are in His world... And He will assuredly examine the secret thoughts... and will make them manifest in the presence of all*. This is the prophet''s appointed end that hastens and the preacher''s judgement of every hidden work — Elohim brings the secret things into the light. It ain''t new — the times hasten and every hidden thing is brought to judgement.',
       sv.verse_id, ev.verse_id, 'extras', 86050
  FROM _session412_2bar83_lookup sv, _session412_2bar83_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=83 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=83 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-83-look-not-to-the-present-but-to-what-is-promised',
       E'Look not to the present delights but to what is promised in the end',
       E'Baruch charges the exiles: *let none of these present things ascend into your hearts, but above all let us be expectant, because that which is promised to us shall come*; not the *delights of the Gentiles in the present* but *what has been promised to us in the end*. The apostle''s word to the dispersion is one with it — comfort lies not in the passing world but in the sure promise; be the kind of people who look for the coming Day. It ain''t new — the hope of the scattered is fixed on the promise, not the present.',
       sv.verse_id, ev.verse_id, 'extras', 86053
  FROM _session412_2bar83_lookup sv, _session412_2bar83_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=83 AND sv.verse_number=4
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=83 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-83-all-the-glory-of-this-time-turns-to-dust',
       E'All the glory of this time turns to dust and stillness',
       E'Baruch unrolls the vanity of the present age: *all healthinesses of this time are turning into diseases*, *every energy of youth is turning into old age and consummation*, *every beauty... faded and hateful*, *every delight and joy... to worms and corruption*, *every clamour of the pride of this time is turning into dust and stillness*. This is the preacher''s whole burden — strength fails, beauty fades, and the proud return to dust. It ain''t new — the splendour of this time wastes away, and only what is promised endures.',
       sv.verse_id, ev.verse_id, 'extras', 86056
  FROM _session412_2bar83_lookup sv, _session412_2bar83_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=83 AND sv.verse_number=10
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=83 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-83-the-consummation-of-all-things-comes-to-truth',
       E'The consummation of all things will come to the truth',
       E'Baruch closes the comfort with the certainty of recompense: *does anyone think that they will not be avenged? But the consummation of all things will come to the truth*, for *the consummation of the age shall then show the great might of its ruler, when all things come to judgement*. Prepare the heart *for that which before ye believed*. The apostle to the dispersion seals the same — looking for and hasting unto the Day of Elohim when all is brought to account. It ain''t new — the age ends in a true judgement, and every promise is made good.',
       sv.verse_id, ev.verse_id, 'extras', 86059
  FROM _session412_2bar83_lookup sv, _session412_2bar83_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=83 AND sv.verse_number=7
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=83 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-83-the-most-high-will-hasten-his-times-and-judge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hab 2:3 — *For the vision is yet for an appointed time, but at the end it shall speak, and not lie... it will surely come, it will not tarry* — the Most High hastens His appointed times to their certain end.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar83_lookup sv, _session412_2bar83_lookup tv
 WHERE t.slug='2-baruch-83-the-most-high-will-hasten-his-times-and-judge'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=83 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Eccl 12:14 — *For Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* — the secret thoughts of every man made manifest with reproof.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar83_lookup sv, _session412_2bar83_lookup tv
 WHERE t.slug='2-baruch-83-the-most-high-will-hasten-his-times-and-judge'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=83 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-83-look-not-to-the-present-but-to-what-is-promised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Pet 3:13 — *Nevertheless we, according to his promise, look for new heavens and a new earth, wherein dwelleth righteousness* — be expectant of what is promised, not the present delights.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar83_lookup sv, _session412_2bar83_lookup tv
 WHERE t.slug='2-baruch-83-look-not-to-the-present-but-to-what-is-promised'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=83 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isa 40:1 — *Comfort ye, comfort ye my people, saith your Elohim (God)* — the consolation of the captives rests on the promise that surely comes.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar83_lookup sv, _session412_2bar83_lookup tv
 WHERE t.slug='2-baruch-83-look-not-to-the-present-but-to-what-is-promised'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=83 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-83-all-the-glory-of-this-time-turns-to-dust
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Eccl 1:2 — *Vanity of vanities, saith the Preacher, vanity of vanities; all is vanity* — every glory of this time turns to dust and stillness.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar83_lookup sv, _session412_2bar83_lookup tv
 WHERE t.slug='2-baruch-83-all-the-glory-of-this-time-turns-to-dust'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=83 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-83-the-consummation-of-all-things-comes-to-truth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Pet 3:12 — *Looking for and hasting unto the coming of the day of Elohim (God), wherein the heavens being on fire shall be dissolved* — the consummation of the age shows the might of its ruler when all comes to judgement.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar83_lookup sv, _session412_2bar83_lookup tv
 WHERE t.slug='2-baruch-83-the-consummation-of-all-things-comes-to-truth'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=83 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Dan 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* — the consummation comes to the truth, when all things come to judgement.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar83_lookup sv, _session412_2bar83_lookup tv
 WHERE t.slug='2-baruch-83-the-consummation-of-all-things-comes-to-truth'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=83 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_84.sql (session412 2-baruch 84) -----
-- Source anchor: pseudepigrapha/2-baruch ch84. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar84 (view _session412_2bar84_lookup). Sort band base 86075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar84_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-84-heaven-and-earth-to-witness
  ('pseudepigrapha', '2-baruch', 84, 2, 'canon', 'deuteronomy', 30, 19, 'free', E'Deut 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life* — the very witness and choice Baruch recalls Moses making.'),
  ('pseudepigrapha', '2-baruch', 84, 2, 'canon', 'deuteronomy', 30, 20, 'free', E'Deut 30:20 — *for he is thy life, and the length of thy days: that thou mayest dwell in the land* — keep it and be kept, the promise Baruch repeats as the law''s own terms.'),
  ('pseudepigrapha', '2-baruch', 84, 5, 'canon', 'deuteronomy', 4, 9, 'free', E'Deut 4:9 — *take heed to thyself, and keep thy soul diligently, lest thou forget the things which thine eyes have seen... but teach them thy sons* — the forgetting of the law that Baruch says brought the predicted woe.'),
  -- thread: 2-baruch-84-remember-the-law-of-moses
  ('pseudepigrapha', '2-baruch', 84, 8, 'canon', 'malachi', 4, 4, 'free', E'Mal 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments* — the closing charge of the prophets, the same word Baruch lays on the tribes.'),
  ('pseudepigrapha', '2-baruch', 84, 8, 'canon', 'psalms', 19, 7, 'free', E'Ps 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the law Baruch bids them remember is the perfect, abiding testimony.'),
  ('pseudepigrapha', '2-baruch', 84, 9, 'canon', 'deuteronomy', 32, 47, 'free', E'Deut 32:47 — *For it is not a vain thing for you; because it is your life... ye shall prolong your days in the land* — the law handed to the sons after, as Baruch charges, because it is their very life.'),
  -- thread: 2-baruch-84-deliver-the-law-to-your-sons
  ('pseudepigrapha', '2-baruch', 84, 9, 'canon', 'deuteronomy', 4, 9, 'free', E'Deut 4:9 — *lest they depart from thy heart all the days of thy life: but teach them thy sons, and thy sons'' sons* — the law delivered to the children, the chain Baruch bids the tribes keep unbroken.'),
  ('pseudepigrapha', '2-baruch', 84, 9, 'canon', 'joshua', 1, 8, 'free', E'Josh 1:8 — *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do* — the law kept and handed on, as Baruch charges his sons after him.'),
  -- thread: 2-baruch-84-according-to-the-multitude-of-his-mercies
  ('pseudepigrapha', '2-baruch', 84, 10, 'canon', 'nehemiah', 9, 6, 'free', E'Neh 9:6 — *thou hast made heaven... and thou preservest them all; and the host of heaven worshippeth thee* — the Mighty One of the great covenant-prayer to whom Baruch bids them pray for reconciliation.'),
  ('pseudepigrapha', '2-baruch', 84, 11, 'canon', 'psalms', 19, 11, 'free', E'Ps 19:11 — *Moreover by them is thy servant warned: and in keeping of them there is great reward* — the keeping of the law that withholds the woe Baruch warns of, the law upheld as Israel''s hope.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar84_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar84_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-84-heaven-and-earth-to-witness',
       E'Moses called heaven and earth to witness — keep it and be kept',
       E'Baruch holds up the covenant charge as Moses left it: *Remember that formerly Moses assuredly called heaven and earth to witness against you and said: ''If ye transgress the law ye shall be dispersed, but if ye keep it ye shall be kept.''* The terms are not Baruch''s invention; they are the very words Moses set before the twelve tribes — life for keeping, scattering for forsaking. It ain''t new — the law is not abolished but upheld; Moses summoned heaven and earth, and set before Israel life and death, that they should choose life.',
       sv.verse_id, ev.verse_id, 'extras', 86075
  FROM _session412_2bar84_lookup sv, _session412_2bar84_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=2
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=84 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-84-remember-the-law-of-moses',
       E'Remember ye the law — the only remaining anchor',
       E'With prophets gone and Zion fallen, Baruch''s whole charge is to hold fast what abides: *And remember ye the law and Zion, and the holy land and your brethren, and the covenant of your fathers, and forget not the festivals and the sabbaths.* This is the law upheld, not let go — the feasts and sabbaths kept, the covenant remembered. It ain''t new — Malachi sealed the prophets with the same command, and the law is the perfect testimony that converts the soul.',
       sv.verse_id, ev.verse_id, 'extras', 86078
  FROM _session412_2bar84_lookup sv, _session412_2bar84_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=8
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=84 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-84-deliver-the-law-to-your-sons',
       E'Deliver the law to your sons as your fathers delivered it',
       E'Baruch binds the generations together by the handing-on of the law: *And deliver ye this epistle and the traditions of the law to your sons after you, as also your fathers delivered (them) to you.* The chain is the same chain Moses set, and Joshua kept by meditating in it day and night. It ain''t new — that the book of the law not depart, but be taught to the sons and the sons'' sons, is the standing charge from Sinai onward.',
       sv.verse_id, ev.verse_id, 'extras', 86081
  FROM _session412_2bar84_lookup sv, _session412_2bar84_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=9
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=84 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-84-according-to-the-multitude-of-his-mercies',
       E'If He judge not according to His mercies, woe to all born',
       E'Baruch ends the charge throwing the people on mercy: *make request perseveringly and pray diligently... that the Mighty One may be reconciled to you, and that He may not reckon the multitude of your sins, but remember the rectitude of your fathers. For if He judge us not according to the multitude of His mercies, woe unto all us who are born.* The remembered fathers and the appeal to mercy are the very ground Nehemiah''s great prayer stands on. It ain''t new — that He is the Maker who preserves all, and is besought to remember mercy and the fathers, the returned remnant confessed before Baruch.',
       sv.verse_id, ev.verse_id, 'extras', 86084
  FROM _session412_2bar84_lookup sv, _session412_2bar84_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=10
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=84 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-84-heaven-and-earth-to-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deut 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life* — the very witness and choice Baruch recalls Moses making.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar84_lookup sv, _session412_2bar84_lookup tv
 WHERE t.slug='2-baruch-84-heaven-and-earth-to-witness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deut 30:20 — *for he is thy life, and the length of thy days: that thou mayest dwell in the land* — keep it and be kept, the promise Baruch repeats as the law''s own terms.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar84_lookup sv, _session412_2bar84_lookup tv
 WHERE t.slug='2-baruch-84-heaven-and-earth-to-witness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deut 4:9 — *take heed to thyself, and keep thy soul diligently, lest thou forget the things which thine eyes have seen... but teach them thy sons* — the forgetting of the law that Baruch says brought the predicted woe.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar84_lookup sv, _session412_2bar84_lookup tv
 WHERE t.slug='2-baruch-84-heaven-and-earth-to-witness'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-84-remember-the-law-of-moses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Mal 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments* — the closing charge of the prophets, the same word Baruch lays on the tribes.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar84_lookup sv, _session412_2bar84_lookup tv
 WHERE t.slug='2-baruch-84-remember-the-law-of-moses'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ps 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* — the law Baruch bids them remember is the perfect, abiding testimony.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar84_lookup sv, _session412_2bar84_lookup tv
 WHERE t.slug='2-baruch-84-remember-the-law-of-moses'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deut 32:47 — *For it is not a vain thing for you; because it is your life... ye shall prolong your days in the land* — the law handed to the sons after, as Baruch charges, because it is their very life.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar84_lookup sv, _session412_2bar84_lookup tv
 WHERE t.slug='2-baruch-84-remember-the-law-of-moses'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-84-deliver-the-law-to-your-sons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deut 4:9 — *lest they depart from thy heart all the days of thy life: but teach them thy sons, and thy sons'' sons* — the law delivered to the children, the chain Baruch bids the tribes keep unbroken.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar84_lookup sv, _session412_2bar84_lookup tv
 WHERE t.slug='2-baruch-84-deliver-the-law-to-your-sons'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Josh 1:8 — *This book of the law shall not depart out of thy mouth; but thou shalt meditate therein day and night, that thou mayest observe to do* — the law kept and handed on, as Baruch charges his sons after him.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar84_lookup sv, _session412_2bar84_lookup tv
 WHERE t.slug='2-baruch-84-deliver-the-law-to-your-sons'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-84-according-to-the-multitude-of-his-mercies
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Neh 9:6 — *thou hast made heaven... and thou preservest them all; and the host of heaven worshippeth thee* — the Mighty One of the great covenant-prayer to whom Baruch bids them pray for reconciliation.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar84_lookup sv, _session412_2bar84_lookup tv
 WHERE t.slug='2-baruch-84-according-to-the-multitude-of-his-mercies'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ps 19:11 — *Moreover by them is thy servant warned: and in keeping of them there is great reward* — the keeping of the law that withholds the woe Baruch warns of, the law upheld as Israel''s hope.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar84_lookup sv, _session412_2bar84_lookup tv
 WHERE t.slug='2-baruch-84-according-to-the-multitude-of-his-mercies'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=84 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_85.sql (session412 2-baruch 85) -----
-- Source anchor: pseudepigrapha/2-baruch ch85. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar85 (view _session412_2bar85_lookup). Sort band base 86100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar85_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-85-nothing-now-save-the-mighty-one-and-his-law
  ('pseudepigrapha', '2-baruch', 85, 3, 'canon', 'psalms', 19, 7, 'free', E'Ps 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure* — the law that remains to Israel when all else is taken, perfect and sure as Baruch confesses.'),
  ('pseudepigrapha', '2-baruch', 85, 3, 'canon', 'psalms', 119, 89, 'free', E'Ps 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven* — the law that abides though Zion falls, the one thing not taken away from Israel.'),
  ('pseudepigrapha', '2-baruch', 85, 3, 'canon', 'ecclesiastes', 12, 13, 'free', E'Eccl 12:13 — *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* — the conclusion of the whole matter, the law that remains when prophets sleep and Zion is gone.'),
  -- thread: 2-baruch-85-no-longer-prophets-nor-place-of-repentance
  ('pseudepigrapha', '2-baruch', 85, 3, 'canon', 'amos', 8, 11, 'free', E'Amos 8:11 — *I will send a famine in the land, not a famine of bread... but of hearing the words of Yahuah (LORD)* — the famine of the prophetic word Baruch laments now that the prophets have fallen asleep.'),
  ('pseudepigrapha', '2-baruch', 85, 12, 'canon', 'amos', 8, 12, 'free', E'Amos 8:12 — *they shall wander... to seek the word of Yahuah (LORD), and shall not find it* — the day with no place for prayer nor prophet that Baruch warns is coming.'),
  -- thread: 2-baruch-85-prepare-your-soul-for-after-death-the-judgment
  ('pseudepigrapha', '2-baruch', 85, 11, 'canon', 'hebrews', 9, 27, 'free', E'Heb 9:27 — *as it is appointed unto men once to die, but after this the judgment* — the judgement after death for which Baruch bids them prepare their souls and not be condemned when they depart.'),
  ('pseudepigrapha', '2-baruch', 85, 9, 'canon', 'ecclesiastes', 12, 14, 'free', E'Eccl 12:14 — *Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* — the judgement that exacts its due, for which Baruch says prepare your soul.'),
  -- thread: 2-baruch-85-the-time-is-short-now-is-the-accepted-time
  ('pseudepigrapha', '2-baruch', 85, 12, 'canon', '2-corinthians', 6, 2, 'free', E'2 Cor 6:2 — *behold, now is the accepted time; behold, now is the day of salvation* — the open day of repentance Baruch says will not return once the age is past, so turn now.'),
  ('pseudepigrapha', '2-baruch', 85, 10, 'canon', 'deuteronomy', 32, 47, 'free', E'Deut 32:47 — *it is not a vain thing for you; because it is your life: and through this thing ye shall prolong your days* — the law set before life''s consummation, the choice Baruch bids them make while the time is short.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar85_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar85_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-85-nothing-now-save-the-mighty-one-and-his-law',
       E'We have nothing now save the Mighty One and His law',
       E'Baruch names what remains when every other support is gone: *the righteous have been gathered, And the prophets have fallen asleep... And Zion has been taken from us, And we have nothing now save the Mighty One and His law.* This is the book''s whole burden — the law is not abolished but is the one remaining anchor, the abiding word when temple and prophet are gone. It ain''t new — the law is the perfect testimony, the word settled for ever in heaven, the conclusion of the whole matter that abides when all else fails.',
       sv.verse_id, ev.verse_id, 'extras', 86100
  FROM _session412_2bar85_lookup sv, _session412_2bar85_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=85 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=85 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-85-no-longer-prophets-nor-place-of-repentance',
       E'No more prophets, no more famine of the word foreseen',
       E'Baruch marks the silence that has fallen: *the prophets have fallen asleep,* and a time comes when *There shall not there be again [a place of repentance, nor]... Nor place for prayer... Nor prayer of the prophets, Nor help of the righteous.* The dearth of the prophetic word is no new grief — Amos foresaw the famine of hearing the words of Yahuah, men wandering to seek it and not finding. It ain''t new — the silence of the prophets and the closing of the day of repentance the prophets themselves foretold.',
       sv.verse_id, ev.verse_id, 'extras', 86103
  FROM _session412_2bar85_lookup sv, _session412_2bar85_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=85 AND sv.verse_number=3
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=85 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-85-prepare-your-soul-for-after-death-the-judgment',
       E'Prepare your souls — judgement exacts its due',
       E'Baruch turns the loss of prophet and temple into urgency: *Before therefore judgement exact its own, And truth that which is its due, Let us prepare our soul... And again prepare your souls, so that when ye sail and ascend from the ship ye may have rest and not be condemned when ye depart.* The fixed appointment of death and the judgement after is the apostle''s plain word, and the rendering of every secret work is Qoheleth''s last verse. It ain''t new — that it is appointed to die once and after that the judgement, and that Elohim brings every work into judgement, the law and the apostles alike confess.',
       sv.verse_id, ev.verse_id, 'extras', 86106
  FROM _session412_2bar85_lookup sv, _session412_2bar85_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=85 AND sv.verse_number=9
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=85 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-85-the-time-is-short-now-is-the-accepted-time',
       E'The age is short — the door of repentance still open now',
       E'Baruch presses the shortness of the age while the day still stands: *the advent of the times is very short... the pitcher is near to the cistern, And the ship to the port,* and after the end *There shall not there be again [a place of repentance].* While repentance is still open, the time to turn is now — the very appeal Paul makes, that now is the accepted time. It ain''t new — that the day of salvation is now, before the door shuts, the apostle urges as the prophets urged before him.',
       sv.verse_id, ev.verse_id, 'extras', 86109
  FROM _session412_2bar85_lookup sv, _session412_2bar85_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=85 AND sv.verse_number=10
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=85 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-85-nothing-now-save-the-mighty-one-and-his-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ps 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure* — the law that remains to Israel when all else is taken, perfect and sure as Baruch confesses.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar85_lookup sv, _session412_2bar85_lookup tv
 WHERE t.slug='2-baruch-85-nothing-now-save-the-mighty-one-and-his-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ps 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven* — the law that abides though Zion falls, the one thing not taken away from Israel.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar85_lookup sv, _session412_2bar85_lookup tv
 WHERE t.slug='2-baruch-85-nothing-now-save-the-mighty-one-and-his-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=89
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Eccl 12:13 — *Fear Elohim (God), and keep his commandments: for this is the whole duty of man* — the conclusion of the whole matter, the law that remains when prophets sleep and Zion is gone.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar85_lookup sv, _session412_2bar85_lookup tv
 WHERE t.slug='2-baruch-85-nothing-now-save-the-mighty-one-and-his-law'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-85-no-longer-prophets-nor-place-of-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 8:11 — *I will send a famine in the land, not a famine of bread... but of hearing the words of Yahuah (LORD)* — the famine of the prophetic word Baruch laments now that the prophets have fallen asleep.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar85_lookup sv, _session412_2bar85_lookup tv
 WHERE t.slug='2-baruch-85-no-longer-prophets-nor-place-of-repentance'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=85 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Amos 8:12 — *they shall wander... to seek the word of Yahuah (LORD), and shall not find it* — the day with no place for prayer nor prophet that Baruch warns is coming.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar85_lookup sv, _session412_2bar85_lookup tv
 WHERE t.slug='2-baruch-85-no-longer-prophets-nor-place-of-repentance'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=85 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=8 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-85-prepare-your-soul-for-after-death-the-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Heb 9:27 — *as it is appointed unto men once to die, but after this the judgment* — the judgement after death for which Baruch bids them prepare their souls and not be condemned when they depart.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar85_lookup sv, _session412_2bar85_lookup tv
 WHERE t.slug='2-baruch-85-prepare-your-soul-for-after-death-the-judgment'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=85 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Eccl 12:14 — *Elohim (God) shall bring every work into judgment, with every secret thing, whether it be good, or whether it be evil* — the judgement that exacts its due, for which Baruch says prepare your soul.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar85_lookup sv, _session412_2bar85_lookup tv
 WHERE t.slug='2-baruch-85-prepare-your-soul-for-after-death-the-judgment'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=85 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-baruch-85-the-time-is-short-now-is-the-accepted-time
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Cor 6:2 — *behold, now is the accepted time; behold, now is the day of salvation* — the open day of repentance Baruch says will not return once the age is past, so turn now.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar85_lookup sv, _session412_2bar85_lookup tv
 WHERE t.slug='2-baruch-85-the-time-is-short-now-is-the-accepted-time'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=85 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deut 32:47 — *it is not a vain thing for you; because it is your life: and through this thing ye shall prolong your days* — the law set before life''s consummation, the choice Baruch bids them make while the time is short.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar85_lookup sv, _session412_2bar85_lookup tv
 WHERE t.slug='2-baruch-85-the-time-is-short-now-is-the-accepted-time'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=85 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_86.sql (session412 2-baruch 86) -----
-- Source anchor: pseudepigrapha/2-baruch ch86. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar86 (view _session412_2bar86_lookup). Sort band base 86125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar86_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-86-read-it-in-your-congregations
  ('pseudepigrapha', '2-baruch', 86, 1, 'canon', 'colossians', 4, 16, 'free', E'Col 4:16 — *when this epistle is read among you, cause that it be read also in the church of the Laodiceans* — a letter sent to be read aloud in the assemblies, exactly as Baruch charges the tribes.'),
  ('pseudepigrapha', '2-baruch', 86, 1, 'canon', 'deuteronomy', 31, 12, 'free', E'Deut 31:12 — *Gather the people together, men, and women, and children... that they may hear, and that they may learn* — the law read before the gathered congregation, the pattern Baruch''s epistle follows.'),
  ('pseudepigrapha', '2-baruch', 86, 1, 'canon', 'nehemiah', 8, 3, 'free', E'Neh 8:3 — *he read therein... and the ears of all the people were attentive unto the book of the law* — the public reading to the assembly Baruch bids them do with his epistle.'),
  ('pseudepigrapha', '2-baruch', 86, 2, 'canon', 'revelation', 1, 3, 'free', E'Rev 1:3 — *Blessed is he that readeth, and they that hear the words of this prophecy, and keep those things which are written therein* — the blessing on reading, hearing, and keeping, as Baruch bids them read and meditate.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar86_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar86_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-86-read-it-in-your-congregations',
       E'Read this epistle in your congregations',
       E'Baruch''s last instruction is that the letter be read aloud to the gathered people: *When therefore ye receive this my epistle, read it in your congregations with care. And meditate thereon, above all on the days of your fasts.* A written word sent to be read in the assembly and kept is the same practice Moses commanded for the law and Paul commanded for his epistles. It ain''t new — that the book be read before all the congregation, men and women, and laid up in the heart, stands from Moses to Ezra to the apostles.',
       sv.verse_id, ev.verse_id, 'extras', 86125
  FROM _session412_2bar86_lookup sv, _session412_2bar86_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=86 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=86 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-86-read-it-in-your-congregations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Col 4:16 — *when this epistle is read among you, cause that it be read also in the church of the Laodiceans* — a letter sent to be read aloud in the assemblies, exactly as Baruch charges the tribes.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar86_lookup sv, _session412_2bar86_lookup tv
 WHERE t.slug='2-baruch-86-read-it-in-your-congregations'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=86 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deut 31:12 — *Gather the people together, men, and women, and children... that they may hear, and that they may learn* — the law read before the gathered congregation, the pattern Baruch''s epistle follows.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar86_lookup sv, _session412_2bar86_lookup tv
 WHERE t.slug='2-baruch-86-read-it-in-your-congregations'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=86 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Neh 8:3 — *he read therein... and the ears of all the people were attentive unto the book of the law* — the public reading to the assembly Baruch bids them do with his epistle.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar86_lookup sv, _session412_2bar86_lookup tv
 WHERE t.slug='2-baruch-86-read-it-in-your-congregations'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=86 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Rev 1:3 — *Blessed is he that readeth, and they that hear the words of this prophecy, and keep those things which are written therein* — the blessing on reading, hearing, and keeping, as Baruch bids them read and meditate.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar86_lookup sv, _session412_2bar86_lookup tv
 WHERE t.slug='2-baruch-86-read-it-in-your-congregations'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=86 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2baruch_87.sql (session412 2-baruch 87) -----
-- Source anchor: pseudepigrapha/2-baruch ch87. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2bar87 (view _session412_2bar87_lookup). Sort band base 86150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session412_2bar87_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-baruch-87-sent-by-the-eagle-to-the-tribes
  ('pseudepigrapha', '2-baruch', 87, 1, 'canon', 'deuteronomy', 32, 11, 'free', E'Deut 32:11 — *As an eagle stirreth up her nest, fluttereth over her young... beareth them on her wings* — the eagle of Moses'' song that bears Israel, the figure Baruch''s eagle-borne letter to the tribes answers to.'),
  ('pseudepigrapha', '2-baruch', 87, 1, 'canon', 'isaiah', 40, 31, 'free', E'Isa 40:31 — *they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles* — the eagle''s wings that carry the captive tribes'' hope, as Baruch sends his word by the eagle.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session412_2bar87_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session412_2bar87_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-baruch-87-sent-by-the-eagle-to-the-tribes',
       E'Bound to the eagle and sent to the tribes',
       E'The book closes with the letter dispatched: *when I had ended all the words of this epistle, and had written it sedulously to its close, that I folded it, and sealed it carefully, and bound it to the neck of the eagle, and dismissed and sent it.* The eagle that bears the word to the scattered tribes recalls the eagle of Moses'' song, on whose wings Yahuah bore Israel, and Isaiah''s promise that they who wait shall mount up with wings as eagles. It ain''t new — the eagle that carries and bears up Israel is Moses'' own figure for the One who gathers His people.',
       sv.verse_id, ev.verse_id, 'extras', 86150
  FROM _session412_2bar87_lookup sv, _session412_2bar87_lookup ev
 WHERE sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=87 AND sv.verse_number=1
   AND ev.edition_slug='pseudepigrapha' AND ev.book_slug='2-baruch' AND ev.chapter_number=87 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-baruch-87-sent-by-the-eagle-to-the-tribes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deut 32:11 — *As an eagle stirreth up her nest, fluttereth over her young... beareth them on her wings* — the eagle of Moses'' song that bears Israel, the figure Baruch''s eagle-borne letter to the tribes answers to.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar87_lookup sv, _session412_2bar87_lookup tv
 WHERE t.slug='2-baruch-87-sent-by-the-eagle-to-the-tribes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=87 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isa 40:31 — *they that wait upon Yahuah (LORD) shall renew their strength; they shall mount up with wings as eagles* — the eagle''s wings that carry the captive tribes'' hope, as Baruch sends his word by the eagle.'
  FROM cross_reference_threads t, cross_references x, _session412_2bar87_lookup sv, _session412_2bar87_lookup tv
 WHERE t.slug='2-baruch-87-sent-by-the-eagle-to-the-tribes'
   AND sv.edition_slug='pseudepigrapha' AND sv.book_slug='2-baruch' AND sv.chapter_number=87 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session412 — 2 Baruch cross-references complete.'
