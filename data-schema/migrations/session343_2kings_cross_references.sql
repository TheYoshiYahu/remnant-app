-- =====================================================================
-- Session 343 — 2 Kings FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/former-prophets-wt/data-schema/migrations/session343_2kings_cross_references.sql
-- =====================================================================

\echo 'session343 — 2 Kings cross-references starting...'
BEGIN;

-- ----- fragment: minion_2-kings_1.sql (2 Kings 1) -----
-- 2 Kings 1 — Ahaziah enquires of Baalzebub; Elijah's rebuke; fire from heaven and the mercy on the humble; the sure word.
-- TAG: 2ki01   VIEW: _s343_2ki01_lookup   SORT BAND: 38500, step 3 (38500,38503,38506)
-- SOURCE rows all 'canon','2-kings',1,v.
--
-- 2 Kings 1 coverage:
--   v.2-3,6,16 (Ahaziah sends to enquire of Baal-zebub the god of Ekron; Is it not because there is not a Elohim in Yashar'el?)
--          NT:     none warranted (the rebuke is Tanakh-grounded; first-commandment + necromancy ban)
--          Extras: none warranted
--          Tanakh: Exodus 20:3 (no other gods before me); Leviticus 20:6 (the soul that turneth after familiar spirits, I will cut off); Deuteronomy 18:10-11 (no consulter with familiar spirits or necromancer); Isaiah 8:19-20 (should not a people seek unto their Elohim? to the law and to the testimony) [thread 1]
--   v.9-15 (the captains of fifty; twice fire comes down and consumes; the third humbles himself and is spared)
--          NT:     Luke 9:54-56 (James and John would call fire down "as Elias did"; Ye know not what manner of spirit ye are of; the Son of Adam is not come to destroy but to save) [thread 2]
--          Extras: none warranted
--          Tanakh: 1 Kings 18:38 (the fire of Yahuah fell — the same prophet, the same heaven-fire) [thread 2]
--   v.17 (So he died according to the word of Yahuah which Elijah had spoken)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 18:21-22 (how shall we know the word? — when the thing follow not, Yahuah hath not spoken; the true prophet's word comes to pass); 1 Kings 18:1 (the word fulfilled pattern — Yahuah said and it came) [thread 3]
--
-- THREADS:
--   2-kings-1-is-there-not-an-elohim-in-israel-enquiring-of-baalzebub (free) — Tanakh: Exod20, Lev20, Deut18, Isa8
--   2-kings-1-fire-from-heaven-and-the-mercy-on-the-humble-ye-know-not-what-spirit (free) — Tanakh: 1Kings18; NT: Luke9
--   2-kings-1-he-died-according-to-the-word-of-yahuah-the-sure-word (free) — Tanakh: Deut18, 1Kings18
-- Framework-load-bearing framing:
--   ★ THE FIRST COMMANDMENT (thread 1): Ahaziah, fallen and sick, sends past the living Elohim to *enquire of
--   Baal-zebub the god of Ekron* (1:2); Elijah's thrice-repeated rebuke — *Is it not because there is not a
--   Elohim (God) in Yashar'el (Israel), that ye go to enquire of Baal-zebub the god of Ekron?* (1:3,6,16) — names
--   the first word of Sinai broken (*Thou shalt have no other gods before me* Exod 20:3) AND the necromancy/
--   divination ban (Lev 20:6; Deut 18:10-11). Isaiah voices the same charge: *should not a people seek unto their
--   Elohim (God)? for the living to the dead?* (Isa 8:19) — to the law and to the testimony (Isa 8:20). The living
--   Elohim is IN Yashar'el; to seek a dead idol is to deny him. Torah is the standard, never the curse.
--   ★★ FIRE, AND THE SEASON OF MERCY (thread 2): twice the captains command *Come down* and twice *fire come
--   down from heaven* consumes them (1:10,12); the third *fell on his knees... let my life... be precious in thy
--   sight* (1:13) and is spared. The vindicating fire is the same the prophet called on Carmel (1 Kings 18:38).
--   ⚠ When James and John would do likewise — *wilt thou that we command fire to come down from heaven... even
--   as Elias did?* (Luke 9:54) — the Formed Son REBUKES them: *Ye know not what manner of spirit ye are of; For
--   the Son of Adam is not come to destroy men's lives, but to save them* (Luke 9:55-56). NOT Elijah condemned —
--   the SEASON changed: judgment held back, the day of salvation opened; the same power, now mercy. The humbled
--   third captain already foreshadows it: mercy on the one who bows.
--   ★ THE SURE WORD (thread 3): *So he died according to the word of Yahuah (LORD) which Elijah had spoken*
--   (1:17) — the mark of the true prophet by Torah's own test: *when a prophet speaketh in the name of Yahuah
--   (LORD), if the thing follow not... that is the thing which Yahuah (LORD) hath not spoken* (Deut 18:22). It
--   followed; Yahuah spoke it; the word stands, as the rain came at his word on Carmel (1 Kings 18:1).

CREATE TEMP VIEW _s343_2ki01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: is there not an Elohim in Israel? enquiring of Baalzebub (1:3,6,16)
    ('canon','2-kings',1,3,'canon','exodus',20,3,'free',E'*Thou shalt have no other gods before me* (Exodus 20:3). The angel of Yahuah sends Elijah to confront the king''s messengers with the first word of Sinai broken: *Is it not because there is not a Elohim (God) in Yashar''el (Israel), that ye go to enquire of Baal-zebub the god of Ekron?* (2 Kings 1:3). The living Elohim is in Yashar''el; to send past him to a foreign idol is to set another god before his face.'),
    ('canon','2-kings',1,3,'canon','isaiah',8,19,'free',E'*And when they shall say unto you, Seek unto them that have familiar spirits, and unto wizards that peep, and that mutter: should not a people seek unto their Elohim (God)? for the living to the dead?* (Isaiah 8:19). Isaiah names the exact folly of Ahaziah: a people that has the living Elohim turning to consult the dead. Elijah''s question — *Is it not because there is not a Elohim (God) in Yashar''el (Israel)?* (2 Kings 1:3) — is Isaiah''s *should not a people seek unto their Elohim?* pressed onto a king who sought a corpse-god of Ekron instead.'),
    ('canon','2-kings',1,6,'canon','leviticus',20,6,'free',E'*And the soul that turneth after such as have familiar spirits, and after wizards, to go a whoring after them, I will even set my face against that soul, and will cut him off from among his people* (Leviticus 20:6). Ahaziah''s sending to *enquire of Baal-zebub the god of Ekron* (2 Kings 1:6) is the very whoring-after-other-spirits Torah forbids on pain of being cut off — and the sentence that follows, *thou shalt not come down from that bed... but shalt surely die* (2 Kings 1:6), is that cutting-off enacted on the king.'),
    ('canon','2-kings',1,16,'canon','deuteronomy',18,11,'free',E'*Or a charmer, or a consulter with familiar spirits, or a wizard, or a necromancer. For all that do these things are an abomination unto Yahuah (LORD)* (Deuteronomy 18:11-12). To *enquire of Baal-zebub the god of Ekron* (2 Kings 1:16) is to be the consulter Torah calls an abomination; Elijah, speaking face to face, lays the indictment as the breach it is — *is it not because there is no Elohim (God) in Yashar''el (Israel) to enquire of his word?* The word of Yahuah was there to be sought, and the king sought a dead thing.'),

    -- THREAD 2: fire from heaven and the mercy on the humble; ye know not what spirit (1:10,12,13)
    ('canon','2-kings',1,10,'canon','1-kings',18,38,'free',E'*Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice, and the wood, and the stones, and the dust, and licked up the water that was in the trench* (1 Kings 18:38). The heaven-fire that consumes Ahaziah''s captains is the same fire the same prophet called down on Carmel: *If I be a man of Elohim (God), then let fire come down from heaven... And there came down fire from heaven, and consumed him and his fifty* (2 Kings 1:10). At Carmel it vindicated Yahuah against Baal; here it vindicates his prophet against the king who sought Baal — both answer whether *there is... a Elohim (God) in Yashar''el (Israel)*.'),
    ('canon','2-kings',1,10,'canon','luke',9,54,'free',E'*And when his disciples James and John saw this, they said, Lord, wilt thou that we command fire to come down from heaven, and consume them, even as Elias did? But he turned, and rebuked them, and said, Ye know not what manner of spirit ye are of. For the Son of Adam is not come to destroy men''s lives, but to save them* (Luke 9:54-56). The disciples invoke this very scene — *even as Elias did* — when Samaritans reject the Master; *there came down fire from heaven, and consumed him and his fifty* (2 Kings 1:10) is the precedent they reach for. The Formed Son holds the same heaven-fire back: not that Elijah sinned, but that the season has changed — the Son of Adam comes in the day of salvation, to save and not destroy, the judgment-power restrained in mercy.'),
    ('canon','2-kings',1,13,'canon','luke',9,56,'free',E'*For the Son of Adam is not come to destroy men''s lives, but to save them* (Luke 9:56). The third captain does not command but kneels — *O man of Elohim (God), I pray thee, let my life, and the life of these fifty thy servants, be precious in thy sight* (2 Kings 1:13) — and lives. The mercy on the one who humbles himself foreshadows the spirit the Formed Son names: the saving of lives, not their destroying; even under the prophet of fire, the one who bows is spared.'),

    -- THREAD 3: he died according to the word of Yahuah, the sure word (1:17)
    ('canon','2-kings',1,17,'canon','deuteronomy',18,22,'free',E'*When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously* (Deuteronomy 18:22). Torah''s own test of the true prophet is met exactly: *So he died according to the word of Yahuah (LORD) which Elijah had spoken* (2 Kings 1:17). The thing followed; it came to pass; therefore Yahuah spoke it, and Elijah spoke not presumptuously but in the Name — the word stands proven.'),
    ('canon','2-kings',1,17,'canon','1-kings',18,1,'free',E'*And it came to pass after many days, that the word of Yahuah (LORD) came to Elijah in the third year, saying, Go, shew thyself unto Ahab; and I will send rain upon the earth* (1 Kings 18:1). As the rain came at Yahuah''s word through Elijah on Carmel, so the death comes at Yahuah''s word through Elijah in Samaria — *So he died according to the word of Yahuah (LORD) which Elijah had spoken* (2 Kings 1:17); the God whose word brings the rain is the God whose word brings the judgment, and not one syllable of it falls to the ground.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREADS

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-1-is-there-not-an-elohim-in-israel-enquiring-of-baalzebub',
       E'Is there not an Elohim in Yashar''el? — enquiring of Baalzebub',
       E'Ahaziah, son of Ahab and Jezebel, falls through a lattice and lies sick — and instead of seeking the living Elohim of his own land he sends messengers to a foreign shrine: *Go, enquire of Baal-zebub the god of Ekron whether I shall recover of this disease* (2 Kings 1:2). The angel of Yahuah intercepts the messengers through Elijah, and three times in the chapter the same indictment rings: *Is it not because there is not a Elohim (God) in Yashar''el (Israel), that ye go to enquire of Baal-zebub the god of Ekron?* (2 Kings 1:3,6,16). This is the first word of Sinai broken — *Thou shalt have no other gods before me* (Exodus 20:3) — and at the same time the divination-and-necromancy ban: *the soul that turneth after such as have familiar spirits, and after wizards, to go a whoring after them, I will even set my face against that soul, and will cut him off from among his people* (Leviticus 20:6); *a consulter with familiar spirits, or a wizard, or a necromancer. For all that do these things are an abomination unto Yahuah (LORD)* (Deuteronomy 18:11-12). Isaiah names the very folly: *should not a people seek unto their Elohim (God)? for the living to the dead?* — *to the law and to the testimony: if they speak not according to this word, it is because there is no light in them* (Isaiah 8:19-20). The whole charge turns on a single fact the king ignored: the living Elohim is IN Yashar''el, his word there to be sought (*to enquire of his word*, 2 Kings 1:16). To send past him to a dead idol of Ekron is to deny he is there — and the sentence falls, *thou shalt not come down from that bed... but shalt surely die*, the Torah cutting-off enacted on a king who whored after another god. The standard throughout is the Torah itself: the law is the light, never the curse; the curse is what falls when the light is refused.',
       sv.verse_id, ev.verse_id, 'free', 38500
  FROM _s343_2ki01_lookup sv, _s343_2ki01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-1-fire-from-heaven-and-the-mercy-on-the-humble-ye-know-not-what-spirit',
       E'Fire from heaven, and the mercy on the humble — ye know not what manner of spirit',
       E'Ahaziah will not let the prophet be. He sends *a captain of fifty with his fifty* to bring Elijah down by force, and the captain hails him not as a man of Elohim to be feared but as a wanted man: *Thou man of Elohim (God), the king hath said, Come down* (2 Kings 1:9). Elijah answers, *If I be a man of Elohim (God), then let fire come down from heaven, and consume thee and thy fifty. And there came down fire from heaven, and consumed him and his fifty* (2 Kings 1:10). A second captain comes with the same command, *Come down quickly*, and the same fire falls (2 Kings 1:11-12). This is the heaven-fire the same prophet called on Carmel — *Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice, and the wood, and the stones, and the dust* (1 Kings 18:38) — there vindicating Yahuah against Baal, here vindicating his prophet against the king who sought Baal. But the third captain does not command; he kneels: *O man of Elohim (God), I pray thee, let my life, and the life of these fifty thy servants, be precious in thy sight* (2 Kings 1:13). And he is spared — *Go down with him: be not afraid of him* (2 Kings 1:15). Mercy rests on the one who humbles himself. Centuries later the disciples reach for this exact scene when a Samaritan village rejects the Master: *Lord, wilt thou that we command fire to come down from heaven, and consume them, even as Elias did?* (Luke 9:54). The Formed Son turns and rebukes them: *Ye know not what manner of spirit ye are of. For the Son of Adam is not come to destroy men''s lives, but to save them* (Luke 9:55-56). This is no condemning of Elijah — the fire was righteous judgment in its season. It is the season itself that has changed. The Son of Adam comes in the day of salvation; the judgment-power is held back, restrained in mercy, *to save them.* The humbled third captain already pointed forward to it: even under the prophet of fire, the one who bows down lives.',
       sv.verse_id, ev.verse_id, 'free', 38503
  FROM _s343_2ki01_lookup sv, _s343_2ki01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=1 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-1-he-died-according-to-the-word-of-yahuah-the-sure-word',
       E'He died according to the word of Yahuah — the sure word',
       E'The chapter closes with a single, weighty line: *So he died according to the word of Yahuah (LORD) which Elijah had spoken* (2 Kings 1:17). Ahaziah''s death is not chance or disease running its course; it is the spoken word of Yahuah coming exactly to pass — *thou shalt not come down from that bed on which thou art gone up, but shalt surely die* (2 Kings 1:4,6,16). And this is precisely Torah''s own test for the true prophet against the false: *When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken, but the prophet hath spoken it presumptuously: thou shalt not be afraid of him* (Deuteronomy 18:22). The thing followed; it came to pass; therefore Yahuah spoke it, and Elijah spoke not of himself but in the Name — proven a true prophet by the very fulfillment. It is the same pattern that opened Elijah''s great sign at Carmel: Yahuah had said *I will send rain upon the earth* (1 Kings 18:1), and the rain came. The God whose word brings the rain of mercy is the God whose word brings the judgment of death, and not one syllable of either falls to the ground. The word of Yahuah is sure.',
       sv.verse_id, ev.verse_id, 'free', 38506
  FROM _s343_2ki01_lookup sv, _s343_2ki01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=1 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD MEMBERS

-- Thread 1: is there not an Elohim in Israel? enquiring of Baalzebub
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt have no other gods before me* (Exodus 20:3) — the first word of Sinai; to enquire of Baal-zebub is to set another god before Yahuah''s face.'
  FROM cross_reference_threads t
  JOIN _s343_2ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s343_2ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-1-is-there-not-an-elohim-in-israel-enquiring-of-baalzebub'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*should not a people seek unto their Elohim (God)? for the living to the dead?* (Isaiah 8:19) — Isaiah''s name for Ahaziah''s folly: a people that has the living Elohim consulting the dead.'
  FROM cross_reference_threads t
  JOIN _s343_2ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s343_2ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-1-is-there-not-an-elohim-in-israel-enquiring-of-baalzebub'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the soul that turneth after such as have familiar spirits... I will even set my face against that soul, and will cut him off* (Leviticus 20:6) — the cutting-off the king''s death enacts; *thou shalt surely die* (2 Kings 1:6).'
  FROM cross_reference_threads t
  JOIN _s343_2ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s343_2ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-1-is-there-not-an-elohim-in-israel-enquiring-of-baalzebub'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a consulter with familiar spirits, or a wizard, or a necromancer... an abomination unto Yahuah (LORD)* (Deuteronomy 18:11-12) — Torah''s ban; the king enquired of a dead god instead of *his word* (2 Kings 1:16).'
  FROM cross_reference_threads t
  JOIN _s343_2ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s343_2ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-1-is-there-not-an-elohim-in-israel-enquiring-of-baalzebub'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: fire from heaven and the mercy on the humble; ye know not what spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Then the fire of Yahuah (LORD) fell, and consumed the burnt sacrifice* (1 Kings 18:38) — the same prophet, the same heaven-fire that vindicated Yahuah at Carmel now vindicates his prophet.'
  FROM cross_reference_threads t
  JOIN _s343_2ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s343_2ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=18 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-1-fire-from-heaven-and-the-mercy-on-the-humble-ye-know-not-what-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*wilt thou that we command fire... even as Elias did? ...Ye know not what manner of spirit ye are of* (Luke 9:54-56) — the Formed Son holds back the same fire; the season has changed from judgment to salvation.'
  FROM cross_reference_threads t
  JOIN _s343_2ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=1 AND sv.verse_number=10
  JOIN _s343_2ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=9 AND tv.verse_number=54
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-1-fire-from-heaven-and-the-mercy-on-the-humble-ye-know-not-what-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*For the Son of Adam is not come to destroy men''s lives, but to save them* (Luke 9:56) — the spirit the humbled third captain foreshadows; mercy on the one who bows (2 Kings 1:13).'
  FROM cross_reference_threads t
  JOIN _s343_2ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s343_2ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=9 AND tv.verse_number=56
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-1-fire-from-heaven-and-the-mercy-on-the-humble-ye-know-not-what-spirit'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: he died according to the word of Yahuah, the sure word
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*if the thing follow not, nor come to pass, that is the thing which Yahuah (LORD) hath not spoken* (Deuteronomy 18:22) — Torah''s test of the true prophet, met exactly: the thing followed, so Yahuah spoke it.'
  FROM cross_reference_threads t
  JOIN _s343_2ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s343_2ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-1-he-died-according-to-the-word-of-yahuah-the-sure-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will send rain upon the earth* (1 Kings 18:1) — the same word-fulfilled pattern: as the rain came at Yahuah''s word, so the death comes at his word; not a syllable falls to the ground.'
  FROM cross_reference_threads t
  JOIN _s343_2ki01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s343_2ki01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=18 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-1-he-died-according-to-the-word-of-yahuah-the-sure-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_2.sql (2 Kings 2) -----
-- 2 Kings 2 — Elijah taken up; the double portion; the mantle and the parted Jordan; the Bethel mockers judged.
-- TAG: 2ki02   VIEW: _s343_2ki02_lookup   SORT BAND: base 38525 step 3 (38525, 38528, 38531, 38534)
-- SOURCE rows all 'canon','2-kings',2,v.  Canon target tier 'free'; extras target tier 'extras'.
--
-- 2 Kings 2 coverage:
--   v.1,11 (Elijah taken up by whirlwind into heaven; chariot/horses of fire):
--        NT:     Acts 1:9 (taken up, cloud received him), Acts 1:11 (so come in like manner); Hebrews 11:5 (Enoch translated, should not see death)
--        Extras: Ecclesiasticus 48:9 (taken up in a whirlwind of fire, in a chariot of fiery horses)
--        Tanakh: Genesis 5:24 (Enoch walked with Elohim, and he was not; for Elohim took him)
--   v.9-10,15 (double portion of thy spirit; if thou see me; spirit of Elijah doth rest on Elisha):
--        NT:     none warranted (succession-of-the-Spirit motif served by Numbers + extras)
--        Extras: Ecclesiasticus 48:12 (Eliseus was filled with his spirit)
--        Tanakh: Deuteronomy 21:17 (double portion = right of the firstborn); Numbers 11:17,25 (spirit on Moses put on the seventy)
--   v.13-14 (mantle that fell; smote waters; Where is Yahuah Elohim of Elijah; waters parted):
--        NT:     none warranted (the parting-power confirmed laterally in the Tanakh)
--        Extras: none warranted
--        Tanakh: Joshua 3:16,17 (Jordan cut off, stood upon an heap; passed over on dry ground)
--   v.23-24 (Go up thou bald head; mocked the prophet at Beth-el; two she bears):
--        NT:     Matthew 17:11 (Elias truly shall first come, and restore all things)
--        Extras: none warranted
--        Tanakh: Malachi 4:5 (Behold, I will send you Elijah the prophet)
--   v.2-8,12,16-22,25: narrative travel / sons of the prophets / healing the spring / Carmel — no standalone xref add (woven into threads above; the spring-healing v.19-22 stands as Elisha's confirmed ministry, none warranted across all three libraries).
--
-- THREADS (4):
--   2-kings-2-elijah-taken-up-the-prophet-who-escaped-death           [Tanakh + NT + extras]  v.1->v.11
--   2-kings-2-the-double-portion-the-spirit-on-the-successor          [Tanakh + extras]       v.9->v.15
--   2-kings-2-the-mantle-and-the-parted-jordan                       [Tanakh]                v.13->v.14
--   2-kings-2-reverence-for-the-prophet-the-bethel-mockers-judged     [Tanakh + NT]           v.23->v.24
--
-- CONTESTED/LOAD-BEARING FRAMING:
--   v.11 Elijah translated = the Enoch pattern (Gen 5:24 / Heb 11:5): the prophet who does NOT see death, the ascension TYPE that
--        the Formed Son fulfils bodily in Acts 1:9-11 (a cloud received him; so come in like manner). Read forward, not as a closed legend.
--   v.9 double portion = the FIRSTBORN'S inheritance (Deut 21:17), the Spirit passed to the successor — Num 11:17,25 the same motion,
--        the spirit upon one put upon the many, the greater works to follow. NOT a magic transfer; the appointed succession of the prophetic word.
--   v.23-24 the Beth-el mockers: framed as judgment on CONTEMPT FOR YAHUAH'S WORD at the heart of the calf-cult center (Beth-el), the
--        reverence due the prophet of Yahuah — bound to Mal 4:5 / Matt 17:11, the Elijah who is honoured and the Elijah yet to come. NOT random cruelty.

CREATE TEMP VIEW _s343_2ki02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Elijah taken up — the prophet who escaped death
    ('canon','2-kings',2,1,'canon','genesis',5,24,'free',
      E'*And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). When *Yahuah (LORD) would take up Elijah into heaven by a whirlwind* (2 Kings 2:1), it is the Enoch pattern repeated — the man of Yahuah who does not see death but is taken by Elohim directly. Two witnesses across the whole canon to the same escape from the grave.'),
    ('canon','2-kings',2,11,'canon','genesis',5,24,'free',
      E'*And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). As *Elijah went up by a whirlwind into heaven* (2 Kings 2:11), he joins Enoch — the second man translated alive, not tasting death. The seed-line keeps a standing testimony that death is not the last word.'),
    ('canon','2-kings',2,11,'canon','hebrews',11,5,'free',
      E'*By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). The roll of faith names Enoch''s translation as the type; *Elijah went up by a whirlwind into heaven* (2 Kings 2:11) is its second witness — the prophet who pleased Yahuah and *should not see death*.'),
    ('canon','2-kings',2,11,'canon','acts',1,9,'free',
      E'*And when he had spoken these things, while they beheld, he was taken up; and a cloud received him out of their sight* (Acts 1:9). What the chariot of fire and the whirlwind foreshadow in *Elijah went up by a whirlwind into heaven* (2 Kings 2:11), the Formed Son fulfils — taken up bodily before watching eyes, a cloud receiving him. Elisha *saw it*; the apostles *beheld*; the eyewitness condition holds in both.'),
    ('canon','2-kings',2,11,'canon','acts',1,11,'free',
      E'*Which also said, Ye men of Galilee, why stand ye gazing up into heaven? this same Yahusha (Jesus), which is taken up from you into heaven, shall so come in like manner as ye have seen him go into heaven* (Acts 1:11). The ascension that *Elijah went up by a whirlwind into heaven* (2 Kings 2:11) prefigures carries its own promise of return — *so come in like manner* — even as Elijah is promised again (Malachi 4:5).'),
    ('canon','2-kings',2,11,'apocrypha','ecclesiasticus',48,9,'extras',
      E'*Who was taken up in a whirlwind of fire, and in a chariot of fiery horses* (Ecclesiasticus 48:9). The second-temple witness reads 2 Kings 2 exactly as the text gives it — *there appeared a chariot of fire, and horses of fire... and Elijah went up by a whirlwind into heaven* (2 Kings 2:11) — preserving the memory of the prophet translated, not buried.'),
    -- THREAD 2: the double portion — the Spirit on the successor
    ('canon','2-kings',2,9,'canon','deuteronomy',21,17,'free',
      E'*But he shall acknowledge the son of the hated for the firstborn, by giving him a double portion of all that he hath: for he is the beginning of his strength; the right of the firstborn is his* (Deuteronomy 21:17). Elisha''s plea *let a double portion of thy spirit be upon me* (2 Kings 2:9) is the firstborn''s claim — he asks to be heir of Elijah''s prophetic strength, the succession-share the Torah names.'),
    ('canon','2-kings',2,9,'canon','numbers',11,17,'free',
      E'*And I will come down and talk with thee there: and I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden of the people with thee, that thou bear it not thyself alone* (Numbers 11:17). The same motion answers *let a double portion of thy spirit be upon me* (2 Kings 2:9) — Yahuah takes of the spirit upon one servant and puts it upon the successor, so the prophetic burden is carried on.'),
    ('canon','2-kings',2,9,'canon','numbers',11,25,'free',
      E'*And Yahuah (LORD) came down in a cloud, and spake unto him, and took of the spirit that was upon him, and gave it unto the seventy elders: and it came to pass, that, when the spirit rested upon them, they prophesied, and did not cease* (Numbers 11:25). As the spirit *rested upon* the seventy, so the sons of the prophets confess *the spirit of Elijah doth rest on Elisha* (2 Kings 2:15) — the granted answer to *let a double portion of thy spirit be upon me* (2 Kings 2:9).'),
    ('canon','2-kings',2,15,'canon','numbers',11,25,'free',
      E'*And Yahuah (LORD) came down in a cloud... and took of the spirit that was upon him, and gave it unto the seventy elders... when the spirit rested upon them, they prophesied* (Numbers 11:25). The resting of the spirit on the successors in Moses'' day is the pattern for *The spirit of Elijah doth rest on Elisha* (2 Kings 2:15) — the prophetic Ruach confirmed visibly on the one who follows.'),
    ('canon','2-kings',2,15,'apocrypha','ecclesiasticus',48,12,'extras',
      E'*Elias it was, who was covered with a whirlwind: and Eliseus was filled with his spirit* (Ecclesiasticus 48:12). The same testimony the sons of the prophets give — *The spirit of Elijah doth rest on Elisha* (2 Kings 2:15) — the succession of the prophetic Spirit named in the second-temple memory.'),
    -- THREAD 3: the mantle and the parted Jordan
    ('canon','2-kings',2,14,'canon','joshua',3,16,'free',
      E'*That the waters which came down from above stood and rose up upon an heap very far from the city Adam, that is beside Zaretan: and those that came down toward the sea of the plain, even the salt sea, failed, and were cut off: and the people passed over right against Jericho* (Joshua 3:16). When Elisha *smote the waters... and they parted hither and thither* (2 Kings 2:14), it is the same Jordan and the same delivering power that Yahuah showed Joshua — the waters cut off so His people pass.'),
    ('canon','2-kings',2,14,'canon','joshua',3,17,'free',
      E'*And the priests that bare the ark of the covenant of Yahuah (LORD) stood firm on dry ground in the midst of Jordan... and all the Israelites passed over on dry ground* (Joshua 3:17). The cry *Where is Yahuah Elohim (the LORD God) of Elijah?* (2 Kings 2:14) is answered as the waters part — the God who dried Jordan for Joshua is present on the successor, the same Spirit, the same deliverance.'),
    -- THREAD 4: reverence for the prophet — the Beth-el mockers judged
    ('canon','2-kings',2,23,'canon','malachi',4,5,'free',
      E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). The youths of the calf-cult center cry *Go up, thou bald head* (2 Kings 2:23), mocking the prophet of Yahuah whose master had just gone up — contempt at Beth-el for the very office Yahuah promises to send again at the end.'),
    ('canon','2-kings',2,23,'canon','matthew',17,11,'free',
      E'*And Yahusha (Jesus) answered and said unto them, Elias truly shall first come, and restore all things* (Matthew 17:11). The Elijah whom the Beth-el youths despised — *Go up, thou bald head* (2 Kings 2:23) — is the one the Messiah names as the restorer who comes first; the contempt for the prophet is contempt for the appointed word.'),
    ('canon','2-kings',2,24,'canon','malachi',4,5,'free',
      E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). When Elisha *cursed them in the name of Yahuah (LORD)* and *there came forth two she bears* (2 Kings 2:24), the judgment falls on contempt for Yahuah''s prophet at Beth-el — the reverence due the office Yahuah Himself honours and will send again.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-2-elijah-taken-up-the-prophet-who-escaped-death',
       E'Elijah Taken Up — the Prophet Who Escaped Death',
       E'*And it came to pass, as they still went on, and talked, that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven* (2 Kings 2:11). Elijah is the second man in the canon to be taken without dying. The first is Enoch: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24), which the roll of faith reads as *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). The second-temple memory keeps the picture exactly: *Who was taken up in a whirlwind of fire, and in a chariot of fiery horses* (Ecclesiasticus 48:9). And the pattern of the prophet caught up to heaven is fulfilled bodily in the Formed Son: *And when he had spoken these things, while they beheld, he was taken up; and a cloud received him out of their sight* (Acts 1:9) — with the promise the whirlwind never gave Elijah''s watchers, *this same Yahusha (Jesus), which is taken up from you into heaven, shall so come in like manner as ye have seen him go into heaven* (Acts 1:11). Elisha *saw it*; the apostles *beheld*; the eyewitness stands at every ascension.',
       sv.verse_id, ev.verse_id, 'extras', 38525
  FROM _s343_2ki02_lookup sv, _s343_2ki02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-2-the-double-portion-the-spirit-on-the-successor',
       E'The Double Portion — the Spirit on the Successor',
       E'*And Elisha said, I pray thee, let a double portion of thy spirit be upon me* (2 Kings 2:9). This is the firstborn''s claim. The Torah names the share: *he shall acknowledge the son of the hated for the firstborn, by giving him a double portion of all that he hath: for he is the beginning of his strength; the right of the firstborn is his* (Deuteronomy 21:17). Elisha asks to be heir of Elijah''s prophetic strength. The succession he asks for has a clear pattern: Yahuah told Moses, *I will take of the spirit which is upon thee, and will put it upon them; and they shall bear the burden of the people with thee* (Numbers 11:17), and so it was — *Yahuah (LORD) came down in a cloud... and took of the spirit that was upon him, and gave it unto the seventy elders: and it came to pass, that, when the spirit rested upon them, they prophesied* (Numbers 11:25). The same resting answers Elisha''s plea: the sons of the prophets see and confess *The spirit of Elijah doth rest on Elisha* (2 Kings 2:15), and the second-temple witness records it, *Eliseus was filled with his spirit* (Ecclesiasticus 48:12). The prophetic Ruach is passed on — the greater works to follow.',
       sv.verse_id, ev.verse_id, 'extras', 38528
  FROM _s343_2ki02_lookup sv, _s343_2ki02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=2 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-2-the-mantle-and-the-parted-jordan',
       E'The Mantle and the Parted Jordan',
       E'*And he took the mantle of Elijah that fell from him, and smote the waters, and said, Where is Yahuah Elohim (the LORD God) of Elijah? and when he also had smitten the waters, they parted hither and thither: and Elisha went over* (2 Kings 2:14). The question is answered by the parting itself. This is the same Jordan, and the same delivering power, that Yahuah showed when Israel first entered the land: *the waters which came down from above stood and rose up upon an heap very far from the city Adam... and those that came down toward the sea of the plain... failed, and were cut off: and the people passed over right against Jericho* (Joshua 3:16), so that *the priests that bare the ark of the covenant of Yahuah (LORD) stood firm on dry ground in the midst of Jordan, and all the Israelites passed over on dry ground* (Joshua 3:17). The God of Joshua is the God of Elijah, and now confirmed on Elisha — the mantle that fell is the office continued, the Spirit confirmed on the one who follows.',
       sv.verse_id, ev.verse_id, 'free', 38531
  FROM _s343_2ki02_lookup sv, _s343_2ki02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-2-reverence-for-the-prophet-the-bethel-mockers-judged',
       E'Reverence for the Prophet — the Beth-el Mockers Judged',
       E'*And he went up from thence unto Beth-el: and as he was going up by the way, there came forth little children out of the city, and mocked him, and said unto him, Go up, thou bald head; go up, thou bald head* (2 Kings 2:23). The mockery comes at Beth-el — the calf-cult center, the heart of the northern apostasy — and it jeers at the very ascension Elisha had just witnessed: *go up*, as Elijah went up. *And he turned back, and looked on them, and cursed them in the name of Yahuah (LORD). And there came forth two she bears out of the wood, and tare forty and two children of them* (2 Kings 2:24). The judgment is not on childhood but on contempt for Yahuah''s prophet at the seat of the calf-worship. For the office they despised is the one Yahuah Himself honours and promises again: *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5) — which the Messiah confirms, *Elias truly shall first come, and restore all things* (Matthew 17:11). To scorn the prophet of Yahuah is to scorn the word he carries.',
       sv.verse_id, ev.verse_id, 'free', 38534
  FROM _s343_2ki02_lookup sv, _s343_2ki02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=2 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. thread_members ============================
-- THREAD 1: elijah-taken-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24) — the first man translated, the pattern Elijah''s whirlwind repeats.'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=1
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-elijah-taken-up-the-prophet-who-escaped-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And Enoch... was not; for Elohim (God) took him* (Genesis 5:24) — as *Elijah went up by a whirlwind into heaven* (2 Kings 2:11), the second man taken without death.'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-elijah-taken-up-the-prophet-who-escaped-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*By faith Enoch was translated that he should not see death* (Hebrews 11:5) — the roll of faith names the type Elijah''s ascent (2 Kings 2:11) repeats.'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-elijah-taken-up-the-prophet-who-escaped-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he was taken up; and a cloud received him out of their sight* (Acts 1:9) — the Formed Son fulfils the ascension Elijah''s whirlwind (2 Kings 2:11) foreshadows.'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-elijah-taken-up-the-prophet-who-escaped-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*this same Yahusha (Jesus)... shall so come in like manner as ye have seen him go* (Acts 1:11) — the return-promise the whirlwind (2 Kings 2:11) only typified, with Elijah himself promised again (Malachi 4:5).'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-elijah-taken-up-the-prophet-who-escaped-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Who was taken up in a whirlwind of fire, and in a chariot of fiery horses* (Ecclesiasticus 48:9) — the second-temple memory of 2 Kings 2:11, the prophet translated not buried.'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-elijah-taken-up-the-prophet-who-escaped-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: the double portion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*giving him a double portion... the right of the firstborn is his* (Deuteronomy 21:17) — Elisha''s plea (2 Kings 2:9) is the firstborn''s claim to the prophet''s strength.'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=21 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-the-double-portion-the-spirit-on-the-successor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will take of the spirit which is upon thee, and will put it upon them* (Numbers 11:17) — the same motion Elisha asks for in *let a double portion of thy spirit be upon me* (2 Kings 2:9).'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-the-double-portion-the-spirit-on-the-successor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*when the spirit rested upon them, they prophesied* (Numbers 11:25) — the resting that answers Elisha''s request (2 Kings 2:9), the prophetic Ruach put on the successors.'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-the-double-portion-the-spirit-on-the-successor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*when the spirit rested upon them, they prophesied* (Numbers 11:25) — the pattern for *The spirit of Elijah doth rest on Elisha* (2 Kings 2:15), the Spirit confirmed on the one who follows.'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-the-double-portion-the-spirit-on-the-successor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Eliseus was filled with his spirit* (Ecclesiasticus 48:12) — the second-temple witness to *The spirit of Elijah doth rest on Elisha* (2 Kings 2:15).'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-the-double-portion-the-spirit-on-the-successor'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: the mantle and the parted Jordan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the waters... were cut off: and the people passed over right against Jericho* (Joshua 3:16) — the same Jordan, the same power, when Elisha *smote the waters... and they parted* (2 Kings 2:14).'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-the-mantle-and-the-parted-jordan'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*all the Israelites passed over on dry ground* (Joshua 3:17) — the God of Joshua answers *Where is Yahuah Elohim of Elijah?* (2 Kings 2:14), present now on the successor.'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=14
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-the-mantle-and-the-parted-jordan'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: the Beth-el mockers judged
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Behold, I will send you Elijah the prophet* (Malachi 4:5) — the youths'' jeer *Go up, thou bald head* (2 Kings 2:23) scorns the very office Yahuah promises to send again.'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-reverence-for-the-prophet-the-bethel-mockers-judged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Elias truly shall first come, and restore all things* (Matthew 17:11) — the Messiah honours the Elijah office the Beth-el youths despised (2 Kings 2:23).'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=23
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=17 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-reverence-for-the-prophet-the-bethel-mockers-judged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Behold, I will send you Elijah the prophet* (Malachi 4:5) — when Elisha *cursed them in the name of Yahuah* and *two she bears* came (2 Kings 2:24), the judgment falls on contempt for the prophet of Yahuah at the calf-cult center.'
  FROM cross_reference_threads t
  JOIN _s343_2ki02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=2 AND sv.verse_number=24
  JOIN _s343_2ki02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-2-reverence-for-the-prophet-the-bethel-mockers-judged'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_3.sql (2 Kings 3) -----
-- 2 Kings 3 — Jehoram of Yashar'el, Jehoshaphat of Yahudah, and the king of Edom march against
-- Moab, which rebelled after Ahab's death; they fetch a seven-days' compass through the wilderness
-- of Edom and run out of water; Jehoshaphat asks for a prophet of Yahuah, and a servant names
-- ELISHA *which poured water on the hands of Elijah* (3:11) — the servant-successor; Elisha, for
-- Jehoshaphat's sake, calls for a minstrel, and *when the minstrel played, that the hand of Yahuah
-- came upon him* (3:15); he prophesies the valley filled with water WITHOUT wind or rain (3:16-17),
-- and victory over Moab; in the morning the water comes by the way of Edom, the Moabites see it red
-- as blood in the sun and rush to plunder, and are routed; the king of Moab, the battle too sore,
-- offers his eldest son for a burnt offering upon the wall (3:26-27) — the horror of Molech-worship
-- set against Yahuah's deliverance.
-- TAG: 2ki03   VIEW: _s343_2ki03_lookup   SORT BAND: 38550, step 3 (38550,38553,38556,38559)
-- SOURCE rows all 'canon','2-kings',3,v.
--
-- 2 Kings 3 coverage:
--   v.11 (*Here is Elisha the son of Shaphat, which poured water on the hands of Elijah*) —
--          the servant-successor; he who ministered to Elijah now stands as the prophet of Yahuah.
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Kings 2:9 (*let a double portion of thy spirit be upon me*); 2 Kings 2:15
--                  (*The spirit of Elijah doth rest on Elisha*); 1 Kings 19:21 (the call —
--                  *ministered unto him*) [thread 1]
--   v.15 (*when the minstrel played, that the hand of Yahuah came upon him*) — the prophetic word
--          stirred by worship/music.
--          NT:     none warranted (the worship-prophecy weave carried Tanakh-internal)
--          Extras: none warranted
--          Tanakh: 1 Samuel 16:23 (David's harp drives the evil spirit away); 1 Samuel 16:16 (the
--                  cunning player); Psalm 40:3 (*he hath put a new song in my mouth*); 1 Chronicles
--                  25:1 (the singers who *should prophesy with harps*) [thread 2]
--   v.16-17,20 (*Ye shall not see wind, neither shall ye see rain; yet that valley shall be filled
--          with water*; in the morning *there came water by the way of Edom*) — water in the
--          wilderness, Yahuah's provision without wind or rain.
--          NT:     John 7:38 (*out of his belly shall flow rivers of living water*) [thread 3]
--          Extras: none warranted
--          Tanakh: Isaiah 41:18 (*I will make the wilderness a pool of water*); Isaiah 41:17 (*When
--                  the poor and needy seek water... I Yahuah will hear them*); Numbers 21:16-17 (the
--                  well Yahuah gave in the wilderness — *Spring up, O well*); Psalm 78:15-16
--                  (water from the rock) — Num/Isa pulled [thread 3]
--   v.26-27 (the king of Moab offers his eldest son for a burnt offering upon the wall) — the
--          Molech-horror of the nations contrasted with Yahuah's deliverance.
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Numbers 21:29 (*Woe to thee, Moab!... O people of Chemosh: he hath given his sons
--                  that escaped... into captivity*); Leviticus 18:21 (*thou shalt not let any of thy
--                  seed pass through the fire to Molech*); Deuteronomy 12:31 (*their sons and their
--                  daughters they have burnt in the fire to their gods*) [thread 4]
--   v.1-3 (Jehoram's reign; he put away the image of Baal but cleaved to the sins of Jeroboam) —
--          narrative/regnal setup; the calf-sin of Jeroboam carried by the Kings weave; no separate
--          target pulled this pass.
--   v.4-10 (Moab's rebellion; the three kings; the seven-days' compass; no water for the host) —
--          narrative setup; the want of water framed in thread 3; no separate target pulled.
--   v.7 (*I am as thou art, my people as thy people*) — Jehoshaphat's alliance, the same words as
--          1 Kings 22:4; framed in prose, not separately threaded this pass.
--   v.18-19,21-25 (the rout of Moab; the cities beaten down) — the victory promised in thread 3;
--          no separate target pulled.

CREATE TEMP VIEW _s343_2ki03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Elisha the servant-successor, who poured water on the hands of Elijah (3:11)
    ('canon','2-kings',3,11,'canon','2-kings',2,9,'free',E'*And it came to pass, when they were gone over, that Elijah said unto Elisha, Ask what I shall do for thee, before I be taken away from thee. And Elisha said, I pray thee, let a double portion of thy spirit be upon me* (2 Kings 2:9). The servant who *poured water on the hands of Elijah* (2 Kings 3:11) had asked for and received the double portion of his master''s spirit. The man known as Elijah''s attendant now stands as the prophet of Yahuah whose word the kings come down to seek — the ministry of pouring water on his master''s hands led straight to the mantle.'),
    ('canon','2-kings',3,11,'canon','2-kings',2,15,'free',E'*And when the sons of the prophets which were to view at Jericho saw him, they said, The spirit of Elijah doth rest on Elisha. And they came to meet him, and bowed themselves to the ground before him* (2 Kings 2:15). The servant identified by his service — *which poured water on the hands of Elijah* (2 Kings 3:11) — is the one upon whom *the spirit of Elijah doth rest*. The successor is confirmed not by his own claim but by the spirit that visibly rests on him; the prophet of Yahuah Jehoshaphat asks for is the man the sons of the prophets already bowed to.'),
    ('canon','2-kings',3,11,'canon','1-kings',19,21,'free',E'*And he returned back from him, and took a yoke of oxen, and slew them, and boiled their flesh with the instruments of the oxen, and gave unto the people, and they did eat. Then he arose, and went after Elijah, and ministered unto him* (1 Kings 19:21). From the day of his call Elisha *ministered unto* Elijah — and that is exactly how the king''s servant names him: *Elisha the son of Shaphat, which poured water on the hands of Elijah* (2 Kings 3:11). The lowly service of attending the prophet is the school of the prophet; the one who ministered is the one Yahuah raised up to speak.'),

    -- THREAD 2: the minstrel played and the hand of Yahuah came — the word stirred by worship (3:15)
    ('canon','2-kings',3,15,'canon','1-samuel',16,23,'free',E'*And it came to pass, when the evil spirit from Elohim (God) was upon Saul, that David took an harp, and played with his hand: so Saul was refreshed, and was well, and the evil spirit departed from him* (1 Samuel 16:23). As David''s harp made room for the spirit''s peace where the evil spirit had ruled, so for Elisha *when the minstrel played, that the hand of Yahuah (LORD) came upon him* (2 Kings 3:15). Worship and music are the appointed setting where the heavy hand of Yahuah falls and the true word comes — the played string opens the prophet to the Spirit.'),
    ('canon','2-kings',3,15,'canon','1-samuel',16,16,'free',E'*Let our lord now command thy servants, which are before thee, to seek out a man, who is a cunning player on an harp: and it shall come to pass, when the evil spirit from Elohim (God) is upon thee, that he shall play with his hand, and thou shalt be well* (1 Samuel 16:16). The cunning player sought for Saul is the same pattern Elisha calls upon: *bring me a minstrel. And it came to pass, when the minstrel played, that the hand of Yahuah (LORD) came upon him* (2 Kings 3:15). The Spirit moves where the instrument is played in faith; the music is not entertainment but the door the prophetic word comes through.'),
    ('canon','2-kings',3,15,'canon','psalms',40,3,'free',E'*And he hath put a new song in my mouth, even praise unto our Elohim (God): many shall see it, and fear, and shall trust in Yahuah (LORD)* (Psalm 40:3). The new song Yahuah puts in the mouth and the minstrel''s playing that brings the hand of Yahuah upon Elisha — *when the minstrel played, that the hand of Yahuah (LORD) came upon him* (2 Kings 3:15) — are one current: praise is the channel of His word and His power. Where Yahuah is praised in song, the word that follows turns *many* to *trust in Yahuah*.'),
    ('canon','2-kings',3,15,'canon','1-chronicles',25,1,'free',E'*Moreover David and the captains of the host separated to the service of the sons of Asaph, and of Heman, and of Jeduthun, who should prophesy with harps, with psalteries, and with cymbals* (1 Chronicles 25:1). David set apart singers *who should prophesy with harps* — the very joining Elisha enacts when *the minstrel played, that the hand of Yahuah (LORD) came upon him* (2 Kings 3:15). Prophecy and worship-music are bound together in Yahuah''s order; the played harp is the appointed vessel through which the word of Yahuah is loosed.'),

    -- THREAD 3: water in the wilderness without wind or rain — Yahuah's provision (3:16-17,20)
    ('canon','2-kings',3,17,'canon','isaiah',41,18,'free',E'*I will open rivers in high places, and fountains in the midst of the valleys: I will make the wilderness a pool of water, and the dry land springs of water* (Isaiah 41:18). Yahuah''s word through Elisha is this very promise enacted: *Ye shall not see wind, neither shall ye see rain; yet that valley shall be filled with water* (2 Kings 3:17). He makes the wilderness a pool of water with no storm to bring it — the parched valley of Edom filled by His word alone, the dry land turned to springs as Isaiah foretells.'),
    ('canon','2-kings',3,17,'canon','isaiah',41,17,'free',E'*When the poor and needy seek water, and there is none, and their tongue faileth for thirst, I Yahuah (LORD) will hear them, I the Elohim (God) of Yashar''el (Israel) will not forsake them* (Isaiah 41:17). The host fainting in the wilderness — *there was no water for the host, and for the cattle* (2 Kings 3:9) — are the poor and needy seeking water; and Yahuah hears, *that valley shall be filled with water, that ye may drink, both ye, and your cattle, and your beasts* (2 Kings 3:17). The Elohim of Yashar''el does not forsake His thirsting people in the desert; He fills the valley.'),
    ('canon','2-kings',3,17,'canon','numbers',21,17,'free',E'*Then Yashar''el (Israel) sang this song, Spring up, O well; sing ye unto it* (Numbers 21:17). At Beer, *the well whereof Yahuah (LORD) spake unto Moses, Gather the people together, and I will give them water* (Numbers 21:16), Yashar''el sang over the water Yahuah gave in the wilderness — the same provision Elisha now declares, *that valley shall be filled with water, that ye may drink* (2 Kings 3:17). From Moses to Elisha it is the one Yahuah who gives water to His people in the desert without rain.'),
    ('canon','2-kings',3,16,'canon','john',7,38,'free',E'*He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water* (John 7:38). The valley filled with water where there was no wind nor rain — *Make this valley full of ditches* (2 Kings 3:16) — is a figure of the living water the Formed Son pours out: water given not by the storm of nature but by the word of Yahuah, springing up to those who thirst. The dry valley that Yahuah fills foreshadows the rivers of living water He gives those who believe.'),

    -- THREAD 4: the king of Moab's son on the wall — the Molech-horror of the nations (3:26-27)
    ('canon','2-kings',3,27,'canon','numbers',21,29,'free',E'*Woe to thee, Moab! thou art undone, O people of Chemosh: he hath given his sons that escaped, and his daughters, into captivity unto Sihon king of the Amorites* (Numbers 21:29). Moab is the people of Chemosh, and in his desperation the king does the unspeakable: *he took his eldest son that should have reigned in his stead, and offered him for a burnt offering upon the wall* (2 Kings 3:27). The god who could not save Moab''s sons from Sihon receives a son burnt on the wall — the bankruptcy of Chemosh laid bare against the Yahuah who fills valleys with water and routs armies.'),
    ('canon','2-kings',3,27,'canon','leviticus',18,21,'free',E'*And thou shalt not let any of thy seed pass through the fire to Molech, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 18:21). The Torah names the abomination Moab''s king now commits — *he took his eldest son... and offered him for a burnt offering upon the wall* (2 Kings 3:27). This is the very horror Yahuah forbids His people: the child passed through the fire to a false god. The deliverance Yahuah works for the three kings stands over against the demonic worship of the nations He commanded Yashar''el never to touch.'),
    ('canon','2-kings',3,27,'canon','deuteronomy',12,31,'free',E'*Thou shalt not do so unto Yahuah Elohayka (the LORD thy God): for every abomination to Yahuah (LORD), which he hateth, have they done unto their gods; for even their sons and their daughters they have burnt in the fire to their gods* (Deuteronomy 12:31). The king of Moab does precisely what Torah names as the abomination of the nations — he *offered* his son *for a burnt offering upon the wall* (2 Kings 3:27), a son burnt in the fire to his god. Yahuah hates this worship; it is the antithesis of His own way, and the desperate sacrifice of Chemosh''s people only deepens the contrast with the living Elohim who gives water and victory.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREADS

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-3-elisha-the-servant-successor-who-poured-water-on-the-hands-of-elijah',
       E'Elisha the servant-successor, who poured water on the hands of Elijah',
       E'When Jehoshaphat asks, *Is there not here a prophet of Yahuah (LORD), that we may enquire of Yahuah (LORD) by him?* (2 Kings 3:11), a servant answers by naming Elisha through his service: *Here is Elisha the son of Shaphat, which poured water on the hands of Elijah* (3:11). The successor is identified not by office or claim but by his ministry — the lowly attending of his master. From the day of his call he *ministered unto* Elijah: *he arose, and went after Elijah, and ministered unto him* (1 Kings 19:21). That service was the school of the prophet. He had asked the double portion at Jordan — *let a double portion of thy spirit be upon me* (2 Kings 2:9) — and received it, so that the sons of the prophets declared, *The spirit of Elijah doth rest on Elisha* (2 Kings 2:15), and bowed before him. Now the kings of Yashar''el, Yahudah, and Edom come down to seek the word of Yahuah from the man who poured water on his master''s hands. The pattern stands across the whole library: the one who serves is the one Yahuah raises up to speak. Jehoshaphat confirms it at once — *The word of Yahuah (LORD) is with him* (3:12).',
       sv.verse_id, ev.verse_id, 'free', 38550
  FROM _s343_2ki03_lookup sv, _s343_2ki03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-3-when-the-minstrel-played-the-hand-of-yahuah-came-upon-him',
       E'When the minstrel played, the hand of Yahuah came upon him',
       E'Elisha will speak only for Jehoshaphat''s sake — *were it not that I regard the presence of Jehoshaphat the king of Yahudah (Judah)... I would not look toward thee* (2 Kings 3:14) — and then he calls for worship: *But now bring me a minstrel. And it came to pass, when the minstrel played, that the hand of Yahuah (LORD) came upon him* (3:15). The prophetic word is stirred by music offered to Yahuah; worship is the appointed door through which His hand falls and His word comes. The pattern runs through the canon. When the evil spirit troubled Saul, the cunning player was sought — *when the evil spirit from Elohim (God) is upon thee, that he shall play with his hand, and thou shalt be well* (1 Samuel 16:16) — and David''s harp made room for peace: *David took an harp, and played with his hand: so Saul was refreshed... and the evil spirit departed from him* (1 Samuel 16:23). David himself testifies that Yahuah *hath put a new song in my mouth, even praise unto our Elohim (God): many shall see it, and fear, and shall trust in Yahuah (LORD)* (Psalm 40:3) — praise is the channel of His word and His power. And David set apart the temple singers *who should prophesy with harps, with psalteries, and with cymbals* (1 Chronicles 25:1), binding prophecy and worship-music together in Yahuah''s own order. The played string is no mere comfort; it is the vessel through which the hand of Yahuah comes upon His prophet.',
       sv.verse_id, ev.verse_id, 'free', 38553
  FROM _s343_2ki03_lookup sv, _s343_2ki03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-3-water-in-the-wilderness-without-wind-or-rain',
       E'Water in the wilderness without wind or rain',
       E'The host of three kings faints in the desert — *there was no water for the host, and for the cattle that followed them* (2 Kings 3:9) — and the word of Yahuah through Elisha gives water with no storm to bring it: *Make this valley full of ditches* (3:16); *Ye shall not see wind, neither shall ye see rain; yet that valley shall be filled with water, that ye may drink, both ye, and your cattle, and your beasts* (3:17). In the morning *there came water by the way of Edom, and the country was filled with water* (3:20). This is Yahuah''s own promise enacted: *When the poor and needy seek water, and there is none, and their tongue faileth for thirst, I Yahuah (LORD) will hear them, I the Elohim (God) of Yashar''el (Israel) will not forsake them* (Isaiah 41:17); *I will make the wilderness a pool of water, and the dry land springs of water* (Isaiah 41:18). It is the same provision Yashar''el knew from Moses, when at the well Yahuah said, *Gather the people together, and I will give them water* (Numbers 21:16), and they sang, *Spring up, O well; sing ye unto it* (Numbers 21:17). From wilderness to wilderness it is one Elohim who gives water to His thirsting people without rain. And the filled valley is a figure forward of the living water the Formed Son pours out — *out of his belly shall flow rivers of living water* (John 7:38) — water given not by the storm of nature but by the word of Yahuah, springing up to all who thirst.',
       sv.verse_id, ev.verse_id, 'free', 38556
  FROM _s343_2ki03_lookup sv, _s343_2ki03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-3-the-king-of-moab-burns-his-son-the-horror-of-chemosh-against-yahuahs-deliverance',
       E'The king of Moab burns his son — the horror of Chemosh against Yahuah''s deliverance',
       E'When the battle is too sore and his sword-band cannot break through, the king of Moab turns to the abomination of his god: *Then he took his eldest son that should have reigned in his stead, and offered him for a burnt offering upon the wall* (2 Kings 3:27). Moab is *the people of Chemosh* (Numbers 21:29) — the god who could not even save Moab''s own sons and daughters from captivity to Sihon now receives a son burnt on the wall. This is precisely the worship Torah forbids Yashar''el on pain of profaning the Name: *thou shalt not let any of thy seed pass through the fire to Molech, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 18:21); it is the abomination of the nations Yahuah hates — *for even their sons and their daughters they have burnt in the fire to their gods* (Deuteronomy 12:31). The whole chapter sets the two ways side by side: the living Elohim who fills a dry valley with water and routs an army by His word, and the dead god of Moab who demands a child in the fire and saves no one. The desperate sacrifice of Chemosh''s people only deepens the contrast — Yahuah delivers; the idol devours.',
       sv.verse_id, ev.verse_id, 'free', 38559
  FROM _s343_2ki03_lookup sv, _s343_2ki03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=3 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD MEMBERS

-- Thread 1: Elisha the servant-successor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*let a double portion of thy spirit be upon me* (2 Kings 2:9) — the servant who poured water on Elijah''s hands had asked and received the double portion.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-elisha-the-servant-successor-who-poured-water-on-the-hands-of-elijah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The spirit of Elijah doth rest on Elisha* (2 Kings 2:15) — the successor confirmed by the spirit that visibly rests on him; the sons of the prophets bow.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-elisha-the-servant-successor-who-poured-water-on-the-hands-of-elijah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he arose, and went after Elijah, and ministered unto him* (1 Kings 19:21) — from his call Elisha ministered; the service was the school of the prophet.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=11
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-elisha-the-servant-successor-who-poured-water-on-the-hands-of-elijah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: when the minstrel played, the hand of Yahuah came upon him
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*David took an harp, and played with his hand: so Saul was refreshed... and the evil spirit departed* (1 Samuel 16:23) — music opens the way for the Spirit, as it does for Elisha.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-when-the-minstrel-played-the-hand-of-yahuah-came-upon-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*a cunning player on an harp... he shall play with his hand, and thou shalt be well* (1 Samuel 16:16) — the same pattern Elisha calls upon: bring a minstrel.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=16 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-when-the-minstrel-played-the-hand-of-yahuah-came-upon-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he hath put a new song in my mouth, even praise unto our Elohim* (Psalm 40:3) — praise is the channel of Yahuah''s word and power.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=40 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-when-the-minstrel-played-the-hand-of-yahuah-came-upon-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*who should prophesy with harps, with psalteries, and with cymbals* (1 Chronicles 25:1) — David bound prophecy and worship-music together in Yahuah''s order.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=25 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-when-the-minstrel-played-the-hand-of-yahuah-came-upon-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: water in the wilderness without wind or rain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will make the wilderness a pool of water, and the dry land springs of water* (Isaiah 41:18) — Yahuah fills the parched valley with no storm to bring it.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-water-in-the-wilderness-without-wind-or-rain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*When the poor and needy seek water... I Yahuah will hear them* (Isaiah 41:17) — the Elohim of Yashar''el does not forsake His thirsting people in the desert.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-water-in-the-wilderness-without-wind-or-rain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Spring up, O well; sing ye unto it* (Numbers 21:17) — the water Yahuah gave at Beer in the wilderness; one Elohim from Moses to Elisha.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-water-in-the-wilderness-without-wind-or-rain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*out of his belly shall flow rivers of living water* (John 7:38) — the dry valley Yahuah fills foreshadows the living water the Formed Son pours out.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-water-in-the-wilderness-without-wind-or-rain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: the king of Moab burns his son — the horror of Chemosh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*O people of Chemosh: he hath given his sons that escaped... into captivity* (Numbers 21:29) — the god who could not save Moab''s sons now receives one burnt on the wall.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=27
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-the-king-of-moab-burns-his-son-the-horror-of-chemosh-against-yahuahs-deliverance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou shalt not let any of thy seed pass through the fire to Molech* (Leviticus 18:21) — the very abomination Torah forbids Yashar''el; Moab''s king commits it.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=27
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-the-king-of-moab-burns-his-son-the-horror-of-chemosh-against-yahuahs-deliverance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*their sons and their daughters they have burnt in the fire to their gods* (Deuteronomy 12:31) — the abomination Yahuah hates; the antithesis of His own deliverance.'
  FROM cross_reference_threads t
  JOIN _s343_2ki03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=3 AND sv.verse_number=27
  JOIN _s343_2ki03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-3-the-king-of-moab-burns-his-son-the-horror-of-chemosh-against-yahuahs-deliverance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_4.sql (2 Kings 4) -----
--
-- 2 Kings 4 — the Elisha miracle cluster: the widow's oil, the Shunammite's son
--   given and raised, death-in-the-pot healed, and the bread multiplied.
-- Tag: 2ki04   View: _s343_2ki04_lookup   Sort band: 38575, step 3 (38575..38596)
-- Source rows all 'canon','2-kings',4,v.  Slug prefix EXACTLY 2-kings-4-.
--
-- Frame: Elisha is the vivid type of the Formed Son who multiplies bread, feeds the
-- hungry, and raises the dead. Provision out of nothing (the oil, the loaves → John 6);
-- the son given in old age and raised (the resurrection pattern → Luke 7 / John 11 /
-- Heb 11:35); faith in grief — "It is well" before the boy yet breathes.
--
-- 2 Kings 4 coverage:
--   v.1-7 (widow's oil pays debt, frees her sons from bondage)
--        NT:     none warranted (provision motif → carried in the bread thread John 6)
--        Extras: none warranted
--        Tanakh: 1 Kings 17:12-16 the meal and oil that fail not  [THREAD oil]
--   v.8-17 (Shunammite given a son in her age)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Genesis 18:10,14 Sarah promised a son at the time of life  [THREAD son-given]
--   v.18-26 (the child dies; "It is well")
--        NT:     none warranted (faith carried in raising thread)
--        Extras: none warranted
--        Tanakh: own-chapter faith answered at v.36-37  [THREAD it-is-well]
--   v.27-37 (Elisha raises the child)
--        NT:     Luke 7:14-15 (widow of Nain's son); John 11:43-44 (Lazarus)  [THREAD raised]
--        Extras: none warranted
--        Tanakh: 1 Kings 17:21-23 (Elijah raises the widow's son); + Heb 11:35  [THREAD raised]
--   v.38-44 (death-in-the-pot healed; twenty loaves feed a hundred, left thereof)
--        NT:     Matt 14:19-20; Mark 6:41-43; John 6:11-13 (the feeding, fragments remain)  [THREAD bread]
--        Extras: none warranted
--        Tanakh: none warranted
--
-- Threads (5):
--   2-kings-4-the-pot-of-oil-that-failed-not-paid-the-debt   [Tanakh]   v.1-7
--   2-kings-4-a-son-given-at-the-time-of-life                [Tanakh]   v.8-17
--   2-kings-4-is-it-well-with-the-child-and-she-said-it-is-well [Tanakh-only, own ch] v.18-26
--   2-kings-4-the-child-sneezed-and-the-dead-was-raised      [Tanakh+NT] v.27-37
--   2-kings-4-they-shall-eat-and-shall-leave-thereof         [Tanakh+NT] v.38-44
--

CREATE TEMP VIEW _s343_2ki04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the pot of oil ---------------------------------------------------
    ('canon','2-kings',4,2,'canon','1-kings',17,12,'free',
     E'*And she said, As Yahuah Elohayka (the LORD thy God) liveth, I have not a cake, but an handful of meal in a barrel, and a little oil in a cruse: and, behold, I am gathering two sticks, that I may go in and dress it for me and my son, that we may eat it, and die.* (1 Kings 17:12). Elisha asks the widow *what hast thou in the house? ... save a pot of oil* (2 Kings 4:2) — the same little, the same widow at the end of her store, that Yahuah multiplies. The handful of meal and the cruse of oil from his master Elijah are the pattern.'),
    ('canon','2-kings',4,6,'canon','1-kings',17,14,'free',
     E'*For thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), The barrel of meal shall not waste, neither shall the cruse of oil fail, until the day that Yahuah (LORD) sendeth rain upon the earth.* (1 Kings 17:14). At Elisha''s word the borrowed vessels are filled and only then *the oil stayed* (2 Kings 4:6) — the abundance runs exactly as far as the need, the cruse that does not fail. Yahuah provides out of almost nothing.'),
    ('canon','2-kings',4,7,'canon','1-kings',17,16,'free',
     E'*And the barrel of meal wasted not, neither did the cruse of oil fail, according to the word of Yahuah (LORD), which he spake by Elijah.* (1 Kings 17:16). The oil that paid the widow''s debt and freed her two sons from the creditor''s bondage — *Go, sell the oil, and pay thy debt, and live thou and thy children of the rest* (2 Kings 4:7) — is the same word kept: provision out of the little to keep the household alive.'),
    -- THREAD 2: a son given at the time of life ---------------------------------
    ('canon','2-kings',4,16,'canon','genesis',18,10,'free',
     E'*And he said, I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son. And Sarah heard it in the tent door, which was behind him.* (Genesis 18:10). Elisha tells the Shunammite *About this season, according to the time of life, thou shalt embrace a son* (2 Kings 4:16) — the very phrase spoken to Abraham. The barren womb opened in old age is the seed-of-promise pattern, Sarah''s laughter answered.'),
    ('canon','2-kings',4,16,'canon','genesis',18,14,'free',
     E'*Is any thing too hard for Yahuah (LORD)? At the time appointed I will return unto thee, according to the time of life, and Sarah shall have a son.* (Genesis 18:14). The Shunammite, like Sarah, can scarcely believe it — *Nay, my lord, thou man of Elohim (God), do not lie unto thine handmaid* (2 Kings 4:16). Nothing is too hard for Yahuah; the son is given *at that season that Elisha had said* (4:17).'),
    -- THREAD 3: it is well (faith in grief) -- own-chapter, Tanakh-only ----------
    ('canon','2-kings',4,23,'canon','2-kings',4,26,'free',
     E'*Run now, I pray thee, to meet her, and say unto her, Is it well with thee? is it well with thy husband? is it well with the child? And she answered, It is well.* (2 Kings 4:26). Already, leaving home with the dead boy laid on the prophet''s bed, she says *It shall be well* (2 Kings 4:23) — neither new moon nor sabbath stays her. Her grief does not unmake her faith; she presses to the man of Elohim before she will own the death.'),
    ('canon','2-kings',4,26,'canon','2-kings',4,37,'free',
     E'*Then she went in, and fell at his feet, and bowed herself to the ground, and took up her son, and went out.* (2 Kings 4:37). Her *It is well* (2 Kings 4:26), spoken over a dead child, is vindicated when the boy is given back alive — the faith that would not let the prophet go (*As Yahuah (LORD) liveth, and as thy soul liveth, I will not leave thee*, 4:30) is answered in full.'),
    -- THREAD 4: the child raised ------------------------------------------------
    ('canon','2-kings',4,34,'canon','1-kings',17,21,'free',
     E'*And he stretched himself upon the child three times, and cried unto Yahuah (LORD), and said, O Yahuah (LORD) my Elohim (God), I pray thee, let this child''s soul come into him again.* (1 Kings 17:21). Elisha does as Elijah did — *he went up, and lay upon the child, and put his mouth upon his mouth, and his eyes upon his eyes, and his hands upon his hands ... and the flesh of the child waxed warm* (2 Kings 4:34). The prophet bends his own life over the dead to call life back.'),
    ('canon','2-kings',4,35,'canon','1-kings',17,22,'free',
     E'*And Yahuah (LORD) heard the voice of Elijah; and the soul of the child came into him again, and he revived.* (1 Kings 17:22). So with Elisha: *the child sneezed seven times, and the child opened his eyes* (2 Kings 4:35). Twice the widow''s and the Shunammite''s sons are raised — the dead given back by the word of Yahuah through his prophet, the firstfruits of the resurrection hope.'),
    ('canon','2-kings',4,35,'canon','luke',7,14,'free',
     E'*And he came and touched the bier: and they that bare him stood still. And he said, Young man, I say unto thee, Arise.* (Luke 7:14). At Nain the only son of a widow is carried out dead, and the Formed Son raises him with a word — *And he that was dead sat up, and began to speak. And he delivered him to his mother* (Luke 7:15). What Elisha laboured over and prayed, the Son does by his own authority: *the child sneezed seven times, and the child opened his eyes* (2 Kings 4:35).'),
    ('canon','2-kings',4,36,'canon','luke',7,15,'free',
     E'*And he that was dead sat up, and began to speak. And he delivered him to his mother.* (Luke 7:15). The crowd cries *That a great prophet is risen up among us; and, That Elohim (God) hath visited his people* (Luke 7:16) — they name the Elisha pattern. Here too the raised son is returned to the mother: *Call this Shunammite ... Take up thy son* (2 Kings 4:36).'),
    ('canon','2-kings',4,35,'canon','john',11,43,'free',
     E'*And when he thus had spoken, he cried with a loud voice, Lazarus, come forth.* (John 11:43). Lazarus, four days in the grave, comes out bound — *And he that was dead came forth ... Yahusha (Jesus) saith unto them, Loose him, and let him go* (John 11:44). The prophet''s sign — the dead child opening his eyes (2 Kings 4:35) — is filled by the One who is himself *the resurrection, and the life* (John 11:25).'),
    ('canon','2-kings',4,37,'canon','john',11,44,'free',
     E'*And he that was dead came forth, bound hand and foot with graveclothes: and his face was bound about with a napkin. Yahusha (Jesus) saith unto them, Loose him, and let him go.* (John 11:44). As the Shunammite *took up her son, and went out* (2 Kings 4:37), so Lazarus is given back to his sisters — the raising of the dead a thread that runs from Elijah to Elisha to the Formed Son, the pledge of the better resurrection.'),
    ('canon','2-kings',4,35,'canon','hebrews',11,35,'free',
     E'*Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* (Hebrews 11:35). The roll of faith names exactly these mothers — the widow of Zarephath and the Shunammite — whose dead were given back. The child who *sneezed seven times, and ... opened his eyes* (2 Kings 4:35) is a sign pointing past itself to *a better resurrection*.'),
    -- THREAD 5: the bread multiplied, fragments remaining -----------------------
    ('canon','2-kings',4,43,'canon','matthew',14,20,'free',
     E'*And they did all eat, and were filled: and they took up of the fragments that remained twelve baskets full.* (Matthew 14:20). When the servitor asks *What, should I set this before an hundred men?*, Elisha answers *Give the people, that they may eat: for thus saith Yahuah (LORD), They shall eat, and shall leave thereof* (2 Kings 4:43). The Formed Son does the greater work — five loaves to five thousand, with twelve baskets over: the little blessed and broken feeds the multitude and is not spent.'),
    ('canon','2-kings',4,42,'canon','mark',6,41,'free',
     E'*And when he had taken the five loaves and the two fishes, he looked up to heaven, and blessed, and brake the loaves, and gave them to his disciples to set before them; and the two fishes divided he among them all.* (Mark 6:41). A man brings Elisha *bread of the firstfruits, twenty loaves of barley, and full ears of corn* (2 Kings 4:42), and the prophet bids it given to a hundred — the firstfruits-bread that multiplies points to the loaves blessed and broken in the desert place.'),
    ('canon','2-kings',4,44,'canon','mark',6,43,'free',
     E'*And they took up twelve baskets full of the fragments, and of the fishes.* (Mark 6:43). *So he set it before them, and they did eat, and left thereof, according to the word of Yahuah (LORD)* (2 Kings 4:44). The surplus is the signature of Yahuah''s provision — they eat and *leave thereof*; the fragments that remain prove the table is the Maker''s, not the meal''s.'),
    ('canon','2-kings',4,42,'canon','john',6,11,'free',
     E'*And Yahusha (Jesus) took the loaves; and when he had given thanks, he distributed to the disciples, and the disciples to them that were set down; and likewise of the fishes as much as they would.* (John 6:11). The barley loaves of Elisha (2 Kings 4:42) and the *five barley loaves* of the lad (John 6:9) are one bread: the Son who multiplies the loaves declares *I am the bread of life: he that cometh to me shall never hunger* (John 6:35) — the provision that satisfies and remains.'),
    ('canon','2-kings',4,43,'canon','john',6,12,'free',
     E'*When they were filled, he said unto his disciples, Gather up the fragments that remain, that nothing be lost.* (John 6:12). Elisha''s word, *They shall eat, and shall leave thereof* (2 Kings 4:43), is the same abundance — the people filled and the fragments gathered, *that nothing be lost*. The little entrusted to the Maker overflows the need.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-4-the-pot-of-oil-that-failed-not-paid-the-debt',
       E'The Pot of Oil That Failed Not — Provision Out of the Little',
       E'A widow of the sons of the prophets is about to lose her two sons to the creditor: *the creditor is come to take unto him my two sons to be bondmen* (2 Kings 4:1). Elisha asks what she has — *Thine handmaid hath not any thing in the house, save a pot of oil* (4:2). From that one cruse, poured into borrowed vessels behind a shut door, the oil runs until *there is not a vessel more. And the oil stayed* (4:6). It is the very pattern Elisha learned from Elijah at Zarephath: *The barrel of meal shall not waste, neither shall the cruse of oil fail* (1 Kings 17:14), kept exactly, *neither did the cruse of oil fail, according to the word of Yahuah (LORD)* (17:16). The little, entrusted to the Maker, is multiplied to meet the need and free the children from bondage: *Go, sell the oil, and pay thy debt, and live thou and thy children of the rest* (2 Kings 4:7).',
       sv.verse_id, ev.verse_id, 'free', 38575
  FROM _s343_2ki04_lookup sv, _s343_2ki04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-4-a-son-given-at-the-time-of-life',
       E'A Son Given at the Time of Life — Sarah''s Pattern',
       E'The great woman of Shunem builds the prophet a chamber and asks nothing for herself — *I dwell among mine own people* (2 Kings 4:13). But she has no child and her husband is old, and Elisha speaks the seed-of-promise word over her: *About this season, according to the time of life, thou shalt embrace a son* (4:16). It is the very phrase Yahuah spoke to Abraham at Mamre: *I will certainly return unto thee according to the time of life; and, lo, Sarah thy wife shall have a son* (Genesis 18:10), and to Sarah''s unbelief, *Is any thing too hard for Yahuah (LORD)? At the time appointed I will return unto thee, according to the time of life, and Sarah shall have a son* (18:14). Like Sarah the Shunammite can scarcely believe — *do not lie unto thine handmaid* (2 Kings 4:16) — yet *the woman conceived, and bare a son at that season that Elisha had said* (4:17). The barren womb opened in old age is the line of promise carried forward.',
       sv.verse_id, ev.verse_id, 'free', 38578
  FROM _s343_2ki04_lookup sv, _s343_2ki04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-4-is-it-well-with-the-child-and-she-said-it-is-well',
       E'Is It Well With the Child? — Faith in Grief',
       E'The promised son grows, and one day at the reapers cries *My head, my head* (2 Kings 4:19) and dies on his mother''s knees at noon. She does not wail; she lays him on the prophet''s own bed, shuts the door, and saddles an ass. Her husband asks why she goes — *it is neither new moon, nor sabbath* — and she answers *It shall be well* (4:23). When Elisha sends Gehazi to meet her with *Is it well with thee? is it well with thy husband? is it well with the child?*, she who has just buried hope on a bed answers *It is well* (4:26). It is faith spoken into grief before the answer is seen. She will not let the prophet go — *As Yahuah (LORD) liveth, and as thy soul liveth, I will not leave thee* (4:30) — and her word is vindicated when *she went in, and fell at his feet, and bowed herself to the ground, and took up her son, and went out* (4:37). "It is well" was true before it was visible.',
       sv.verse_id, ev.verse_id, 'free', 38581
  FROM _s343_2ki04_lookup sv, _s343_2ki04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=4 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-4-the-child-sneezed-and-the-dead-was-raised',
       E'The Child Sneezed Seven Times — the Dead Raised',
       E'Elisha shuts the door upon the two of them, prays unto Yahuah, and *went up, and lay upon the child, and put his mouth upon his mouth, and his eyes upon his eyes, and his hands upon his hands ... and the flesh of the child waxed warm* (2 Kings 4:34). He does as his master Elijah did at Zarephath — *he stretched himself upon the child three times, and cried unto Yahuah (LORD) ... let this child''s soul come into him again* (1 Kings 17:21), and *Yahuah (LORD) heard the voice of Elijah; and the soul of the child came into him again* (17:22). So here: *the child sneezed seven times, and the child opened his eyes* (2 Kings 4:35), and the boy is given back to his mother. This is the raising pattern the Formed Son fills and surpasses — at Nain, *Young man, I say unto thee, Arise. And he that was dead sat up, and began to speak. And he delivered him to his mother* (Luke 7:14-15); at Bethany, *Lazarus, come forth ... Loose him, and let him go* (John 11:43-44), spoken by the One who is *the resurrection, and the life*. The roll of faith names these very mothers: *Women received their dead raised to life again ... that they might obtain a better resurrection* (Hebrews 11:35). Elisha labours and prays; the Son raises by his own word — the firstfruits of the day all the dead shall hear his voice.',
       sv.verse_id, ev.verse_id, 'free', 38584
  FROM _s343_2ki04_lookup sv, _s343_2ki04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=4 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-4-they-shall-eat-and-shall-leave-thereof',
       E'They Shall Eat, and Shall Leave Thereof — the Bread Multiplied',
       E'In a dearth Elisha heals the poisoned pottage — *there is death in the pot* — by casting in meal until *there was no harm in the pot* (2 Kings 4:40-41); the prophet''s table is made safe and sufficient. Then a man brings *bread of the firstfruits, twenty loaves of barley, and full ears of corn* (4:42), and Elisha bids it set before a hundred men. His servitor protests the smallness of it, but the word stands: *thus saith Yahuah (LORD), They shall eat, and shall leave thereof* (4:43), and *they did eat, and left thereof, according to the word of Yahuah (LORD)* (4:44). The surplus is the Maker''s signature on the meal. The Formed Son does the greater work in the desert place: *he took the loaves; and when he had given thanks, he distributed* (John 6:11), and *they did all eat, and were filled: and they took up of the fragments that remained twelve baskets full* (Matthew 14:20; Mark 6:41-43). *Gather up the fragments that remain, that nothing be lost* (John 6:12) — the little blessed and broken feeds the multitude and is not spent, for he is *the bread of life: he that cometh to me shall never hunger* (John 6:35).',
       sv.verse_id, ev.verse_id, 'free', 38587
  FROM _s343_2ki04_lookup sv, _s343_2ki04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=38
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=4 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD MEMBERS ============================
-- THREAD 1: oil
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I have not a cake, but an handful of meal in a barrel, and a little oil in a cruse* (1 Kings 17:12) — the same widow at the end of her store, the little Yahuah multiplies.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-the-pot-of-oil-that-failed-not-paid-the-debt'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The barrel of meal shall not waste, neither shall the cruse of oil fail* (1 Kings 17:14) — the abundance runs exactly as far as the need.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=6
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-the-pot-of-oil-that-failed-not-paid-the-debt'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the cruse of oil fail, according to the word of Yahuah (LORD)* (1 Kings 17:16) — the word kept; the oil that pays the debt and frees the sons from bondage.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=7
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-the-pot-of-oil-that-failed-not-paid-the-debt'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: son given
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*according to the time of life ... Sarah thy wife shall have a son* (Genesis 18:10) — the very phrase Elisha speaks over the Shunammite.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=16
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-a-son-given-at-the-time-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Is any thing too hard for Yahuah (LORD)?* (Genesis 18:14) — Sarah''s unbelief answered; the barren womb opened in age.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=16
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-a-son-given-at-the-time-of-life'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: it is well
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Is it well with the child? And she answered, It is well* (2 Kings 4:26) — faith spoken into grief, already framed in v.23 *It shall be well*.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-is-it-well-with-the-child-and-she-said-it-is-well'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*took up her son, and went out* (2 Kings 4:37) — her "It is well" vindicated; the dead boy given back alive.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=26
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-is-it-well-with-the-child-and-she-said-it-is-well'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: child raised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he stretched himself upon the child three times ... let this child''s soul come into him again* (1 Kings 17:21) — Elisha does as Elijah did over the dead.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=34
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-the-child-sneezed-and-the-dead-was-raised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the soul of the child came into him again, and he revived* (1 Kings 17:22) — the dead given back by the word of Yahuah, as the boy sneezes and opens his eyes.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=35
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-the-child-sneezed-and-the-dead-was-raised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Young man, I say unto thee, Arise* (Luke 7:14) — the widow of Nain''s son raised; what Elisha prayed, the Son does by his word.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=35
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-the-child-sneezed-and-the-dead-was-raised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*And he delivered him to his mother* (Luke 7:15) — as Elisha returns the Shunammite''s son: *Take up thy son* (4:36).'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=36
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-the-child-sneezed-and-the-dead-was-raised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Lazarus, come forth* (John 11:43) — the four-days-dead raised by the One who is *the resurrection, and the life*.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=35
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=11 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-the-child-sneezed-and-the-dead-was-raised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Loose him, and let him go* (John 11:44) — Lazarus given back, as the Shunammite takes up her son (4:37).'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=37
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=11 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-the-child-sneezed-and-the-dead-was-raised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Women received their dead raised to life again ... a better resurrection* (Hebrews 11:35) — the very mothers of Zarephath and Shunem in the roll of faith.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=35
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-the-child-sneezed-and-the-dead-was-raised'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5: bread multiplied
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*they took up of the fragments that remained twelve baskets full* (Matthew 14:20) — the greater work: five loaves to five thousand, with surplus over.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=43
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=14 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-they-shall-eat-and-shall-leave-thereof'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he ... blessed, and brake the loaves* (Mark 6:41) — the barley firstfruits-bread of Elisha pointing to the loaves blessed and broken.'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=42
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=6 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-they-shall-eat-and-shall-leave-thereof'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*twelve baskets full of the fragments* (Mark 6:43) — the surplus that signs the Maker''s table, as they *left thereof* (4:44).'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=44
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=6 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-they-shall-eat-and-shall-leave-thereof'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he took the loaves ... and likewise of the fishes* (John 6:11) — the barley loaves one bread; *I am the bread of life* (John 6:35).'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=42
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-they-shall-eat-and-shall-leave-thereof'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Gather up the fragments that remain, that nothing be lost* (John 6:12) — the same abundance as Elisha''s *They shall eat, and shall leave thereof* (4:43).'
  FROM cross_reference_threads t
  JOIN _s343_2ki04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=4 AND sv.verse_number=43
  JOIN _s343_2ki04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-4-they-shall-eat-and-shall-leave-thereof'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_5.sql (2 Kings 5) -----
-- 2 Kings 5 — Naaman the Syrian, the leper cleansed; Gehazi's greed
-- TAG: 2ki05   VIEW: _s343_2ki05_lookup   SORT BAND: base 38600, step 3
--
-- 2 Kings 5 coverage:
--   v.2-3  (the little captive maid points Naaman to the prophet in Samaria)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: none warranted (Israel's witness in the nations; framed in thread prose)
--          -> THREAD: 2-kings-5-the-little-captive-maid-points-to-the-prophet (no canon target; Tanakh-internal witness — covered in summary, anchored verses self-contained)
--          NOTE: this theme is folded into the cleansing thread's prose; no standalone xref rows
--   v.10,12,13,14  (Go and wash in Jordan seven times; rage at the simplicity; dipped seven times; flesh like a little child)
--          NT:     John 9:7 (Go, wash in the pool of Siloam); Matthew 8:2-3 (the leper made clean by the word)
--          Extras: none warranted
--          Tanakh: Leviticus 14:7 (sprinkle the leper seven times and pronounce him clean)
--          -> THREAD: 2-kings-5-go-and-wash-in-jordan-seven-times-and-be-clean
--   v.15,17  (now I know there is no Elohim but in Yashar'el; two mules' burden of earth)
--          NT:     Luke 4:27 (Naaman the Syrian, the only leper cleansed — individual mercy to a sojourner)
--          Extras: none warranted
--          Tanakh: none warranted
--          -> THREAD: 2-kings-5-no-elohim-in-all-the-earth-but-in-yasharel-the-sojourners-confession
--   v.20,26,27  (Gehazi runs after Naaman, lies, the leprosy cleaves to him)
--          NT:     Acts 8:18-20 (Simon Magus — thy money perish with thee; the gift of Elohim not purchased)
--          Extras: none warranted
--          Tanakh: none warranted
--          -> THREAD: 2-kings-5-gehazi-the-free-gift-profaned-by-greed
--
-- THREADS (3):
--   2-kings-5-go-and-wash-in-jordan-seven-times-and-be-clean   [canon/free]  (John 9, Matthew 8, Leviticus 14)
--   2-kings-5-no-elohim-in-all-the-earth-but-in-yasharel-the-sojourners-confession  [canon/free]  (Luke 4)
--   2-kings-5-gehazi-the-free-gift-profaned-by-greed   [canon/free]  (Acts 8)
--   (the little captive maid, v.2-3, carries no standalone xref — Israel''s witness in the nations, folded into the cleansing thread''s prose)
--
-- FRAMEWORK NOTES:
--   * Naaman = a SOJOURNER of the nations who receives individual mercy (cleansing) WITHOUT becoming
--     seed-of-promise. NOT false-inclusion/grafting; NOT replacement of Israel. The Messiah pairs him
--     with the widow of Zarephath at Luke 4:25-27 precisely as the sovereign-mercy exceptions, the
--     prophet rejected at home while a Gentile believes — NOT a transfer of the covenant to the nations.
--   * The cleansing comes by HUMBLE OBEDIENCE TO THE PLAIN WORD (dip seven times in Jordan), not by a
--     grand gesture; cf. the washing of John 9 and the Torah's leper-law of seven (Lev 14). Torah affirmed.
--   * Gehazi profanes the FREE GIFT by greed; the gift of Elohim is not for sale (Acts 8, Simon Magus).

CREATE TEMP VIEW _s343_2ki05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Go and wash in Jordan seven times and be clean
    ('canon','2-kings',5,10,'canon','john',9,7,'free',
     E'*And said unto him, Go, wash in the pool of Siloam, (which is by interpretation, Sent.) He went his way therefore, and washed, and came seeing.* (John 9:7) Elisha sends Naaman the same plain word — *Go and wash in Jordan seven times, and thy flesh shall come again to thee, and thou shalt be clean* (2 Kings 5:10). Both healings hang on the humble obedience to the spoken word: a washing the proud reason despises, yet the one who simply goes and washes comes up clean.'),
    ('canon','2-kings',5,10,'canon','leviticus',14,7,'free',
     E'*And he shall sprinkle upon him that is to be cleansed from the leprosy seven times, and shall pronounce him clean, and shall let the living bird loose into the open field.* (Leviticus 14:7) Elisha''s word — *Go and wash in Jordan seven times... and thou shalt be clean* (2 Kings 5:10) — moves in the rhythm of Yahuah''s own leper-law, the sevenfold cleansing of the Torah. The prophet does not invent a new way; he speaks the pattern already written.'),
    ('canon','2-kings',5,14,'canon','matthew',8,3,'free',
     E'*And Yahusha (Jesus) put forth his hand, and touched him, saying, I will; be thou clean. And immediately his leprosy was cleansed.* (Matthew 8:3) When Naaman at last obeyed, *his flesh came again like unto the flesh of a little child, and he was clean* (2 Kings 5:14). The Formed Son who later cleansed the leper with a word is the same who gave the prophet his word in Samaria — the leprosy yields to the command of Yahuah, then by the prophet, now by his own hand.'),
    ('canon','2-kings',5,13,'canon','john',9,7,'free',
     E'*And said unto him, Go, wash in the pool of Siloam... He went his way therefore, and washed, and came seeing.* (John 9:7) Naaman''s servants plead, *if the prophet had bid thee do some great thing, wouldest thou not have done it? how much rather then, when he saith to thee, Wash, and be clean?* (2 Kings 5:13) The cleansing is hidden in the lowliness of the word; the blind man asks no great thing, only goes and washes, and sees.'),

    -- THREAD 2: No Elohim in all the earth but in Yashar'el — the sojourner's confession
    ('canon','2-kings',5,15,'canon','luke',4,27,'free',
     E'*And many lepers were in Yashar''el (Israel) in the time of Eliseus the prophet; and none of them was cleansed, saving Naaman the Syrian.* (Luke 4:27) The Messiah names this very chapter: out of all Yashar''el''s lepers, the sovereign mercy of Yahuah reached one sojourner of the nations, who then confessed *now I know that there is no Elohim (God) in all the earth, but in Yashar''el* (2 Kings 5:15). An individual mercy granted, not a transfer of the covenant — the prophet rejected at home while a Gentile believes.'),
    ('canon','2-kings',5,17,'canon','luke',4,27,'free',
     E'*And many lepers were in Yashar''el (Israel) in the time of Eliseus the prophet; and none of them was cleansed, saving Naaman the Syrian.* (Luke 4:27) The Syrian asks for *two mules'' burden of earth* (2 Kings 5:17) that he might offer to Yahuah alone — a sojourner cleaving to the one true Elohim of Yashar''el. He receives mercy; he does not become the seed of promise, but worships the El of Israel from afar, the very pairing the Messiah sets beside the widow of Zarephath.'),

    -- THREAD 3: Gehazi — the free gift profaned by greed
    ('canon','2-kings',5,20,'canon','acts',8,20,'free',
     E'*But Peter said unto him, Thy money perish with thee, because thou hast thought that the gift of Elohim (God) may be purchased with money.* (Acts 8:20) Gehazi reasons, *as Yahuah (LORD) liveth, I will run after him, and take somewhat of him* (2 Kings 5:20) — running to monetize what Elisha freely refused. Simon Magus and Gehazi share the one sin: treating the free gift of Yahuah as merchandise.'),
    ('canon','2-kings',5,26,'canon','acts',8,20,'free',
     E'*Thy money perish with thee, because thou hast thought that the gift of Elohim (God) may be purchased with money.* (Acts 8:20) Elisha discerns the heart: *Is it a time to receive money, and to receive garments, and oliveyards, and vineyards, and sheep, and oxen...?* (2 Kings 5:26) The prophet, like Peter, exposes the covetous heart that would trade on the mercy of Elohim.'),
    ('canon','2-kings',5,27,'canon','acts',8,20,'free',
     E'*Thy money perish with thee, because thou hast thought that the gift of Elohim (God) may be purchased with money.* (Acts 8:20) The judgment falls: *The leprosy therefore of Naaman shall cleave unto thee, and unto thy seed for ever. And he went out from his presence a leper as white as snow* (2 Kings 5:27). The very disease the sojourner lost by free grace, the greedy servant gained by grasping after gain — the gift defiled becomes the curse.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-5-go-and-wash-in-jordan-seven-times-and-be-clean',
       E'Go and wash in Jordan seven times, and be clean',
       E'Naaman, *captain of the host of the king of Syria... a great man... but he was a leper* (2 Kings 5:1), comes with his horses and chariots expecting a grand gesture, and Elisha sends only a messenger with a plain word: *Go and wash in Jordan seven times, and thy flesh shall come again to thee, and thou shalt be clean* (2 Kings 5:10). The captain rages — *Are not Abana and Pharpar, rivers of Damascus, better than all the waters of Yashar''el (Israel)?* (2 Kings 5:12) — for the cure is too lowly for his pride. His servants plead, *if the prophet had bid thee do some great thing, wouldest thou not have done it? how much rather then, when he saith to thee, Wash, and be clean?* (2 Kings 5:13) Then *went he down, and dipped himself seven times in Jordan, according to the saying of the man of Elohim (God): and his flesh came again like unto the flesh of a little child, and he was clean* (2 Kings 5:14).\n\nThe sevenfold washing is no novelty: it is the rhythm of Yahuah''s own Torah — *And he shall sprinkle upon him that is to be cleansed from the leprosy seven times, and shall pronounce him clean* (Leviticus 14:7). The prophet does not invent a new way; he speaks the pattern already written. So too the Messiah sends the blind man: *Go, wash in the pool of Siloam... He went his way therefore, and washed, and came seeing* (John 9:7) — and cleanses the leper Himself with a word, *I will; be thou clean. And immediately his leprosy was cleansed* (Matthew 8:3). One thread runs through all: cleansing comes not by the great work the flesh would attempt, but by humble obedience to the plain word of Yahuah, spoken first by the prophet and at last by the Formed Son in the flesh.',
       sv.verse_id, ev.verse_id, 'free', 38600
  FROM _s343_2ki05_lookup sv, _s343_2ki05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=5 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=5 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-5-no-elohim-in-all-the-earth-but-in-yasharel-the-sojourners-confession',
       E'There is no Elohim in all the earth, but in Yashar''el — the sojourner''s confession',
       E'Cleansed in Jordan, Naaman returns and stands before the prophet: *Behold, now I know that there is no Elohim (God) in all the earth, but in Yashar''el (Israel): now therefore, I pray thee, take a blessing of thy servant* (2 Kings 5:15). The Syrian of the nations confesses the one true Elohim of Yashar''el, and asks for *two mules'' burden of earth* (2 Kings 5:17) that he might offer henceforth *neither burnt offering nor sacrifice unto other gods, but unto Yahuah (LORD)*.\n\nThis is sovereign mercy to a sojourner — and the Messiah Himself names this chapter as exactly that: *And many lepers were in Yashar''el (Israel) in the time of Eliseus the prophet; and none of them was cleansed, saving Naaman the Syrian* (Luke 4:27). Out of all Yashar''el''s lepers, the mercy of Yahuah reached one Gentile who believed — set beside the widow of Zarephath (Luke 4:25-26), the two stand as the sovereign exceptions, the prophet rejected at home while a stranger of the nations confesses the El of Israel. Naaman receives mercy; he does not become the seed of promise, nor is the covenant transferred from Yashar''el to the nations. He worships from afar, carrying Israel''s earth to Damascus — an individual cleansed, not a people replaced.',
       sv.verse_id, ev.verse_id, 'free', 38603
  FROM _s343_2ki05_lookup sv, _s343_2ki05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=5 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=5 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-5-gehazi-the-free-gift-profaned-by-greed',
       E'Gehazi — the free gift profaned by greed',
       E'Elisha had refused every reward: *As Yahuah (LORD) liveth, before whom I stand, I will receive none* (2 Kings 5:16). But Gehazi his servant covets what the prophet freely declined: *Behold, my master hath spared Naaman this Syrian... but, as Yahuah (LORD) liveth, I will run after him, and take somewhat of him* (2 Kings 5:20). He lies to Naaman, takes silver and garments, and hides them. Elisha discerns all: *Is it a time to receive money, and to receive garments, and oliveyards, and vineyards, and sheep, and oxen, and menservants, and maidservants?* (2 Kings 5:26) The judgment is exact and terrible: *The leprosy therefore of Naaman shall cleave unto thee, and unto thy seed for ever. And he went out from his presence a leper as white as snow* (2 Kings 5:27). The very curse the sojourner lost by free grace, the greedy servant gained by grasping after gain.\n\nThe apostolic word carries the same warning when Simon the sorcerer offers money for the gift of the Ruach HaKodesh (Holy Spirit): *Thy money perish with thee, because thou hast thought that the gift of Elohim (God) may be purchased with money* (Acts 8:20). Gehazi and Simon Magus share one sin — to treat the free gift of Yahuah as merchandise. The mercy of Elohim is not for sale; the heart that would trade on it earns not gain but judgment.',
       sv.verse_id, ev.verse_id, 'free', 38606
  FROM _s343_2ki05_lookup sv, _s343_2ki05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=5 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=5 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'John 9:7 — *Go, wash in the pool of Siloam... and came seeing*: the same plain word of washing that cleansed Naaman (2 Kings 5:10).'
  FROM cross_reference_threads t
  JOIN _s343_2ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s343_2ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-5-go-and-wash-in-jordan-seven-times-and-be-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 14:7 — *sprinkle... seven times, and shall pronounce him clean*: Elisha''s sevenfold washing moves in the rhythm of Yahuah''s own leper-law of the Torah.'
  FROM cross_reference_threads t
  JOIN _s343_2ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=5 AND sv.verse_number=10
  JOIN _s343_2ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=14 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-5-go-and-wash-in-jordan-seven-times-and-be-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'John 9:7 (at 5:13) — *He went his way... and washed, and came seeing*: the cleansing hidden in the lowliness of the word the servants urge Naaman to obey.'
  FROM cross_reference_threads t
  JOIN _s343_2ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=5 AND sv.verse_number=13
  JOIN _s343_2ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-5-go-and-wash-in-jordan-seven-times-and-be-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Matthew 8:3 — *be thou clean. And immediately his leprosy was cleansed*: the Formed Son who gave the prophet his word now cleanses the leper with his own hand. Naaman''s flesh came again *like unto the flesh of a little child* (2 Kings 5:14).'
  FROM cross_reference_threads t
  JOIN _s343_2ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=5 AND sv.verse_number=14
  JOIN _s343_2ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=8 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-5-go-and-wash-in-jordan-seven-times-and-be-clean'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Luke 4:27 — *none of them was cleansed, saving Naaman the Syrian*: the Messiah names this chapter as sovereign mercy to a sojourner who confessed *no Elohim... but in Yashar''el* (2 Kings 5:15). Individual mercy, not the covenant transferred.'
  FROM cross_reference_threads t
  JOIN _s343_2ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=5 AND sv.verse_number=15
  JOIN _s343_2ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-5-no-elohim-in-all-the-earth-but-in-yasharel-the-sojourners-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Luke 4:27 (at 5:17) — the Syrian asks *two mules'' burden of earth* to offer to Yahuah alone; a sojourner cleaving to the El of Israel from afar, paired by the Messiah with the widow of Zarephath as the sovereign-mercy exceptions.'
  FROM cross_reference_threads t
  JOIN _s343_2ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=5 AND sv.verse_number=17
  JOIN _s343_2ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-5-no-elohim-in-all-the-earth-but-in-yasharel-the-sojourners-confession'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Acts 8:20 — *Thy money perish with thee... the gift of Elohim (God) may be purchased with money*: Gehazi runs to monetize (2 Kings 5:20) what Elisha freely refused, the same sin as Simon Magus.'
  FROM cross_reference_threads t
  JOIN _s343_2ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=5 AND sv.verse_number=20
  JOIN _s343_2ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=8 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-5-gehazi-the-free-gift-profaned-by-greed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Acts 8:20 (at 5:26) — Elisha, like Peter, exposes the covetous heart: *Is it a time to receive money... and vineyards, and sheep, and oxen?* The mercy of Elohim is not merchandise.'
  FROM cross_reference_threads t
  JOIN _s343_2ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=5 AND sv.verse_number=26
  JOIN _s343_2ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=8 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-5-gehazi-the-free-gift-profaned-by-greed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Acts 8:20 (at 5:27) — the gift defiled becomes the curse: *The leprosy... shall cleave unto thee... a leper as white as snow*. What the sojourner lost by free grace, the greedy servant gained by grasping.'
  FROM cross_reference_threads t
  JOIN _s343_2ki05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=5 AND sv.verse_number=27
  JOIN _s343_2ki05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=8 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-5-gehazi-the-free-gift-profaned-by-greed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_6.sql (2 Kings 6) -----
-- 2 Kings 6 — full-library cross-references — Yoshi's Remnant Bible
-- TAG: 2ki06    VIEW: _s343_2ki06_lookup    SORT BAND: 38625 base, step 3
-- SOURCE rows all: 'canon','2-kings',6,v
--
-- 2 Kings 6 coverage:
--   v.5-7  (iron axe head made to swim — the small loss, the impossible reversed)
--          NT:     none warranted (no NT quotation of the axe-head sign)
--          Extras: none warranted
--          Tanakh: 2-kings 2:21 (Elisha's word reverses nature, healed the waters) — THREADED
--   v.8-14 (Elisha reveals Syria's secret war-plans; the host surrounds Dothan)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: setting for the chariots-of-fire thread (v.15-17)
--   v.15-17 ★★★ (the chariots of fire — "they that be with us are more"; eyes opened)
--          NT:     Hebrews 1:14 (ministering spirits sent forth) — THREADED
--          Extras: none warranted (Ps 91 angel-charge already canon)
--          Tanakh: Psalm 34:7 (angel of Yahuah encampeth round about), Psalm 91:11
--                  (give his angels charge), 2-kings 2:11 (the same chariot/horses of fire) — THREADED
--   v.18-23 ★ (mercy to the blinded enemy — fed and sent home; bands came no more)
--          NT:     Romans 12:20 (feed thine enemy, coals of fire), Romans 12:21
--                  (overcome evil with good) — THREADED
--          Extras: none warranted
--          Tanakh: none warranted (Rom 12 itself draws Prov 25:21-22 forward)
--   v.24-29 ★ (siege of Samaria — famine, women boil their children = covenant curse)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Deuteronomy 28:53 + 28:52 (besiege thy gates, eat fruit of own body),
--                  Leviticus 26:29 (eat the flesh of your sons) — THREADED (the breach-curse, NOT Torah)
--   v.30-33 (the king blames Elisha; "this evil is of Yahuah")
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: folded into the siege/curse thread (the despair before the deliverance of ch 7)
--
-- THREADS (4):
--   2-kings-6-chariots-of-fire-they-that-be-with-us-are-more          (free) — Ps34, Ps91, Heb1, 2Ki2
--   2-kings-6-mercy-to-the-blinded-enemy-coals-of-fire                (free) — Romans 12
--   2-kings-6-the-siege-famine-as-the-covenant-curse                  (free) — Deut28, Lev26
--   2-kings-6-the-iron-axe-head-made-to-swim                          (free) — 2 Kings 2
--
-- Framework notes: chariots-of-fire = the unseen host of Yahuah guarding His own, the eyes
-- opened to the greater reality (Ps34:7/Heb1:14 ministering spirits); the fiery chariot is the
-- same Formed-host that carried Elijah (2Ki2:11), NOT a co-equal trinity. Mercy to the blinded
-- enemy = coals of fire / overcome evil with good (Rom12). The siege-famine is the Deut28/Lev26
-- covenant-CURSE for covenant-breaking fulfilled in the land — the breach-consequence, never the
-- Torah itself made into a curse.

CREATE TEMP VIEW _s343_2ki06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ B. cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: chariots of fire — "they that be with us are more"
    ('canon','2-kings',6,16,'canon','psalms',34,7,'free',
      E'*The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7). When Elisha tells his trembling servant *Fear not: for they that be with us are more than they that be with them* (2 Kings 6:16), the psalm names the unseen guard he sees — Yahuah''s host pitched round about His own.'),
    ('canon','2-kings',6,17,'canon','psalms',34,7,'free',
      E'*The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7). The young man''s opened eyes behold what the psalm declares: *the mountain was full of horses and chariots of fire round about Elisha* (2 Kings 6:17) — the encamping host made visible.'),
    ('canon','2-kings',6,17,'canon','psalms',91,11,'free',
      E'*For he shall give his angels charge over thee, to keep thee in all thy ways* (Psalm 91:11). The fiery chariots round about Elisha (2 Kings 6:17) are the angelic charge of the psalm — the El Elyon (most High) setting His host as a wall about the one who dwells in His secret place.'),
    ('canon','2-kings',6,17,'canon','hebrews',1,14,'free',
      E'*Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14). The horses and chariots of fire (2 Kings 6:17) are these ministering spirits — the flame-of-fire ministers (Hebrews 1:7) sent forth to guard the heirs; the eyes opened to the greater reality.'),
    ('canon','2-kings',6,17,'canon','2-kings',2,11,'free',
      E'*And it came to pass... that, behold, there appeared a chariot of fire, and horses of fire, and parted them both asunder; and Elijah went up by a whirlwind into heaven* (2 Kings 2:11). The same chariot and horses of fire that bore Elijah away now stand *round about Elisha* (2 Kings 6:17) — Yahuah''s fiery host, ever the guard of His prophets.'),
    -- THREAD 2: mercy to the blinded enemy — coals of fire
    ('canon','2-kings',6,22,'canon','romans',12,20,'free',
      E'*Therefore if thine enemy hunger, feed him; if he thirst, give him drink: for in so doing thou shalt heap coals of fire on his head* (Romans 12:20). Elisha will not let the king smite the captive Syrians — *set bread and water before them, that they may eat and drink, and go to their master* (2 Kings 6:22) — the very mercy-to-the-enemy Paul commands, coals of fire heaped not in vengeance but in kindness.'),
    ('canon','2-kings',6,23,'canon','romans',12,21,'free',
      E'*Be not overcome of evil, but overcome evil with good* (Romans 12:21). Elisha feeds the blinded host and sends them home, and *the bands of Syria came no more into the land of Yashar''el (Israel)* (2 Kings 6:23) — evil overcome with good, the enemy disarmed by bread rather than the sword.'),
    -- THREAD 3: the siege-famine as the covenant curse
    ('canon','2-kings',6,28,'canon','deuteronomy',28,53,'free',
      E'*And thou shalt eat the fruit of thine own body, the flesh of thy sons and of thy daughters... in the siege, and in the straitness, wherewith thine enemies shall distress thee* (Deuteronomy 28:53). The mother''s words *Give thy son, that we may eat him* (2 Kings 6:28) are this written curse come to pass — the Deuteronomy 28 siege-judgment for covenant-breaking, fulfilled in the besieged city.'),
    ('canon','2-kings',6,29,'canon','deuteronomy',28,53,'free',
      E'*And thou shalt eat the fruit of thine own body, the flesh of thy sons and of thy daughters... in the siege, and in the straitness, wherewith thine enemies shall distress thee* (Deuteronomy 28:53). *So we boiled my son, and did eat him* (2 Kings 6:29) is the very horror Moses foretold — not the Torah as a curse, but the breach of the covenant bringing down its named consequence.'),
    ('canon','2-kings',6,29,'canon','leviticus',26,29,'free',
      E'*And ye shall eat the flesh of your sons, and the flesh of your daughters shall ye eat* (Leviticus 26:29). The boiled-and-eaten son in besieged Samaria (2 Kings 6:29) is this Leviticus curse fulfilled — the covenant-lawsuit consequence for despising Yahuah''s statutes, the horror of disobedience, never the statutes themselves.'),
    ('canon','2-kings',6,24,'canon','deuteronomy',28,52,'free',
      E'*And he shall besiege thee in all thy gates, until thy high and fenced walls come down, wherein thou trustedst, throughout all thy land* (Deuteronomy 28:52). *Ben-hadad king of Syria gathered all his host, and went up, and besieged Samaria* (2 Kings 6:24) — the foretold besieging of the gates, the covenant-curse closing on the unfaithful city.'),
    -- THREAD 4: the iron axe head made to swim
    ('canon','2-kings',6,6,'canon','2-kings',2,21,'free',
      E'*And he went forth unto the spring of the waters, and cast the salt in there, and said, Thus saith Yahuah (LORD), I have healed these waters; there shall not be from thence any more death or barren land* (2 Kings 2:21). As Elisha''s cast salt reversed the bitter spring, so his cast stick reverses iron''s nature — *he cut down a stick, and cast it in thither; and the iron did swim* (2 Kings 6:6) — Yahuah''s care, through His prophet''s word, even over the small borrowed loss.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ C. threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-6-chariots-of-fire-they-that-be-with-us-are-more',
       E'Chariots of Fire — They That Be With Us Are More',
       E'The Syrian host has surrounded Dothan by night, and Elisha''s servant despairs — *Alas, my master! how shall we do?* (2 Kings 6:15). Elisha answers with the great word of the unseen world: *Fear not: for they that be with us are more than they that be with them* (2 Kings 6:16). Then he prays — *Yahuah (LORD), I pray thee, open his eyes, that he may see. And Yahuah (LORD) opened the eyes of the young man; and he saw: and, behold, the mountain was full of horses and chariots of fire round about Elisha* (2 Kings 6:17). The eyes are opened to the greater reality.\n\nThe psalms name this guarding host. *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalm 34:7) — the very encamping Elisha already saw. *For he shall give his angels charge over thee, to keep thee in all thy ways* (Psalm 91:11) — the angelic charge of the El Elyon (most High). And the New Testament names what they are: *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14) — the flame-of-fire ministers (Hebrews 1:7) sent forth to guard the heirs. This is Yahuah''s fiery host — the same *chariot of fire, and horses of fire* that bore Elijah up by a whirlwind into heaven (2 Kings 2:11) — His ranks of light, His Formed host, not a co-equal counterfeit but the armies of the Most High pitched round about His own.',
       sv.verse_id, ev.verse_id, 'free', 38625
  FROM _s343_2ki06_lookup sv, _s343_2ki06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=6 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-6-mercy-to-the-blinded-enemy-coals-of-fire',
       E'Mercy to the Blinded Enemy — Coals of Fire',
       E'Elisha has struck the Syrian host with blindness and led them helpless into Samaria. The king of Yashar''el (Israel) sees his cornered enemies and asks twice, *My father, shall I smite them? shall I smite them?* (2 Kings 6:21). Elisha forbids the slaughter: *Thou shalt not smite them... set bread and water before them, that they may eat and drink, and go to their master* (2 Kings 6:22). So he prepares great provision, feeds them, and sends them home — *and they went to their master. So the bands of Syria came no more into the land of Yashar''el (Israel)* (2 Kings 6:23).\n\nThis is the very wisdom Paul draws forward: *Therefore if thine enemy hunger, feed him; if he thirst, give him drink: for in so doing thou shalt heap coals of fire on his head* (Romans 12:20). Bread for the blinded enemy, not the sword — coals of fire heaped in kindness, melting hostility rather than burning it. *Be not overcome of evil, but overcome evil with good* (Romans 12:21): Elisha disarms a war with mercy, and the raids cease where the sword could never have ended them.',
       sv.verse_id, ev.verse_id, 'free', 38628
  FROM _s343_2ki06_lookup sv, _s343_2ki06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-6-the-siege-famine-as-the-covenant-curse',
       E'The Siege-Famine as the Covenant Curse',
       E'*Ben-hadad king of Syria gathered all his host, and went up, and besieged Samaria* (2 Kings 6:24), and the famine grows so terrible that an ass''s head sells for fourscore pieces of silver. Then comes the unspeakable cry of a woman on the wall: *This woman said unto me, Give thy son, that we may eat him to day, and we will eat my son to morrow. So we boiled my son, and did eat him* (2 Kings 6:28-29).\n\nThis is no random horror — it is the written covenant-curse come to pass. *And he shall besiege thee in all thy gates, until thy high and fenced walls come down, wherein thou trustedst* (Deuteronomy 28:52); *and thou shalt eat the fruit of thine own body, the flesh of thy sons and of thy daughters... in the siege, and in the straitness, wherewith thine enemies shall distress thee* (Deuteronomy 28:53). Leviticus names it just as plainly: *And ye shall eat the flesh of your sons, and the flesh of your daughters shall ye eat* (Leviticus 26:29). These are the named consequences of breaking covenant with Yahuah — the curse of the breach, never the Torah itself made into a curse. The covenant Yahuah swore to bless when obeyed (Deuteronomy 28:1-14) bears down with its lawsuit-judgment where it was despised; yet the king who cries *this evil is of Yahuah (LORD)* (2 Kings 6:33) stands one night from a deliverance he cannot imagine.',
       sv.verse_id, ev.verse_id, 'free', 38631
  FROM _s343_2ki06_lookup sv, _s343_2ki06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=6 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-6-the-iron-axe-head-made-to-swim',
       E'The Iron Axe Head Made to Swim',
       E'The sons of the prophets are felling beams by the Jordan when disaster strikes the smallest of men: *as one was felling a beam, the axe head fell into the water: and he cried, and said, Alas, master! for it was borrowed* (2 Kings 6:5). A borrowed tool lost, a poor man''s shame. Yahuah''s prophet does not despise the little loss: *And the man of Elohim (God) said, Where fell it? And he shewed him the place. And he cut down a stick, and cast it in thither; and the iron did swim* (2 Kings 6:6).\n\nThe impossible is reversed — iron made to float — by the prophet''s word, as so much in Elisha''s ministry. The same hand that *cast the salt in there* and healed the deadly spring — *Thus saith Yahuah (LORD), I have healed these waters; there shall not be from thence any more death or barren land* (2 Kings 2:21) — now casts a stick and lifts iron upon the water. Yahuah''s care reaches down to the borrowed axe of a nameless servant; nothing is too small for the One who orders the chariots of fire.',
       sv.verse_id, ev.verse_id, 'free', 38634
  FROM _s343_2ki06_lookup sv, _s343_2ki06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ============================ D. thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 34:7 — *the angel of Yahuah (LORD) encampeth round about them that fear him* — the unseen guard behind "they that be with us are more" (2 Kings 6:16).'
  FROM cross_reference_threads t
  JOIN _s343_2ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s343_2ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-6-chariots-of-fire-they-that-be-with-us-are-more'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 34:7 — the encamping angel-host made visible: *the mountain was full of horses and chariots of fire round about Elisha* (2 Kings 6:17).'
  FROM cross_reference_threads t
  JOIN _s343_2ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s343_2ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-6-chariots-of-fire-they-that-be-with-us-are-more'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 91:11 — *he shall give his angels charge over thee, to keep thee in all thy ways* — the angelic charge surrounding the prophet (2 Kings 6:17).'
  FROM cross_reference_threads t
  JOIN _s343_2ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s343_2ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-6-chariots-of-fire-they-that-be-with-us-are-more'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hebrews 1:14 — *ministering spirits, sent forth to minister for them who shall be heirs of salvation* — what the chariots of fire are (2 Kings 6:17).'
  FROM cross_reference_threads t
  JOIN _s343_2ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s343_2ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-6-chariots-of-fire-they-that-be-with-us-are-more'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Kings 2:11 — *a chariot of fire, and horses of fire* bore Elijah up; the same fiery host now stands round about Elisha (2 Kings 6:17).'
  FROM cross_reference_threads t
  JOIN _s343_2ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=17
  JOIN _s343_2ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-6-chariots-of-fire-they-that-be-with-us-are-more'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Romans 12:20 — *if thine enemy hunger, feed him... thou shalt heap coals of fire on his head* — Elisha''s bread-and-water for the captive Syrians (2 Kings 6:22).'
  FROM cross_reference_threads t
  JOIN _s343_2ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=22
  JOIN _s343_2ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-6-mercy-to-the-blinded-enemy-coals-of-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Romans 12:21 — *overcome evil with good* — the raids cease where mercy, not the sword, ended the war: *the bands of Syria came no more* (2 Kings 6:23).'
  FROM cross_reference_threads t
  JOIN _s343_2ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=23
  JOIN _s343_2ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-6-mercy-to-the-blinded-enemy-coals-of-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 28:52 — *he shall besiege thee in all thy gates, until thy high and fenced walls come down* — Ben-hadad''s siege of Samaria (2 Kings 6:24), the curse closing on the city.'
  FROM cross_reference_threads t
  JOIN _s343_2ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=24
  JOIN _s343_2ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-6-the-siege-famine-as-the-covenant-curse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 28:53 — *thou shalt eat the fruit of thine own body... in the siege* — the mother''s words *Give thy son, that we may eat him* (2 Kings 6:28) fulfill the written curse.'
  FROM cross_reference_threads t
  JOIN _s343_2ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=28
  JOIN _s343_2ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=53
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-6-the-siege-famine-as-the-covenant-curse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 28:53 again — *So we boiled my son, and did eat him* (2 Kings 6:29) is the very horror Moses foretold for the breach, not the Torah as curse.'
  FROM cross_reference_threads t
  JOIN _s343_2ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=29
  JOIN _s343_2ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=53
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-6-the-siege-famine-as-the-covenant-curse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Leviticus 26:29 — *ye shall eat the flesh of your sons* — the covenant-lawsuit curse for despising the statutes, fulfilled in besieged Samaria (2 Kings 6:29).'
  FROM cross_reference_threads t
  JOIN _s343_2ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=29
  JOIN _s343_2ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-6-the-siege-famine-as-the-covenant-curse'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 2:21 — *I have healed these waters* — Elisha''s cast salt reversed the spring as his cast stick now reverses iron: *the iron did swim* (2 Kings 6:6).'
  FROM cross_reference_threads t
  JOIN _s343_2ki06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=6 AND sv.verse_number=6
  JOIN _s343_2ki06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-6-the-iron-axe-head-made-to-swim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_7.sql (2 Kings 7) -----
-- 2 Kings 7 — the siege-famine broken by the word of Yahuah; the four lepers' gospel
-- TAG: 2ki07   VIEW: _s343_2ki07_lookup   SORT BAND: base 38650, step 3
--
-- 2 Kings 7 coverage:
--   v.1,16,18  (To morrow about this time shall a measure of fine flour be sold... in the gate of Samaria; fulfilled exactly according to the word of Yahuah)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Psalm 33:6,9 (by the word of Yahuah the heavens were made; he spake and it was done); Isaiah 55:1-2,10-11 (come, buy and eat without money; so shall my word be that it shall not return void); Numbers 23:19 (hath he said, and shall he not do it?)
--          -> THREAD: 2-kings-7-abundance-from-yahuah-by-his-word-the-measure-of-flour
--   v.9  (This day is a day of good tidings, and we hold our peace... now therefore come, that we may go and tell the king's household)
--          NT:     Romans 10:15 (how beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things)
--          Extras: none warranted
--          Tanakh: Isaiah 52:7 (how beautiful upon the mountains are the feet of him that bringeth good tidings)
--          -> THREAD: 2-kings-7-a-day-of-good-tidings-the-good-news-that-must-be-told-not-hoarded
--   v.2,19,20  (if Yahuah would make windows in heaven, might this thing be? thou shalt see it with thine eyes, but shalt not eat thereof; the people trode upon him in the gate, and he died)
--          NT:     Hebrews 4:1-2 (the word preached did not profit them, not being mixed with faith; entered not in because of unbelief)
--          Extras: none warranted
--          Tanakh: Numbers 23:19 (Elohim is not a man, that he should lie... hath he said, and shall he not do it?) — the sure word fulfilled against the scoffer
--          -> THREAD: 2-kings-7-the-unbelief-that-sees-the-blessing-but-does-not-partake
--   v.3-8,10-15,17  (the lepers go to the abandoned Syrian camp; Yahuah made the host hear a noise of chariots; the people spoil the tents; the famine breaks)
--          NT:     none warranted (narrative of the deliverance; carried in the threads' prose)
--          Extras: none warranted
--          Tanakh: none warranted (the deliverance Yahuah wrought; folded into the abundance and good-tidings threads)
--
-- THREADS (3):
--   2-kings-7-abundance-from-yahuah-by-his-word-the-measure-of-flour   [canon/free]  (Psalm 33, Isaiah 55, Numbers 23)
--   2-kings-7-a-day-of-good-tidings-the-good-news-that-must-be-told-not-hoarded   [canon/free]  (Isaiah 52, Romans 10)
--   2-kings-7-the-unbelief-that-sees-the-blessing-but-does-not-partake   [canon/free]  (Hebrews 4, Numbers 23)
--
-- FRAMEWORK NOTES:
--   * The measure of fine flour for a shekel in the gate of Samaria (7:1) is sudden ABUNDANCE
--     from Yahuah BY HIS WORD — the same creating, accomplishing word of Psalm 33 (*he spake,
--     and it was done*) and Isaiah 55 (*so shall my word be... it shall not return unto me void*).
--     Yahuah feeds the starving freely, *without money and without price* (Isa 55:1). Torah's God
--     keeps His spoken word exactly (Num 23:19): the famine breaks *according to the word of Yahuah*.
--   * The four lepers' *day of good tidings* (7:9) that must be PROCLAIMED, not hoarded, is the very
--     image Isaiah and Paul use for the gospel of deliverance announced to a people in bondage —
--     *how beautiful... the feet of him that bringeth good tidings* (Isa 52:7 / Rom 10:15). The
--     good news of Yahuah's salvation is told, carried to the king's household, not kept silent.
--   * The scoffing lord who SEES the blessing but does not PARTAKE (7:2,19-20) — *thou shalt see
--     it with thine eyes, but shalt not eat thereof* — is the unbelief of Hebrews 4: the word
--     preached *did not profit them, not being mixed with faith*, and they *entered not in because
--     of unbelief*. The sure word of Yahuah (Num 23:19) fulfilled against the one who scoffed.

CREATE TEMP VIEW _s343_2ki07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Abundance from Yahuah by his word — the measure of flour
    ('canon','2-kings',7,1,'canon','psalms',33,9,'free',
     E'*For he spake, and it was done; he commanded, and it stood fast.* (Psalm 33:9) Into the depth of the siege-famine Elisha prophesies, *To morrow about this time shall a measure of fine flour be sold for a shekel, and two measures of barley for a shekel, in the gate of Samaria* (2 Kings 7:1). The abundance comes by the same word that made the worlds — Yahuah speaks, and the thing stands fast; the prophet does but announce what the spoken word will accomplish.'),
    ('canon','2-kings',7,1,'canon','psalms',33,6,'free',
     E'*By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth.* (Psalm 33:6) When Elisha says, *Thus saith Yahuah (LORD)... shall a measure of fine flour be sold for a shekel... in the gate of Samaria* (2 Kings 7:1), the same creating word that fashioned the heavens now turns a starving city to sudden plenty. Yahuah''s word is the engine of the deliverance, not the prophet''s wisdom.'),
    ('canon','2-kings',7,1,'canon','isaiah',55,1,'free',
     E'*Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat; yea, come, buy wine and milk without money and without price.* (Isaiah 55:1) The famine-priced *measure of fine flour... for a shekel* (2 Kings 7:1) becomes Yahuah''s free table: the people *spoiled the tents of the Syrians* (7:16) and ate of an abundance they never bought from the enemy. Yahuah feeds the starving freely — the bread of His word given without price.'),
    ('canon','2-kings',7,16,'canon','isaiah',55,11,'free',
     E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it.* (Isaiah 55:11) The famine broke exactly as foretold: *So a measure of fine flour was sold for a shekel, and two measures of barley for a shekel, according to the word of Yahuah (LORD)* (2 Kings 7:16). The prophesied abundance is the word of Yahuah accomplishing what He pleased — it did not return void.'),
    ('canon','2-kings',7,16,'canon','numbers',23,19,'free',
     E'*Elohim (God) is not a man, that he should lie; neither the son of Adam, that he should repent: hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19) The fulfillment is exact — *according to the word of Yahuah (LORD)* (2 Kings 7:16) the flour was sold in the gate. What Yahuah said, He did; what He spoke, He made good. The sure word of the unchanging Elohim turns the prophet''s promise into plenty.'),

    -- THREAD 2: A day of good tidings — the good news that must be told, not hoarded
    ('canon','2-kings',7,9,'canon','isaiah',52,7,'free',
     E'*How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace; that bringeth good tidings of good, that publisheth salvation; that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7) The lepers, having eaten of the abandoned camp, awake to conscience: *This day is a day of good tidings, and we hold our peace... now therefore come, that we may go and tell the king''s household* (2 Kings 7:9). The good news of a deliverance already wrought may not be hoarded; it must be carried, its bearers'' feet beautiful with the announcing.'),
    ('canon','2-kings',7,9,'canon','romans',10,15,'free',
     E'*And how shall they preach, except they be sent? as it is written, How beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things!* (Romans 10:15) The four lepers at the gate, the outcasts who first taste the deliverance, become the first to publish it — *we do not well: this day is a day of good tidings, and we hold our peace* (2 Kings 7:9). So Paul names the apostolic errand by the very image: the glad tidings of salvation, freely received, must be freely told to a people in bondage.')
  ,
    -- THREAD 3: The unbelief that sees the blessing but does not partake
    ('canon','2-kings',7,2,'canon','hebrews',4,2,'free',
     E'*For unto us was the gospel preached, as well as unto them: but the word preached did not profit them, not being mixed with faith in them that heard it.* (Hebrews 4:2) The lord on whose hand the king leaned scoffs at the prophet''s word — *Behold, if Yahuah (LORD) would make windows in heaven, might this thing be?* — and hears the sentence, *Behold, thou shalt see it with thine eyes, but shalt not eat thereof* (2 Kings 7:2). The promise was preached to him as to all, but it did not profit him: he heard without faith, and the blessing he saw he did not taste.'),
    ('canon','2-kings',7,19,'canon','hebrews',4,6,'free',
     E'*Seeing therefore it remaineth that some must enter therein, and they to whom it was first preached entered not in because of unbelief.* (Hebrews 4:6) The scoffing lord answered the man of Elohim, *if Yahuah (LORD) should make windows in heaven, might such a thing be?* and was told again, *thou shalt see it with thine eyes, but shalt not eat thereof* (2 Kings 7:19). He saw the plenty pour into the gate, yet entered not into it — the very unbelief that bars a man from the rest set before him.'),
    ('canon','2-kings',7,20,'canon','numbers',23,19,'free',
     E'*Elohim (God) is not a man, that he should lie... hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19) The prophet''s word fell out to the letter against the scoffer: *And so it fell out unto him: for the people trode upon him in the gate, and he died* (2 Kings 7:20). He saw the blessing with his eyes but did not eat thereof, exactly as Elisha said. The sure word of Yahuah is fulfilled — in abundance for the believing, in judgment for the one who scoffed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-7-abundance-from-yahuah-by-his-word-the-measure-of-flour',
       E'Abundance from Yahuah by his word — the measure of fine flour in the gate',
       E'The siege of Samaria had ground the city to a famine so deep that *an ass''s head was sold for fourscore pieces of silver* (2 Kings 6:25) and mothers devoured their children. Into that depth Elisha prophesies sudden plenty by the bare authority of the spoken word: *Hear ye the word of Yahuah (LORD); Thus saith Yahuah (LORD), To morrow about this time shall a measure of fine flour be sold for a shekel, and two measures of barley for a shekel, in the gate of Samaria* (2 Kings 7:1).\n\nThis is the same creating, accomplishing word the Psalm sings: *By the word of Yahuah (LORD) were the heavens made; and all the host of them by the breath of his mouth... For he spake, and it was done; he commanded, and it stood fast* (Psalm 33:6,9). The word that fashioned the heavens turns a starving city to overnight abundance. And it is the word Yahuah promises through Isaiah will never fail: *So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please* (Isaiah 55:11) — the same Yahuah who calls the hungry to His free table, *Ho, every one that thirsteth, come ye to the waters, and he that hath no money; come ye, buy, and eat... without money and without price* (Isaiah 55:1).\n\nAnd so it fell out: *the people went out, and spoiled the tents of the Syrians. So a measure of fine flour was sold for a shekel, and two measures of barley for a shekel, according to the word of Yahuah (LORD)* (2 Kings 7:16). The unchanging Elohim does not speak in vain: *Elohim (God) is not a man, that he should lie... hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?* (Numbers 23:19). What Yahuah said, He did — abundance, freely, by His word.',
       sv.verse_id, ev.verse_id, 'free', 38650
  FROM _s343_2ki07_lookup sv, _s343_2ki07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=7 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-7-a-day-of-good-tidings-the-good-news-that-must-be-told-not-hoarded',
       E'This day is a day of good tidings — the good news that must be told, not hoarded',
       E'The four leprous men at the gate reasoned, *Why sit we here until we die?* (2 Kings 7:3), and went over to the Syrian camp — only to find it abandoned, *for Yahuah (Lord) had made the host of the Syrians to hear a noise of chariots, and a noise of horses, even the noise of a great host* (2 Kings 7:6), so that they fled and left everything. The outcasts ate and drank and gathered spoil; then conscience smote them: *We do not well: this day is a day of good tidings, and we hold our peace: if we tarry till the morning light, some mischief will come upon us: now therefore come, that we may go and tell the king''s household* (2 Kings 7:9).\n\nThe good news of a deliverance Yahuah has already wrought may not be hoarded by the few who first taste it; it must be carried to the starving. This is the very image the prophet and the apostle use for the gospel of salvation announced to a people in bondage: *How beautiful upon the mountains are the feet of him that bringeth good tidings, that publisheth peace; that bringeth good tidings of good, that publisheth salvation; that saith unto Zion, Thy Elohim (God) reigneth!* (Isaiah 52:7). Paul takes the same words for the apostolic errand: *as it is written, How beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things!* (Romans 10:15).\n\nThat lepers — the lowest at the gate — should be the first heralds is fitting: the glad tidings of Yahuah''s salvation, freely received, are freely told. They run to the porter, the porter to the king''s house, and the whole city is fed. The day of good news belongs to all who are perishing, and silence in such a day is no light thing.',
       sv.verse_id, ev.verse_id, 'free', 38653
  FROM _s343_2ki07_lookup sv, _s343_2ki07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-7-the-unbelief-that-sees-the-blessing-but-does-not-partake',
       E'Thou shalt see it with thine eyes, but shalt not eat thereof — unbelief that sees but does not partake',
       E'When Elisha announced the coming plenty, *a lord on whose hand the king leaned answered the man of Elohim (God), and said, Behold, if Yahuah (LORD) would make windows in heaven, might this thing be? And he said, Behold, thou shalt see it with thine eyes, but shalt not eat thereof* (2 Kings 7:2). The blessing was preached to him as to all the city, but he heard it without faith, and his unbelief sealed his portion: he would witness the deliverance and have no share in it.\n\nThis is precisely the warning of Hebrews: *For unto us was the gospel preached, as well as unto them: but the word preached did not profit them, not being mixed with faith in them that heard it* (Hebrews 4:2); and again, *Seeing therefore it remaineth that some must enter therein, and they to whom it was first preached entered not in because of unbelief* (Hebrews 4:6). The scoffer hears, but the word does not profit; he sees the door of plenty open and enters not, barred by his own unbelief.\n\nThe word fell out to the letter. The king set him to keep the gate, and when the famished city poured out to the spoil, *the people trode upon him in the gate, and he died, as the man of Elohim (God) had said* (2 Kings 7:17); *And so it fell out unto him: for the people trode upon him in the gate, and he died* (2 Kings 7:20). The sure word of Yahuah is no idle thing: *Elohim (God) is not a man, that he should lie... hath he said, and shall he not do it?* (Numbers 23:19). He saw the blessing with his eyes, exactly as Elisha said, but did not eat thereof — abundance to the believing, and to the one who scoffed, the very deliverance trampling him in the gate.',
       sv.verse_id, ev.verse_id, 'free', 38656
  FROM _s343_2ki07_lookup sv, _s343_2ki07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=7 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Psalm 33:9 — *For he spake, and it was done; he commanded, and it stood fast*: the abundance of 2 Kings 7:1 comes by the same word that made the worlds.'
  FROM cross_reference_threads t
  JOIN _s343_2ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=7 AND sv.verse_number=1
  JOIN _s343_2ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-7-abundance-from-yahuah-by-his-word-the-measure-of-flour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Psalm 33:6 — *By the word of Yahuah (LORD) were the heavens made*: the creating word that fashioned the heavens turns a starving city to sudden plenty (2 Kings 7:1).'
  FROM cross_reference_threads t
  JOIN _s343_2ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=7 AND sv.verse_number=1
  JOIN _s343_2ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-7-abundance-from-yahuah-by-his-word-the-measure-of-flour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Isaiah 55:1 — *come ye, buy, and eat... without money and without price*: Yahuah feeds the famished freely; the bread of his word given without price (2 Kings 7:1,16).'
  FROM cross_reference_threads t
  JOIN _s343_2ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=7 AND sv.verse_number=1
  JOIN _s343_2ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-7-abundance-from-yahuah-by-his-word-the-measure-of-flour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Isaiah 55:11 — *so shall my word be... it shall not return unto me void, but it shall accomplish that which I please*: the famine broke *according to the word of Yahuah* (2 Kings 7:16).'
  FROM cross_reference_threads t
  JOIN _s343_2ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s343_2ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-7-abundance-from-yahuah-by-his-word-the-measure-of-flour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Numbers 23:19 — *hath he said, and shall he not do it? or hath he spoken, and shall he not make it good?*: the unchanging Elohim keeps his word exactly; the flour was sold *according to the word of Yahuah* (2 Kings 7:16).'
  FROM cross_reference_threads t
  JOIN _s343_2ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=7 AND sv.verse_number=16
  JOIN _s343_2ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=23 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-7-abundance-from-yahuah-by-his-word-the-measure-of-flour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 52:7 — *how beautiful upon the mountains are the feet of him that bringeth good tidings... that publisheth salvation*: the lepers'' *day of good tidings* (2 Kings 7:9) must be carried, not hoarded.'
  FROM cross_reference_threads t
  JOIN _s343_2ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s343_2ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-7-a-day-of-good-tidings-the-good-news-that-must-be-told-not-hoarded'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Romans 10:15 — *How beautiful are the feet of them that preach the gospel of peace, and bring glad tidings of good things!*: Paul names the apostolic errand by the same image; the outcast lepers, first to taste deliverance, become its first heralds (2 Kings 7:9).'
  FROM cross_reference_threads t
  JOIN _s343_2ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s343_2ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-7-a-day-of-good-tidings-the-good-news-that-must-be-told-not-hoarded'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Hebrews 4:2 — *the word preached did not profit them, not being mixed with faith in them that heard it*: the scoffing lord hears the promise but believes not, and the blessing he sees he shall not taste (2 Kings 7:2).'
  FROM cross_reference_threads t
  JOIN _s343_2ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=7 AND sv.verse_number=2
  JOIN _s343_2ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-7-the-unbelief-that-sees-the-blessing-but-does-not-partake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hebrews 4:6 — *they to whom it was first preached entered not in because of unbelief*: the lord sees the plenty pour into the gate yet enters not into it (2 Kings 7:19).'
  FROM cross_reference_threads t
  JOIN _s343_2ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=7 AND sv.verse_number=19
  JOIN _s343_2ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-7-the-unbelief-that-sees-the-blessing-but-does-not-partake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Numbers 23:19 — *hath he said, and shall he not do it?*: the sure word fell out to the letter — *the people trode upon him in the gate, and he died* (2 Kings 7:20). Blessing seen, not tasted.'
  FROM cross_reference_threads t
  JOIN _s343_2ki07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=7 AND sv.verse_number=20
  JOIN _s343_2ki07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=23 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-7-the-unbelief-that-sees-the-blessing-but-does-not-partake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_8.sql (2 Kings 8) -----
-- 2 Kings 8 — the Shunammite's land restored; Elisha weeps over Hazael; the Davidic lamp kept for David's sake
-- TAG: 2ki08   VIEW: _s343_2ki08_lookup   SORT BAND: base 38675, step 3
--
-- 2 Kings 8 coverage:
--   v.1-6  (the Shunammite's land restored after the seven-year famine Elisha foretold; the prophet's word honored)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: none warranted (providence vindicating the prophet's word; self-contained, framed in prose)
--          -> no standalone xref; the prophet's-word-honored theme is folded into the Damascus thread's prose
--   v.10,11,12,13  (Elisha foresees Hazael's evil and WEEPS; I know the evil that thou wilt do unto the children of Yashar'el)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Kings 19:15 (anoint Hazael king over Syria); 1 Kings 19:17 (him that escapeth the sword of Hazael shall Jehu slay); Amos 1:3-4 (Damascus threshed Gilead — the judgment Elisha wept over)
--          -> THREAD: 2-kings-8-the-prophet-wept-knowing-the-evil-hazael-would-do
--   v.13,15  (Hazael king over Syria; smothers Ben-hadad and reigns — Elisha's word stands)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Kings 19:15 (Go, anoint Hazael to be king over Syria — the commission fulfilled)
--          -> folded into the weeping thread (same Hazael commission); no separate thread
--   v.18,19  (Jehoram marries the daughter of Ahab and does evil; YET Yahuah would not destroy Yahudah for David's sake — a light alway)
--          NT:     Luke 1:32 (the throne of his father David — the lamp brought to the Heir)
--          Extras: none warranted
--          Tanakh: 2 Samuel 7:15-16 (my mercy shall not depart; thine house established for ever); Psalm 132:17 (I have ordained a lamp for mine anointed); 1 Kings 11:36 (that David may have a light alway before me); 2 Chronicles 21:7 (he would not destroy the house of David, because of the covenant)
--          -> THREAD: 2-kings-8-yet-yahuah-kept-a-lamp-for-david-his-servants-sake
--   v.18,26,27  (the daughter of Ahab / Athaliah; Ahaziah walks in the way of the house of Ahab — the Ahab-poison in the Davidic house)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Chronicles 21:6 (he had the daughter of Ahab to wife, and wrought evil); 1 Kings 11:1-2 (Solomon's strange wives turned away his heart — the same marriage-poison); 2 Kings 9:6-7 (Jehu anointed to smite the house of Ahab — the purge the contamination sets up)
--          -> THREAD: 2-kings-8-the-house-of-ahab-married-into-the-house-of-david
--   v.20-22 (Edom revolts from Yahudah; Libnah revolts)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: none warranted (the covenant-judgment loosening of the kingdom under an evil king; framed in the lamp thread's prose)
--          -> no standalone xref
--
-- THREADS (3):
--   2-kings-8-the-prophet-wept-knowing-the-evil-hazael-would-do      [canon/free]  (1 Kings 19, Amos 1)
--   2-kings-8-yet-yahuah-kept-a-lamp-for-david-his-servants-sake     [canon/free]  (2 Samuel 7, Psalm 132, 1 Kings 11, 2 Chronicles 21, Luke 1)
--   2-kings-8-the-house-of-ahab-married-into-the-house-of-david      [canon/free]  (2 Chronicles 21, 1 Kings 11, 2 Kings 9)
--
-- FRAMEWORK NOTES:
--   * Elisha's tears (v.11-12) are the grief of FOREKNOWLEDGE — the Formed Son's Spirit shewing the prophet
--     the evil Hazael will do to the children of Yashar'el (Israel), the covenant-judgment loosed on the
--     covenant-breaking northern house. The prophet WEEPS; this is judgment grieved, never relished —
--     victims-not-enemies even as the lawsuit falls. Fulfils the Horeb commission, 1 Kings 19:15-17.
--   * The Davidic LAMP (v.19) is the seed-of-promise mercy (Genesis 3:15 running through David): the line is
--     poisoned by the Ahab-marriage and endangered, YET Yahuah keeps the lamp for David his servant's sake —
--     the unconditional-mercy clause of 2 Samuel 7:15 (my mercy shall not depart), sung in Psalm 132:17
--     (a lamp for mine anointed), echoed at 1 Kings 11:36 and 2 Chronicles 21:7. The lamp is the kept seed
--     that arrives at the throne of David in Luke 1:32 — the Formed Son, the Heir the mercy preserved through
--     endangerment.
--   * The Ahab-marriage (v.18,27) is the contamination of Yahudah by the house of Ahab — the same
--     strange-wife poison that turned Solomon's heart (1 Kings 11:1-2), now setting up Jehu's purge (2 Kings 9)
--     and Athaliah's usurpation. Conduct-within-the-covenant judged; the line endangered but not severed.

CREATE TEMP VIEW _s343_2ki08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the prophet wept knowing the evil Hazael would do
    ('canon','2-kings',8,12,'canon','1-kings',19,15,'free',
     E'*And Yahuah (LORD) said unto him, Go, return on thy way to the wilderness of Damascus: and when thou comest, anoint Hazael to be king over Syria* (1 Kings 19:15). At Horeb the Formed Son commissioned Elijah to anoint this very Hazael; now the word comes to pass in Damascus, and Elisha, seeing it, weeps — *Because I know the evil that thou wilt do unto the children of Yashar''el (Israel)* (2 Kings 8:12). The judgment was named on the mount; the prophet grieves it as it falls.'),
    ('canon','2-kings',8,12,'canon','1-kings',19,17,'free',
     E'*And it shall come to pass, that him that escapeth the sword of Hazael shall Jehu slay; and him that escapeth from the sword of Jehu shall Elisha slay* (1 Kings 19:17). The Horeb word set Hazael''s sword first in the chain of judgment against the covenant-breaking house. Elisha foresees its edge — *their strong holds wilt thou set on fire, and their young men wilt thou slay with the sword* (2 Kings 8:12) — and weeps over the evil already decreed.'),
    ('canon','2-kings',8,12,'canon','amos',1,3,'free',
     E'*Thus saith Yahuah (LORD); For three transgressions of Damascus, and for four, I will not turn away the punishment thereof; because they have threshed Gilead with threshing instruments of iron* (Amos 1:3). The prophet Amos names the very atrocity Elisha wept to foresee — Hazael''s Syria threshing the children of Yashar''el (Israel). The tears of 2 Kings 8:12 are answered by the lawsuit of Amos: the evil foreknown, then judged in turn.'),
    ('canon','2-kings',8,13,'canon','1-kings',19,15,'free',
     E'*Go, return on thy way to the wilderness of Damascus: and when thou comest, anoint Hazael to be king over Syria* (1 Kings 19:15). To the man who protests *is thy servant a dog, that he should do this great thing?*, Elisha answers *Yahuah (LORD) hath shewed me that thou shalt be king over Syria* (2 Kings 8:13) — the exact crown the Horeb commission named. The prophet''s word stands; the sword is loosed.'),

    -- THREAD 2: yet Yahuah kept a lamp for David his servant's sake
    ('canon','2-kings',8,19,'canon','2-samuel',7,15,'free',
     E'*But my mercy shall not depart away from him, as I took it from Saul, whom I put away before thee* (2 Samuel 7:15). This is the clause that holds Yahudah (Judah) when its king does evil: *Yet Yahuah (LORD) would not destroy Yahudah (Judah) for David his servant''s sake* (2 Kings 8:19). The mercy that does not depart is the seed-of-promise kept though the line sins.'),
    ('canon','2-kings',8,19,'canon','2-samuel',7,16,'free',
     E'*And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). The everlasting covenant to David is why the lamp is not put out under Jehoram. *As he promised him to give him alway a light, and to his children* (2 Kings 8:19) is this throne-for-ever pledge held firm against the king''s evil.'),
    ('canon','2-kings',8,19,'canon','psalms',132,17,'free',
     E'*There will I make the horn of David to bud: I have ordained a lamp for mine anointed* (Psalm 132:17). The Psalm sings the very lamp 2 Kings 8:19 guards — *a light alway, and to his children*. The ordained lamp of the anointed is the budding horn, the kept seed that will flower in the Heir though every present king fail.'),
    ('canon','2-kings',8,19,'canon','1-kings',11,36,'free',
     E'*And unto his son will I give one tribe, that David my servant may have a light alway before me in Jerusalem, the city which I have chosen me to put my name there* (1 Kings 11:36). The same lamp-for-David clause first spoken when the kingdom was torn from Solomon now shelters Yahudah (Judah) under Jehoram — *give him alway a light, and to his children* (2 Kings 8:19). One unbroken mercy across the generations.'),
    ('canon','2-kings',8,19,'canon','2-chronicles',21,7,'free',
     E'*Howbeit Yahuah (LORD) would not destroy the house of David, because of the covenant that he had made with David, and as he promised to give a light to him and to his sons for ever* (2 Chronicles 21:7). The Chronicler''s parallel makes the ground explicit — *because of the covenant*. The lamp of 2 Kings 8:19 is the covenant-mercy of 2 Samuel 7, named as the reason Yahudah (Judah) is spared.'),
    ('canon','2-kings',8,19,'canon','luke',1,32,'free',
     E'*He shall be great, and shall be called the Son of the Highest: and Yahuah (LORD) Elohim (God) shall give unto him the throne of his father David* (Luke 1:32). The lamp kept through endangerment arrives here, at the throne of David, in the Formed Son the mercy preserved. *Give him alway a light, and to his children* (2 Kings 8:19) is the seed carried unbroken to the Heir of the everlasting throne.'),

    -- THREAD 3: the house of Ahab married into the house of David
    ('canon','2-kings',8,18,'canon','2-chronicles',21,6,'free',
     E'*And he walked in the way of the kings of Yashar''el (Israel), like as did the house of Ahab: for he had the daughter of Ahab to wife: and he wrought that which was evil in the eyes of Yahuah (LORD)* (2 Chronicles 21:6). The Chronicler names the door the poison entered: *the daughter of Ahab was his wife* (2 Kings 8:18). The Ahab-marriage carries the Baal-house corruption straight into the Davidic line.'),
    ('canon','2-kings',8,18,'canon','1-kings',11,2,'free',
     E'*Of the nations concerning which Yahuah (LORD) said unto the children of Yashar''el (Israel), Ye shall not go in to them, neither shall they come in unto you: for surely they will turn away your heart after their gods: Solomon clave unto these in love* (1 Kings 11:2). The same strange-wife poison that *turned away* Solomon''s heart now works in Jehoram, who *walked in the way of the kings of Yashar''el (Israel)... for the daughter of Ahab was his wife* (2 Kings 8:18). The marriage that defies the covenant defiles the house.'),
    ('canon','2-kings',8,27,'canon','2-kings',9,7,'free',
     E'*And thou shalt smite the house of Ahab thy master, that I may avenge the blood of my servants the prophets, and the blood of all the servants of Yahuah (LORD), at the hand of Jezebel* (2 Kings 9:7). Ahaziah *walked in the way of the house of Ahab... for he was the son in law of the house of Ahab* (2 Kings 8:27) — the contamination that the very next chapter purges, Jehu anointed to cut off the house of Ahab the Davidic line had married into.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-8-the-prophet-wept-knowing-the-evil-hazael-would-do',
       E'The prophet wept, knowing the evil Hazael would do',
       E'Elisha comes to Damascus, and when Ben-hadad''s servant Hazael enquires of Yahuah (LORD), the prophet settles his countenance and breaks — *and the man of Elohim (God) wept. And Hazael said, Why weepeth my lord? And he answered, Because I know the evil that thou wilt do unto the children of Yashar''el (Israel): their strong holds wilt thou set on fire, and their young men wilt thou slay with the sword, and wilt dash their children, and rip up their women with child* (2 Kings 8:11-12). These are the tears of foreknowledge — the Spirit of the Formed Son shewing the prophet the slaughter to come upon the covenant-breaking northern house, and the prophet grieving the judgment even as he foretells it.\n\nThe sword was named long before, at Horeb, when the Formed Son sent Elijah back: *Go, return on thy way to the wilderness of Damascus: and when thou comest, anoint Hazael to be king over Syria* (1 Kings 19:15), and *him that escapeth the sword of Hazael shall Jehu slay* (1 Kings 19:17). So when Hazael protests, *is thy servant a dog, that he should do this great thing?*, Elisha answers from that commission — *Yahuah (LORD) hath shewed me that thou shalt be king over Syria* (2 Kings 8:13) — and on the morrow Hazael smothers his master and reigns. The word stands.\n\nAmos later names the very atrocity the prophet wept to foresee: *Thus saith Yahuah (LORD); For three transgressions of Damascus, and for four, I will not turn away the punishment thereof; because they have threshed Gilead with threshing instruments of iron* (Amos 1:3). The judgment is grieved before it is loosed and answered in turn — victims, not enemies; the lawsuit falls upon Israel''s sin, and even the foreknown evildoer comes under the covenant''s own reckoning.',
       sv.verse_id, ev.verse_id, 'free', 38675
  FROM _s343_2ki08_lookup sv, _s343_2ki08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-8-yet-yahuah-kept-a-lamp-for-david-his-servants-sake',
       E'Yet Yahuah kept a lamp for David his servant''s sake',
       E'Jehoram of Yahudah (Judah) marries the daughter of Ahab and walks in the way of the kings of Yashar''el (Israel) — the Ahab-poison entering the Davidic house. And the verdict hangs in the balance, until one word turns it: *Yet Yahuah (LORD) would not destroy Yahudah (Judah) for David his servant''s sake, as he promised him to give him alway a light, and to his children* (2 Kings 8:19). The line is poisoned and endangered, yet the lamp is not put out. This is the seed-of-promise mercy — the kept seed running from the woman through David, held firm against the king''s own evil.\n\nThe ground of the sparing is the everlasting covenant to David: *But my mercy shall not depart away from him, as I took it from Saul, whom I put away before thee* (2 Samuel 7:15), and *thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:16). It is the unconditional-mercy clause, the *light alway* clause Yahuah (LORD) first spoke when the kingdom was torn from Solomon — *that David my servant may have a light alway before me in Jerusalem* (1 Kings 11:36) — and which the Chronicler makes explicit: *Yahuah (LORD) would not destroy the house of David, because of the covenant that he had made with David, and as he promised to give a light to him and to his sons for ever* (2 Chronicles 21:7).\n\nThe Psalm sings the lamp by name: *There will I make the horn of David to bud: I have ordained a lamp for mine anointed* (Psalm 132:17). The lamp is a budding horn, a kept seed that flowers though every present king fails — and it arrives at last at the throne it was kept for: *Yahuah (LORD) Elohim (God) shall give unto him the throne of his father David* (Luke 1:32). The mercy preserved through endangerment delivers the Formed Son, the Heir, to the everlasting throne.',
       sv.verse_id, ev.verse_id, 'free', 38678
  FROM _s343_2ki08_lookup sv, _s343_2ki08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=8 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-8-the-house-of-ahab-married-into-the-house-of-david',
       E'The house of Ahab married into the house of David',
       E'The contamination of Yahudah (Judah) comes through a marriage. Jehoram *walked in the way of the kings of Yashar''el (Israel), as did the house of Ahab: for the daughter of Ahab was his wife: and he did evil in the sight of Yahuah (LORD)* (2 Kings 8:18); the Chronicler says it plainly — *for he had the daughter of Ahab to wife: and he wrought that which was evil in the eyes of Yahuah (LORD)* (2 Chronicles 21:6). The Baal-house of the north is wedded into the throne of David, and its idolatry walks in with the bride.\n\nThis is the old poison. *Of the nations concerning which Yahuah (LORD) said unto the children of Yashar''el (Israel), Ye shall not go in to them, neither shall they come in unto you: for surely they will turn away your heart after their gods: Solomon clave unto these in love* (1 Kings 11:2). The strange-wife marriage that turned away Solomon''s heart now works the same ruin in the Davidic house through Athaliah, daughter of Ahab, whose son Ahaziah *walked in the way of the house of Ahab... for he was the son in law of the house of Ahab* (2 Kings 8:27).\n\nThe corruption sets up the very purge the next chapter brings: *And thou shalt smite the house of Ahab thy master, that I may avenge the blood of my servants the prophets, and the blood of all the servants of Yahuah (LORD), at the hand of Jezebel* (2 Kings 9:7). Jehu is anointed to cut off the house of Ahab the Davidic line had married into — conduct-within-the-covenant judged, the throne endangered to the edge of usurpation, yet the lamp of David''s house (2 Kings 8:19) is not extinguished by it.',
       sv.verse_id, ev.verse_id, 'free', 38681
  FROM _s343_2ki08_lookup sv, _s343_2ki08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=8 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Kings 19:15 — *anoint Hazael to be king over Syria*: the Horeb commission Elisha now sees fulfilled, weeping over the evil it loosed.'
  FROM cross_reference_threads t
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-8-the-prophet-wept-knowing-the-evil-hazael-would-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Kings 19:17 — *him that escapeth the sword of Hazael shall Jehu slay*: Hazael''s sword first in the decreed chain of judgment the prophet foresaw.'
  FROM cross_reference_threads t
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-8-the-prophet-wept-knowing-the-evil-hazael-would-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Amos 1:3 — *they have threshed Gilead with threshing instruments of iron*: the prophet names the very Syrian atrocity Elisha wept to foresee.'
  FROM cross_reference_threads t
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=12
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-8-the-prophet-wept-knowing-the-evil-hazael-would-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Kings 19:15 — *thou shalt be king over Syria*: Elisha answers Hazael''s protest straight from the Horeb word; the crown is sure.'
  FROM cross_reference_threads t
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=13
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-8-the-prophet-wept-knowing-the-evil-hazael-would-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Samuel 7:15 — *my mercy shall not depart away from him*: the unconditional clause that holds Yahudah (Judah) though its king does evil.'
  FROM cross_reference_threads t
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=19
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-8-yet-yahuah-kept-a-lamp-for-david-his-servants-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Samuel 7:16 — *thy throne shall be established for ever*: the everlasting covenant that keeps the lamp lit under Jehoram.'
  FROM cross_reference_threads t
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=19
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-8-yet-yahuah-kept-a-lamp-for-david-his-servants-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 132:17 — *I have ordained a lamp for mine anointed*: the lamp of 2 Kings 8:19 sung as a budding horn, the kept seed.'
  FROM cross_reference_threads t
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=19
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-8-yet-yahuah-kept-a-lamp-for-david-his-servants-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Kings 11:36 — *a light alway before me in Jerusalem*: the same lamp-for-David clause, first spoken when the kingdom was torn from Solomon.'
  FROM cross_reference_threads t
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=19
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-8-yet-yahuah-kept-a-lamp-for-david-his-servants-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Chronicles 21:7 — *because of the covenant that he had made with David*: the Chronicler names the ground of the sparing explicitly.'
  FROM cross_reference_threads t
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=19
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=21 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-8-yet-yahuah-kept-a-lamp-for-david-his-servants-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Luke 1:32 — *the throne of his father David*: the lamp kept through endangerment arrives at the throne in the Formed Son, the Heir.'
  FROM cross_reference_threads t
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=19
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-8-yet-yahuah-kept-a-lamp-for-david-his-servants-sake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Chronicles 21:6 — *for he had the daughter of Ahab to wife*: the Chronicler names the door the Baal-house poison entered the Davidic line.'
  FROM cross_reference_threads t
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=18
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=21 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-8-the-house-of-ahab-married-into-the-house-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Kings 11:2 — *they will turn away your heart after their gods*: the same strange-wife marriage-poison that ruined Solomon, now in Jehoram.'
  FROM cross_reference_threads t
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=18
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-8-the-house-of-ahab-married-into-the-house-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 9:7 — *thou shalt smite the house of Ahab*: the purge the contamination sets up; Jehu anointed to cut off the house Yahudah (Judah) married into.'
  FROM cross_reference_threads t
  JOIN _s343_2ki08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=8 AND sv.verse_number=27
  JOIN _s343_2ki08_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-8-the-house-of-ahab-married-into-the-house-of-david'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_9.sql (2 Kings 9) -----
-- 2 Kings 9 — Jehu anointed king over Yashar'el; the house of Ahab smitten;
--   Joram cast into Naboth's plot; Jezebel thrown down and eaten by dogs
-- TAG: 2ki09   VIEW: _s343_2ki09_lookup   SORT BAND: base 38700, step 3
--
-- 2 Kings 9 coverage:
--   v.3,6,7,10  (Elisha's young prophet anoints Jehu; commission to smite Ahab's house,
--               avenge the blood of the prophets, the dogs to eat Jezebel in Jezreel)
--          NT:     none warranted (the Naboth/Jezebel requital weaves forward, threaded below)
--          Extras: none warranted
--          Tanakh: 1 Kings 19:16-17 (Jehu shalt thou anoint king over Yashar'el; him that escapeth
--                  the sword of Jehu shall Elisha slay); 1 Kings 21:21-22 (the cutting off of Ahab's house)
--          -> THREAD: 2-kings-9-jehu-anointed-the-appointed-avenger-of-the-prophets-blood
--   v.21,24,25,26  (Joram met in the portion of Naboth; smitten; cast into Naboth's plat;
--                  the blood of Naboth and his sons requited in this plat)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Kings 21:19 (where dogs licked the blood of Naboth shall dogs lick thy blood);
--                  1 Kings 21:29 (in his son's days will I bring the evil upon his house)
--          -> THREAD: 2-kings-9-the-blood-of-naboth-requited-in-his-own-field
--   v.30,33,35,36,37  (Jezebel painted, thrown down, trodden, eaten by dogs; the word of Elijah)
--          NT:     Revelation 2:20-23 (that woman Jezebel... I will cast her into a bed... kill her
--                  children with death; according to your works); Galatians 6:7 (whatsoever a man soweth)
--          Extras: none warranted
--          Tanakh: 1 Kings 21:23 (the dogs shall eat Jezebel by the wall of Jezreel)
--          -> THREAD: 2-kings-9-the-dogs-shall-eat-jezebel-the-persecutor-judged-as-elijah-spake
--   v.27,28  (Ahaziah of Yahudah, contaminated by the house of Ahab, also struck and dies)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: folded into the Naboth/requital thread's prose (the Ahab-contagion reaching Yahudah);
--                  no standalone xref
--   v.14,16,7,10 (the avenger Jehu himself, and the blood of Jezreel)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Hosea 1:4 (I will avenge the blood of Jezreel upon the house of Jehu)
--          -> THREAD: 2-kings-9-the-avenger-himself-answerable-the-blood-of-jezreel
--
-- THREADS (4):
--   2-kings-9-jehu-anointed-the-appointed-avenger-of-the-prophets-blood   [canon/free]  (1 Kings 19, 1 Kings 21)
--   2-kings-9-the-blood-of-naboth-requited-in-his-own-field   [canon/free]  (1 Kings 21)
--   2-kings-9-the-dogs-shall-eat-jezebel-the-persecutor-judged-as-elijah-spake   [canon/free]  (1 Kings 21, Revelation 2, Galatians 6)
--   2-kings-9-the-avenger-himself-answerable-the-blood-of-jezreel   [canon/free]  (Hosea 1)
--
-- FRAMEWORK NOTES:
--   * Jehu is the APPOINTED AVENGER — the sure word of Yahuah, spoken to Elijah at Horeb (1 Kings 19:16-17)
--     and against Ahab in Naboth's vineyard (1 Kings 21:21-24), now coming to pass. The bloodshed is Yahuah's
--     JUDICIAL judgment on a murderous Baal-dynasty that slew the prophets by the hand of Jezebel (9:7) — NOT
--     ethnic violence, NOT zeal for its own sake. The throne is given to execute a covenant-lawsuit verdict.
--   * The blood of Naboth is requited in NABOTH'S OWN FIELD (9:25-26): the exact place where the murder was
--     done becomes the place of the requital, *I will requite thee in this plat* — the precision of the sure
--     word (1 Kings 21:19), and the delay to the son's days exactly as 1 Kings 21:29 foretold.
--   * Jezebel, the PERSECUTOR of the prophets, ends exactly as Elijah spake (1 Kings 21:23) — dogs eat her
--     flesh in the portion of Jezreel (9:36-37). The Revelation letter to Thyatira reaches back to this same
--     name: *that woman Jezebel... I will cast her into a bed... and kill her children with death... according
--     to your works* (Rev 2:20-23) — the seducing-to-fornication-and-idolatry spirit judged, sowing and reaping
--     (Gal 6:7). Victim-framing: the house of Ahab/Jezebel is a system of bloodshed and Baal-worship judged,
--     not a people hated.
--   * The avenger is himself answerable: Yahuah later visits *the blood of Jezreel upon the house of Jehu*
--     (Hosea 1:4) — the executor who exceeded his commission in bloodshed comes under the same just measure.
--     Jezreel (the field of judgment) becomes the name of both the wound and the great day of regathering of
--     the TWO HOUSES (Hosea 1:11) — judgment and mercy held in one name.

CREATE TEMP VIEW _s343_2ki09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Jehu anointed — the appointed avenger of the prophets' blood
    ('canon','2-kings',9,3,'canon','1-kings',19,16,'free',
     E'*And Jehu the son of Nimshi shalt thou anoint to be king over Yashar''el (Israel): and Elisha the son of Shaphat of Abel-meholah shalt thou anoint to be prophet in thy room.* (1 Kings 19:16) The young prophet pours the oil and speaks the appointed word, *Thus saith Yahuah (LORD), I have anointed thee king over Yashar''el (Israel)* (2 Kings 9:3). What Yahuah commanded Elijah at Horeb now comes to pass by Elisha''s hand: Jehu is no usurper but the king Yahuah Himself named to execute judgment on the house of Ahab.'),
    ('canon','2-kings',9,7,'canon','1-kings',19,17,'free',
     E'*And it shall come to pass, that him that escapeth the sword of Hazael shall Jehu slay: and him that escapeth from the sword of Jehu shall Elisha slay.* (1 Kings 19:17) The commission to Jehu — *thou shalt smite the house of Ahab thy master, that I may avenge the blood of my servants the prophets, and the blood of all the servants of Yahuah (LORD), at the hand of Jezebel* (2 Kings 9:7) — is the sword Yahuah appointed at Horeb. The avenging is judicial: the blood of the prophets slain by Jezebel''s hand requires an answer.'),
    ('canon','2-kings',9,8,'canon','1-kings',21,21,'free',
     E'*Behold, I will bring evil upon thee, and will take away thy posterity, and will cut off from Ahab him that pisseth against the wall, and him that is shut up and left in Yashar''el (Israel),* (1 Kings 21:21) The word Jehu carries — *For the whole house of Ahab shall perish: and I will cut off from Ahab him that pisseth against the wall, and him that is shut up and left in Yashar''el (Israel)* (2 Kings 9:8) — is Elijah''s very sentence against Ahab, word for word. The judgment spoken in Naboth''s vineyard is now the king''s charge.'),
    ('canon','2-kings',9,9,'canon','1-kings',21,22,'free',
     E'*And will make thine house like the house of Jeroboam the son of Nebat, and like the house of Baasha the son of Ahijah, for the provocation wherewith thou hast provoked me to anger, and made Yashar''el (Israel) to sin.* (1 Kings 21:22) Jehu''s commission repeats the measure exactly: *And I will make the house of Ahab like the house of Jeroboam the son of Nebat, and like the house of Baasha the son of Ahijah* (2 Kings 9:9). Ahab joins the line of dynasties cut off for leading Yashar''el into Baal — the sure word standing over every house that provokes Yahuah.'),

    -- THREAD 2: The blood of Naboth requited in his own field
    ('canon','2-kings',9,25,'canon','1-kings',21,19,'free',
     E'*And thou shalt speak unto him, saying, Thus saith Yahuah (LORD), Hast thou killed, and also taken possession?... In the place where dogs licked the blood of Naboth shall dogs lick thy blood, even thine.* (1 Kings 21:19) Jehu remembers the burden Yahuah laid upon Ahab in this very field: *Take up, and cast him in the portion of the field of Naboth the Jezreelite: for remember how that, when I and thou rode together after Ahab his father, Yahuah (LORD) laid this burden upon him* (2 Kings 9:25). The place of the murder becomes the place of the requital.'),
    ('canon','2-kings',9,26,'canon','1-kings',21,19,'free',
     E'*In the place where dogs licked the blood of Naboth shall dogs lick thy blood, even thine.* (1 Kings 21:19) The requital is exact: *Surely I have seen yesterday the blood of Naboth, and the blood of his sons, saith Yahuah (LORD); and I will requite thee in this plat, saith Yahuah (LORD). Now therefore take and cast him into the plat of ground, according to the word of Yahuah (LORD)* (2 Kings 9:26). The blood Jezebel spilled by false witnesses in Naboth''s vineyard (1 Kings 21:13) is answered in the same ground — the sure word of Yahuah does not fall.'),
    ('canon','2-kings',9,26,'canon','1-kings',21,29,'free',
     E'*Seest thou how Ahab humbleth himself before me? because he humbleth himself before me, I will not bring the evil in his days: but in his son''s days will I bring the evil upon his house.* (1 Kings 21:29) Joram is Ahab''s son; the evil deferred for Ahab''s repentance now falls in the son''s day, *according to the word of Yahuah (LORD)* (2 Kings 9:26). The delay was mercy and the requital is justice — both kept to the letter Elijah spoke.'),

    -- THREAD 3: The dogs shall eat Jezebel — the persecutor judged as Elijah spake
    ('canon','2-kings',9,10,'canon','1-kings',21,23,'free',
     E'*And of Jezebel also spake Yahuah (LORD), saying, The dogs shall eat Jezebel by the wall of Jezreel.* (1 Kings 21:23) The prophet''s commission to Jehu carries the same sentence: *And the dogs shall eat Jezebel in the portion of Jezreel, and there shall be none to bury her* (2 Kings 9:10). The persecutor who slew the prophets and slaughtered Naboth by false witness is marked for the same field where she spilled innocent blood.'),
    ('canon','2-kings',9,36,'canon','1-kings',21,23,'free',
     E'*And of Jezebel also spake Yahuah (LORD), saying, The dogs shall eat Jezebel by the wall of Jezreel.* (1 Kings 21:23) When they find only the skull, the feet, and the palms, Jehu names the fulfillment outright: *This is the word of Yahuah (LORD), which he spake by his servant Elijah the Tishbite, saying, In the portion of Jezreel shall dogs eat the flesh of Jezebel* (2 Kings 9:36). The word spoken in Naboth''s vineyard years before is fulfilled to the syllable — the sure word of Yahuah by His servant the prophet.'),
    ('canon','2-kings',9,37,'canon','revelation',2,23,'free',
     E'*And I will kill her children with death; and all the churches shall know that I am he which searcheth the reins and hearts: and I will give unto every one of you according to your works.* (Revelation 2:23) Jezebel''s carcase becomes *as dung upon the face of the field in the portion of Jezreel; so that they shall not say, This is Jezebel* (2 Kings 9:37) — blotted out of memory. The Formed Son carries her very name forward against the seducing spirit at Thyatira, judging *that woman Jezebel* (Rev 2:20) and her children by the same measure: every one rendered *according to your works*.'),
    ('canon','2-kings',9,33,'canon','revelation',2,22,'free',
     E'*Behold, I will cast her into a bed, and them that commit adultery with her into great tribulation, except they repent of their deeds.* (Revelation 2:22) Jezebel painted her face and looked from the window; Jehu commands, *Throw her down. So they threw her down: and some of her blood was sprinkled on the wall, and on the horses: and he trode her under foot* (2 Kings 9:33). The casting-down of the harlot of Baal-worship in Jezreel prefigures the casting of *that woman Jezebel* into a bed of judgment — the same seducing-to-idolatry spirit, the same recompense.'),
    ('canon','2-kings',9,37,'canon','galatians',6,7,'free',
     E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* (Galatians 6:7) Jezebel sowed the blood of Naboth and the prophets; she reaps a carcase *as dung upon the face of the field in the portion of Jezreel* (2 Kings 9:37). She who sent letters to stone the innocent (1 Kings 21:8-13) is gathered as the harvest of her own sowing — Elohim is not mocked, and the field of her sowing is the field of her reaping.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 4 sources weave to Hosea 1:4 (added here to keep all VALUES in one block)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','2-kings',9,24,'canon','hosea',1,4,'free',
     E'*And Yahuah (LORD) said unto him, Call his name Jezreel; for yet a little while, and I will avenge the blood of Jezreel upon the house of Jehu, and will cause to cease the kingdom of the house of Yashar''el (Israel).* (Hosea 1:4) Jehu *drew a bow with his full strength, and smote Jehoram between his arms, and the arrow went out at his heart* (2 Kings 9:24); but the executor who poured out blood beyond his charge is himself answerable — Yahuah will visit the blood of Jezreel on Jehu''s own house. The same just measure that fell on Ahab falls on the avenger who exceeded it.'),
    ('canon','2-kings',9,7,'canon','hosea',1,4,'free',
     E'*Call his name Jezreel; for yet a little while, and I will avenge the blood of Jezreel upon the house of Jehu...* (Hosea 1:4) Jehu was charged *that I may avenge the blood of my servants the prophets... at the hand of Jezebel* (2 Kings 9:7) — a true commission. Yet Jezreel, the field of the avenging, becomes the name of a later reckoning against Jehu''s house too; and it becomes, in that same prophet, *the day of Jezreel* of regathering, when *the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together* (Hosea 1:11). Judgment and mercy held in one name over the two houses.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-9-jehu-anointed-the-appointed-avenger-of-the-prophets-blood',
       E'Jehu anointed — the appointed avenger of the prophets'' blood',
       E'Elisha sends a young prophet with a box of oil to Ramoth-gilead: *Then take the box of oil, and pour it on his head, and say, Thus saith Yahuah (LORD), I have anointed thee king over Yashar''el (Israel)* (2 Kings 9:3). This is no usurpation. Years before, at Horeb, Yahuah had named this very man: *And Jehu the son of Nimshi shalt thou anoint to be king over Yashar''el (Israel)... And it shall come to pass, that him that escapeth the sword of Hazael shall Jehu slay* (1 Kings 19:16-17). The throne is given to execute a verdict.\n\nThe commission is explicit and judicial: *thou shalt smite the house of Ahab thy master, that I may avenge the blood of my servants the prophets, and the blood of all the servants of Yahuah (LORD), at the hand of Jezebel. For the whole house of Ahab shall perish* (2 Kings 9:7-8). And the words Jehu carries are Elijah''s own sentence spoken in Naboth''s vineyard: *I will cut off from Ahab him that pisseth against the wall, and him that is shut up and left in Yashar''el (Israel)* (1 Kings 21:21), *and will make thine house like the house of Jeroboam the son of Nebat, and like the house of Baasha the son of Ahijah* (1 Kings 21:22). Ahab is set in the line of dynasties cut off for leading Yashar''el into Baal. This is the bloodshed of a covenant-lawsuit — Yahuah''s judgment upon a murderous Baal-dynasty that slew His prophets — not zeal of the flesh, not ethnic violence. The king is the sword the Most High appointed, and the blood of the prophets cries to be answered.',
       sv.verse_id, ev.verse_id, 'free', 38700
  FROM _s343_2ki09_lookup sv, _s343_2ki09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-9-the-blood-of-naboth-requited-in-his-own-field',
       E'The blood of Naboth requited in his own field',
       E'Joram king of Yashar''el and Ahaziah king of Yahudah ride out and meet Jehu *in the portion of Naboth the Jezreelite* (2 Kings 9:21) — the very ground stolen by murder. There Jehu draws his bow and smites Joram through the heart, then commands: *Take up, and cast him in the portion of the field of Naboth the Jezreelite: for remember how that, when I and thou rode together after Ahab his father, Yahuah (LORD) laid this burden upon him* (2 Kings 9:25).\n\nThe burden was Elijah''s word: *In the place where dogs licked the blood of Naboth shall dogs lick thy blood, even thine* (1 Kings 21:19). And the requital is exact to the place: *Surely I have seen yesterday the blood of Naboth, and the blood of his sons, saith Yahuah (LORD); and I will requite thee in this plat, saith Yahuah (LORD). Now therefore take and cast him into the plat of ground, according to the word of Yahuah (LORD)* (2 Kings 9:26). The blood Jezebel spilled by false witnesses (1 Kings 21:13) is answered in the same field where it was shed. Nor is the timing accidental: Yahuah had said, *because he humbleth himself before me, I will not bring the evil in his days: but in his son''s days will I bring the evil upon his house* (1 Kings 21:29) — and Joram is Ahab''s son. The delay was mercy; the requital is justice; both kept to the letter. So thorough is the judgment that the Ahab-contagion reaches even Yahudah: Ahaziah, allied to that house, *fled by the way of the garden house* and was struck down (2 Kings 9:27). The sure word of Yahuah does not fall to the ground.',
       sv.verse_id, ev.verse_id, 'free', 38709
  FROM _s343_2ki09_lookup sv, _s343_2ki09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=9 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-9-the-dogs-shall-eat-jezebel-the-persecutor-judged-as-elijah-spake',
       E'The dogs shall eat Jezebel — the persecutor judged as Elijah spake',
       E'Jezebel — who slew the prophets by her hand (2 Kings 9:7) and stoned Naboth by false witnesses (1 Kings 21:8-13) — hears Jehu is come, *and she painted her face, and tired her head, and looked out at a window* (2 Kings 9:30). Jehu lifts his face: *Who is on my side? who?* and to the eunuchs, *Throw her down. So they threw her down: and some of her blood was sprinkled on the wall, and on the horses: and he trode her under foot* (2 Kings 9:33). When they go to bury her they find *no more of her than the skull, and the feet, and the palms of her hands* (2 Kings 9:35).\n\nThen Jehu names the fulfillment: *This is the word of Yahuah (LORD), which he spake by his servant Elijah the Tishbite, saying, In the portion of Jezreel shall dogs eat the flesh of Jezebel* (2 Kings 9:36) — for Yahuah had said, *The dogs shall eat Jezebel by the wall of Jezreel* (1 Kings 21:23). Her carcase becomes *as dung upon the face of the field in the portion of Jezreel; so that they shall not say, This is Jezebel* (2 Kings 9:37). The persecutor of Yahuah''s servants is blotted from memory in the field of her own bloodshed — *whatsoever a man soweth, that shall he also reap* (Galatians 6:7); Elohim is not mocked.\n\nThe name does not die with her. The Formed Son carries it forward against the seducing spirit at Thyatira: *that woman Jezebel, which calleth herself a prophetess, to teach and to seduce my servants to commit fornication, and to eat things sacrificed unto idols* (Revelation 2:20). The sentence is the same measure: *Behold, I will cast her into a bed... And I will kill her children with death... and I will give unto every one of you according to your works* (Revelation 2:22-23). The Baal-seducing spirit that murdered the prophets in Jezreel meets, in every age, the same just recompense. This is judgment on a system of bloodshed and idolatry — not hatred of a people, but the answering of innocent blood.',
       sv.verse_id, ev.verse_id, 'free', 38718
  FROM _s343_2ki09_lookup sv, _s343_2ki09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=9 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-9-the-avenger-himself-answerable-the-blood-of-jezreel',
       E'The avenger himself answerable — the blood of Jezreel',
       E'Jehu''s commission was true — *that I may avenge the blood of my servants the prophets... at the hand of Jezebel* (2 Kings 9:7) — and his arm strong: *And Jehu drew a bow with his full strength, and smote Jehoram between his arms, and the arrow went out at his heart* (2 Kings 9:24). Yet the executor who poured out blood beyond his charge does not stand outside the same justice he carried. Generations later Yahuah speaks through Hosea: *Call his name Jezreel; for yet a little while, and I will avenge the blood of Jezreel upon the house of Jehu, and will cause to cease the kingdom of the house of Yashar''el (Israel)* (Hosea 1:4).\n\nThe field of the avenging becomes the field of a later reckoning. The measure that fell on Ahab falls in time on the avenger who exceeded it — Yahuah''s judgment is no respecter of the throne He Himself anointed. Yet Jezreel (“El sows”) is not only the name of a wound. In the same prophet it turns to mercy: *great shall be the day of Jezreel* (Hosea 1:11), when *the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land* (Hosea 1:11). The two houses scattered under such bloody kings — Yahudah in the south, Yashar''el / Ephraim in the north — are promised to be made one again. Judgment and ingathering are held in a single name, sown by the El who both requites blood and gathers His people home.',
       sv.verse_id, ev.verse_id, 'free', 38727
  FROM _s343_2ki09_lookup sv, _s343_2ki09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=9 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Kings 19:16 — *Jehu the son of Nimshi shalt thou anoint to be king over Yashar''el*: the man Yahuah named at Horeb is now anointed by Elisha''s prophet (2 Kings 9:3). No usurper — the king Yahuah Himself appointed.'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=3
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-jehu-anointed-the-appointed-avenger-of-the-prophets-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Kings 19:17 — *him that escapeth from the sword of Jehu shall Elisha slay*: the appointed sword. Jehu''s charge to avenge *the blood of my servants the prophets... at the hand of Jezebel* (2 Kings 9:7) is the judicial commission of Horeb.'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-jehu-anointed-the-appointed-avenger-of-the-prophets-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Kings 21:21 — *I will cut off from Ahab him that pisseth against the wall*: Elijah''s sentence in Naboth''s vineyard is the very word Jehu carries (2 Kings 9:8).'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=8
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-jehu-anointed-the-appointed-avenger-of-the-prophets-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'1 Kings 21:22 — *make thine house like the house of Jeroboam... and Baasha*: the measure repeated word for word in Jehu''s charge (2 Kings 9:9). Ahab joins the dynasties cut off for leading Yashar''el into Baal.'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=9
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-jehu-anointed-the-appointed-avenger-of-the-prophets-blood'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Kings 21:19 — *where dogs licked the blood of Naboth shall dogs lick thy blood*: Jehu remembers the burden Yahuah laid on Ahab in this field (2 Kings 9:25); the place of the murder becomes the place of the requital.'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=25
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-the-blood-of-naboth-requited-in-his-own-field'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Kings 21:19 (at 9:26) — *I will requite thee in this plat... according to the word of Yahuah*: the blood of Naboth and his sons answered in the same ground where Jezebel''s false witnesses spilled it (1 Kings 21:13).'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=26
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-the-blood-of-naboth-requited-in-his-own-field'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Kings 21:29 — *in his son''s days will I bring the evil upon his house*: Joram is Ahab''s son; the evil deferred for Ahab''s humbling falls in the son''s day, *according to the word of Yahuah* (2 Kings 9:26). Mercy delayed, justice kept.'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=26
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-the-blood-of-naboth-requited-in-his-own-field'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Kings 21:23 — *The dogs shall eat Jezebel by the wall of Jezreel*: the sentence spoken against the persecutor of the prophets, carried in Jehu''s commission (2 Kings 9:10).'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=10
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-the-dogs-shall-eat-jezebel-the-persecutor-judged-as-elijah-spake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Revelation 2:22 — *I will cast her into a bed... except they repent*: the casting-down of Jezebel (2 Kings 9:33) prefigures the casting of *that woman Jezebel* into judgment — the same seducing-to-idolatry spirit.'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=33
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-the-dogs-shall-eat-jezebel-the-persecutor-judged-as-elijah-spake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Kings 21:23 (at 9:36) — Jehu names the fulfillment outright: *This is the word of Yahuah... by his servant Elijah... In the portion of Jezreel shall dogs eat the flesh of Jezebel*. The sure word fulfilled to the syllable.'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=36
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-the-dogs-shall-eat-jezebel-the-persecutor-judged-as-elijah-spake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Revelation 2:23 — *I will give unto every one of you according to your works*: Jezebel''s carcase as dung, her name blotted out (2 Kings 9:37); the Formed Son judges the same Jezebel-spirit at Thyatira by the same measure.'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=37
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-the-dogs-shall-eat-jezebel-the-persecutor-judged-as-elijah-spake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Galatians 6:7 — *whatsoever a man soweth, that shall he also reap*: Jezebel sowed the blood of Naboth and the prophets and reaps a carcase as dung in the field of her own sowing (2 Kings 9:37). Elohim is not mocked.'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=37
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-the-dogs-shall-eat-jezebel-the-persecutor-judged-as-elijah-spake'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 MEMBERS
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Hosea 1:4 (at 9:7) — *I will avenge the blood of Jezreel upon the house of Jehu*: the avenging field becomes the name of a later reckoning, and then *the day of Jezreel* of the two-house regathering (Hosea 1:11). Judgment and mercy in one name.'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=7
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-the-avenger-himself-answerable-the-blood-of-jezreel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hosea 1:4 (at 9:24) — Jehu smites Joram with his full strength, yet the executor who exceeded his charge is himself answerable: Yahuah will avenge the blood of Jezreel on Jehu''s own house. The same just measure on the avenger.'
  FROM cross_reference_threads t
  JOIN _s343_2ki09_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=9 AND sv.verse_number=24
  JOIN _s343_2ki09_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-9-the-avenger-himself-answerable-the-blood-of-jezreel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_10.sql (2 Kings 10) -----
--
-- Chapter: 2 Kings 10 — Jehu purges the house of Ahab and the house of Baal,
--   yet keeps the golden calves of Jeroboam; Yahuah begins to cut Yashar'el short.
-- Tag: 2ki10   View: _s343_2ki10_lookup   Sort band: 38725 step 3 (38725, 38728, 38731, 38734)
--
-- 2 Kings 10 coverage:
--   v.1-9 (the seventy heads in baskets, the ruse against Ahab's sons)
--        NT:     none warranted (narrative bridge into the fulfilment verses)
--        Extras: none warranted
--        Tanakh: 1 Kings 21 / 1 Kings 19 (the word being fulfilled — bound at v.10-11,17)
--   v.10  Know now nothing of the word of Yahuah shall fall to the earth — the word against Ahab fulfilled
--        NT:     none warranted (the framework weave is back to the prophetic word it fulfils)
--        Extras: none warranted
--        Tanakh: 1 Kings 21:21,22,24 (Elijah's word against Ahab's house); 1 Kings 19:17 (Jehu commissioned to slay)  -> THREAD 1
--   v.11  Jehu slew all that remained of the house of Ahab -> 1 Kings 21:21 (take away thy posterity) -> THREAD 1
--   v.17  destroyed him according to the saying of Yahuah which he spake to Elijah -> 1 Kings 21:24 -> THREAD 1
--   v.18-19,25,27-28  the ruse, the slaughter, the house of Baal a draught house, Baal destroyed out of Yashar'el
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Kings 19:18 (seven thousand knees not bowed to Baal); Deuteronomy 13:14,15 (herem on the idolatrous city) -> THREAD 2
--   v.29,31  the golden calves kept; Jehu took no heed to walk in the Torah with all his heart
--        NT:     none warranted (calf-sin is a Tanakh internal weave; Matthew 15:9 weighed for "commandments of men" but Jehu's is the OPPOSITE error — half-obedience, not added tradition — so NOT bound)
--        Extras: none warranted
--        Tanakh: 1 Kings 12:28,29,30 (Jeroboam's two calves in Beth-el and Dan); 2 Kings 17:16,21,22 (the calf-sin that scatters the north) -> THREAD 3
--   v.30,32-33  reward to the fourth generation; Yahuah begins to cut Yashar'el short, Hazael smites the borders
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Hosea 1:4,5 (avenge the blood of Jezreel on the house of Jehu); 2 Kings 17:18,23 (Yashar'el removed, carried to Assyria) -> THREAD 4
--   v.12-16,20-24,26,34-36  narrative detail (Ahaziah's brethren, Jehonadab, vestments, burial) — none warranted, woven into the four threads above
--
-- Threads:
--   2-kings-10-nothing-of-the-word-of-yahuah-shall-fall-to-the-earth (free; Tanakh: 1 Kings 21, 1 Kings 19)
--   2-kings-10-thus-jehu-destroyed-baal-out-of-yashar-el (free; Tanakh: 1 Kings 19, Deuteronomy 13)
--   2-kings-10-baal-torn-down-but-the-calves-kept (free; Tanakh: 1 Kings 12, 2 Kings 17)
--   2-kings-10-yahuah-began-to-cut-yashar-el-short (free; Tanakh: Hosea 1, 2 Kings 17)
--
-- Contested/load-bearing framing:
--   * v.10 "nothing of the word of Yahuah shall fall to the earth" — read as the FAITHFULNESS of the
--     prophetic word, the word against Ahab (1 Kings 21) wholly performed; the Formed Son's word spoken
--     by Elijah does not return void (the larger pattern, kept inside the Tanakh witness here).
--   * v.29,31 the partial reform — Jehu tore down Baal but KEPT the calves of Jeroboam. Framed as
--     HALF-HEARTED obedience that does not return fully to the Torah ("took no heed to walk in the law
--     of Yahuah Elohim of Yashar'el with all his heart"), NOT as Torah-as-burden. The calf-sin is the
--     very sin that scatters the north (2 Kings 17) — Torah is the inheritance, the calf is the breach.
--   * v.30,32 Hosea 1:4 — even the avenger's excess is judged ("I will avenge the blood of Jezreel upon
--     the house of Jehu"); the victims-not-enemies lens: Jehu is rewarded for executing judgment yet his
--     house is itself brought under judgment for the bloodshed beyond the word — the covenant-lawsuit
--     reaches even the instrument.

CREATE TEMP VIEW _s343_2ki10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: nothing of the word of Yahuah shall fall to the earth (1 Kings 21, 1 Kings 19)
    ('canon','2-kings',10,10,'canon','1-kings',21,21,'free',
      E'*Behold, I will bring evil upon thee, and will take away thy posterity, and will cut off from Ahab him that pisseth against the wall, and him that is shut up and left in Yashar''el (Israel)* (1 Kings 21:21). Jehu stands over the seventy heads and declares *Know now that there shall fall unto the earth nothing of the word of Yahuah (LORD), which Yahuah (LORD) spake concerning the house of Ahab* (2 Kings 10:10) — the word Elijah carried against Ahab is here wholly performed; not one syllable falls to the ground.'),
    ('canon','2-kings',10,10,'canon','1-kings',21,24,'free',
      E'*Him that dieth of Ahab in the city the dogs shall eat; and him that dieth in the field shall the fowls of the air eat* (1 Kings 21:24). Jehu''s purge in Jezreel and Samaria is the door of that sentence swinging shut; *there shall fall unto the earth nothing of the word of Yahuah (LORD)* (2 Kings 10:10) — the prophetic word does not return void.'),
    ('canon','2-kings',10,11,'canon','1-kings',21,21,'free',
      E'*Behold, I will bring evil upon thee, and will take away thy posterity... and him that is shut up and left in Yashar''el (Israel)* (1 Kings 21:21). *So Jehu slew all that remained of the house of Ahab in Jezreel, and all his great men, and his kinsfolks, and his priests, until he left him none remaining* (2 Kings 10:11) — the *take away thy posterity* of Elijah''s word is the *none remaining* of the deed.'),
    ('canon','2-kings',10,17,'canon','1-kings',21,24,'free',
      E'*Him that dieth of Ahab in the city the dogs shall eat* (1 Kings 21:24). *And when he came to Samaria, he slew all that remained unto Ahab in Samaria, till he had destroyed him, according to the saying of Yahuah (LORD), which he spake to Elijah* (2 Kings 10:17) — the narrator names the fulfilment outright: the saying spoken to Elijah is the saying carried out.'),
    ('canon','2-kings',10,11,'canon','1-kings',19,17,'free',
      E'*And it shall come to pass, that him that escapeth the sword of Hazael shall Jehu slay; and him that escapeth from the sword of Jehu shall Elisha slay* (1 Kings 19:17). Jehu''s sword — *Jehu slew all that remained of the house of Ahab* (2 Kings 10:11) — is the very instrument named at Horeb; the avenger was commissioned before he ever drew it.'),

    -- THREAD 2: Thus Jehu destroyed Baal out of Yashar'el (1 Kings 19, Deuteronomy 13)
    ('canon','2-kings',10,28,'canon','1-kings',19,18,'free',
      E'*Yet I have left me seven thousand in Yashar''el (Israel), all the knees which have not bowed unto Baal, and every mouth which hath not kissed him* (1 Kings 19:18). *Thus Jehu destroyed Baal out of Yashar''el (Israel)* (2 Kings 10:28) — the seven thousand who never bowed are vindicated when the house of Baal is broken down; Yahuah''s preserved remnant outlasts the idol.'),
    ('canon','2-kings',10,19,'canon','deuteronomy',13,14,'free',
      E'*Then shalt thou enquire, and make search, and ask diligently; and, behold, if it be truth, and the thing certain, that such abomination is wrought among you* (Deuteronomy 13:14). Jehu''s ruse — *call unto me all the prophets of Baal... for I have a great sacrifice to do to Baal... But Jehu did it in subtilty, to the intent that he might destroy the worshippers of Baal* (2 Kings 10:19) — flushes out the abomination so that the Torah''s sentence on the idolatrous city can fall on the worshippers gathered in one house.'),
    ('canon','2-kings',10,25,'canon','deuteronomy',13,15,'free',
      E'*Thou shalt surely smite the inhabitants of that city with the edge of the sword, destroying it utterly, and all that is therein* (Deuteronomy 13:15). *And they smote them with the edge of the sword; and the guard and the captains cast them out* (2 Kings 10:25) — the slaughter of the Baal-worshippers is the herem of Deuteronomy 13 executed: those who turn to serve other gods are utterly smitten with the edge of the sword.'),
    ('canon','2-kings',10,27,'canon','deuteronomy',13,16,'free',
      E'*And thou shalt gather all the spoil of it into the midst of the street thereof, and shalt burn with fire the city... and it shall be an heap for ever; it shall not be built again* (Deuteronomy 13:16). *And they brake down the image of Baal, and brake down the house of Baal, and made it a draught house unto this day* (2 Kings 10:27) — the house of the idol is unmade and never rebuilt, the Torah''s perpetual heap turned to a place of filth.'),

    -- THREAD 3: Baal torn down but the calves kept (1 Kings 12, 2 Kings 17)
    ('canon','2-kings',10,29,'canon','1-kings',12,28,'free',
      E'*Whereupon the king took counsel, and made two calves of gold, and said unto them, It is too much for you to go up to Jerusalem: behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (1 Kings 12:28). *Howbeit from the sins of Jeroboam the son of Nebat... Jehu departed not from after them, to wit, the golden calves that were in Beth-el, and that were in Dan* (2 Kings 10:29) — Jehu tears down Baal yet bows to the same calves Jeroboam cast; the half-reform leaves the founding idolatry standing.'),
    ('canon','2-kings',10,29,'canon','1-kings',12,29,'free',
      E'*And he set the one in Beth-el, and the other put he in Dan* (1 Kings 12:29). *...the golden calves that were in Beth-el, and that were in Dan* (2 Kings 10:29) — the very two shrines named at the kingdom''s tearing are the two Jehu refuses to tear down; the north never returns from Jeroboam''s breach.'),
    ('canon','2-kings',10,31,'canon','1-kings',12,30,'free',
      E'*And this thing became a sin: for the people went to worship before the one, even unto Dan* (1 Kings 12:30). *But Jehu took no heed to walk in the law of Yahuah Elohim (the LORD God) of Yashar''el (Israel) with all his heart: for he departed not from the sins of Jeroboam* (2 Kings 10:31) — to keep the calves is to refuse to walk in the Torah with all the heart; the half-hearted obedience is no return to Yahuah at all.'),
    ('canon','2-kings',10,31,'canon','2-kings',17,16,'free',
      E'*And they left all the commandments of Yahuah (LORD) their Elohim (God), and made them molten images, even two calves... and served Baal* (2 Kings 17:16). Jehu''s refusal — *he departed not from the sins of Jeroboam, which made Yashar''el (Israel) to sin* (2 Kings 10:31) — is the same calf-sin the historian names as the root of the northern exile: the breach left unmended ripens into scattering.'),

    -- THREAD 4: Yahuah began to cut Yashar'el short (Hosea 1, 2 Kings 17)
    ('canon','2-kings',10,30,'canon','hosea',1,4,'free',
      E'*And Yahuah (LORD) said unto him, Call his name Jezreel; for yet a little while, and I will avenge the blood of Jezreel upon the house of Jehu, and will cause to cease the kingdom of the house of Yashar''el (Israel)* (Hosea 1:4). Yahuah rewards Jehu — *thy children of the fourth generation shall sit on the throne of Yashar''el (Israel)* (2 Kings 10:30) — yet the bloodshed at Jezreel is itself called to account; even the avenger''s excess is judged, the throne granted and the blood requited together.'),
    ('canon','2-kings',10,32,'canon','hosea',1,5,'free',
      E'*And it shall come to pass at that day, that I will break the bow of Yashar''el (Israel) in the valley of Jezreel* (Hosea 1:5). *In those days Yahuah (LORD) began to cut Yashar''el (Israel) short: and Hazael smote them in all the coasts of Yashar''el (Israel)* (2 Kings 10:32) — the cutting-short begins under Jehu''s own house; the bow that broke at Jezreel is already bending under Hazael''s hand.'),
    ('canon','2-kings',10,32,'canon','2-kings',17,18,'free',
      E'*Therefore Yahuah (LORD) was very angry with Yashar''el (Israel), and removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18). The shrinking that *began to cut Yashar''el (Israel) short* (2 Kings 10:32) under Hazael runs to its end here: the borders smitten become the people removed, the north handed to Assyria.'),
    ('canon','2-kings',10,32,'canon','2-kings',17,23,'free',
      E'*Until Yahuah (LORD) removed Yashar''el (Israel) out of his sight, as he had said by all his servants the prophets. So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day* (2 Kings 17:23). *In those days Yahuah (LORD) began to cut Yashar''el (Israel) short* (2 Kings 10:32) — the half-hearted house that kept the calves is the house that is at last carried away; the scattering of the northern stick begins in Jehu''s very reign.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-10-nothing-of-the-word-of-yahuah-shall-fall-to-the-earth',
  E'Nothing of the word of Yahuah shall fall to the earth — the word against Ahab fulfilled',
  E'Standing over the seventy heads heaped at the gate, Jehu makes the meaning of the slaughter plain: *Know now that there shall fall unto the earth nothing of the word of Yahuah (LORD), which Yahuah (LORD) spake concerning the house of Ahab: for Yahuah (LORD) hath done that which he spake by his servant Elijah* (2 Kings 10:10). The word being performed was spoken in Naboth''s stolen vineyard: *Behold, I will bring evil upon thee, and will take away thy posterity, and will cut off from Ahab him that pisseth against the wall, and him that is shut up and left in Yashar''el (Israel)* (1 Kings 21:21), and *Him that dieth of Ahab in the city the dogs shall eat; and him that dieth in the field shall the fowls of the air eat* (1 Kings 21:24). The deed answers the word phrase for phrase: *So Jehu slew all that remained of the house of Ahab in Jezreel, and all his great men, and his kinsfolks, and his priests, until he left him none remaining* (2 Kings 10:11) — the *take away thy posterity* become the *none remaining* — and *he slew all that remained unto Ahab in Samaria, till he had destroyed him, according to the saying of Yahuah (LORD), which he spake to Elijah* (2 Kings 10:17). The avenger himself was named at Horeb before he drew the sword: *him that escapeth from the sword of Jehu shall Elisha slay* (1 Kings 19:17). The word of Yahuah does not return void; not one syllable spoken against Ahab''s house falls to the ground.',
  sv.verse_id, ev.verse_id, 'free', 38725
  FROM _s343_2ki10_lookup sv, _s343_2ki10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=10 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-10-thus-jehu-destroyed-baal-out-of-yashar-el',
  E'Thus Jehu destroyed Baal out of Yashar''el — the herem on the house of the idol',
  E'By a ruse Jehu gathers every Baal-worshipper into one house: *call unto me all the prophets of Baal, all his servants, and all his priests... for I have a great sacrifice to do to Baal... But Jehu did it in subtilty, to the intent that he might destroy the worshippers of Baal* (2 Kings 10:19). The strategy is the Torah''s own procedure against the idolatrous city — *Then shalt thou enquire, and make search, and ask diligently; and, behold, if it be truth, and the thing certain, that such abomination is wrought among you* (Deuteronomy 13:14) — and its sentence: *Thou shalt surely smite the inhabitants of that city with the edge of the sword, destroying it utterly* (Deuteronomy 13:15). So it falls: *they smote them with the edge of the sword; and the guard and the captains cast them out* (2 Kings 10:25), and the house itself is unmade and never rebuilt — *they brake down the image of Baal, and brake down the house of Baal, and made it a draught house unto this day* (2 Kings 10:27), the perpetual heap of *it shall not be built again... it shall be an heap for ever* (Deuteronomy 13:16). *Thus Jehu destroyed Baal out of Yashar''el (Israel)* (2 Kings 10:28). And the remnant that never bowed is vindicated: *Yet I have left me seven thousand in Yashar''el (Israel), all the knees which have not bowed unto Baal* (1 Kings 19:18) — Yahuah''s preserved seven thousand outlast the idol they refused.',
  sv.verse_id, ev.verse_id, 'free', 38728
  FROM _s343_2ki10_lookup sv, _s343_2ki10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=10 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-10-baal-torn-down-but-the-calves-kept',
  E'Baal torn down but the calves kept — the half-hearted obedience that does not return to Torah',
  E'The reform stops short. Having destroyed Baal, Jehu will not tear down the older idol: *Howbeit from the sins of Jeroboam the son of Nebat, who made Yashar''el (Israel) to sin, Jehu departed not from after them, to wit, the golden calves that were in Beth-el, and that were in Dan* (2 Kings 10:29). Those are the very calves Jeroboam cast at the kingdom''s tearing — *the king took counsel, and made two calves of gold, and said unto them... behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (1 Kings 12:28), *and he set the one in Beth-el, and the other put he in Dan* (1 Kings 12:29), *and this thing became a sin* (1 Kings 12:30). The historian renders the verdict on the half-reform plainly: *But Jehu took no heed to walk in the law of Yahuah Elohim (the LORD God) of Yashar''el (Israel) with all his heart: for he departed not from the sins of Jeroboam, which made Yashar''el (Israel) to sin* (2 Kings 10:31). To keep the calves is to refuse to walk in the Torah *with all his heart* — and this is no minor omission, for it is the same calf-sin the historian later names as the root of the exile: *they left all the commandments of Yahuah (LORD) their Elohim (God), and made them molten images, even two calves... and served Baal* (2 Kings 17:16). The Torah is the inheritance; the calf is the breach left unmended, and the breach scatters the north.',
  sv.verse_id, ev.verse_id, 'free', 38731
  FROM _s343_2ki10_lookup sv, _s343_2ki10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=10 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-10-yahuah-began-to-cut-yashar-el-short',
  E'Yahuah began to cut Yashar''el short — even the avenger''s house judged, the north toward exile',
  E'Yahuah rewards the judgment Jehu executed: *Because thou hast done well in executing that which is right in mine eyes, and hast done unto the house of Ahab according to all that was in mine heart, thy children of the fourth generation shall sit on the throne of Yashar''el (Israel)* (2 Kings 10:30). Yet the same blood is requited: Hosea names a son for the valley of slaughter — *Call his name Jezreel; for yet a little while, and I will avenge the blood of Jezreel upon the house of Jehu, and will cause to cease the kingdom of the house of Yashar''el (Israel)* (Hosea 1:4), *and... I will break the bow of Yashar''el (Israel) in the valley of Jezreel* (Hosea 1:5). The instrument is rewarded for the deed and answerable for the excess in the same breath. And the decline begins in his own reign: *In those days Yahuah (LORD) began to cut Yashar''el (Israel) short: and Hazael smote them in all the coasts of Yashar''el (Israel)* (2 Kings 10:32). The borders smitten become the people removed — *Therefore Yahuah (LORD) was very angry with Yashar''el (Israel), and removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18) — *until Yahuah (LORD) removed Yashar''el (Israel) out of his sight... So was Yashar''el (Israel) carried away out of their own land to Assyria* (2 Kings 17:23). The half-hearted house that kept the calves is the house at last scattered: the cutting-short of the northern stick begins here, with Jehu.',
  sv.verse_id, ev.verse_id, 'free', 38734
  FROM _s343_2ki10_lookup sv, _s343_2ki10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=10 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Kings 21:21 — *I will... take away thy posterity, and will cut off from Ahab*: the word Jehu fulfils.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-nothing-of-the-word-of-yahuah-shall-fall-to-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Kings 21:24 — *Him that dieth of Ahab in the city the dogs shall eat*: the sentence Jehu carries out.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-nothing-of-the-word-of-yahuah-shall-fall-to-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 10:11 -> 1 Kings 21:21 — *until he left him none remaining* answers *take away thy posterity*.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=11
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-nothing-of-the-word-of-yahuah-shall-fall-to-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 10:11 -> 1 Kings 19:17 — *him that escapeth from the sword of Jehu shall Elisha slay*: the avenger commissioned at Horeb.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=11
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-nothing-of-the-word-of-yahuah-shall-fall-to-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Kings 10:17 -> 1 Kings 21:24 — *according to the saying of Yahuah... which he spake to Elijah*: the fulfilment named outright.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=17
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-nothing-of-the-word-of-yahuah-shall-fall-to-the-earth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 10:19 -> Deuteronomy 13:14 — *enquire, and make search, and ask diligently*: the ruse flushes out the abomination.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=19
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-thus-jehu-destroyed-baal-out-of-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 10:25 -> Deuteronomy 13:15 — *smite... with the edge of the sword, destroying it utterly*: the herem executed.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=25
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-thus-jehu-destroyed-baal-out-of-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 10:27 -> Deuteronomy 13:16 — *it shall be an heap for ever; it shall not be built again*: the house of Baal a draught house.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=27
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-thus-jehu-destroyed-baal-out-of-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 10:28 -> 1 Kings 19:18 — *seven thousand... all the knees which have not bowed unto Baal*: the remnant vindicated.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=28
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-thus-jehu-destroyed-baal-out-of-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 10:29 -> 1 Kings 12:28 — *made two calves of gold... behold thy gods, O Yashar''el*: the idol Jehu keeps.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=29
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-baal-torn-down-but-the-calves-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 10:29 -> 1 Kings 12:29 — *the one in Beth-el, and the other... in Dan*: the two shrines Jehu leaves standing.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=29
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-baal-torn-down-but-the-calves-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 10:31 -> 1 Kings 12:30 — *this thing became a sin*: keeping the calves is refusing to walk in the Torah with all the heart.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=31
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-baal-torn-down-but-the-calves-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 10:31 -> 2 Kings 17:16 — *made them molten images, even two calves... and served Baal*: the same calf-sin that scatters the north.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=31
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-baal-torn-down-but-the-calves-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 10:30 -> Hosea 1:4 — *I will avenge the blood of Jezreel upon the house of Jehu*: even the rewarded avenger judged.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=30
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-yahuah-began-to-cut-yashar-el-short'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 10:32 -> Hosea 1:5 — *I will break the bow of Yashar''el in the valley of Jezreel*: the cutting-short under Jehu''s house.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=32
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-yahuah-began-to-cut-yashar-el-short'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 10:32 -> 2 Kings 17:18 — *removed them out of his sight: there was none left but... Yahudah only*: the borders smitten become the people removed.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=32
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-yahuah-began-to-cut-yashar-el-short'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 10:32 -> 2 Kings 17:23 — *carried away out of their own land to Assyria*: the northern stick scattered, begun in Jehu''s reign.'
  FROM cross_reference_threads t
  JOIN _s343_2ki10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=10 AND sv.verse_number=32
  JOIN _s343_2ki10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-10-yahuah-began-to-cut-yashar-el-short'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session343 — 2 Kings cross-references complete.'
