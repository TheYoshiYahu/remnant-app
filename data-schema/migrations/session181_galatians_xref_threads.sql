-- =====================================================================
-- Session 181 migration — galatians-anchored cross-reference threads
-- =====================================================================
-- 12 threads with 108 member rows
-- Anchor: Galatians book — companion to any pre-existing
-- galatians-anchored threads from S74 / S110+. All threads at tier='free'.
--
-- Idempotent: every INSERT carries ON CONFLICT DO NOTHING.
-- Run via: psql "$DATABASE_URL" -f data-schema/migrations/session181_galatians_xref_threads.sql
-- =====================================================================

\echo 'Session 181 galatians migration starting...'
BEGIN;

-- Verse-lookup temp view scoped to this transaction.
CREATE TEMP VIEW _s181_galatians_lookup AS
SELECT b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug = 'canon';

-- ---------------------------------------------------------------------
-- Thread 1: galatians-as-scattered-seed
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'galatians-as-scattered-seed',
    E'The Galatians as the scattered seed coming home',
    E'The letter is addressed *unto the assemblies of Galatia* — and the inherited reading assumes a roomful of random pagan converts. The framework reads the room differently. Paul''s mission was to *the uncircumcision* — the scattered seed of Yashar''el (Israel) living as Gentiles among the nations, with no Torah, no Temple, no priests, no covenant memory, the *not my people* of Hosea 1:9 walking the lands of their dispersion without knowing the name of the Father whose name had been forgotten among them.\n\n*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10)\n\nThat is the prophecy Paul is walking inside. The Galatians had *known not Elohim* (Galatians 4:8); they had been *in bondage to them which by nature are no gods.* They had *turned to Elohim from idols* (1 Thessalonians 1:9 — the same pattern in a different city). Paul is naming the Lo-Ammi house being recovered. *He which troubleth you shall bear his judgment* (Galatians 5:10) — the *other gospel* the agitators brought to those particular ears was the lie that the scattered could only come home by being circumcised as proselytes into Yahudah (Judah). The Father''s gathering of the twelve tribes was prophetic; the agitator''s flesh-credential doorway was counterfeit. The letter is the rebuke of the counterfeit, not the abolition of the covenant.\n\n*In Yahusha (Jesus) HaMashiach (Christ) neither circumcision availeth any thing, nor uncircumcision, but a new creature. And as many as walk according to this rule, peace be on them, and mercy, and upon the Yashar''el (Israel) of Elohim (God).* (Galatians 6:15-16) The closing benediction names the audience by its actual name. The room had been Yashar''el (Israel) the whole time — scattered, forgotten, now hearing the gathering call.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1001
  FROM _s181_galatians_lookup sv, _s181_galatians_lookup ev
 WHERE sv.book_slug = 'galatians' AND sv.chapter_number = 1 AND sv.verse_number = 1
   AND ev.book_slug = 'galatians' AND ev.chapter_number = 1 AND ev.verse_number = 9
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('galatians', 1, 2, 'hosea', 1, 9, 1, E'The *assemblies of Galatia* read against the *Lo-ammi: for ye are not my people* — the scattered northern house living among the nations in dispersion, the room Paul is writing to.'),
  ('galatians', 1, 2, 'hosea', 1, 10, 2, E'The *sand of the sea* gathering-promise; the same people Hosea names *not my people* are named *sons of the living Elohim (God)* in the same breath.'),
  ('galatians', 3, 8, 'genesis', 12, 3, 3, E'*In thee shall all nations be blessed* — the Avrahamic promise the Galatians are heirs of, not foreigners to. The promise was *preached before* to Avraham (Abraham); the seed has been carrying it forward.'),
  ('galatians', 4, 8, 'isaiah', 65, 1, 4, E'*I am found of them that sought me not; I am made manifest unto them that asked not after me* — the scattered seed in idolatry being found by Yahuah (the LORD) before they knew his name.'),
  ('galatians', 4, 9, 'jeremiah', 31, 10, 5, E'*He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* — the same Father who let them be scattered is now making himself known to bring them home.'),
  ('galatians', 6, 16, 'ezekiel', 37, 21, 6, E'*The Yashar''el (Israel) of Elohim (God)* read against *I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side* — the same people, named twice across the two testaments.'),
  ('galatians', 6, 16, 'isaiah', 11, 11, 7, E'*He shall set the second time his hand to recover the remnant of his people* — the second gathering Paul is inside, addressing the very *outcasts of Yashar''el (Israel)* the prophet named.'),
  ('galatians', 1, 6, 'romans', 9, 25, 8, E'*I will call them my people, which were not my people* — Paul''s own naming of his audience in Romans uses the same Hosea text; the Galatians are the same Lo-Ammi house the Roman letter addresses.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:galatians-as-scattered-seed | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_galatians_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_galatians_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for galatians-as-scattered-seed.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'galatians-as-scattered-seed'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:galatians-as-scattered-seed | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 2: another-gospel-as-judaizer-flesh-credential
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'another-gospel-as-judaizer-flesh-credential',
    E'The *other gospel* — the proselyte-conversion lie, not Torah-life',
    E'*I marvel that ye are so soon removed from him that called you into the grace of Messiah (Christ) unto another gospel: which is not another; but there be some that trouble you, and would pervert the gospel of Messiah (Christ).* (Galatians 1:6-7) The pulpit has trained the reader to hear *another gospel* and think *anyone who adds Torah-keeping to grace.* That is not what Paul names. The agitators in Galatia were preaching a specific lie, and the lie has a precise scriptural fingerprint.\n\n*And certain men which came down from Yahudah (Judaea) taught the brethren, and said, Except ye be circumcised after the manner of Mosheh (Moses), ye cannot be saved.* (Acts 15:1) That is the *other gospel.* It is not *the covenant-life of Torah-observance.* It is the teaching that ritual conversion into the house of Yahudah (Judah) confers covenant standing — that the doorway home for the scattered seed is proselyte-circumcision into a particular ethnic house, not the promise the Father spoke to Avraham (Abraham) four hundred and thirty years before the Torah came in (Galatians 3:17).\n\nThe Pharisees had been preaching that gospel a generation earlier. *Woe unto you, scribes and Pharisees, hypocrites! for ye compass sea and land to make one proselyte, and when he is made, ye make him twofold more the child of hell than yourselves.* (Matthew 23:15) The proselyte gospel was the doorway-of-flesh-credential mistaken for the doorway-of-promise. Paul''s anathema in Galatians 1:8-9 falls on that doorway, not on the Torah the scattered seed are coming home to.\n\nThe same flesh-credential gospel rides forward through every age in different clothing. *Be circumcised and become a Yahudi (Jew) and you are saved* in Paul''s day; *be baptized and join the church and you are saved* in the modern pulpit. Same architecture, different costume. The *other gospel* of Galatians 1 is alive in every system that offers a ritual-entry-into-our-community as the substitute for the prophetic gathering of the twelve paternal tribes.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1002
  FROM _s181_galatians_lookup sv, _s181_galatians_lookup ev
 WHERE sv.book_slug = 'galatians' AND sv.chapter_number = 1 AND sv.verse_number = 6
   AND ev.book_slug = 'galatians' AND ev.chapter_number = 1 AND ev.verse_number = 9
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('galatians', 1, 7, 'acts', 15, 1, 1, E'The *some that trouble you* are the same *certain men which came down from Yahudah (Judaea)* teaching that circumcision is the doorway to salvation; Acts 15 names the exact lie Galatians 1:7 rebukes.'),
  ('galatians', 1, 7, 'acts', 15, 5, 2, E'*Certain of the sect of the Pharisees which believed* — even after coming to the Messiah they were still preaching the flesh-credential gospel; the *other gospel* has names and a party.'),
  ('galatians', 1, 8, 'matthew', 23, 15, 3, E'Yahusha''s (Jesus''s) woe against the Pharisees'' proselyte-making is the prior diagnostic; Paul''s anathema falls on the same architecture, one generation later.'),
  ('galatians', 1, 8, 'deuteronomy', 4, 2, 4, E'*Ye shall not add unto the word which I command you, neither shall ye diminish ought from it* — the anathema-against-adding is itself a Torah principle; Paul is standing on Deuteronomy, not against it.'),
  ('galatians', 1, 9, 'deuteronomy', 13, 1, 5, E'The Torah''s own test for the false prophet — any *other gospel,* even from one carrying the name of the Father, is to be refused; Paul is applying the Torah''s own filter to the agitators.'),
  ('galatians', 1, 6, 'zechariah', 13, 9, 6, E'*I will bring the third part through the fire, and will refine them as silver is refined* — the prophetic refining of the covenant people foreclosed the *become-a-Yahudi-and-be-saved* gospel before Galatians was written; ancestry by birth never saved a stiff heart, and proselyte ritual cannot even reach the starting line.'),
  ('galatians', 1, 7, '2-corinthians', 11, 13, 7, E'*False apostles, deceitful workers, transforming themselves into the apostles of Messiah (Christ)* — Paul''s identical naming of the same agitator-class in a different letter; the *other gospel* travels with false brethren who put on apostolic costume.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:another-gospel-as-judaizer-flesh-credential | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_galatians_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_galatians_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for another-gospel-as-judaizer-flesh-credential.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'another-gospel-as-judaizer-flesh-credential'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:another-gospel-as-judaizer-flesh-credential | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 3: paul-the-torah-observant-yashareli
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'paul-the-torah-observant-yashareli',
    E'Paul of the tribe of Binyamin — never abandoned the Torah',
    E'Paul''s autobiographical opening is the framework for reading every line he writes. He is not a former Pharisee who left the Torah for grace. He is a Torah-observant Yashar''eli (Israelite) of the tribe of Binyamin (Benjamin), zealous for the covenant, who was confronted by Yahusha (Jesus) on the Damascus road and learned that the Messiah he was persecuting was the Yahuah (the LORD) of his own Tanakh come in the flesh. The man rebuking the agitators in Galatia is the same man who in another letter names himself precisely:\n\n*Circumcised the eighth day, of the stock of Yashar''el (Israel), of the tribe of Binyamin (Benjamin), an Hebrew of the Hebrews; as touching the law, a Pharisee.* (Philippians 3:5)\n\nHe says *I am a Yahudi (Jew)* in Acts 22:3 — present tense, after the resurrection, after the conversion, after years in the field. He took a Nazirite vow at Cenchrea (Acts 18:18). He went up to the Temple under a vow he had paid for with four other men *that all may know that those things, whereof they were informed concerning thee, are nothing; but that thou thyself also walkest orderly, and keepest the law* (Acts 21:24). He circumcised Timothy with his own hand (Acts 16:3). He celebrated the appointed feasts (Acts 20:6, 16; 27:9). He affirmed *the law is holy, and the commandment holy, and just, and good* (Romans 7:12). He named the Torah *spiritual* (Romans 7:14). He said *do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* (Romans 3:31).\n\nThe Paul who abolished the Torah does not exist. He is a construction of the inherited pulpit. The Paul who wrote Galatians is the Torah-observant Benjaminite Paul who refused to let the flesh-credential gospel set itself up as the doorway home for the scattered seed. Read every line of the letter through the man who actually wrote it, and the Christianized Paul collapses.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1003
  FROM _s181_galatians_lookup sv, _s181_galatians_lookup ev
 WHERE sv.book_slug = 'galatians' AND sv.chapter_number = 1 AND sv.verse_number = 11
   AND ev.book_slug = 'galatians' AND ev.chapter_number = 2 AND ev.verse_number = 21
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('galatians', 1, 13, 'philippians', 3, 5, 1, E'*Mine own nation* is the house Paul is *of the stock of Yashar''el (Israel), of the tribe of Binyamin (Benjamin)* — he is naming his own covenant lineage, not distancing from it.'),
  ('galatians', 1, 14, 'acts', 22, 3, 2, E'*Profited in the Yahudi (Jewish) religion above many my equals* read against Paul''s later *I am verily a Yahudi (Jew), born in Tarsus... taught according to the perfect manner of the law of the fathers* — present tense, after conversion.'),
  ('galatians', 1, 15, 'jeremiah', 1, 5, 3, E'*Separated me from my mother''s womb* is the prophetic-call language; Jeremiah was *sanctified... and ordained a prophet unto the nations* before he was born. Paul''s call walks the same prophetic stream, not a break from it.'),
  ('galatians', 1, 15, 'isaiah', 49, 1, 4, E'*Yahuah (the LORD) hath called me from the womb; from the bowels of my mother hath he made mention of my name* — Yeshayahu''s (Isaiah''s) Servant-call language Paul applies to his own commission.'),
  ('galatians', 1, 16, 'isaiah', 49, 6, 5, E'*To raise up the tribes of Ya''aqov (Jacob), and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles* — the prophetic specification of the apostolic mission; Paul cites this at Acts 13:47, naming his own commission as the gathering of the scattered seed.'),
  ('galatians', 2, 7, 'romans', 11, 13, 6, E'The gospel *of the uncircumcision* / *apostle of the Gentiles* read in Paul''s own clarification — *of the seed of Avraham (Abraham), of the tribe of Binyamin (Benjamin)* (Rom 11:1). Paul affirms his own covenant lineage in present tense, and walks that lineage into the apostolic commission to the scattered seed.'),
  ('galatians', 2, 14, 'acts', 21, 24, 7, E'*Walkest orderly, and keepest the law* — the Yerushalayim (Jerusalem) elders'' bodily proof of Paul''s continuing Torah-life, set against the Galatians 2:14 accusation of *living after the manner of Gentiles* which Peter was charged with, not Paul.'),
  ('galatians', 2, 21, 'romans', 3, 31, 8, E'*Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* — Paul''s own explicit refusal of the antinomian reading of his own ministry; the Romans clause locks the Galatians 2:21 reading.'),
  ('galatians', 2, 20, 'habakkuk', 2, 4, 9, E'*The just shall live by his faith* — Paul''s *I live by the faith of the Son of Elohim (God)* is the Habakkuk verse Paul will quote three times across his letters; faithfulness has always been the covenant-walk standard.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:paul-the-torah-observant-yashareli | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_galatians_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_galatians_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for paul-the-torah-observant-yashareli.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'paul-the-torah-observant-yashareli'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:paul-the-torah-observant-yashareli | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 4: erga-nomou-as-flesh-credential-system
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'erga-nomou-as-flesh-credential-system',
    E'*Works of the law* — the circumcision-party system, not Torah-observance',
    E'*Knowing that a man is not justified by the works of the law, but by the faith of Yahusha (Jesus) HaMashiach (Christ), even we have believed in Yahusha (Jesus) HaMashiach (Christ), that we might be justified by the faith of HaMashiach (Christ), and not by the works of the law: for by the works of the law shall no flesh be justified.* (Galatians 2:16)\n\nThe phrase *works of the law* is technical. In Greek, *erga nomou*. The pulpit has trained the reader to hear it as a synonym for *anything you do to keep the Torah,* so that the verse comes out *Torah-keeping cannot justify a man.* That is not what the phrase carries. The phrase names a specific party''s specific system — the circumcision-party''s flesh-performance gospel that the rituals of conversion (primarily circumcision, with the boundary-markers of food, Sabbath, and festival observance deployed as proselyte-identity badges) confer covenant standing.\n\nThe Tanakh has always taught the opposite of the lie Paul is rebuking. *Not for thy righteousness, or for the uprightness of thine heart, dost thou go to possess their land... understand therefore, that Yahuah Elohayka (the LORD thy God) giveth thee not this good land to possess it for thy righteousness; for thou art a stiffnecked people.* (Deuteronomy 9:5-6) Avraham (Abraham) was counted righteous before he was circumcised (Genesis 15:6, before Genesis 17). The promise came first, the covenant-sign came after; the sign was never the mechanism. Paul is reading his own Tanakh and rebuking the party that had inverted the sequence.\n\nTwo questions the Reformation collapsed into one and that this letter must always separate: *how is a person justified before Yah?* — by faith, by promise, by what Yahuah (the LORD) does for his name''s sake (Ezekiel 36:22). *How does a justified person live?* — by Spirit-empowered Torah-observance (Ezekiel 36:27). These are different questions. Paul is answering the first against the agitators who confused it. He is not abolishing the second.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1004
  FROM _s181_galatians_lookup sv, _s181_galatians_lookup ev
 WHERE sv.book_slug = 'galatians' AND sv.chapter_number = 2 AND sv.verse_number = 16
   AND ev.book_slug = 'galatians' AND ev.chapter_number = 2 AND ev.verse_number = 16
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('galatians', 2, 16, 'genesis', 15, 6, 1, E'*Avraham (Abraham) believed in Yahuah (the LORD); and he counted it to him for righteousness* — twenty-four years before Genesis 17''s circumcision; the order is the answer to the agitators.'),
  ('galatians', 2, 16, 'deuteronomy', 9, 5, 2, E'*Not for thy righteousness... doth Yahuah Elohayka (the LORD thy God) give thee this land* — the Tanakh''s own naming of the principle that flesh-performance does not establish covenant standing.'),
  ('galatians', 2, 16, 'psalms', 143, 2, 3, E'*In thy sight shall no man living be justified* — David''s own confession; the principle *by the works of the law shall no flesh be justified* is Psalm 143 carried forward, not a new doctrine.'),
  ('galatians', 2, 16, 'habakkuk', 2, 4, 4, E'*The just shall live by his faith* — the Tanakh-source of the faith-standard Paul deploys; covenant-life was always faith-walking, never flesh-credential-purchasing.'),
  ('galatians', 2, 16, 'isaiah', 64, 6, 5, E'*All our righteousnesses are as filthy rags* — no system of flesh-performance can buy standing before Yahuah (the LORD); the prophet had said it long before the agitators tried to sell it.'),
  ('galatians', 2, 16, 'ezekiel', 36, 22, 6, E'*Not for your sakes do I this... but for mine holy name''s sake* — the name''s-sake grammar that rules out every flesh-credential gospel; justification belongs to Yahuah (the LORD), not to any party''s ritual.'),
  ('galatians', 2, 16, 'romans', 3, 31, 7, E'*Do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* — Paul''s own clarification that the rebuke of *works of the law* is not the rebuke of Torah-observance; the Torah is established by faith, not voided by it.'),
  ('galatians', 2, 16, 'romans', 4, 3, 8, E'*Avraham (Abraham) believed Elohim (God), and it was counted unto him for righteousness* — Paul rereads Genesis 15:6 in Romans 4 in detail; both letters carry the same justification-by-promise reading rooted in the patriarchal narrative.'),
  ('galatians', 2, 16, 'acts', 15, 10, 9, E'Peter at the Yerushalayim (Jerusalem) council names the *yoke upon the neck of the disciples, which neither our fathers nor we were able to bear* — the proselyte-conversion system imposed as the doorway, not the Torah itself that the Yashar''eli (Israelites) had walked.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:erga-nomou-as-flesh-credential-system | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_galatians_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_galatians_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for erga-nomou-as-flesh-credential-system.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'erga-nomou-as-flesh-credential-system'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:erga-nomou-as-flesh-credential-system | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 5: curse-of-the-law-as-deuteronomy-28-exile
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'curse-of-the-law-as-deuteronomy-28-exile',
    E'The *curse of the law* — Deuteronomy 28 exile, not the Torah itself',
    E'*HaMashiach (Christ) hath redeemed us from the curse of the law, being made a curse for us: for it is written, Cursed is every one that hangeth on a tree.* (Galatians 3:13)\n\nThe inherited reading hears *curse of the law* and thinks *the Torah itself is a curse.* That is the antichrist reading. Paul is not naming the Torah as the curse. He is naming the specific scriptural curse that falls on covenant-people who walk contrary to the Torah — the Deuteronomy 28 exile-judgment, the wounds that scattered the northern house through Assyria and the southern house through Babylon, the *not my people* condition the prophets had named and lamented for centuries.\n\n*And it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God)... that all these curses shall come upon thee, and overtake thee... And Yahuah (the LORD) shall scatter thee among all people, from the one end of the earth even unto the other.* (Deuteronomy 28:15, 64)\n\nThat is *the curse of the law.* Not the Torah. The Torah is the inheritance. The curse is the exile-judgment for breaking the inheritance. Yahusha (Jesus) bore the curse on the tree — *cursed is every one that hangeth on a tree* (citing Deuteronomy 21:23) — to open the way home for the scattered seed who had walked into the curse by walking contrary to the Father. The door is open. The way back is made. But the door home is not the cancellation of the consequence-system. Paul writes the immediate corrective to his own grace-language three chapters later in Romans: *What then? shall we sin, because we are not under the law, but under grace? Elohim (God) forbid* (Romans 6:15). The cross redeems us *from the curse of exile* into the Way. It does not redeem us *from the Torah* into a kingdom where consequence no longer operates.\n\n*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7) — Paul lands the same corrective inside this very letter, four chapters after the *redeemed from the curse* clause. The two verses must be read together. The same letter that names the redemption names the standing operation of the consequence-system.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1005
  FROM _s181_galatians_lookup sv, _s181_galatians_lookup ev
 WHERE sv.book_slug = 'galatians' AND sv.chapter_number = 3 AND sv.verse_number = 10
   AND ev.book_slug = 'galatians' AND ev.chapter_number = 3 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('galatians', 3, 10, 'deuteronomy', 27, 26, 1, E'*Cursed is every one that continueth not in all things which are written in the book of the law to do them* — Paul cites Deuteronomy directly; the curse is the Torah''s own self-warning against breaking it, not the Torah itself.'),
  ('galatians', 3, 10, 'deuteronomy', 28, 15, 2, E'The full curse-catalog of Deuteronomy 28 — the wounds that fall on the covenant-people who walk contrary to the covenant; this IS the *curse of the law* Galatians names.'),
  ('galatians', 3, 10, 'deuteronomy', 28, 64, 3, E'*Yahuah (the LORD) shall scatter thee among all people* — the exile-curse that fell on both houses; the scattered seed of the Galatians is the very condition the Deuteronomy 28 curse names.'),
  ('galatians', 3, 13, 'deuteronomy', 21, 23, 4, E'*Cursed is every one that hangeth on a tree* — Paul cites the Deuteronomy verse directly; Yahusha (Jesus) bore the curse on the tree to redeem the scattered FROM the exile-judgment, not from the Torah.'),
  ('galatians', 3, 13, 'isaiah', 53, 5, 5, E'*He was wounded for our transgressions, he was bruised for our iniquities* — the Tanakh-prophecy of the Servant bearing the exile-judgment-wounds; the curse-bearing is prophetic substance, not Torah-abolition.'),
  ('galatians', 3, 13, 'daniel', 9, 11, 6, E'*Therefore the curse is poured upon us, and the oath that is written in the law of Mosheh (Moses)* — Daniel''s prayer names the curse as the Deuteronomy 28 exile-judgment poured upon the covenant-people, exactly as Paul names it.'),
  ('galatians', 3, 13, 'leviticus', 26, 33, 7, E'*I will scatter you among the heathen* — the parallel curse-clause from Leviticus; the exile-judgment was Torah''s own warning, and the warning came true.'),
  ('galatians', 3, 14, 'isaiah', 44, 3, 8, E'*I will pour my Ruach (Spirit) upon thy seed, and my blessing upon thine offspring* — the Tanakh source of the *promise of the Spirit* the redeemed scattered seed now receive; the gathering carries the Ruach (Spirit).'),
  ('galatians', 3, 14, 'genesis', 12, 3, 9, E'*In thee shall all families of the earth be blessed* — the Avrahamic blessing that the cross-bearing of the curse opens the door for the scattered seed to walk into. The blessing was always the Father''s, never the agitator''s to sell.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:curse-of-the-law-as-deuteronomy-28-exile | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_galatians_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_galatians_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for curse-of-the-law-as-deuteronomy-28-exile.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'curse-of-the-law-as-deuteronomy-28-exile'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:curse-of-the-law-as-deuteronomy-28-exile | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 6: the-seed-of-promise-is-singular-paternal
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'the-seed-of-promise-is-singular-paternal',
    E'*To thy seed, which is HaMashiach* — paternal-seed substance carrying the promise',
    E'*Now to Avraham (Abraham) and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is HaMashiach (Christ).* (Galatians 3:16)\n\nThe *seed* of Avraham (Abraham) is paternal. The seed runs father → son → son''s son through paternal blood. *Thy seed* across the patriarchal-promises — Genesis 12:7, 13:15, 15:5, 17:7-8, 22:18, 26:4, 28:13-14 — is paternal-seed-language, and the framework holds both pieces of every patriarchal promise: the promise spoken to the patriarch AND the paternal blood-line carrying the promise forward through his sons.\n\nPaul reads the singular *seed* in the patriarchal text and identifies it with the Messiah. The promise was always pointing to one specific seed who would carry it as the substance, not many seeds scattered across many lineages. The Messiah is the seed-singular Genesis pointed to; the seed-of-promise still runs paternal through the same line — through the Messiah, through Avraham (Abraham), through the patriarchs.\n\nThis rules out two opposite collapses. The Pharisaic-flesh-credential lie collapses the promise — it teaches that being-born-into-Yahudah (Judah) or converting-into-Yahudah (Judah) saves, erasing the prior promise to Avraham (Abraham) that the Father himself fulfilled. The Christian-Gentile-grafting-by-faith-confession lie collapses the seed — it teaches that anyone who confesses faith becomes the seed of Avraham (Abraham), erasing the paternal-seed-substance the promises carry. The framework refuses both collapses. The Messiah is the seed-singular; through him the scattered paternal seed comes home; the marriage-covenant is the one mechanism the Father has appointed for foreign-origin individuals to enter the seed-line by absorption into the husband''s seed-identity (Rachab into Salmon, Ruth into Boaz). The pattern Galatians 3:16 names is the pattern the Tanakh-Genesis-and-Prophets carried from the beginning.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1006
  FROM _s181_galatians_lookup sv, _s181_galatians_lookup ev
 WHERE sv.book_slug = 'galatians' AND sv.chapter_number = 3 AND sv.verse_number = 16
   AND ev.book_slug = 'galatians' AND ev.chapter_number = 3 AND ev.verse_number = 19
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('galatians', 3, 16, 'genesis', 12, 7, 1, E'*Unto thy seed will I give this land* — the first patriarchal-seed-promise, paternal, pointing forward to the seed-singular Galatians 3 names.'),
  ('galatians', 3, 16, 'genesis', 13, 15, 2, E'*To thee will I give it, and to thy seed for ever* — the seed-promise carrying the land-inheritance forward as substance, not as metaphor.'),
  ('galatians', 3, 16, 'genesis', 17, 7, 3, E'*I will establish my covenant... for an everlasting covenant, to be Elohim (God) unto thee, and to thy seed after thee* — the seed-promise as the substance of the covenant itself.'),
  ('galatians', 3, 16, 'genesis', 22, 18, 4, E'*In thy seed shall all the nations of the earth be blessed* — the Avrahamic blessing-clause running through the singular seed; the verse Paul is reading when he names HaMashiach (Christ) as *thy seed.*'),
  ('galatians', 3, 16, '2-samuel', 7, 12, 5, E'*I will set up thy seed after thee... and I will establish the throne of his kingdom for ever* — the Davidic seed-promise pointing to the Messianic-seed-singular; Galatians 3:16 reads the patriarchal and Davidic promises as one stream.'),
  ('galatians', 3, 16, 'isaiah', 11, 1, 6, E'*There shall come forth a rod out of the stem of Yishai (Jesse), and a Branch shall grow out of his roots* — the Davidic-Messianic seed-singular springing from the lineage, named by the prophet.'),
  ('galatians', 3, 17, 'exodus', 12, 40, 7, E'The four-hundred-and-thirty-year Egypt-sojourn ended by the Exodus — Paul''s chronology in Galatians 3:17 lifts the Exodus timeframe directly; the Torah came in *four hundred and thirty years* after the promise, and cannot disannul it.'),
  ('galatians', 3, 18, 'genesis', 15, 18, 8, E'*In the same day Yahuah (the LORD) made a covenant with Avram (Abram)* — the inheritance came by promise, not by Torah-performance; Paul reads the Genesis 15 covenant-cutting as the source.'),
  ('galatians', 3, 19, 'deuteronomy', 5, 5, 9, E'*I stood between Yahuah (the LORD) and you at that time, to shew you the word of Yahuah (the LORD)* — Mosheh''s (Moses''s) own naming of the mediator-function the Torah came in *by the hand of a mediator*; the Torah''s mediator-architecture is preserved, not abolished.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:the-seed-of-promise-is-singular-paternal | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_galatians_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_galatians_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for the-seed-of-promise-is-singular-paternal.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'the-seed-of-promise-is-singular-paternal'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:the-seed-of-promise-is-singular-paternal | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 7: paidagogos-as-pre-messianic-guardian
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'paidagogos-as-pre-messianic-guardian',
    E'The *paidagogos* — coming-of-age into full sonship, not graduating past Torah',
    E'*Wherefore the law was our schoolmaster to bring us unto HaMashiach (Christ), that we might be justified by faith. But after that faith is come, we are no longer under a schoolmaster.* (Galatians 3:24-25)\n\nThe Greek word translated *schoolmaster* is *paidagogos* — a household guardian-escort, not a teacher of curriculum. The paidagogos walked the heir-son to school each day, guarded his conduct, and exercised legal custody during the years of the heir''s minority. The function ended when the son entered full sonship and the inheritance was placed in his hand. The pulpit has trained the reader to hear *no longer under a schoolmaster* as *no longer under the Torah''s content.* That is exactly the inversion the metaphor refuses. Coming of age means receiving the inheritance, not throwing it away.\n\n*And these words, which I command thee this day, shall be in thine heart: and thou shalt teach them diligently unto thy children.* (Deuteronomy 6:6-7) The Torah was the household instruction of the Father — given, then internalized through the years of minority, then walked freely by the son who has come into his inheritance. *I will put my Ruach (Spirit) within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The new covenant is the same Torah, on a different surface — the heart instead of the tablets. Stone tablets out; fleshy tables of the heart in. The paidagogos''s external supervision is the stone-tablet stage; full sonship is the heart-tablet stage. The Torah is the same. The Spirit is the new covenant''s gift, and what the Spirit does inside the heart is exactly what the Father commanded outside.\n\nThe pre-Messianic age stewarded the covenant-people through external custody; the Messianic age brings the heir-sons into their inheritance with the Torah written on the heart by the Ruach (Spirit). The inheritance includes the Torah. To exit the paidagogos by abandoning the household instruction is to refuse the inheritance and call the journey complete at the gate.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1007
  FROM _s181_galatians_lookup sv, _s181_galatians_lookup ev
 WHERE sv.book_slug = 'galatians' AND sv.chapter_number = 3 AND sv.verse_number = 24
   AND ev.book_slug = 'galatians' AND ev.chapter_number = 3 AND ev.verse_number = 25
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('galatians', 3, 24, 'deuteronomy', 6, 6, 1, E'*These words... shall be in thine heart: and thou shalt teach them diligently unto thy children* — the Torah''s own framing as household instruction; the paidagogos-function carried in the home before the Messiah came in the flesh.'),
  ('galatians', 3, 24, 'deuteronomy', 6, 7, 2, E'*Thou shalt teach them diligently unto thy children, and shalt talk of them when thou sittest in thine house* — the paidagogos-architecture from the Torah itself, not a Greek-philosophical overlay.'),
  ('galatians', 3, 25, 'jeremiah', 31, 33, 3, E'*I will put my law in their inward parts, and write it in their hearts* — the new-covenant promise that the Torah is moved from the external custody to the internal heart-substance; the paidagogos''s external work yields to the Ruach (Spirit)''s internal work, same Torah.'),
  ('galatians', 3, 25, 'ezekiel', 36, 26, 4, E'*A new heart also will I give you, and a new spirit will I put within you* — the heart-of-flesh given to the heir-sons in their majority; the inheritance comes into their hand.'),
  ('galatians', 3, 25, 'ezekiel', 36, 27, 5, E'*I will put my Ruach (Spirit) within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* — the Spirit causes the walking-in-statutes; the post-paidagogos life is Spirit-empowered Torah-walking, not Torah-abandonment.'),
  ('galatians', 3, 25, 'hebrews', 8, 10, 6, E'*I will put my laws into their mind, and write them in their hearts* — the apostolic quotation of Jeremiah 31:33 reading the new covenant as Torah-internalized; Hebrews and Galatians are walking the same stream.'),
  ('galatians', 3, 26, 'hosea', 1, 10, 7, E'*Ye are the sons of the living Elohim (God)* — the Lo-Ammi house brought into full sonship; Paul''s *ye are all the children of Elohim (God) by faith* is the Hosea fulfillment Galatians is naming.'),
  ('galatians', 4, 1, 'exodus', 4, 22, 8, E'*Yashar''el (Israel) is my son, even my firstborn* — the covenant-people as the heir-son the household instruction was preparing for inheritance; the metaphor''s substance is the Tanakh''s own father-son architecture.'),
  ('galatians', 4, 7, 'romans', 8, 17, 9, E'*Heirs of Elohim (God), and joint-heirs with HaMashiach (Christ)* — the inheritance into which the heir-son enters at the coming of full sonship; the inheritance is the kingdom-of-priests promise, not the discarding of the Torah that constitutes it.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:paidagogos-as-pre-messianic-guardian | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_galatians_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_galatians_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for paidagogos-as-pre-messianic-guardian.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'paidagogos-as-pre-messianic-guardian'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:paidagogos-as-pre-messianic-guardian | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 8: neither-jew-nor-greek-removes-hierarchy-not-identity
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'neither-jew-nor-greek-removes-hierarchy-not-identity',
    E'*Neither Yahudi (Jew) nor Greek* — hierarchy of access removed, identity preserved',
    E'*There is neither Yahudi (Jew) nor Greek, there is neither bond nor free, there is neither male nor female: for ye are all one in Yahusha (Jesus) HaMashiach (Christ). And if ye be HaMashiach''s (Christ''s), then are ye Avraham''s (Abraham''s) seed, and heirs according to the promise.* (Galatians 3:28-29)\n\nThe inherited reading hears *neither Yahudi (Jew) nor Greek* and concludes that ethnicity is erased, tribal identity is abolished, the prophetic gathering of the twelve paternal tribes is replaced with a self-selected community of believers from any people. That is the false inclusion gospel. The verse refuses it on two grounds.\n\nFirst, the *bond nor free* and *male nor female* clauses sit inside the same sentence. Yahusha (Jesus) did not abolish slavery in the Roman world by saying it; Paul did not abolish the male-and-female creation-distinction by saying it. He named what *in HaMashiach (Christ)* means — the agitator-hierarchy of access (circumcised above uncircumcised, free above bond, male above female) has no standing before the promise. The verse removes hierarchy. It does not erase the categories the hierarchy was abusing.\n\nSecond, the very next verse names the covenant-identity the room enters: *Avraham''s (Abraham''s) seed.* The Greek-living-as-Gentile scattered seed and the Yahudi (Jewish) hearer alike have no hierarchy of access before the promise — both come home through the prophetic journey, not through the agitator''s ritual doorway. Both modern Yahudah (Judah) and the modern scattered seed are children of the broken-off; the seed of Avraham (Abraham) was always one olive tree of two scattered houses, and the agitator''s flesh-credential hierarchy was the lie that claimed otherwise. The Galatians 3:28 verse is the rebuke of the hierarchy, and the closing benediction at Galatians 6:16 names what the gathered room is: *the Yashar''el (Israel) of Elohim (God),* the scattered paternal seed coming home through the journey the prophets named.\n\nThe prophetic gathering of all twelve tribes still stands. *I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). The verse Paul writes is the agitator-hierarchy refused, not the Tanakh''s tribal-architecture erased.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1008
  FROM _s181_galatians_lookup sv, _s181_galatians_lookup ev
 WHERE sv.book_slug = 'galatians' AND sv.chapter_number = 3 AND sv.verse_number = 26
   AND ev.book_slug = 'galatians' AND ev.chapter_number = 3 AND ev.verse_number = 29
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('galatians', 3, 28, 'ezekiel', 37, 21, 1, E'*I will take the children of Yashar''el (Israel) from among the heathen* — the prophetic gathering of the twelve tribes that *neither Yahudi (Jew) nor Greek* refuses to flatten; the houses remain identified, the hierarchy of access between them is removed.'),
  ('galatians', 3, 28, 'ezekiel', 37, 22, 2, E'*I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all* — the two houses become one nation under one king (the Messiah); the unity is the gathering, not the dissolving of identity.'),
  ('galatians', 3, 28, 'ezekiel', 37, 19, 3, E'*The stick of Yoseph (Joseph), which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick* — the two-stick unity-prophecy; both sticks remain identified by their tribal names while becoming one in the Father''s hand.'),
  ('galatians', 3, 28, 'jeremiah', 31, 31, 4, E'*I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* — the new covenant is made with both houses by name, not with a generic-believing-community without lineage.'),
  ('galatians', 3, 28, 'isaiah', 11, 12, 5, E'*He shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* — the gathering of both houses by name; the *neither Yahudi (Jew) nor Greek* verse cannot erase what the prophet says will be gathered.'),
  ('galatians', 3, 28, 'acts', 26, 7, 6, E'Paul''s own naming of *our twelve tribes, instantly serving Elohim (God) day and night* in the Roman court — present tense, after the resurrection; the tribes are intact in Paul''s own theology.'),
  ('galatians', 3, 29, 'genesis', 22, 18, 7, E'*In thy seed shall all the nations of the earth be blessed* — the Avrahamic seed-blessing the gathered scattered are heirs of; *Avraham''s (Abraham''s) seed... heirs according to the promise* is the Genesis 22 substance.'),
  ('galatians', 3, 29, 'romans', 11, 1, 8, E'*I also am a Yashar''eli (Israelite), of the seed of Avraham (Abraham), of the tribe of Binyamin (Benjamin)* — Paul affirms his own tribal identity in present tense; the *Avraham''s (Abraham''s) seed* of Galatians 3:29 is the same lineage Romans 11:1 walks in.'),
  ('galatians', 6, 16, 'ezekiel', 37, 21, 9, E'*The Yashar''el (Israel) of Elohim (God)* read against the prophetic gathering of the twelve tribes; the letter''s closing benediction names the scattered seed coming home, not a metaphorical replacement-Israel.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:neither-jew-nor-greek-removes-hierarchy-not-identity | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_galatians_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_galatians_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for neither-jew-nor-greek-removes-hierarchy-not-identity.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'neither-jew-nor-greek-removes-hierarchy-not-identity'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:neither-jew-nor-greek-removes-hierarchy-not-identity | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 9: hagar-and-sarah-as-two-covenants
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'hagar-and-sarah-as-two-covenants',
    E'Hagar and Sarah — flesh-credential counterfeit versus promise-Yerushalayim (Jerusalem) above',
    E'*Tell me, ye that desire to be under the law, do ye not hear the law? For it is written, that Avraham (Abraham) had two sons, the one by a bondmaid, the other by a freewoman... which things are an allegory: for these are the two covenants; the one from the mount Sinai, which gendereth to bondage, which is Hagar.* (Galatians 4:21-24)\n\nThe Christian default reads this allegory as *Hagar represents the Torah given at Sinai, Sarah represents grace through Christ, and the cast-out-the-bondwoman command means cast out the Torah.* That reading is the antichrist reading. The framework reads what the allegory actually says. Both covenants in the allegory were already operative when Paul wrote it; the question is which doorway-into-the-seed-of-promise each represents.\n\nHagar represents the flesh-credential system — *the works of the law,* the proselyte-conversion-into-Yahudah (Judah) gospel, the agitator''s doorway. The Yishmael (Ishmael) line came from Avraham (Abraham)''s flesh-attempt to fulfill the promise his own way, by his own work, through a substitute mother. Hagar is *Mount Sinai in Arabia... and answereth to Yerushalayim (Jerusalem) which now is, and is in bondage with her children* — the first-century proselyte-system operating out of Yerushalayim (Jerusalem) under the Pharisaic and the agitator-party leadership, the same flesh-credential gospel the Galatians 1:7 *other gospel* was preaching. The bondage is the bondage of trying to buy the promise by ritual conversion into a particular ethnic house. The bondage is NOT the Torah, which Paul calls *holy, and just, and good* in Romans 7:12.\n\nSarah represents the promise-Yerushalayim (Jerusalem) above — *Yerushalayim (Jerusalem) which is above is free, which is the mother of us all* (Galatians 4:26). The Yitschaq (Isaac)-line came from the promise the Father spoke, not from the flesh-attempt; the freewoman''s son inherits because the promise is what the Father is keeping. The allegory''s *cast out the bondwoman* is the casting-out of the flesh-credential doorway. It is not the casting-out of the Torah. The same Paul who writes this allegory writes *do we then make void the law through faith? Elohim (God) forbid: yea, we establish the law* (Romans 3:31). The two clauses lock each other. The bondwoman who is cast out is the agitator-system; the freewoman whose son inherits is the promise that has always run through the patriarchal-seed-singular Galatians 3:16 named.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1009
  FROM _s181_galatians_lookup sv, _s181_galatians_lookup ev
 WHERE sv.book_slug = 'galatians' AND sv.chapter_number = 4 AND sv.verse_number = 21
   AND ev.book_slug = 'galatians' AND ev.chapter_number = 4 AND ev.verse_number = 31
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('galatians', 4, 22, 'genesis', 16, 15, 1, E'*Hagar bare Avram (Abram) a son: and Avram (Abram) called his son''s name, which Hagar bare, Yishmael (Ishmael)* — the bondmaid''s son named in the Genesis text Paul reads allegorically; the flesh-attempt-to-fulfill-the-promise.'),
  ('galatians', 4, 22, 'genesis', 21, 2, 2, E'*Sarah conceived, and bare Avraham (Abraham) a son in his old age... at the set time of which Elohim (God) had spoken* — the promise-son born when the Father''s set time came; the seed-singular line.'),
  ('galatians', 4, 23, 'genesis', 18, 10, 3, E'*I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son* — the spoken-promise Yitschaq (Isaac)''s birth fulfilled; *he that was of the freewoman was by promise* is the Genesis 18 substance.'),
  ('galatians', 4, 24, 'genesis', 17, 18, 4, E'*Avraham (Abraham) said unto Elohim (God), O that Yishmael (Ishmael) might live before thee!* — the flesh-attempt named directly by Avraham (Abraham) in the Torah text; Hagar''s son is the flesh-doorway, not the promise.'),
  ('galatians', 4, 25, 'genesis', 25, 12, 5, E'*These are the generations of Yishmael (Ishmael), Avraham''s (Abraham''s) son... twelve princes according to their nations* — Yishmael''s (Ishmael''s) line as a separate tribal architecture, not the seed-of-promise; the Hagar-line of the allegory carries this lineage-substance.'),
  ('galatians', 4, 26, 'isaiah', 54, 1, 6, E'*Sing, O barren, thou that didst not bear* — Paul quotes Isaiah directly at Galatians 4:27; the promise-Yerushalayim (Jerusalem)-above is the Isaiah 54 restoration-prophecy of the scattered seed coming home in abundance.'),
  ('galatians', 4, 27, 'isaiah', 54, 1, 7, E'*More are the children of the desolate than the children of the married wife* — the Tanakh source-verse for the promise-line outproducing the flesh-attempt; the gathering of the scattered fulfills the Isaiah prophecy directly.'),
  ('galatians', 4, 28, 'romans', 9, 8, 8, E'*They which are the children of the flesh, these are not the children of Elohim (God): but the children of the promise are counted for the seed* — Paul''s parallel reading of the Hagar-Sarah architecture in Romans 9; the children of promise are the seed.'),
  ('galatians', 4, 30, 'genesis', 21, 10, 9, E'*Cast out this bondwoman and her son: for the son of this bondwoman shall not be heir with my son, even with Yitschaq (Isaac)* — Sarah''s words quoted exactly; the casting-out is of the flesh-doorway in the patriarchal narrative, the same casting-out Paul applies to the agitator-system.'),
  ('galatians', 4, 24, 'romans', 7, 12, 10, E'*Wherefore the law is holy, and the commandment holy, and just, and good* — Paul''s own lock on the allegory; the bondage in Galatians 4 is not the Torah, because the same Paul names the Torah *holy* in the very next letter in the canon''s order.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:hagar-and-sarah-as-two-covenants | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_galatians_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_galatians_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for hagar-and-sarah-as-two-covenants.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'hagar-and-sarah-as-two-covenants'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:hagar-and-sarah-as-two-covenants | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 10: liberty-in-messiah-from-judaizer-yoke
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'liberty-in-messiah-from-judaizer-yoke',
    E'*Stand fast in liberty* — freedom from the proselyte-yoke, not from the Torah',
    E'*Stand fast therefore in the liberty wherewith HaMashiach (Christ) hath made us free, and be not entangled again with the yoke of bondage. Behold, I Paul say unto you, that if ye be circumcised, HaMashiach (Christ) shall profit you nothing.* (Galatians 5:1-2)\n\nThe pulpit reads *yoke of bondage* and inserts *the Torah.* The verse refuses the insertion. Paul names the yoke specifically in the next breath: *if ye be circumcised, HaMashiach (Christ) shall profit you nothing.* The yoke is the agitator-system''s proselyte-circumcision-as-doorway-to-salvation. The yoke is the same flesh-credential gospel of Galatians 1:7 wearing a different name. The yoke is what Peter named at the Yerushalayim (Jerusalem) council — *the yoke upon the neck of the disciples, which neither our fathers nor we were able to bear* (Acts 15:10) — the proselyte-conversion-system imposed as the doorway, not the Torah the Yashar''eli (Israelites) had walked in their generations.\n\nYahusha (Jesus) himself names the contrary yoke: *Take my yoke upon you, and learn of me; for I am meek and lowly in heart... For my yoke is easy, and my burden is light* (Matthew 11:29-30). His yoke is not the absence of Torah. His yoke is the same Torah carried with him — *I have kept my Father''s commandments, and abide in his love* (John 15:10) — borne by a Spirit-empowered heart instead of a flesh-credential-purchasing system. The liberty is the freedom to receive the Father''s instruction as inheritance, not to perform it as a wage paid to a proselyte-system.\n\n*For all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself* (Galatians 5:14). Paul does not free the Galatians from the love-command; he names the love-command as the fulfillment of the Torah. The Torah is established by faith, not voided by it. The liberty Galatians 5 names is the liberty from the agitator''s doorway, into the Father''s house where the Torah is written on the heart by the Ruach (Spirit).',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1010
  FROM _s181_galatians_lookup sv, _s181_galatians_lookup ev
 WHERE sv.book_slug = 'galatians' AND sv.chapter_number = 5 AND sv.verse_number = 1
   AND ev.book_slug = 'galatians' AND ev.chapter_number = 5 AND ev.verse_number = 6
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('galatians', 5, 1, 'acts', 15, 10, 1, E'Peter''s *yoke upon the neck of the disciples, which neither our fathers nor we were able to bear* — the proselyte-conversion-system the apostolic council named as the yoke; same yoke Paul refuses in Galatians 5:1.'),
  ('galatians', 5, 1, 'acts', 15, 24, 2, E'*Subverting your souls, saying, Ye must be circumcised, and keep the law* — the agitator-formula the Yerushalayim (Jerusalem) council itself refused; Galatians 5:1''s yoke has the same shape.'),
  ('galatians', 5, 1, 'matthew', 11, 29, 3, E'*Take my yoke upon you, and learn of me* — Yahusha''s (Jesus''s) yoke is the contrary yoke, Torah carried in Spirit-empowered ease, not the proselyte-yoke imposed by the agitators.'),
  ('galatians', 5, 1, 'matthew', 23, 4, 4, E'*They bind heavy burdens and grievous to be borne, and lay them on men''s shoulders* — Yahusha''s (Jesus''s) own naming of the Pharisaic burden-system; the same architecture the Galatian agitators carry forward.'),
  ('galatians', 5, 6, 'genesis', 17, 11, 5, E'The circumcision-sign as covenant-membership-mark for those born into the covenant; *circumcision availeth* nothing as a flesh-credential doorway, because the sign was never the mechanism of standing — the promise was.'),
  ('galatians', 5, 6, 'deuteronomy', 30, 6, 6, E'*Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God)* — the heart-circumcision the Torah itself prophesied; the new-covenant work the Ruach (Spirit) does inside, the same Father naming the same work.'),
  ('galatians', 5, 14, 'leviticus', 19, 18, 7, E'*Thou shalt love thy neighbour as thyself* — Paul quotes Leviticus directly; the *fulfilment of the law* is the Torah''s own love-command, not the abolition of the Torah.'),
  ('galatians', 5, 14, 'romans', 13, 8, 8, E'*He that loveth another hath fulfilled the law... all the commandments are briefly comprehended in this saying, Thou shalt love thy neighbour as thyself* — Paul''s identical reading in Romans; love-of-neighbour as the heart-substance of the commandments, not their replacement.'),
  ('galatians', 5, 14, 'james', 2, 8, 9, E'*If ye fulfil the royal law according to the scripture, Thou shalt love thy neighbour as thyself, ye do well* — Ya''aqov''s (James''s) parallel; *the royal law* IS the Torah, fulfilled by the love-command Paul names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:liberty-in-messiah-from-judaizer-yoke | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_galatians_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_galatians_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for liberty-in-messiah-from-judaizer-yoke.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'liberty-in-messiah-from-judaizer-yoke'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:liberty-in-messiah-from-judaizer-yoke | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 11: fruit-of-the-spirit-as-torah-confirming
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'fruit-of-the-spirit-as-torah-confirming',
    E'Fruit of the Ruach (Spirit) — *against such there is no law* as Torah-confirming',
    E'*But the fruit of the Ruach (Spirit) is love, joy, peace, longsuffering, gentleness, goodness, faith, meekness, temperance: against such there is no law.* (Galatians 5:22-23)\n\nThe pulpit reads *against such there is no law* and hears it as *the Torah is no longer in operation for the Spirit-led.* The verse says the opposite. The fruit Paul lists is the fruit the Torah commands. Love (Deuteronomy 6:5; Leviticus 19:18). Joy (Deuteronomy 16:14). Peace (Psalm 34:14, the Torah''s wisdom-tradition). Longsuffering, gentleness, goodness, faithfulness, meekness, temperance — every one a virtue the Torah and the prophets call the covenant-people to walk in. The Spirit produces what the Torah commands, because the Spirit who lives in the believer is the Spirit who spoke at Sinai, and he does not lead in two directions. *Against such there is no law* means the Torah does not stand against the fruit of its own Spirit. The fruit is the Torah''s confirmation, not its abolition.\n\n*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh. And I will put my Ruach (Spirit) within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* (Ezekiel 36:26-27)\n\nThe Ruach (Spirit)-empowered Galatians 5 life is the Ezekiel 36 promise breaking into time. The Spirit causes the walking in statutes. Spirit-led life IS Torah-life — not Torah-life-with-the-Spirit-added as a different category, not Torah-life-replaced-by-Spirit-life as a contradiction. The Spirit walks the believer into what the Torah commanded all along, with the commandment now written on the heart instead of carved on stone.\n\n*Walk in the Ruach (Spirit), and ye shall not fulfil the lust of the flesh* (Galatians 5:16) is the same sentence as *cause you to walk in my statutes.* The two verses lock each other. The Spirit and the Torah are one work of one Father in two phases — the external commandment given at Sinai, the same commandment internalized in the heart by the Ruach (Spirit) in the new covenant.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1011
  FROM _s181_galatians_lookup sv, _s181_galatians_lookup ev
 WHERE sv.book_slug = 'galatians' AND sv.chapter_number = 5 AND sv.verse_number = 22
   AND ev.book_slug = 'galatians' AND ev.chapter_number = 5 AND ev.verse_number = 25
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('galatians', 5, 22, 'deuteronomy', 6, 5, 1, E'*Thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart* — the Shema''s love-command; love as the first fruit is the Torah''s first command, not a replacement of it.'),
  ('galatians', 5, 22, 'leviticus', 19, 18, 2, E'*Thou shalt love thy neighbour as thyself* — Leviticus names love-of-neighbour as Torah; the first fruit of the Ruach (Spirit) is the second great commandment.'),
  ('galatians', 5, 22, 'deuteronomy', 16, 14, 3, E'*Thou shalt rejoice in thy feast, thou, and thy son, and thy daughter* — the Torah''s command of joy, walked in the appointed feasts; joy as the second fruit is feast-substance.'),
  ('galatians', 5, 22, 'micah', 6, 8, 4, E'*To do justly, and to love mercy, and to walk humbly with thy Elohim (God)* — the prophet''s summation of what Yahuah (the LORD) requires; the fruit-of-the-Spirit list walks the same path.'),
  ('galatians', 5, 23, 'ezekiel', 36, 27, 5, E'*I will put my Ruach (Spirit) within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* — the Tanakh-source for the *fruit of the Ruach (Spirit)* arc; the Spirit causes the statutes-keeping.'),
  ('galatians', 5, 23, 'jeremiah', 31, 33, 6, E'*I will put my law in their inward parts, and write it in their hearts* — *against such there is no law* read against the law-written-in-the-heart; the Torah is not abolished, it is internalized.'),
  ('galatians', 5, 25, 'ezekiel', 36, 26, 7, E'*A new heart... and a new spirit will I put within you* — *if we live in the Ruach (Spirit), let us also walk in the Ruach (Spirit)* is the heart-of-flesh-given-the-Spirit-life of the Ezekiel prophecy.'),
  ('galatians', 5, 18, 'romans', 8, 14, 8, E'*As many as are led by the Ruach (Spirit) of Elohim (God), they are the sons of Elohim (God)* — Paul''s parallel reading in Romans; Spirit-leading is the new-covenant evidence of sonship, the same architecture both letters carry.'),
  ('galatians', 5, 16, 'romans', 8, 4, 9, E'*That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Ruach (Spirit)* — Paul''s own explicit Romans clarification: walking in the Ruach (Spirit) is the fulfilling-of-the-righteousness-of-the-law, not its abolition.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:fruit-of-the-spirit-as-torah-confirming | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_galatians_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_galatians_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for fruit-of-the-spirit-as-torah-confirming.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'fruit-of-the-spirit-as-torah-confirming'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:fruit-of-the-spirit-as-torah-confirming | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Thread 12: law-of-messiah-as-torah-internalized
-- ---------------------------------------------------------------------
INSERT INTO cross_reference_threads
  (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT
    'law-of-messiah-as-torah-internalized',
    E'*The law of Messiah* — same Torah, written on the heart',
    E'*Bear ye one another''s burdens, and so fulfil the law of HaMashiach (Christ).* (Galatians 6:2)\n\nThe pulpit reads *the law of HaMashiach (Christ)* and hears it as *a new and different law that has replaced the Torah.* The framework reads the phrase as the Torah of the Messiah — the same Torah, carried in the Messiah''s own walking of it, taught with its heart-substance restored, internalized by the Ruach (Spirit) in the new covenant. The Messiah did not bring a new commandment-list; he brought the old one back to its heart. *I am not come to destroy, but to fulfil* (Matthew 5:17). To *fulfil* is to fill the Torah with the heart-substance the oral-tradition apparatus had stripped from it — the love-of-neighbour Leviticus 19:18 commanded, the burden-bearing the Torah''s whole social architecture rests on, the mercy-and-justice-and-faith Yahusha (Jesus) names as *the weightier matters of the law* (Matthew 23:23).\n\n*If ye fulfil the royal law according to the scripture, Thou shalt love thy neighbour as thyself, ye do well.* (James 2:8) Ya''aqov (James) names the same Torah by a different title — *the royal law* — and locates its center in the same Leviticus 19:18 verse Paul cites at Galatians 5:14. The *law of HaMashiach (Christ),* the *royal law,* and *the law of Yahuah (the LORD)* are one thing under different names — the Torah the Father gave, the Torah the Messiah walked, the Torah the Ruach (Spirit) writes on the heart of those gathered home.\n\nThe closing of the letter locks the standing operation of the consequence-system the same letter named the Messiah''s redemption from in chapter 3: *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). The same Paul who wrote *redeemed us from the curse of the law* wrote *whatsoever a man soweth, that shall he also reap* four chapters later. Both clauses must be read together. The door home is open through the Messiah; the Way the door opens onto has consequences that still operate, because the Way is real, because the Father is real.',
    sv.verse_id, ev.verse_id,
    'free'::content_tier, 1012
  FROM _s181_galatians_lookup sv, _s181_galatians_lookup ev
 WHERE sv.book_slug = 'galatians' AND sv.chapter_number = 6 AND sv.verse_number = 1
   AND ev.book_slug = 'galatians' AND ev.chapter_number = 6 AND ev.verse_number = 10
ON CONFLICT (slug) DO NOTHING;

WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, sort_order, member_note) AS (VALUES
  ('galatians', 6, 2, 'leviticus', 19, 18, 1, E'*Thou shalt love thy neighbour as thyself* — the Leviticus verse the *law of HaMashiach (Christ)* centers on; burden-bearing is the active form of neighbour-love the Torah commanded.'),
  ('galatians', 6, 2, 'jeremiah', 31, 33, 2, E'*I will put my law in their inward parts, and write it in their hearts* — *the law of HaMashiach (Christ)* IS the Torah written on the heart by the Ruach (Spirit) per the new-covenant promise.'),
  ('galatians', 6, 2, 'ezekiel', 36, 27, 3, E'*Cause you to walk in my statutes, and ye shall keep my judgments, and do them* — the Spirit-empowered walking the *law of HaMashiach (Christ)* names; same Torah, internalized.'),
  ('galatians', 6, 2, 'james', 2, 8, 4, E'*The royal law* — *thou shalt love thy neighbour as thyself* — Ya''aqov (James) names the same Torah-internalized law Paul calls the *law of HaMashiach (Christ)*; one Torah under multiple apostolic titles.'),
  ('galatians', 6, 2, 'matthew', 22, 39, 5, E'*Thou shalt love thy neighbour as thyself... on these two commandments hang all the law and the prophets* — Yahusha (Jesus) himself centers the Torah on the love-command Galatians 6:2 names as fulfilment.'),
  ('galatians', 6, 7, 'deuteronomy', 28, 15, 6, E'*Cursed shalt thou be in the city, and cursed shalt thou be in the field* — Deuteronomy 28''s sowing-and-reaping of the consequence-system; the curse-operation Paul affirms is still in operation, not cancelled by the redemption-door.'),
  ('galatians', 6, 7, 'hosea', 8, 7, 7, E'*They have sown the wind, and they shall reap the whirlwind* — the prophet''s identical sowing-and-reaping formula; covenant-consequence is Tanakh-substance, not Pauline novelty.'),
  ('galatians', 6, 7, 'job', 4, 8, 8, E'*They that plow iniquity, and sow wickedness, reap the same* — Job''s wisdom-stream affirmation of the same sowing-and-reaping principle; the standing operation of the consequence-system.'),
  ('galatians', 6, 7, 'romans', 6, 15, 9, E'*What then? shall we sin, because we are not under the law, but under grace? Elohim (God) forbid* — Paul''s own immediate corrective to his own grace-language; the door home is not a release from consequence, in either letter.'),
  ('galatians', 6, 9, 'deuteronomy', 7, 9, 10, E'*Yahuah Elohayka (the LORD thy God), he is Elohim (God), the faithful Elohim (God), which keepeth covenant and mercy* — the harvest in due season comes because the Father is faithful to keep covenant with those who walk with him; the well-doing Paul names is covenant-walking.'),
  ('galatians', 6, 10, 'deuteronomy', 15, 11, 11, E'*Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy* — the Torah''s specific command to do good to the brethren; Paul''s *do good unto all men, especially unto them who are of the household of faith* walks the Deuteronomy command into the gathered scattered.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', E'thread:law-of-messiah-as-torah-internalized | ' || i.member_note, 'free'::content_tier
  FROM input i
  JOIN _s181_galatians_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v
  JOIN _s181_galatians_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Link thread members for law-of-messiah-as-torah-internalized.
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 
       ROW_NUMBER() OVER (ORDER BY sb.canonical_order, sc.chapter_number, sv.verse_number,
                                   tb.canonical_order, tc.chapter_number, tv.verse_number) AS so,
       SUBSTRING(x.note FROM POSITION('|' IN x.note) + 2)
  FROM cross_references x
  JOIN cross_reference_threads t ON t.slug = 'law-of-messiah-as-torah-internalized'
  JOIN verses sv ON sv.id = x.source_verse_id
  JOIN chapters sc ON sc.id = sv.chapter_id
  JOIN books sb ON sb.id = sc.book_id
  JOIN verses tv ON tv.id = x.target_verse_id
  JOIN chapters tc ON tc.id = tv.chapter_id
  JOIN books tb ON tb.id = tc.book_id
 WHERE x.note LIKE 'thread:law-of-messiah-as-torah-internalized | %'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

COMMIT;
\echo 'Session 181 galatians migration complete.'