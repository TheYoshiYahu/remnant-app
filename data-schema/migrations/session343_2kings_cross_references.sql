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

-- ----- fragment: minion_2-kings_11.sql (2 Kings 11) -----
--
-- Chapter: 2 Kings 11 — Athaliah destroys the seed royal; Joash hidden six years
--          in the house of Yahuah; crowned with the testimony; covenant renewed,
--          Baal cast down. The most dangerous hour of the Davidic covenant: the
--          serpent's seed-war reaching to extinguish the line that carries Messiah,
--          and Yahuah keeping His sworn word though the lamp hangs by one hidden child.
-- Tag: 2ki11    View: _s343_2ki11_lookup    Sort band: 38750, step 3
--
-- 2 Kings 11 coverage:
--   v.1  (Athaliah destroyed all the seed royal)
--        NT:     none warranted (carried forward via the seed-line threads below)
--        Extras: none warranted
--        Tanakh: Genesis 3:15 (serpent's seed vs woman's seed); 1 Kings 11:39
--                (I will afflict the seed of David, but not for ever);
--                2 Chronicles 22:10 (the parallel — seed royal of the house of Yahudah)
--   v.2-3 (Jehosheba hid Joash in the house of Yahuah six years)
--        NT:     none warranted (Davidic-throne fulfillment carried in v.12 thread)
--        Extras: none warranted
--        Tanakh: 2 Samuel 7:15-16 (my mercy shall not depart; house established for ever);
--                Psalm 132:17 (a lamp ordained for mine anointed);
--                Jeremiah 33:17 (David shall never want a man to sit upon the throne);
--                2 Chronicles 22:11-12 (the parallel — hid in the house of Elohim six years)
--   v.4-11 (Jehoiada's oath, sabbath-courses, David's spears, the guard)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 2 Chronicles 23:1-10 (parallel, recorded in covenant-thread member where load-bearing)
--   v.12 (crown, testimony, anointed, Elohim save the king)
--        NT:     Luke 1:32-33 (the throne of his father David; reign over the house of Jacob for ever)
--        Extras: none warranted
--        Tanakh: 2 Chronicles 23:11 (the parallel crowning); Psalm 132:18 (his crown shall flourish)
--   v.13-16 (Athaliah cried Treason; slain)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (narrative; gathered under the seed/covenant arcs)
--   v.17-18 (covenant between Yahuah and king and people; house of Baal broken down)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 2 Chronicles 23:16-17 (the parallel covenant + Baal cast down);
--                1 Kings 11:11 (Solomon: thou hast not kept my covenant and my statutes)
--   v.19-21 (Joash on the throne; the city quiet)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (resolution of the throne-restored arc)
--
-- Threads (slug + target libraries):
--   2-kings-11-the-serpent-strikes-the-seed-royal       (Tanakh: Genesis, 1 Kings, 2 Chronicles)
--   2-kings-11-the-lamp-hidden-in-the-house-of-yahuah    (Tanakh: 2 Samuel, Psalm, Jeremiah, 2 Chronicles)
--   2-kings-11-the-crown-the-testimony-elohim-save-the-king (Tanakh: 2 Chronicles, Psalm; NT: Luke)
--   2-kings-11-the-covenant-renewed-and-baal-cast-down   (Tanakh: 2 Chronicles, 1 Kings)
--
-- Framework-load-bearing framing: Athaliah is the Ahab-poison (Gen 3:15 serpent-seed)
-- reaching south to extinguish the Davidic line that carries the Messiah; the line
-- hangs by one hidden infant, yet Yahuah's sworn word (2 Sam 7 / Ps 132 / Jer 33)
-- cannot fail — the lamp is not put out. v.12 the crown + the testimony (the Torah-scroll)
-- weaves FORWARD to Luke 1:32-33, the throne of David given to the Formed Son who
-- reigns over the house of Jacob for ever. NT used only where the type genuinely fills.

CREATE TEMP VIEW _s343_2ki11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== B. cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the serpent strikes the seed royal
    ('canon','2-kings',11,1,'canon','genesis',3,15,'free',
      E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). When Athaliah *arose and destroyed all the seed royal* (2 Kings 11:1), this is the serpent''s seed-war reaching its sharpest point: the Ahab-poison out of the north, married into Yahudah (Judah), striking to extinguish the very line that carries the woman''s Seed. Kill the seed royal and the promise to David dies with it — so the heel-bruising fury falls on the cradle.'),
    ('canon','2-kings',11,1,'canon','1-kings',11,39,'free',
      E'*And I will for this afflict the seed of David, but not for ever* (1 Kings 11:39). Yahuah (LORD) had already set the bound on every blow against the line: affliction, yes — extinction, never. So when Athaliah *destroyed all the seed royal* (2 Kings 11:1), the word stands over her like a wall: *but not for ever*. The seed is afflicted to one hidden infant, and there it holds.'),
    ('canon','2-kings',11,1,'canon','2-chronicles',22,10,'free',
      E'*But when Athaliah the mother of Ahaziah saw that her son was dead, she arose and destroyed all the seed royal of the house of Yahudah (Judah)* (2 Chronicles 22:10). The Chronicler names the target plainly — *the seed royal of the house of Yahudah (Judah)*, the covenant line, not a throne in the abstract. The same hand, the same hour, the same seed-war recorded twice so it cannot be missed.'),
    -- THREAD 2: the lamp hidden in the house of Yahuah
    ('canon','2-kings',11,2,'canon','2-chronicles',22,11,'free',
      E'*But Jehoshabeath, the daughter of the king, took Joash the son of Ahaziah, and stole him from among the king''s sons that were slain... hid him from Athaliah, so that she slew him not* (2 Chronicles 22:11). The parallel adds that Jehoshabeath was *the wife of Jehoiada the priest* — the seed is carried into the priest''s keeping. One stolen child stands between the serpent and the throne, and *he was not slain* (2 Kings 11:2).'),
    ('canon','2-kings',11,3,'canon','2-chronicles',22,12,'free',
      E'*And he was with them hid in the house of Elohim (God) six years: and Athaliah reigned over the land* (2 Chronicles 22:12). For six years the lawful king is an infant hidden in the sanctuary while the usurper sits the throne — the promise alive but unseen, *hid in the house of Yahuah (LORD)* (2 Kings 11:3). Yahuah''s word does not fail when it is hidden; it waits.'),
    ('canon','2-kings',11,3,'canon','2-samuel',7,15,'free',
      E'*But my mercy shall not depart away from him, as I took it from Saul, whom I put away before thee. And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever* (2 Samuel 7:15-16). This is the oath that holds the line through Athaliah''s six years. Joash *hid in the house of Yahuah (LORD)* (2 Kings 11:3) is that *for ever* surviving by a thread — the mercy that *shall not depart* keeping one breath of David alive.'),
    ('canon','2-kings',11,3,'canon','psalms',132,17,'free',
      E'*There will I make the horn of David to bud: I have ordained a lamp for mine anointed* (Psalm 132:17). The *lamp* is the never-extinguished Davidic line, and in 2 Kings 11 it is one flame cupped in the temple''s dark — Joash *hid in the house of Yahuah (LORD)* (2 Kings 11:3). Athaliah reigns above; the lamp Yahuah *ordained* burns below, and it is not put out.'),
    ('canon','2-kings',11,3,'canon','jeremiah',33,17,'free',
      E'*For thus saith Yahuah (LORD); David shall never want a man to sit upon the throne of the house of Yashar''el (Israel)* (Jeremiah 33:17). This is the covenant the hidden child secures. *And he was with her hid in the house of Yahuah (LORD) six years* (2 Kings 11:3) — the one man, the only man, kept so the throne would *never want* an heir. The serpent cannot break a covenant that Yahuah binds to *day and night* (Jeremiah 33:20-21).'),
    -- THREAD 3: the crown, the testimony, Elohim save the king
    ('canon','2-kings',11,12,'canon','2-chronicles',23,11,'free',
      E'*Then they brought out the king''s son, and put upon him the crown, and gave him the testimony, and made him king. And Jehoiada and his sons anointed him, and said, Elohim (God) save the king* (2 Chronicles 23:11). The parallel confirms the act point for point — crown, *testimony* (the Torah-scroll laid on the king), anointing — the rightful seed brought out of hiding into the open and acknowledged, as in *they made him king, and anointed him* (2 Kings 11:12).'),
    ('canon','2-kings',11,12,'canon','psalms',132,18,'free',
      E'*His enemies will I clothe with shame: but upon himself shall his crown flourish* (Psalm 132:18). The crowning in the temple is the psalm enacted: Athaliah''s reign ends in *shame* and the sword, while *the crown upon him* (2 Kings 11:12) — set on the rescued child — *shall flourish*. The lamp ordained in the verse before (Psalm 132:17) is now crowned.'),
    ('canon','2-kings',11,12,'canon','luke',1,32,'free',
      E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:32-33). Every rescue of the Davidic line — Joash crowned with *the testimony* (2 Kings 11:12) — was the line kept open toward this Heir. The Formed Son receives *the throne of his father David* from the Father; the lamp that survived Athaliah burns at last without end.'),
    -- THREAD 4: the covenant renewed and Baal cast down
    ('canon','2-kings',11,17,'canon','2-chronicles',23,16,'free',
      E'*And Jehoiada made a covenant between him, and between all the people, and between the king, that they should be the LORD''S people* (2 Chronicles 23:16). The parallel records the same covenant-renewal: with the rightful king restored, the people are bound again to be *Yahuah (LORD)''s people* (2 Kings 11:17). Restoration of the throne and renewal of the covenant are one act — the king set right, the people turned back.'),
    ('canon','2-kings',11,18,'canon','2-chronicles',23,17,'free',
      E'*Then all the people went to the house of Baal, and brake it down, and brake his altars and his images in pieces, and slew Mattan the priest of Baal before the altars* (2 Chronicles 23:17). The covenant renewed bears immediate fruit: the Baal-shrine that Athaliah''s house had raised is torn down to its altars, exactly as *all the people of the land went into the house of Baal, and brake it down* (2 Kings 11:18). Turning to Yahuah means casting down the rival altar.'),
    ('canon','2-kings',11,17,'canon','1-kings',11,11,'free',
      E'*Wherefore Yahuah (LORD) said unto Solomon, Forasmuch as this is done of thee, and thou hast not kept my covenant and my statutes, which I have commanded thee, I will surely rend the kingdom from thee* (1 Kings 11:11). The covenant Jehoiada renews — *that they should be the LORD''S people* (2 Kings 11:17) — is the very thing Solomon''s strange gods had broken, splitting the two houses. The Torah is never the curse; breaking it is. Here Yahudah (Judah) is bound back to the *covenant and... statutes* a king once forsook.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== C. threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-11-the-serpent-strikes-the-seed-royal',
       E'The serpent strikes the seed royal',
       E'*And when Athaliah the mother of Ahaziah saw that her son was dead, she arose and destroyed all the seed royal* (2 Kings 11:1). This is the most dangerous hour the Davidic covenant ever faced — and it is the serpent''s seed-war coming to a head. *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). Athaliah is the daughter of Ahab, the northern poison married into the house of Yahudah (Judah); kill the seed royal and you kill the line that carries the woman''s Seed. The Chronicler names the target without flinching: *she arose and destroyed all the seed royal of the house of Yahudah (Judah)* (2 Chronicles 22:10). Yet the heel-bruise has a bound set on it long before: *And I will for this afflict the seed of David, but not for ever* (1 Kings 11:39). Afflicted — to one hidden child — never extinguished.',
       sv.verse_id, ev.verse_id, 'free', 38750
  FROM _s343_2ki11_lookup sv, _s343_2ki11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=11 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-11-the-lamp-hidden-in-the-house-of-yahuah',
       E'The lamp hidden in the house of Yahuah',
       E'One infant stands between the serpent and the throne. *But Jehosheba... took Joash the son of Ahaziah, and stole him from among the king''s sons which were slain... so that he was not slain. And he was with her hid in the house of Yahuah (LORD) six years* (2 Kings 11:2-3). The parallel adds that the rescuer was *the wife of Jehoiada the priest* (2 Chronicles 22:11) — the seed carried into the sanctuary''s keeping while *Athaliah reigned over the land* (2 Chronicles 22:12). For six years the lawful king is a hidden child and the usurper sits the throne; the promise is alive but unseen. This is exactly the oath surviving by a thread: *But my mercy shall not depart away from him... thy throne shall be established for ever* (2 Samuel 7:15-16). It is the lamp not put out: *There will I make the horn of David to bud: I have ordained a lamp for mine anointed* (Psalm 132:17). And it is the covenant the serpent cannot break: *David shall never want a man to sit upon the throne of the house of Yashar''el (Israel)* (Jeremiah 33:17) — secured, in this hour, by one breath of David hidden in the house of Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 38753
  FROM _s343_2ki11_lookup sv, _s343_2ki11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=11 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-11-the-crown-the-testimony-elohim-save-the-king',
       E'The crown, the testimony, Elohim save the king',
       E'In the seventh year the hidden seed is brought into the open and crowned. *And he brought forth the king''s son, and put the crown upon him, and gave him the testimony; and they made him king, and anointed him; and they clapped their hands, and said, Elohim (God) save the king* (2 Kings 11:12). The *testimony* is the Torah-scroll laid upon the king — the throne and the covenant-instruction handed over together, confirmed in the parallel: *put upon him the crown, and gave him the testimony, and made him king. And Jehoiada and his sons anointed him* (2 Chronicles 23:11). The crowning enacts the psalm: *His enemies will I clothe with shame: but upon himself shall his crown flourish* (Psalm 132:18) — the lamp ordained one verse earlier now set with a crown. And every such rescue of the line bends FORWARD to the Heir it was kept for: *Yahuah Elohim (the Lord God) shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:32-33). The Formed Son receives David''s throne from the Father; the lamp that survived Athaliah burns without end.',
       sv.verse_id, ev.verse_id, 'free', 38756
  FROM _s343_2ki11_lookup sv, _s343_2ki11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=11 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-11-the-covenant-renewed-and-baal-cast-down',
       E'The covenant renewed and Baal cast down',
       E'With the rightful king restored, the people are bound back to Yahuah. *And Jehoiada made a covenant between Yahuah (LORD) and the king and the people, that they should be the LORD''S people* (2 Kings 11:17). The parallel records the same renewal: *Jehoiada made a covenant between him, and between all the people, and between the king, that they should be the LORD''S people* (2 Chronicles 23:16). And the covenant renewed casts down the rival altar at once: *And all the people of the land went into the house of Baal, and brake it down; his altars and his images brake they in pieces thoroughly* (2 Kings 11:18); *Then all the people went to the house of Baal, and brake it down... and slew Mattan the priest of Baal before the altars* (2 Chronicles 23:17). This is the restoration of the very thing a king once forsook: *thou hast not kept my covenant and my statutes, which I have commanded thee, I will surely rend the kingdom from thee* (1 Kings 11:11). The Torah is never the curse; breaking it is. Here Yahudah (Judah) is turned back, the king set right and the people bound again to the covenant and the statutes.',
       sv.verse_id, ev.verse_id, 'free', 38759
  FROM _s343_2ki11_lookup sv, _s343_2ki11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=11 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ===== D. thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Between thy seed and her seed; it shall bruise thy head* (Genesis 3:15) — Athaliah''s assault on the seed royal is the serpent''s seed-war striking the line that carries the woman''s Seed.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-serpent-strikes-the-seed-royal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will for this afflict the seed of David, but not for ever* (1 Kings 11:39) — the bound set on every blow against the line; afflicted to one hidden child, never extinguished.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-serpent-strikes-the-seed-royal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*She arose and destroyed all the seed royal of the house of Yahudah (Judah)* (2 Chronicles 22:10) — the parallel names the covenant line as the target, twice recorded so it cannot be missed.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=1
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=22 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-serpent-strikes-the-seed-royal'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Jehoshabeath... stole him from among the king''s sons that were slain* (2 Chronicles 22:11) — the rescuer is the priest''s wife; the seed carried into the sanctuary''s keeping.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=2
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=22 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-lamp-hidden-in-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He was with them hid in the house of Elohim (God) six years: and Athaliah reigned over the land* (2 Chronicles 22:12) — the lawful king an infant in the sanctuary while the usurper sits the throne.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=22 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-lamp-hidden-in-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*My mercy shall not depart away from him... thy throne shall be established for ever* (2 Samuel 7:15-16) — the oath that holds the line through Athaliah''s six years.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-lamp-hidden-in-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I have ordained a lamp for mine anointed* (Psalm 132:17) — the never-extinguished Davidic line, here one flame cupped in the temple''s dark.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-lamp-hidden-in-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*David shall never want a man to sit upon the throne of the house of Yashar''el (Israel)* (Jeremiah 33:17) — the covenant the one hidden child secures; the serpent cannot break what Yahuah binds to day and night.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=3
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-lamp-hidden-in-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Put upon him the crown, and gave him the testimony... Jehoiada and his sons anointed him* (2 Chronicles 23:11) — the parallel confirms crown, Torah-testimony, and anointing point for point.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=12
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=23 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-crown-the-testimony-elohim-save-the-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Upon himself shall his crown flourish* (Psalm 132:18) — the crowning enacts the psalm; the lamp ordained one verse earlier is now set with a crown.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=12
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=132 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-crown-the-testimony-elohim-save-the-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The throne of his father David... he shall reign over the house of Jacob for ever* (Luke 1:32-33) — every rescue of the line bent FORWARD to the Heir; the Formed Son receives David''s throne from the Father.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=12
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-crown-the-testimony-elohim-save-the-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Jehoiada made a covenant... that they should be the LORD''S people* (2 Chronicles 23:16) — the parallel renewal; the people bound again to Yahuah with the rightful king restored.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=17
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=23 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-covenant-renewed-and-baal-cast-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*All the people went to the house of Baal, and brake it down... slew Mattan the priest of Baal* (2 Chronicles 23:17) — the renewed covenant casts down the rival altar at once.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=18
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=23 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-covenant-renewed-and-baal-cast-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou hast not kept my covenant and my statutes... I will surely rend the kingdom from thee* (1 Kings 11:11) — the covenant renewed is the very thing a king once forsook; the Torah is never the curse, breaking it is.'
  FROM cross_reference_threads t
  JOIN _s343_2ki11_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=11 AND sv.verse_number=17
  JOIN _s343_2ki11_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-11-the-covenant-renewed-and-baal-cast-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_12.sql (2 Kings 12) -----
-- 2 Kings 12 — Jehoash/Joash: right under Jehoiada's instruction; the repair of the house;
--   the chest and the faithful workmen; the temple treasure given to the enemy.
-- TAG: 2ki12   VIEW: _s343_2ki12_lookup   SORT BAND: base 38775 step 3 (38775,38778,38781,38784)
--
-- 2 Kings 12 coverage:
--   v.2 (right all his days wherein Jehoiada instructed him):
--        NT:     Matthew 23:35 (Zacharias son of Barachias slain between temple and altar — Joash's turning after Jehoiada died)
--        Extras: none warranted
--        Tanakh: 2 Chronicles 24:2 (right all the days of Jehoiada), 24:17-22 (forsook the house, slew Zechariah son of Jehoiada)
--   v.3 (high places not taken away): folded into thread 4 framing; Tanakh 2 Chr 24:18 (served groves and idols)
--   v.4-5 (money of the dedicated things / atonement money / repair the breaches):
--        NT:     none warranted (the giving-for-the-house weave goes to thread 3)
--        Extras: none warranted
--        Tanakh: Exodus 30:12-16 (the ransom/atonement money, half a shekel), 2 Kings 22:5-6 (Josiah's same repair), 2 Chronicles 24:4-6 (Joash minded to repair / Moses' collection)
--   v.9 (the chest with a hole bored in the lid set beside the altar):
--        NT:     Mark 12:41-44 (the widow's two mites cast into the treasury), Luke 21:1-4 (same)
--        Extras: none warranted
--        Tanakh: 2 Chronicles 24:8-11 (the chest made and set at the gate, the people cast in)
--   v.15 (they reckoned not with the men, for they dealt faithfully):
--        NT:     (woven in thread 3 via the widow's all-her-living faithfulness)
--        Extras: none warranted
--        Tanakh: 2 Kings 22:7 (no reckoning made, because they dealt faithfully — Josiah's workmen)
--   v.11-14 (the money laid out to carpenters, masons, hewers — given to the workmen): 2 Chr 24:12-13
--   v.16 (trespass/sin money was the priests'): folded — none warranted
--   v.17-18 (Hazael threatens; Joash strips the temple gold to buy him off):
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 2 Chronicles 24:23-24 (the host of Syria came, executed judgment against Joash)
--   v.20-21 (servants conspire and slay Joash): folded into thread 1 (the end of the turning) — 2 Chr 24:25
--
-- THREADS (4):
--   2-kings-12-right-while-the-priest-instructed-him-and-the-turning-after  [Tanakh + NT(Matthew)]  free
--   2-kings-12-the-money-of-the-dedicated-things-to-repair-the-house        [Tanakh(Exodus,2Kings,2Chronicles)]  free
--   2-kings-12-the-chest-by-the-altar-and-the-widows-mite                   [Tanakh(2Chronicles) + NT(Mark,Luke)]  free
--   2-kings-12-the-hallowed-gold-given-to-the-enemy                         [Tanakh(2Chronicles)]  free
--
-- All members canon → every thread tier_required 'free'.

CREATE TEMP VIEW _s343_2ki12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: right while the priest instructed him, and the turning after
    ('canon','2-kings',12,2,'canon','2-chronicles',24,2,'free',
      E'*And Joash did that which was right in the sight of Yahuah (LORD) all the days of Jehoiada the priest* (2 Chronicles 24:2). The Chronicler reads 2 Kings 12:2 plainly — *Jehoash did that which was right in the sight of Yahuah (LORD) all his days wherein Jehoiada the priest instructed him*: his uprightness is measured by the godly priest standing over him, not by a heart settled in the covenant. The qualifier is the warning.'),
    ('canon','2-kings',12,2,'canon','2-chronicles',24,17,'free',
      E'*Now after the death of Jehoiada came the princes of Yahudah (Judah), and made obeisance to the king. Then the king hearkened unto them* (2 Chronicles 24:17). The moment the priest who *instructed him* (2 Kings 12:2) is gone, Joash turns — *they left the house of Yahuah Elohim (the LORD God) of their fathers, and served groves and idols* (2 Chronicles 24:18). Right under guidance is not yet right in the heart.'),
    ('canon','2-kings',12,2,'canon','2-chronicles',24,22,'free',
      E'*Thus Joash the king remembered not the kindness which Jehoiada his father had done to him, but slew his son. And when he died, he said, Yahuah (LORD) look upon it, and require it* (2 Chronicles 24:22). The king who once was *right... wherein Jehoiada the priest instructed him* (2 Kings 12:2) repays the priest by stoning the priest''s son Zechariah in the court of the house — the full measure of the turning after the godly instructor is taken away.'),
    ('canon','2-kings',12,2,'canon','matthew',23,35,'free',
      E'*That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar* (Matthew 23:35). Yahusha (Jesus) names the very murder 2 Chronicles 24 records — Joash, *right... wherein Jehoiada the priest instructed him* (2 Kings 12:2), later *stoned* Zechariah son of Jehoiada *in the court of the house of Yahuah (LORD)*; the blood between temple and altar runs from this turned king down to the generation that kills the prophets and the Master himself.'),
    -- Thread 2: the money of the dedicated things to repair the house
    ('canon','2-kings',12,4,'canon','exodus',30,13,'free',
      E'*This they shall give, every one that passeth among them that are numbered, half a shekel after the shekel of the sanctuary... an half shekel shall be the offering of Yahuah (LORD)* (Exodus 30:13). Joash''s *money of every one that passeth the account, the money that every man is set at* (2 Kings 12:4) is this census ransom of Torah — the half-shekel each man owed for the service of the house.'),
    ('canon','2-kings',12,4,'canon','exodus',30,16,'free',
      E'*And thou shalt take the atonement money of the children of Yashar''el (Israel), and shalt appoint it for the service of the tabernacle of the congregation; that it may be a memorial unto the children of Yashar''el (Israel) before Yahuah (LORD), to make an atonement for your souls* (Exodus 30:16). The *atonement money* of Torah is exactly what Joash gathers in 2 Kings 12:4 — *all the money that cometh into any man''s heart to bring into the house of Yahuah (LORD)* — appointed, as Moses commanded, for the service and upkeep of the house.'),
    ('canon','2-kings',12,5,'canon','2-chronicles',24,5,'free',
      E'*Go out unto the cities of Yahudah (Judah), and gather of all Yashar''el (Israel) money to repair the house of your Elohim (God) from year to year, and see that ye hasten the matter. Howbeit the Levites hastened it not* (2 Chronicles 24:5). The Chronicler tells the same charge Joash gives in 2 Kings 12:5 — *let them repair the breaches of the house* — and the same delay that forced the king to find another way.'),
    ('canon','2-kings',12,5,'canon','2-kings',22,5,'free',
      E'*And let them deliver it into the hand of the doers of the work, that have the oversight of the house of Yahuah (LORD)... to repair the breaches of the house* (2 Kings 22:5). Josiah, generations later, repeats Joash''s very pattern — the people''s silver gathered by the keepers of the door, given to the workmen to *repair the breaches of the house* (2 Kings 12:5). The house of Yahuah (LORD) is kept in repair by the freewill giving of the covenant people.'),
    -- Thread 3: the chest by the altar and the widow's mite
    ('canon','2-kings',12,9,'canon','2-chronicles',24,8,'free',
      E'*And at the king''s commandment they made a chest, and set it without at the gate of the house of Yahuah (LORD)* (2 Chronicles 24:8). The Chronicler records the same chest Jehoiada *bored a hole in the lid of* and *set... beside the altar* in 2 Kings 12:9 — and *all the princes and all the people rejoiced, and brought in, and cast into the chest, until they had made an end* (2 Chronicles 24:10). The freewill offering of the whole people fills the house''s repair.'),
    ('canon','2-kings',12,9,'canon','mark',12,42,'free',
      E'*And there came a certain poor widow, and she threw in two mites, which make a farthing* (Mark 12:42). Yahusha (Jesus) *sat over against the treasury, and beheld how the people cast money into the treasury* (Mark 12:41) — the same kind of altar-side collection Joash''s chest gathered in 2 Kings 12:9, where *the priests that kept the door put therein all the money that was brought into the house of Yahuah (LORD)*. The giving for the house, from king''s scribe to poor widow, is one thread.'),
    ('canon','2-kings',12,9,'canon','mark',12,44,'free',
      E'*For all they did cast in of their abundance; but she of her want did cast in all that she had, even all her living* (Mark 12:44). The widow''s gift into the temple treasury is the heart of *all the money that cometh into any man''s heart to bring into the house of Yahuah (LORD)* (2 Kings 12:4) — measured not by amount but by the whole-hearted giving the chest beside the altar (2 Kings 12:9) was made to receive.'),
    ('canon','2-kings',12,9,'canon','luke',21,4,'free',
      E'*For all these have of their abundance cast in unto the offerings of Elohim (God): but she of her penury hath cast in all the living that she had* (Luke 21:4). Luke sets the widow''s *two mites* against *the rich men casting their gifts into the treasury* (Luke 21:1) — the same freewill giving for the house that filled Joash''s chest (2 Kings 12:9); the offering Yahuah (LORD) weighs is the heart, not the heap.'),
    ('canon','2-kings',12,15,'canon','2-kings',22,7,'free',
      E'*Howbeit there was no reckoning made with them of the money that was delivered into their hand, because they dealt faithfully* (2 Kings 22:7). Josiah''s workmen are trusted on the same ground as Joash''s — *they reckoned not with the men, into whose hand they delivered the money to be bestowed on workmen: for they dealt faithfully* (2 Kings 12:15). Honest stewardship of the people''s offering for the house needs no audit.'),
    ('canon','2-kings',12,11,'canon','2-chronicles',24,12,'free',
      E'*And the king and Jehoiada gave it to such as did the work of the service of the house of Yahuah (LORD), and hired masons and carpenters to repair the house of Yahuah (LORD)* (2 Chronicles 24:12). The same hands at the same labour as 2 Kings 12:11 — *they laid it out to the carpenters and builders, that wrought upon the house of Yahuah (LORD)*; the people''s silver becomes timber, stone, and a restored house.'),
    -- Thread 4: the hallowed gold given to the enemy
    ('canon','2-kings',12,18,'canon','2-chronicles',24,23,'free',
      E'*And it came to pass at the end of the year, that the host of Syria came up against him: and they came to Yahudah (Judah) and Jerusalem, and destroyed all the princes of the people from among the people, and sent all the spoil of them unto the king of Damascus* (2 Chronicles 24:23). The Chronicler shows what 2 Kings 12:18 cost — Joash *took all the hallowed things... and all the gold that was found in the treasures of the house of Yahuah (LORD)... and sent it to Hazael*; stripping the house to buy off Syria bought only a brief reprieve before judgment came.'),
    ('canon','2-kings',12,18,'canon','2-chronicles',24,24,'free',
      E'*For the army of the Syrians came with a small company of men, and Yahuah (LORD) delivered a very great host into their hand, because they had forsaken Yahuah Elohim (the LORD God) of their fathers. So they executed judgment against Joash* (2 Chronicles 24:24). The temple gold Joash *sent... to Hazael king of Syria* (2 Kings 12:18) could not save a king who had forsaken Yahuah (LORD); the small Syrian company overthrows the great host — the cost of compromise is judgment, not safety.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-12-right-while-the-priest-instructed-him-and-the-turning-after',
       E'Right While the Priest Instructed Him — and the Turning After',
       E'2 Kings 12 sets a quiet trap in a single qualifier: *And Jehoash did that which was right in the sight of Yahuah (LORD) all his days wherein Jehoiada the priest instructed him* (2 Kings 12:2). His uprightness is bounded by the godly priest standing over him. The Chronicler reads it the same way — *And Joash did that which was right in the sight of Yahuah (LORD) all the days of Jehoiada the priest* (2 Chronicles 24:2) — and then tells what 2 Kings only hints: *Now after the death of Jehoiada came the princes of Yahudah (Judah), and made obeisance to the king. Then the king hearkened unto them* (2 Chronicles 24:17), and *they left the house of Yahuah Elohim (the LORD God) of their fathers, and served groves and idols* (2 Chronicles 24:18). The turning ends in blood: *Thus Joash the king remembered not the kindness which Jehoiada his father had done to him, but slew his son. And when he died, he said, Yahuah (LORD) look upon it, and require it* (2 Chronicles 24:22). Yahusha (Jesus) gathers up that requiring — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar* (Matthew 23:35). Right under instruction is not yet right in the heart; the covenant looks for the Torah written within, not borrowed from the priest who stands beside you.',
       sv.verse_id, ev.verse_id, 'free', 38775
  FROM _s343_2ki12_lookup sv, _s343_2ki12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=12 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-12-the-money-of-the-dedicated-things-to-repair-the-house',
       E'The Money of the Dedicated Things, to Repair the House',
       E'Joash charges the priests: *All the money of the dedicated things that is brought into the house of Yahuah (LORD), even the money of every one that passeth the account, the money that every man is set at, and all the money that cometh into any man''s heart to bring into the house of Yahuah (LORD)* (2 Kings 12:4) — *let them repair the breaches of the house, wheresoever any breach shall be found* (2 Kings 12:5). The *money of every one that passeth the account* is the census ransom of Torah: *This they shall give, every one that passeth among them that are numbered, half a shekel after the shekel of the sanctuary... an half shekel shall be the offering of Yahuah (LORD)* (Exodus 30:13), and *thou shalt take the atonement money of the children of Yashar''el (Israel), and shalt appoint it for the service of the tabernacle of the congregation... to make an atonement for your souls* (Exodus 30:16). The atonement money funds the house. The Chronicler tells the same charge and the same delay — *Go out unto the cities of Yahudah (Judah), and gather of all Yashar''el (Israel) money to repair the house of your Elohim (God) from year to year... Howbeit the Levites hastened it not* (2 Chronicles 24:5). And the pattern outlives Joash: Josiah does the very same — *let them give it to the doers of the work which is in the house of Yahuah (LORD), to repair the breaches of the house* (2 Kings 22:5). The house of Yahuah (LORD) is sustained by the covenant people''s giving, the appointed Torah offering turned to timber and stone.',
       sv.verse_id, ev.verse_id, 'free', 38778
  FROM _s343_2ki12_lookup sv, _s343_2ki12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=12 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-12-the-chest-by-the-altar-and-the-widows-mite',
       E'The Chest by the Altar, and the Widow''s Mite',
       E'When the priests had not repaired the house, *Jehoiada the priest took a chest, and bored a hole in the lid of it, and set it beside the altar, on the right side as one cometh into the house of Yahuah (LORD): and the priests that kept the door put therein all the money that was brought into the house of Yahuah (LORD)* (2 Kings 12:9). The Chronicler shows the people''s joy in it — *And at the king''s commandment they made a chest, and set it without at the gate of the house of Yahuah (LORD)* (2 Chronicles 24:8); *and all the princes and all the people rejoiced, and brought in, and cast into the chest, until they had made an end* (2 Chronicles 24:10). The silver became timber and stone: *they laid it out to the carpenters and builders, that wrought upon the house of Yahuah (LORD)* (2 Kings 12:11), and the workmen needed no audit — *they reckoned not with the men, into whose hand they delivered the money to be bestowed on workmen: for they dealt faithfully* (2 Kings 12:15), the same trust Josiah''s workmen are given, *because they dealt faithfully* (2 Kings 22:7). And the chest beside the altar reaches forward to the treasury where Yahusha (Jesus) *beheld how the people cast money into the treasury* (Mark 12:41): *And there came a certain poor widow, and she threw in two mites, which make a farthing* (Mark 12:42); *she of her want did cast in all that she had, even all her living* (Mark 12:44); *she of her penury hath cast in all the living that she had* (Luke 21:4). From the rejoicing princes to the penniless widow, the giving for the house is one thread — and the offering Yahuah (LORD) weighs is the whole heart, not the heap.',
       sv.verse_id, ev.verse_id, 'free', 38781
  FROM _s343_2ki12_lookup sv, _s343_2ki12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=12 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-12-the-hallowed-gold-given-to-the-enemy',
       E'The Hallowed Gold Given to the Enemy',
       E'The same house Joash laboured to repair he later strips to save himself: *Then Hazael king of Syria went up, and fought against Gath, and took it: and Hazael set his face to go up to Jerusalem* (2 Kings 12:17), and *Jehoash king of Yahudah (Judah) took all the hallowed things that Jehoshaphat, and Jehoram, and Ahaziah, his fathers, kings of Yahudah (Judah), had dedicated, and his own hallowed things, and all the gold that was found in the treasures of the house of Yahuah (LORD), and in the king''s house, and sent it to Hazael king of Syria: and he went away from Jerusalem* (2 Kings 12:18). The repaired house is emptied of its hallowed gold to buy off the enemy — and the Chronicler shows the bargain bought nothing. *And it came to pass at the end of the year, that the host of Syria came up against him... and sent all the spoil of them unto the king of Damascus* (2 Chronicles 24:23); *For the army of the Syrians came with a small company of men, and Yahuah (LORD) delivered a very great host into their hand, because they had forsaken Yahuah Elohim (the LORD God) of their fathers. So they executed judgment against Joash* (2 Chronicles 24:24). The king who turned from Yahuah (LORD) cannot purchase safety with the temple''s gold; the small company overthrows the great host. Compromise costs the dedicated things and still ends in judgment.',
       sv.verse_id, ev.verse_id, 'free', 38784
  FROM _s343_2ki12_lookup sv, _s343_2ki12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=12 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- MEMBERS — Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Chronicles 24:2 — *right... all the days of Jehoiada the priest*: the Chronicler reads the same qualifier as 2 Kings 12:2.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=24 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-right-while-the-priest-instructed-him-and-the-turning-after'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 24:17 — after Jehoiada dies the king hearkens to the princes; the instruction removed, the heart turns.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=24 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-right-while-the-priest-instructed-him-and-the-turning-after'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Chronicles 24:22 — Joash slays Jehoiada''s son Zechariah; *Yahuah (LORD) look upon it, and require it*.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=24 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-right-while-the-priest-instructed-him-and-the-turning-after'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Matthew 23:35 — *Zacharias son of Barachias, whom ye slew between the temple and the altar*: Yahusha (Jesus) names the blood Joash''s turning shed.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-right-while-the-priest-instructed-him-and-the-turning-after'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS — Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 30:13 — the half-shekel *of every one that passeth among them that are numbered*: Joash''s *money that every man is set at*.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=4
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-the-money-of-the-dedicated-things-to-repair-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Exodus 30:16 — the *atonement money... appointed... for the service of the tabernacle*: the Torah offering that funds the house.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=4
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=30 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-the-money-of-the-dedicated-things-to-repair-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Chronicles 24:5 — the same charge to gather and repair, and the Levites'' delay that 2 Kings 12:6 records.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=5
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=24 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-the-money-of-the-dedicated-things-to-repair-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 22:5 — Josiah repeats Joash''s pattern: the people''s silver to the workmen to *repair the breaches of the house*.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=5
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=22 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-the-money-of-the-dedicated-things-to-repair-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS — Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Chronicles 24:8 — the same chest set at the gate of the house; the people''s collection for the repair.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=9
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=24 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-the-chest-by-the-altar-and-the-widows-mite'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 24:12 — the silver laid out to masons and carpenters: 2 Kings 12:11 made vivid.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=11
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=24 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-the-chest-by-the-altar-and-the-widows-mite'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 22:7 — Josiah''s workmen trusted without reckoning, *because they dealt faithfully*: 2 Kings 12:15''s honest stewardship.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=15
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=22 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-the-chest-by-the-altar-and-the-widows-mite'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Mark 12:42 — the poor widow''s two mites cast into the treasury; the altar-side giving 2 Kings 12:9 received, carried forward.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=9
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-the-chest-by-the-altar-and-the-widows-mite'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Mark 12:44 — *she... did cast in all that she had, even all her living*: the whole-hearted giving the chest was made to receive.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=9
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-the-chest-by-the-altar-and-the-widows-mite'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Luke 21:4 — *she of her penury hath cast in all the living that she had*: the offering Yahuah (LORD) weighs is the heart, not the heap.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=9
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-the-chest-by-the-altar-and-the-widows-mite'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS — Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Chronicles 24:23 — the host of Syria came and spoiled Jerusalem; what stripping the house to buy off Hazael (2 Kings 12:18) bought.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=18
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=24 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-the-hallowed-gold-given-to-the-enemy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 24:24 — a small Syrian company overthrows a great host *because they had forsaken Yahuah*; the gold could not save the turned king.'
  FROM cross_reference_threads t
  JOIN _s343_2ki12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=12 AND sv.verse_number=18
  JOIN _s343_2ki12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=24 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-12-the-hallowed-gold-given-to-the-enemy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_13.sql (2 Kings 13) -----
-- 2 Kings 13 — Jehoahaz & Jehoash of Yashar'el; Yahuah's covenant-mercy to the northern
--   house for the fathers' sakes; Elisha's death-bed arrows (half-hearted faith limits the
--   victory); Elisha's bones revive a dead man (the resurrection sign).
-- TAG: 2ki13   VIEW: _s343_2ki13_lookup   SORT BAND: 38800 step 3 (38800,38803,38806,...)
--
-- 2 Kings 13 coverage:
--   v.4-5  (Jehoahaz besought Yahuah; Yahuah gave a saviour)
--          NT:     Romans 11:1-2 (hath Elohim cast away his people? Elohim forbid)
--          Extras: none warranted (covered under v.23 thread)
--          Tanakh: Hosea 1:6-7 (Lo-ruhamah / mercy on Yahudah) — northern-house mercy
--   v.14   (Joash weeps over Elisha — O my father, chariot of Yashar'el)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Kings 2:12 (Elisha's identical cry over Elijah — the prophetic mantle)
--   v.15-19 (the arrow of Yahuah's deliverance; smote thrice and stayed; the half victory)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Leviticus 26:7-8 (five chase a hundred — the covenant victory forfeited)
--   v.20-21 (Elisha dies; the dead man touches his bones and revives, stands on his feet)
--          NT:     John 11:25 (I am the resurrection and the life)
--          Extras: Ecclesiasticus 48:13-14 (after his death his body prophesied)
--          Tanakh: Ezekiel 37:5-6 (I will cause breath to enter, ye shall live);
--                  Daniel 12:2 (many that sleep in the dust shall awake)
--   v.23   (Yahuah had compassion for his covenant with Abraham, Isaac, Jacob; not cast off as yet)
--          NT:     Romans 11:28-29 (beloved for the fathers' sakes; gifts and calling without repentance)
--          Extras: none warranted
--          Tanakh: Leviticus 26:42,44 (I will remember my covenant; I will not cast them away);
--                  Hosea 1:9-10 (Lo-ammi → ye are the sons of the living Elohim)
--
-- THREADS:
--   2-kings-13-the-covenant-mercy-to-the-northern-house-for-the-fathers-sakes
--        [canon: romans, leviticus, hosea]  tier free  — Rom 11 two-house mercy frame
--   2-kings-13-the-arrow-of-yahuahs-deliverance-the-half-hearted-faith-that-limits-the-victory
--        [canon: leviticus, 2-kings]  tier free  — covenant victory forfeited by halfheartedness
--   2-kings-13-the-dead-man-revived-by-elishas-bones-the-life-that-conquers-death
--        [canon: john, ezekiel, daniel; extras: ecclesiasticus]  tier EXTRAS  — resurrection sign

CREATE TEMP VIEW _s343_2ki13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===================== cross_references =====================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: covenant-mercy to the northern house for the fathers' sakes
    ('canon','2-kings',13,5,'canon','romans',11,1,'free',E'When Jehoahaz besought Yahuah (LORD) in his oppression, *(And Yahuah (LORD) gave Yashar''el (Israel) a saviour, so that they went out from under the hand of the Syrians: and the children of Yashar''el (Israel) dwelt in their tents, as beforetime.* (2 Kings 13:5) — deliverance comes to the sinning northern house, unearned. Sha''ul answers the same question across the centuries: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* (Romans 11:1). The saviour Yahuah raises up for Ephraim is the standing proof that he has not cast off his people.'),
    ('canon','2-kings',13,4,'canon','romans',11,2,'free',E'*And Jehoahaz besought Yahuah (LORD), and Yahuah (LORD) hearkened unto him: for he saw the oppression of Yashar''el (Israel)* (2 Kings 13:4) — Yahuah hearkens to the northern house he foreknew. *Elohim (God) hath not cast away his people which he foreknew. Wot ye not what the scripture saith of Elias? how he maketh intercession to Elohim (God) against Yashar''el (Israel)* (Romans 11:2). The same Yashar''el of Elijah''s and Elisha''s day is the people Sha''ul says Yahuah foreknew and will never cast away.'),
    ('canon','2-kings',13,23,'canon','romans',11,28,'free',E'*And Yahuah (LORD) was gracious unto them, and had compassion on them, and had respect unto them, because of his covenant with Abraham, Isaac, and Jacob, and would not destroy them, neither cast he them from his presence as yet.* (2 Kings 13:23). Sha''ul names the very ground of that mercy: *As concerning the gospel, they are enemies for your sakes: but as touching the election, they are beloved for the fathers'' sakes.* (Romans 11:28). The mercy to idolatrous Ephraim rests not on their worth but on Abraham, Isaac, and Jacob.'),
    ('canon','2-kings',13,23,'canon','romans',11,29,'free',E'Yahuah *would not destroy them, neither cast he them from his presence as yet* (2 Kings 13:23) — the covenant holds though the house keeps sinning. *For the gifts and calling of Elohim (God) are without repentance.* (Romans 11:29). The patriarchal covenant is not revoked by Ephraim''s rebellion; the calling stands because Yahuah does not change his mind toward the seed.'),
    ('canon','2-kings',13,23,'canon','leviticus',26,42,'free',E'Yahuah had compassion *because of his covenant with Abraham, Isaac, and Jacob* (2 Kings 13:23) — and the Torah had already named that triple covenant as the floor of mercy: *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember; and I will remember the land.* (Leviticus 26:42). Kings narrates what Sinai had promised — the fathers'' covenant remembered even in exile-judgment.'),
    ('canon','2-kings',13,23,'canon','leviticus',26,44,'free',E'*And would not destroy them, neither cast he them from his presence as yet* (2 Kings 13:23). The Torah is the promise it fulfils: *And yet for all that, when they be in the land of their enemies, I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God).* (Leviticus 26:44). Yahuah keeping the northern house in their sin is Sinai''s covenant-clause holding firm.'),
    ('canon','2-kings',13,5,'canon','hosea',1,7,'free',E'Yahuah *gave Yashar''el (Israel) a saviour* (2 Kings 13:5) — deliverance not by their strength but by his hand. In the same era Hosea hears: *But I will have mercy upon the house of Yahudah (Judah), and will save them by Yahuah (LORD) their Elohim (God), and will not save them by bow, nor by sword, nor by battle, by horses, nor by horsemen.* (Hosea 1:7). The salvation Yahuah works is his own doing, not the arm of flesh.'),
    ('canon','2-kings',13,23,'canon','hosea',1,9,'free',E'Yahuah *would not destroy them, neither cast he them from his presence as yet* (2 Kings 13:23). Hosea, prophesying in the days of this very Jeroboam''s house, names the divorce that the *as yet* foreshadows: *Then said Elohim (God), Call his name Lo-ammi: for ye are not my people, and I will not be your Elohim (God).* (Hosea 1:9). The northern house is being given over — but not yet utterly, for the covenant still holds.'),
    ('canon','2-kings',13,23,'canon','hosea',1,10,'free',E'The mercy that *would not destroy them* (2 Kings 13:23) opens onto Hosea''s regathering promise to the scattered northern house: *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God).* (Hosea 1:10). The covenant kept *as yet* in Kings is the seed of the full ingathering.'),

    -- THREAD 2: the arrow of Yahuah's deliverance; the half-hearted faith that limits victory
    ('canon','2-kings',13,19,'canon','leviticus',26,8,'free',E'Elisha is wroth: *Thou shouldest have smitten five or six times; then hadst thou smitten Syria till thou hadst consumed it: whereas now thou shalt smite Syria but thrice.* (2 Kings 13:19). The number is the covenant''s own promise of overwhelming victory: *And five of you shall chase an hundred, and an hundred of you shall put ten thousand to flight: and your enemies shall fall before you by the sword.* (Leviticus 26:8). Joash''s half-hearted three strokes forfeit the lopsided victory the Torah had pledged to the faithful.'),
    ('canon','2-kings',13,17,'canon','leviticus',26,7,'free',E'*The arrow of the LORD''S deliverance, and the arrow of deliverance from Syria: for thou shalt smite the Syrians in Aphek, till thou have consumed them.* (2 Kings 13:17). The deliverance offered is the Torah''s blessing for obedience: *And ye shall chase your enemies, and they shall fall before you by the sword.* (Leviticus 26:7). The arrow is Yahuah''s pledged victory — but it must be taken to the full.'),
    ('canon','2-kings',13,14,'canon','2-kings',2,12,'free',E'Joash weeps over the dying Elisha: *O my father, my father, the chariot of Yashar''el (Israel), and the horsemen thereof.* (2 Kings 13:14) — the very cry Elisha himself raised when Elijah was taken: *And Elisha saw it, and he cried, My father, my father, the chariot of Yashar''el (Israel), and the horsemen thereof.* (2 Kings 2:12). The prophet who inherited the mantle is mourned in the same words he spoke; the true defence of the house is the man of Elohim, not its fifty horsemen.'),

    -- THREAD 3: the dead man revived by Elisha's bones — the life that conquers death
    ('canon','2-kings',13,21,'canon','john',11,25,'extras',E'*And when the man was let down, and touched the bones of Elisha, he revived, and stood up on his feet.* (2 Kings 13:21) — life flows even from a dead prophet''s bones. The Formed Son names the power behind that sign: *Yahusha (Jesus) said unto her, I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live* (John 11:25). The bones that raised the dead man point to the One in whom life itself stands, who calls Lazarus from the grave.'),
    ('canon','2-kings',13,21,'canon','ezekiel',37,5,'extras',E'A dead man *touched the bones of Elisha, he revived, and stood up on his feet* (2 Kings 13:21). Ezekiel sees the same wonder enlarged over the whole scattered house: *Thus saith Adonai Yahuah (the Lord GOD) unto these bones; Behold, I will cause breath to enter into you, and ye shall live* (Ezekiel 37:5). The single revived man is a token of the dry bones of all Yashar''el rising to live.'),
    ('canon','2-kings',13,21,'canon','ezekiel',37,6,'extras',E'The man *revived, and stood up on his feet* (2 Kings 13:21) — flesh and breath returning to a corpse. Ezekiel hears the promise spelled out: *And I will lay sinews upon you, and will bring up flesh upon you, and cover you with skin, and put breath in you, and ye shall live; and ye shall know that I am Yahuah (LORD).* (Ezekiel 37:6). What Elisha''s bones did for one, Yahuah will do for the whole house of Yashar''el.'),
    ('canon','2-kings',13,21,'canon','daniel',12,2,'extras',E'The dead man stood up on his feet at the touch of Elisha''s bones (2 Kings 13:21) — a foretaste of the great waking: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). The reviving sign in Elisha''s grave reaches forward to the resurrection of the dust at the time of the end.'),
    ('canon','2-kings',13,21,'apocrypha','ecclesiasticus',48,13,'extras',E'*And when the man was let down, and touched the bones of Elisha, he revived, and stood up on his feet.* (2 Kings 13:21). Ben Sira praises this very wonder: *No word could overcome him; and after his death his body prophesied.* (Ecclesiasticus 48:13) — Eliseus'' (Elisha''s) corpse still bearing the power of Yahuah, a witness in the second-temple library to the prophet whose bones gave life.'),
    ('canon','2-kings',13,20,'apocrypha','ecclesiasticus',48,14,'extras',E'*And Elisha died, and they buried him.* (2 Kings 13:20) — yet his grave was no end. *He did wonders in his life, and at his death were his works marvellous.* (Ecclesiasticus 48:14). The wonders did not cease at his burial; the dead man raised at his bones is the marvellous work wrought even in death.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===================== threads =====================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-13-the-covenant-mercy-to-the-northern-house-for-the-fathers-sakes',
       E'The covenant-mercy to the northern house, for the fathers'' sakes',
       E'Jehoahaz''s Yashar''el (Israel) is steeped in the sins of Jeroboam, ground down under Hazael of Syria — and still, when the king cries out, mercy comes. *And Jehoahaz besought Yahuah (LORD), and Yahuah (LORD) hearkened unto him: for he saw the oppression of Yashar''el (Israel)* (2 Kings 13:4), and *(And Yahuah (LORD) gave Yashar''el (Israel) a saviour, so that they went out from under the hand of the Syrians* (13:5). The reason is named outright at the chapter''s close: *And Yahuah (LORD) was gracious unto them, and had compassion on them, and had respect unto them, because of his covenant with Abraham, Isaac, and Jacob, and would not destroy them, neither cast he them from his presence as yet.* (13:23). This is the two-house heart of the apparatus: the northern house is not spared for its righteousness — it has none — but for the patriarchal covenant. The Torah had already pledged exactly this: *Then will I remember my covenant with Jacob, and also my covenant with Isaac, and also my covenant with Abraham will I remember* (Leviticus 26:42), and *I will not cast them away, neither will I abhor them, to destroy them utterly, and to break my covenant with them: for I am Yahuah (LORD) their Elohim (God)* (Leviticus 26:44). In Hosea''s parallel oracle from the same era, the divorce is real — *Call his name Lo-ammi: for ye are not my people* (Hosea 1:9) — yet *not cast off as yet*, for the regathering already stands written: *in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). Sha''ul gathers it all into one answer: *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1); *Elohim (God) hath not cast away his people which he foreknew* (11:2); *as touching the election, they are beloved for the fathers'' sakes* (11:28); *For the gifts and calling of Elohim (God) are without repentance* (11:29). The saviour given to Ephraim in 2 Kings 13 is the standing proof of a covenant that never lapses.',
       sv.verse_id, ev.verse_id, 'free', 38800
  FROM _s343_2ki13_lookup sv, _s343_2ki13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=13 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-13-the-arrow-of-yahuahs-deliverance-the-half-hearted-faith-that-limits-the-victory',
       E'The arrow of Yahuah''s deliverance — the half-hearted faith that limits the victory',
       E'Joash comes weeping to the dying Elisha — *O my father, my father, the chariot of Yashar''el (Israel), and the horsemen thereof* (2 Kings 13:14) — the very cry Elisha himself had raised when Elijah was caught up: *My father, my father, the chariot of Yashar''el (Israel), and the horsemen thereof* (2 Kings 2:12). The prophet, not the kingdom''s fifty horsemen, is the true strength of the house. Then Elisha lays the king''s hands on the bow and declares, *The arrow of the LORD''S deliverance, and the arrow of deliverance from Syria: for thou shalt smite the Syrians in Aphek, till thou have consumed them* (13:17). But when told to smite the ground, *he smote thrice, and stayed* (13:18), and *the man of Elohim (God) was wroth with him, and said, Thou shouldest have smitten five or six times; then hadst thou smitten Syria till thou hadst consumed it: whereas now thou shalt smite Syria but thrice* (13:19). The covenant had pledged a victory out of all proportion to the faithful: *ye shall chase your enemies, and they shall fall before you by the sword* (Leviticus 26:7), and *five of you shall chase an hundred, and an hundred of you shall put ten thousand to flight* (Leviticus 26:8). The deliverance was Yahuah''s to give in full; Joash''s halting three strokes measure out a half-hearted faith, and the victory shrinks to fit it.',
       sv.verse_id, ev.verse_id, 'free', 38803
  FROM _s343_2ki13_lookup sv, _s343_2ki13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=13 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-13-the-dead-man-revived-by-elishas-bones-the-life-that-conquers-death',
       E'The dead man revived by Elisha''s bones — the life that conquers death',
       E'*And Elisha died, and they buried him* (2 Kings 13:20) — but the prophet''s grave is not an end. *And it came to pass, as they were burying a man, that, behold, they spied a band of men; and they cast the man into the sepulchre of Elisha: and when the man was let down, and touched the bones of Elisha, he revived, and stood up on his feet* (13:21). Life flows from the dead prophet''s very bones; death is overruled. The second-temple library remembered the wonder: *No word could overcome him; and after his death his body prophesied* (Ecclesiasticus 48:13); *He did wonders in his life, and at his death were his works marvellous* (Ecclesiasticus 48:14). Ezekiel sees the single revived man enlarged over the whole scattered house: *Behold, I will cause breath to enter into you, and ye shall live* (Ezekiel 37:5), *and I will lay sinews upon you, and will bring up flesh upon you... and ye shall live* (37:6) — the dry bones of all Yashar''el rising. Daniel carries it to the consummation: *many of them that sleep in the dust of the earth shall awake, some to everlasting life* (Daniel 12:2). And the Formed Son names the power standing behind every such sign: *I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live* (John 11:25). The man who stood up on his feet at Elisha''s bones is a first token of the One who is himself the resurrection, and of the whole house that shall live again.',
       sv.verse_id, ev.verse_id, 'extras', 38806
  FROM _s343_2ki13_lookup sv, _s343_2ki13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=13 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ===================== thread_members =====================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Romans 11:1 — *Hath Elohim (God) cast away his people? Elohim (God) forbid* — the saviour given to Ephraim is the standing proof.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=5
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-covenant-mercy-to-the-northern-house-for-the-fathers-sakes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Romans 11:2 — *Elohim (God) hath not cast away his people which he foreknew* — the Yashar''el of Elijah''s day, foreknown.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=4
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-covenant-mercy-to-the-northern-house-for-the-fathers-sakes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Romans 11:28 — *beloved for the fathers'' sakes* — the very ground 2 Kings 13:23 names.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=23
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-covenant-mercy-to-the-northern-house-for-the-fathers-sakes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Romans 11:29 — *the gifts and calling of Elohim (God) are without repentance* — the covenant unrevoked.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=23
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-covenant-mercy-to-the-northern-house-for-the-fathers-sakes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Leviticus 26:42 — *I will remember my covenant with Jacob... Isaac... Abraham* — Sinai''s floor of mercy.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=23
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-covenant-mercy-to-the-northern-house-for-the-fathers-sakes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Leviticus 26:44 — *I will not cast them away... nor break my covenant* — the promise 13:23 keeps.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=23
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-covenant-mercy-to-the-northern-house-for-the-fathers-sakes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Hosea 1:7 — *I will... save them by Yahuah (LORD) their Elohim (God), and... not by bow* — salvation by his own hand.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=5
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-covenant-mercy-to-the-northern-house-for-the-fathers-sakes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Hosea 1:9 — *Lo-ammi: for ye are not my people* — the divorce the *as yet* foreshadows.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=23
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-covenant-mercy-to-the-northern-house-for-the-fathers-sakes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'Hosea 1:10 — *Ye are the sons of the living Elohim (God)* — the regathering the kept covenant seeds.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=23
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-covenant-mercy-to-the-northern-house-for-the-fathers-sakes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 2:12 — Elisha''s own cry over Elijah, *My father, my father, the chariot of Yashar''el* — the mantle mourned in the same words.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=14
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=2 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-arrow-of-yahuahs-deliverance-the-half-hearted-faith-that-limits-the-victory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Leviticus 26:7 — *ye shall chase your enemies, and they shall fall before you* — the deliverance the arrow pledged.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=17
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-arrow-of-yahuahs-deliverance-the-half-hearted-faith-that-limits-the-victory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Leviticus 26:8 — *five of you shall chase an hundred* — the lopsided victory forfeited by smiting only thrice.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=19
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-arrow-of-yahuahs-deliverance-the-half-hearted-faith-that-limits-the-victory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Ecclesiasticus 48:13 — *after his death his body prophesied* — the library''s witness to Elisha''s life-giving bones.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=20
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-dead-man-revived-by-elishas-bones-the-life-that-conquers-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Ecclesiasticus 48:13 — *No word could overcome him; and after his death his body prophesied* — death no end to the prophet''s power.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-dead-man-revived-by-elishas-bones-the-life-that-conquers-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Ezekiel 37:5 — *I will cause breath to enter into you, and ye shall live* — the one revived man enlarged over the whole house.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-dead-man-revived-by-elishas-bones-the-life-that-conquers-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Ezekiel 37:6 — *I will lay sinews upon you, and will bring up flesh upon you... and ye shall live* — the dry bones of all Yashar''el rising.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-dead-man-revived-by-elishas-bones-the-life-that-conquers-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake* — the reviving sign reaching to the resurrection.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-dead-man-revived-by-elishas-bones-the-life-that-conquers-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'John 11:25 — *I am the resurrection, and the life* — the Formed Son standing behind the bones that gave life.'
  FROM cross_reference_threads t
  JOIN _s343_2ki13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s343_2ki13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-13-the-dead-man-revived-by-elishas-bones-the-life-that-conquers-death'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_14.sql (2 Kings 14) -----
--
-- Chapter: 2 Kings 14 — Amaziah of Yahudah does right, executes his father's
--   murderers but spares THEIR CHILDREN according to the Torah; smites Edom, grows
--   proud, challenges Jehoash of Yashar'el and is answered with the thistle-and-cedar
--   parable, then defeated, Jerusalem's wall broken and the temple plundered; Jeroboam II
--   of Yashar'el restores the northern border by the word of Yahuah spoken through Jonah —
--   Yahuah's undeserved mercy, the name of Yashar'el not yet blotted out from under heaven.
-- Tag: 2ki14   View: _s343_2ki14_lookup   Sort band: 38825 step 3 (38825, 38828, 38831, 38834)
--
-- 2 Kings 14 coverage:
--   v.1-4  (Amaziah's accession, did right yet not like David, high places remain)
--        NT:     none warranted (narrative bridge)
--        Extras: none warranted
--        Tanakh: 2 Chronicles 25:1-2 (the parallel account — bound at v.5-6) — covered in THREAD 1
--   v.5-6  he slew his father's murderers but NOT their children, *according unto that which
--          is written in the book of the law of Moses* — the Torah QUOTED as binding standard
--        NT:     none warranted (the weave is the Torah-source and the prophets who carry the
--                individual-responsibility principle forward; no NT add stronger than the Tanakh chain)
--        Extras: none warranted
--        Tanakh: Deuteronomy 24:16 (the very statute quoted); 2 Chronicles 25:4 (parallel, cites the
--                same Torah); Ezekiel 18:20 (the soul that sinneth, it shall die); Jeremiah 31:30
--                (every one shall die for his own iniquity) -> THREAD 1
--   v.7    smote Edom in the valley of salt — bridge into the pride; none warranted alone
--   v.8-10 the thistle-and-cedar parable; *thine heart hath lifted thee up*; pride that meddles to its hurt
--        NT:     none warranted (Tanakh-internal parable weave; the proverb of pride before the fall
--                is itself Tanakh wisdom)
--        Extras: none warranted
--        Tanakh: Judges 9:8-15 (Jotham's parable of the trees and the bramble — the kingly-fable form);
--                Proverbs 16:18 (pride goeth before destruction); Amos 6:13 (vain boast of strength) -> THREAD 2
--   v.11-14 Yahudah put to the worse, wall of Jerusalem broken from Ephraim-gate, temple plundered
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 2 Chronicles 25:20 (it was of Elohim, that he might deliver them, because they sought
--                the gods of Edom) — the defeat as judgment; folded into THREAD 2 prose, anchored at v.10
--   v.15-24 burial notices, Azariah made king, Jeroboam II's evil reign — narrative; none warranted alone
--   v.25   Jeroboam restored the coast of Yashar'el *according to the word of Yahuah... by the hand of
--          his servant Jonah the son of Amittai the prophet* — mercy under a wicked king
--        NT:     none warranted (the Jonah-mercy weave is carried by Jonah's own book and Hosea; the NT
--                "sign of Jonas" is the fish/resurrection, a different node — not bound here)
--        Extras: none warranted
--        Tanakh: Jonah 1:1 (the same Jonah son of Amittai, the word of Yahuah came to him) -> THREAD 3
--   v.26-27 Yahuah saw the affliction of Yashar'el... said NOT that he would blot out the name of
--          Yashar'el from under heaven — undeserved mercy, the name preserved before the scattering
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Hosea 1:6 (I will no more have mercy upon the house of Yashar'el) + Hosea 11:8 (How
--                shall I give thee up, Ephraim?) — the patient mercy that stays the blotting-out;
--                Amos 6:1 (woe to them at ease in Zion) — the prosperity restored that Amos rebukes -> THREAD 3 & THREAD 4
--   v.28-29 the rest of Jeroboam's acts, Damascus and Hamath recovered, Zachariah reigns — none warranted alone
--
-- Threads:
--   2-kings-14-the-fathers-shall-not-be-put-to-death-for-the-children (free; Tanakh: Deuteronomy 24, 2 Chronicles 25, Ezekiel 18, Jeremiah 31)
--   2-kings-14-the-thistle-that-was-in-lebanon-and-the-cedar (free; Tanakh: Judges 9, Proverbs 16, Amos 6)
--   2-kings-14-restored-the-coast-by-the-hand-of-his-servant-jonah (free; Tanakh: Jonah 1, Amos 6)
--   2-kings-14-he-would-not-blot-out-the-name-of-yashar-el-from-under-heaven (free; Tanakh: Hosea 1, Hosea 11)
--
-- Contested/load-bearing framing:
--   * v.6 the king OBEYS the written Torah and the narrator QUOTES it: *according unto that which is
--     written in the book of the law of Moses, wherein Yahuah commanded* — Deuteronomy 24:16 is the
--     binding standard a righteous king rules BY, not a defunct code. The individual-responsibility
--     principle (each dies for his OWN sin) is carried forward by Ezekiel 18:20 and Jeremiah 31:30 —
--     Torah affirmed, never the curse; the Torah is the inheritance the throne is measured against.
--   * v.9-10 the thistle-and-cedar: pride brought low, the kingly-fable form of Jotham (Judges 9), the
--     wisdom proverb *pride goeth before destruction* (Proverbs 16:18) — and the defeat is named in the
--     parallel as Yahuah's own deliverance into judgment (2 Chronicles 25:20). No people attacked; the
--     SYSTEM of self-exalting pride is dismantled — the victim-not-enemy lens on Amaziah's own ruin.
--   * v.25-27 the heart of the chapter for the framework: Yahuah restores the NORTH (Yashar'el / the
--     ten-tribe stick) under WICKED Jeroboam II, by the word of JONAH — undeserved mercy. *Yahuah said
--     not that he would blot out the name of Yashar'el from under heaven* — the same name Hosea will say
--     is for a season Lo-ruhamah ("no mercy", Hosea 1:6) and Lo-ammi, yet whose blotting-out Yahuah's
--     own heart recoils from (*How shall I give thee up, Ephraim?* Hosea 11:8). This is the patient
--     mercy BEFORE the Assyrian scattering — the two-house God keeping the northern stick alive to gather
--     it again. The prosperity restored is the very ease Amos rebukes (Amos 6:1).

CREATE TEMP VIEW _s343_2ki14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the fathers shall not be put to death for the children (Deuteronomy 24, 2 Chronicles 25, Ezekiel 18, Jeremiah 31)
    ('canon','2-kings',14,6,'canon','deuteronomy',24,16,'free',
      E'*The fathers shall not be put to death for the children, neither shall the children be put to death for the fathers: every man shall be put to death for his own sin* (Deuteronomy 24:16). This is the very statute the narrator names when Amaziah spares the sons of his father''s murderers — *the children of the murderers he slew not: according unto that which is written in the book of the law of Moses, wherein Yahuah (LORD) commanded* (2 Kings 14:6). The righteous king rules BY the written Torah; the Torah is the binding standard the throne is measured against, quoted word for word and obeyed.'),
    ('canon','2-kings',14,6,'canon','2-chronicles',25,4,'free',
      E'*But he slew not their children, but did as it is written in the law in the book of Moses, where Yahuah (LORD) commanded, saying, The fathers shall not die for the children, neither shall the children die for the fathers, but every man shall die for his own sin* (2 Chronicles 25:4). The Chronicler tells the same deed and cites the same Torah-source as 2 Kings 14:6 — two witnesses that the act of mercy is an act of obedience: *according unto that which is written in the book of the law of Moses*.'),
    ('canon','2-kings',14,6,'canon','ezekiel',18,20,'free',
      E'*The soul that sinneth, it shall die. The son shall not bear the iniquity of the father, neither shall the father bear the iniquity of the son: the righteousness of the righteous shall be upon him, and the wickedness of the wicked shall be upon him* (Ezekiel 18:20). The principle Amaziah obeys — *every man shall be put to death for his own sin* (2 Kings 14:6) — is the same principle Ezekiel carries forward against the proverb of sour grapes; the Torah''s individual responsibility is not abolished but pressed deeper into the heart of the covenant people.'),
    ('canon','2-kings',14,6,'canon','jeremiah',31,30,'free',
      E'*But every one shall die for his own iniquity: every man that eateth the sour grape, his teeth shall be set on edge* (Jeremiah 31:30). The statute the king keeps — *every man shall be put to death for his own sin* (2 Kings 14:6) — stands at the door of the new-covenant chapter, where the same Torah is written *in their inward parts* (Jeremiah 31:33); the individual-responsibility commandment is not replaced but engraved on the heart.'),

    -- THREAD 2: the thistle that was in Lebanon and the cedar (Judges 9, Proverbs 16, Amos 6)
    ('canon','2-kings',14,9,'canon','judges',9,8,'free',
      E'*The trees went forth on a time to anoint a king over them; and they said unto the olive tree, Reign thou over us* (Judges 9:8). Jehoash answers Amaziah''s challenge with a fable of the same kind — *The thistle that was in Lebanon sent to the cedar that was in Lebanon, saying, Give thy daughter to my son to wife: and there passed by a wild beast that was in Lebanon, and trode down the thistle* (2 Kings 14:9). As Jotham''s trees expose the worthless bramble that would reign, so the thistle that presumes against the cedar is trodden down: the kingly-fable mocking self-exalting pride.'),
    ('canon','2-kings',14,9,'canon','judges',9,15,'free',
      E'*And the bramble said unto the trees, If in truth ye anoint me king over you, then come and put your trust in my shadow: and if not, let fire come out of the bramble, and devour the cedars of Lebanon* (Judges 9:15). The worthless bramble that threatens the cedars is the very figure Jehoash turns against Amaziah — the lowly thistle puffed up against *the cedar that was in Lebanon* (2 Kings 14:9); the parable warns that pretension to greatness ends in being trodden underfoot.'),
    ('canon','2-kings',14,10,'canon','proverbs',16,18,'free',
      E'*Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). Jehoash names the very disease — *Thou hast indeed smitten Edom, and thine heart hath lifted thee up... why shouldest thou meddle to thy hurt, that thou shouldest fall* (2 Kings 14:10); the lifted-up heart that meddles to its hurt is the haughty spirit the proverb says goes before a fall, and Amaziah''s defeat at Beth-shemesh is that proverb walked out in a king.'),
    ('canon','2-kings',14,10,'canon','amos',6,13,'free',
      E'*Ye which rejoice in a thing of nought, which say, Have we not taken to us horns by our own strength?* (Amos 6:13). Amaziah''s boast in his Edom victory — *thine heart hath lifted thee up: glory of this* (2 Kings 14:10) — is the same vain confidence in self-won strength Amos rebukes; the smiting of Edom becomes a horn taken by his own strength, and the lifted heart will not hear the warning to tarry at home.'),

    -- THREAD 3: restored the coast by the hand of his servant Jonah (Jonah 1, Amos 6)
    ('canon','2-kings',14,25,'canon','jonah',1,1,'free',
      E'*Now the word of Yahuah (LORD) came unto Jonah the son of Amittai, saying* (Jonah 1:1). The prophet whose word restores the northern border is named here and only here outside his own book — *Jeroboam restored the coast of Yashar''el (Israel)... according to the word of Yahuah Elohim (the LORD God) of Yashar''el (Israel), which he spake by the hand of his servant Jonah, the son of Amittai, the prophet* (2 Kings 14:25). The same Jonah son of Amittai who fled to Tarshish and was swallowed of the great fish is the servant through whom Yahuah enlarges Yashar''el — mercy spoken over the very north that will not repent.'),
    ('canon','2-kings',14,25,'canon','amos',6,1,'free',
      E'*Woe to them that are at ease in Zion, and trust in the mountain of Samaria, which are named chief of the nations* (Amos 6:1). The prosperity Jonah''s word brings — Jeroboam''s restored coast *from the entering of Hamath unto the sea of the plain* (2 Kings 14:25) — is the very ease Amos, prophesying in these same days, denounces: the border enlarged by mercy becomes the security the careless trust in, while they *are not grieved for the affliction of Joseph*.'),

    -- THREAD 4: he would not blot out the name of Yashar'el from under heaven (Hosea 1, Hosea 11)
    ('canon','2-kings',14,26,'canon','hosea',11,8,'free',
      E'*How shall I give thee up, Ephraim? how shall I deliver thee, Yashar''el (Israel)? how shall I make thee as Admah? how shall I set thee as Zeboim? mine heart is turned within me, my repentings are kindled together* (Hosea 11:8). Yahuah''s sight of the north''s misery — *For Yahuah (LORD) saw the affliction of Yashar''el (Israel), that it was very bitter* (2 Kings 14:26) — is the same recoiling mercy Hosea hears in these days: the Father whose heart turns within him at the thought of giving Ephraim up is the God who looks on the bitter affliction and saves them yet.'),
    ('canon','2-kings',14,27,'canon','hosea',1,6,'free',
      E'*And Elohim (God) said unto him, Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel); but I will utterly take them away* (Hosea 1:6). The blotting-out Yahuah here withholds — *And Yahuah (LORD) said not that he would blot out the name of Yashar''el (Israel) from under heaven: but he saved them by the hand of Jeroboam* (2 Kings 14:27) — is the sentence Hosea names against the northern house. The name is kept alive for a season; the patient mercy stays the blotting-out, holding the ten-tribe stick to be gathered again before the Assyrian scattering falls.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-14-the-fathers-shall-not-be-put-to-death-for-the-children',
  E'The fathers shall not be put to death for the children — the king ruling by the written Torah',
  E'When the kingdom is confirmed in his hand Amaziah avenges his murdered father, yet he draws a line the Torah drew first: *But the children of the murderers he slew not: according unto that which is written in the book of the law of Moses, wherein Yahuah (LORD) commanded, saying, The fathers shall not be put to death for the children, nor the children be put to death for the fathers; but every man shall be put to death for his own sin* (2 Kings 14:6). The narrator quotes the statute outright — *The fathers shall not be put to death for the children, neither shall the children be put to death for the fathers: every man shall be put to death for his own sin* (Deuteronomy 24:16) — and the Chronicler tells the same deed with the same citation: *he slew not their children, but did as it is written in the law in the book of Moses* (2 Chronicles 25:4). The Torah is not a defunct code; it is the binding standard a righteous king rules BY, the inheritance the throne is measured against. And the principle of individual responsibility it teaches is carried forward, not abolished: *The soul that sinneth, it shall die. The son shall not bear the iniquity of the father* (Ezekiel 18:20), *every one shall die for his own iniquity* (Jeremiah 31:30) — the very Torah Jeremiah says Yahuah will write *in their inward parts* (Jeremiah 31:33). The commandment is engraved deeper, never replaced.',
  sv.verse_id, ev.verse_id, 'free', 38825
  FROM _s343_2ki14_lookup sv, _s343_2ki14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=14 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-14-the-thistle-that-was-in-lebanon-and-the-cedar',
  E'The thistle that was in Lebanon and the cedar — pride lifted up and trodden down',
  E'Flush with his slaughter of Edom, Amaziah sends a challenge to the north: *Come, let us look one another in the face* (2 Kings 14:8). Jehoash answers not with a threat but with a fable: *The thistle that was in Lebanon sent to the cedar that was in Lebanon, saying, Give thy daughter to my son to wife: and there passed by a wild beast that was in Lebanon, and trode down the thistle* (2 Kings 14:9). It is the kingly-fable form of Jotham, who from mount Gerizim told how *the trees went forth on a time to anoint a king over them* (Judges 9:8) and chose at last the worthless bramble that says *let fire come out of the bramble, and devour the cedars of Lebanon* (Judges 9:15) — the lowly plant puffed up against the great. Jehoash names the disease plainly: *Thou hast indeed smitten Edom, and thine heart hath lifted thee up: glory of this, and tarry at home: for why shouldest thou meddle to thy hurt, that thou shouldest fall* (2 Kings 14:10). It is the proverb walked out in a king — *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18) — and the very boast Amos rebukes in these days: *Ye which rejoice in a thing of nought, which say, Have we not taken to us horns by our own strength?* (Amos 6:13). Amaziah would not hear; the thistle was trodden down, the wall of Jerusalem broken and the temple plundered. The system dismantled is pride itself, not a people; the king is undone by his own lifted heart.',
  sv.verse_id, ev.verse_id, 'free', 38828
  FROM _s343_2ki14_lookup sv, _s343_2ki14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=14 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-14-restored-the-coast-by-the-hand-of-his-servant-jonah',
  E'Restored the coast by the hand of his servant Jonah — mercy spoken over the north',
  E'Under Jeroboam II, who *did that which was evil in the sight of Yahuah (LORD)* and *departed not from all the sins of Jeroboam the son of Nebat* (2 Kings 14:24), Yahuah nonetheless enlarges the kingdom: *He restored the coast of Yashar''el (Israel) from the entering of Hamath unto the sea of the plain, according to the word of Yahuah Elohim (the LORD God) of Yashar''el (Israel), which he spake by the hand of his servant Jonah, the son of Amittai, the prophet, which was of Gath-hepher* (2 Kings 14:25). The prophet is named here and only here outside his own book — the same servant to whom *the word of Yahuah (LORD) came unto Jonah the son of Amittai, saying* (Jonah 1:1), who fled to Tarshish and was swallowed of the great fish. The mercy that spared repentant Nineveh through Jonah''s mouth is the mercy that, through the same mouth, restores a wicked north''s border. Yet the prosperity is double-edged: it is the very ease Amos, prophesying in these same days, denounces — *Woe to them that are at ease in Zion, and trust in the mountain of Samaria, which are named chief of the nations* (Amos 6:1). The enlarged coast becomes the careless security of those who *are not grieved for the affliction of Joseph*; Yahuah''s gift of room is no license to forget him.',
  sv.verse_id, ev.verse_id, 'free', 38831
  FROM _s343_2ki14_lookup sv, _s343_2ki14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=14 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-14-he-would-not-blot-out-the-name-of-yashar-el-from-under-heaven',
  E'He would not blot out the name of Yashar''el from under heaven — the patient mercy before the scattering',
  E'The reason for the restoration is laid bare, and it is mercy and nothing else: *For Yahuah (LORD) saw the affliction of Yashar''el (Israel), that it was very bitter: for there was not any shut up, nor any left, nor any helper for Yashar''el (Israel). And Yahuah (LORD) said not that he would blot out the name of Yashar''el (Israel) from under heaven: but he saved them by the hand of Jeroboam the son of Joash* (2 Kings 14:26-27). This is the heart of Yahuah toward the northern house — the same heart Hosea hears in these very days: *How shall I give thee up, Ephraim? how shall I deliver thee, Yashar''el (Israel)?... mine heart is turned within me, my repentings are kindled together* (Hosea 11:8). The name that Yahuah will NOT yet blot out is the name Hosea is told to call Lo-ruhamah, no-mercy — *Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel); but I will utterly take them away* (Hosea 1:6). The sentence is real, but it is stayed: the ten-tribe stick is kept alive a season longer, saved by a wicked king''s hand, because the God who divorced the north has already purposed to gather it again. This is the patient mercy BEFORE the Assyrian scattering — the two-house God holding Ephraim in being until the day he makes the stick of Joseph and the stick of Judah one.',
  sv.verse_id, ev.verse_id, 'free', 38834
  FROM _s343_2ki14_lookup sv, _s343_2ki14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=14 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 14:6 -> Deuteronomy 24:16 — *every man shall be put to death for his own sin*: the very statute the king obeys, quoted by the narrator.'
  FROM cross_reference_threads t
  JOIN _s343_2ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s343_2ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-14-the-fathers-shall-not-be-put-to-death-for-the-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 14:6 -> 2 Chronicles 25:4 — *did as it is written in the law in the book of Moses*: the parallel witness citing the same Torah.'
  FROM cross_reference_threads t
  JOIN _s343_2ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s343_2ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=25 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-14-the-fathers-shall-not-be-put-to-death-for-the-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 14:6 -> Ezekiel 18:20 — *the soul that sinneth, it shall die*: the individual-responsibility Torah pressed deeper into the heart.'
  FROM cross_reference_threads t
  JOIN _s343_2ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s343_2ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-14-the-fathers-shall-not-be-put-to-death-for-the-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 14:6 -> Jeremiah 31:30 — *every one shall die for his own iniquity*: the same commandment written on the heart in the new-covenant chapter.'
  FROM cross_reference_threads t
  JOIN _s343_2ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=6
  JOIN _s343_2ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-14-the-fathers-shall-not-be-put-to-death-for-the-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 14:9 -> Judges 9:8 — *the trees went forth... to anoint a king*: Jotham''s kingly-fable, the form Jehoash borrows.'
  FROM cross_reference_threads t
  JOIN _s343_2ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s343_2ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=9 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-14-the-thistle-that-was-in-lebanon-and-the-cedar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 14:9 -> Judges 9:15 — *let fire come out of the bramble, and devour the cedars*: the worthless plant puffed up against the great.'
  FROM cross_reference_threads t
  JOIN _s343_2ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=9
  JOIN _s343_2ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=9 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-14-the-thistle-that-was-in-lebanon-and-the-cedar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 14:10 -> Proverbs 16:18 — *Pride goeth before destruction*: the lifted-up heart that meddles to its hurt.'
  FROM cross_reference_threads t
  JOIN _s343_2ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=10
  JOIN _s343_2ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-14-the-thistle-that-was-in-lebanon-and-the-cedar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 14:10 -> Amos 6:13 — *taken to us horns by our own strength*: the same vain boast in self-won victory Amos rebukes.'
  FROM cross_reference_threads t
  JOIN _s343_2ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=10
  JOIN _s343_2ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=6 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-14-the-thistle-that-was-in-lebanon-and-the-cedar'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 14:25 -> Jonah 1:1 — *the word of Yahuah came unto Jonah the son of Amittai*: the same prophet whose word enlarges the north.'
  FROM cross_reference_threads t
  JOIN _s343_2ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=25
  JOIN _s343_2ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-14-restored-the-coast-by-the-hand-of-his-servant-jonah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 14:25 -> Amos 6:1 — *woe to them that are at ease in Zion*: the restored prosperity becomes the careless security Amos denounces.'
  FROM cross_reference_threads t
  JOIN _s343_2ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=25
  JOIN _s343_2ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=6 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-14-restored-the-coast-by-the-hand-of-his-servant-jonah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 14:26 -> Hosea 11:8 — *How shall I give thee up, Ephraim?*: the recoiling mercy that looks on the bitter affliction.'
  FROM cross_reference_threads t
  JOIN _s343_2ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=26
  JOIN _s343_2ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=11 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-14-he-would-not-blot-out-the-name-of-yashar-el-from-under-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 14:27 -> Hosea 1:6 — *Call her name Lo-ruhamah... I will no more have mercy*: the sentence stayed, the name kept alive a season.'
  FROM cross_reference_threads t
  JOIN _s343_2ki14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=14 AND sv.verse_number=27
  JOIN _s343_2ki14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-14-he-would-not-blot-out-the-name-of-yashar-el-from-under-heaven'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_15.sql (2 Kings 15) -----
--
-- Chapter: 2 Kings 15 — Azariah/Uzziah of Yahudah reigns long and right yet is smitten
--   with leprosy for overstepping the priesthood; the north collapses in bloody succession
--   (Zachariah, Shallum, Menahem, Pekahiah, Pekah), Pul/Tiglath-pileser of Assyria comes,
--   and the FIRST DEPORTATION of the northern tribes begins (Galilee/Naphtali carried captive).
-- Tag: 2ki15   View: _s343_2ki15_lookup   Sort band: 38850 step 3 (38850, 38853, 38856, 38859, 38862)
--
-- 2 Kings 15 coverage:
--   v.1-4  Azariah reigns 52 yrs, did right, high places not removed
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 2 Chronicles 26:3,4 (the parallel reign) — woven into THREAD 1 background
--   v.5  Yahuah smote the king, a leper to his death, dwelt in a several house, Jotham over the house
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 2 Chronicles 26:16,18,19,21 (struck for burning incense, overstepping the priesthood);
--                Numbers 16:40 (no stranger come near to offer incense); Numbers 12:10 (Miriam leprous
--                for speaking against Yahuah's chosen servant)  -> THREAD 1
--   v.7  Azariah slept with his fathers; Jotham reigned (cross-ref the death-year of Uzziah)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Isaiah 6:1 (*In the year that king Uzziah died* — the prophet's call dated to this death)  -> THREAD 2
--   v.8-12  Zachariah (last of Jehu's line) slain by Shallum; the fourth-generation word fulfilled
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 2 Kings 10:30 (thy children of the fourth generation shall sit on the throne);
--                Hosea 1:4 (I will avenge the blood of Jezreel upon the house of Jehu)  -> THREAD 3
--   v.13-16  Shallum slain by Menahem; Menahem rips up the women with child (the violent collapse)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Hosea 13:16 weighed (Samaria's women with child ripped up) — NOT pulled (kept tight to
--                the succession/calf-sin frame); the bloody chaos woven into THREAD 3 & THREAD 4 prose
--   v.9,18,24,28  he departed not from the sins of Jeroboam, who made Yashar'el to sin (the refrain)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Kings 14:15,16 (Yahuah shall root up Yashar'el... scatter beyond the river... give
--                Yashar'el up because of the sins of Jeroboam); 2 Kings 17:22,23 (carried away to Assyria)  -> THREAD 4
--   v.19-20  Pul king of Assyria came; Menahem buys him off with a thousand talents of silver
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: 1 Chronicles 5:26 (Pul and Tilgath-pilneser carry away the trans-Jordan tribes)  -> THREAD 5
--   v.29  Tiglath-pileser took Galilee, all the land of Naphtali, and carried them captive to Assyria
--        NT:     Matthew 4:15,16 (the land of Naphtali... Galilee of the Gentiles... the people which
--                sat in darkness saw great light — the Formed Son walks the very deported region)  -> THREAD 5
--        Extras: none warranted
--        Tanakh: Isaiah 9:1 (the land of Naphtali... afterward did more grievously afflict her); 1 Chronicles
--                5:26 (the deportation of the eastern tribes); 2 Kings 17:6,23 (the full exile this begins)  -> THREAD 4 & 5
--   v.30-31  Hoshea slays Pekah (the last northern king before the fall) — woven into THREAD 4
--   v.32-38  Jotham of Yahudah reigns right, builds the higher gate, high places remain; Rezin & Pekah
--            begin to come against Yahudah
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (transitional regnal frame; Jotham's righteousness mirrors v.3-4, the
--                Syro-Ephraimite pressure (v.37) belongs to ch16/Isaiah 7 — not pulled here)
--
-- Threads:
--   2-kings-15-the-king-who-overstepped-the-priesthood-smitten-with-leprosy (free; Tanakh: 2 Chronicles 26, Numbers 16, Numbers 12)
--   2-kings-15-in-the-year-that-king-uzziah-died (free; Tanakh: Isaiah 6)
--   2-kings-15-the-fourth-generation-of-jehu-and-the-blood-of-jezreel (free; Tanakh: 2 Kings 10, Hosea 1)
--   2-kings-15-departed-not-from-the-sins-of-jeroboam-the-north-rooted-up (free; Tanakh: 1 Kings 14, 2 Kings 17)
--   2-kings-15-the-first-assyrian-deportation-of-the-northern-tribes (free; Tanakh: 1 Chronicles 5, Isaiah 9, 2 Kings 17 + NT: Matthew 4)
--
-- Contested/load-bearing framing:
--   * v.5 Uzziah's leprosy — framed through 2 Chronicles 26: the king who PRESUMED the priesthood,
--     went into the temple to burn incense, and was struck. Bound to Numbers 16 (Korah, no stranger
--     come near to offer incense) and Numbers 12 (Miriam leprous). The lens: the office is appointed,
--     the Torah's order of priest and king stands; the leprosy is the covenant-judgment on the man
--     who overstepped the appointed boundary — NOT Torah as burden but Torah as the holy order kept.
--   * v.8-12 the fourth generation — the word to Jehu (2 Kings 10:30) is exactly fulfilled and the
--     blood of Jezreel (Hosea 1:4) requited in the same stroke: the avenger's house reaps what it sowed.
--   * v.29 the FIRST DEPORTATION — the keystone. The scattering of the house of Yashar'el (the northern
--     stick) BEGINS here, Galilee and Naphtali carried to Assyria, the patient mercy now ending; it runs
--     to 2 Kings 17 (the full exile, Lo-Ammi enacted). Woven FORWARD to Isaiah 9:1 -> Matthew 4:15-16:
--     the very region first plunged into darkness by deportation is where the Formed Son first shines —
--     the light dawns on the scattered, the regathering of the two houses foreshadowed at the place of
--     the first scattering. Victims-not-enemies: the deported are the lost sheep, not the foe.

CREATE TEMP VIEW _s343_2ki15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross_references =====
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the king who overstepped the priesthood, smitten with leprosy (2 Chronicles 26, Numbers 16, Numbers 12)
    ('canon','2-kings',15,5,'canon','2-chronicles',26,16,'free',
      E'*But when he was strong, his heart was lifted up to his destruction: for he transgressed against Yahuah Elohav (the LORD his God), and went into the temple of Yahuah (LORD) to burn incense upon the altar of incense* (2 Chronicles 26:16). 2 Kings says only that *Yahuah (LORD) smote the king, so that he was a leper unto the day of his death* (2 Kings 15:5); the Chronicler names the trespass — the king who reigned long and right grew strong and reached for the priest''s censer, overstepping the appointed boundary of the Torah.'),
    ('canon','2-kings',15,5,'canon','2-chronicles',26,18,'free',
      E'*And they withstood Uzziah the king, and said unto him, It appertaineth not unto thee, Uzziah, to burn incense unto Yahuah (LORD), but to the priests the sons of Aaron, that are consecrated to burn incense: go out of the sanctuary; for thou hast trespassed* (2 Chronicles 26:18). The leprosy of *he was a leper unto the day of his death* (2 Kings 15:5) falls on a king told to his face that the incense is not his to offer; the order of priest and king is the Torah''s, and the crown does not annul it.'),
    ('canon','2-kings',15,5,'canon','2-chronicles',26,19,'free',
      E'*Then Uzziah was wroth, and had a censer in his hand to burn incense: and while he was wroth with the priests, the leprosy even rose up in his forehead before the priests in the house of Yahuah (LORD), from beside the incense altar* (2 Chronicles 26:19). Here is the moment 2 Kings compresses into *Yahuah (LORD) smote the king* (2 Kings 15:5): the plague breaks out in his forehead at the very altar he usurped, the judgment standing where the trespass stood.'),
    ('canon','2-kings',15,5,'canon','2-chronicles',26,21,'free',
      E'*And Uzziah the king was a leper unto the day of his death, and dwelt in a several house, being a leper; for he was cut off from the house of Yahuah (LORD): and Jotham his son was over the king''s house, judging the people of the land* (2 Chronicles 26:21). The Chronicler''s words are 2 Kings 15:5 almost verbatim — *he was a leper unto the day of his death, and dwelt in a several house. And Jotham the king''s son was over the house, judging the people of the land* — the king cut off from the very house whose altar he seized.'),
    ('canon','2-kings',15,5,'canon','numbers',16,40,'free',
      E'*To be a memorial unto the children of Yashar''el (Israel), that no stranger, which is not of the seed of Aaron, come near to offer incense before Yahuah (LORD); that he be not as Korah, and as his company* (Numbers 16:40). Uzziah''s leprosy — *Yahuah (LORD) smote the king, so that he was a leper* (2 Kings 15:5) — is this memorial enforced: the one not of Aaron''s seed who comes near to offer incense reaps Korah''s breach, the appointed boundary defended by Yahuah himself.'),
    ('canon','2-kings',15,5,'canon','numbers',12,10,'free',
      E'*And the cloud departed from off the tabernacle; and, behold, Miriam became leprous, white as snow: and Aaron looked upon Miriam, and, behold, she was leprous* (Numbers 12:10). As Miriam was struck leprous for rising against the servant Yahuah set apart, so the king who reached past his appointed place is struck: *Yahuah (LORD) smote the king, so that he was a leper unto the day of his death* (2 Kings 15:5) — the same plague on the same presumption, and both shut out from the camp and the house.'),

    -- THREAD 2: in the year that king Uzziah died (Isaiah 6)
    ('canon','2-kings',15,7,'canon','isaiah',6,1,'free',
      E'*In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple* (Isaiah 6:1). *So Azariah slept with his fathers... and Jotham his son reigned in his stead* (2 Kings 15:7) — the death that closes the long reign is the very year the prophet is granted the throne-vision: the leprous king laid in the city of David, and in that same year Isaiah sees the King, Yahuah Tseva''ot, enthroned in the temple Uzziah was cut off from.'),

    -- THREAD 3: the fourth generation of Jehu and the blood of Jezreel (2 Kings 10, Hosea 1)
    ('canon','2-kings',15,12,'canon','2-kings',10,30,'free',
      E'*And Yahuah (LORD) said unto Jehu, Because thou hast done well in executing that which is right in mine eyes... thy children of the fourth generation shall sit on the throne of Yashar''el (Israel)* (2 Kings 10:30). The narrator marks the fulfilment outright: *This was the word of Yahuah (LORD) which he spake unto Jehu, saying, Thy sons shall sit on the throne of Yashar''el (Israel) unto the fourth generation. And so it came to pass* (2 Kings 15:12) — Zachariah is that fourth generation, and his murder closes the promised line to the day.'),
    ('canon','2-kings',15,10,'canon','hosea',1,4,'free',
      E'*And Yahuah (LORD) said unto him, Call his name Jezreel; for yet a little while, and I will avenge the blood of Jezreel upon the house of Jehu, and will cause to cease the kingdom of the house of Yashar''el (Israel)* (Hosea 1:4). *And Shallum the son of Jabesh conspired against him, and smote him before the people, and slew him* (2 Kings 15:10) — the blood Jehu spilled at Jezreel is requited in the blood of his last son; the same throne granted to the fourth generation is the throne where his house is cut down.'),

    -- THREAD 4: departed not from the sins of Jeroboam — the north rooted up (1 Kings 14, 2 Kings 17)
    ('canon','2-kings',15,9,'canon','1-kings',14,15,'free',
      E'*For Yahuah (LORD) shall smite Yashar''el (Israel), as a reed is shaken in the water, and he shall root up Yashar''el (Israel) out of this good land, which he gave to their fathers, and shall scatter them beyond the river, because they have made their groves, provoking Yahuah (LORD) to anger* (1 Kings 14:15). Each northern king *departed not from the sins of Jeroboam the son of Nebat, who made Yashar''el (Israel) to sin* (2 Kings 15:9) — the very word Ahijah spoke is now ripening; the scattering *beyond the river* is the Assyrian exile drawing near.'),
    ('canon','2-kings',15,18,'canon','1-kings',14,16,'free',
      E'*And he shall give Yashar''el (Israel) up because of the sins of Jeroboam, who did sin, and who made Yashar''el (Israel) to sin* (1 Kings 14:16). Menahem too *departed not all his days from the sins of Jeroboam the son of Nebat, who made Yashar''el (Israel) to sin* (2 Kings 15:18); the refrain repeated over king after king is the ground Ahijah named for handing the north over — the calf-sin unrepented is the cause of the giving-up.'),
    ('canon','2-kings',15,28,'canon','2-kings',17,22,'free',
      E'*For the children of Yashar''el (Israel) walked in all the sins of Jeroboam which he did; they departed not from them* (2 Kings 17:22). Pekah, the last but one, *departed not from the sins of Jeroboam the son of Nebat, who made Yashar''el (Israel) to sin* (2 Kings 15:28) — the historian''s verdict on the whole north gathered into the single refrain that runs through this chapter, the breach no king would mend.'),
    ('canon','2-kings',15,28,'canon','2-kings',17,23,'free',
      E'*Until Yahuah (LORD) removed Yashar''el (Israel) out of his sight, as he had said by all his servants the prophets. So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day* (2 Kings 17:23). The unbroken refrain — *he departed not from the sins of Jeroboam* (2 Kings 15:28) — is the road to this end: the calf-sin unrepented through every reign of this chapter carries the northern stick out of the land.'),

    -- THREAD 5: the first Assyrian deportation of the northern tribes (1 Chronicles 5, Isaiah 9, 2 Kings 17, Matthew 4)
    ('canon','2-kings',15,19,'canon','1-chronicles',5,26,'free',
      E'*And the Elohim (God) of Yashar''el (Israel) stirred up the spirit of Pul king of Assyria, and the spirit of Tilgath-pilneser king of Assyria, and he carried them away, even the Reubenites, and the Gadites, and the half tribe of Manasseh, and brought them unto Halah, and Habor, and Hara, and to the river Gozan, unto this day* (1 Chronicles 5:26). When *Pul the king of Assyria came against the land: and Menahem gave Pul a thousand talents of silver* (2 Kings 15:19), the shadow that falls is this very deportation; the silver only delays the carrying-away of the eastern tribes Assyria will take.'),
    ('canon','2-kings',15,29,'canon','1-chronicles',5,26,'free',
      E'*...and he carried them away, even the Reubenites, and the Gadites, and the half tribe of Manasseh, and brought them unto Halah, and Habor, and Hara, and to the river Gozan, unto this day* (1 Chronicles 5:26). *In the days of Pekah king of Yashar''el (Israel) came Tiglath-pileser king of Assyria... and carried them captive to Assyria* (2 Kings 15:29) — the same Assyrian hand, the trans-Jordan and the Galilee tribes alike torn from the land; the scattering of the house of Yashar''el has begun.'),
    ('canon','2-kings',15,29,'canon','isaiah',9,1,'free',
      E'*Nevertheless the dimness shall not be such as was in her vexation, when at the first he lightly afflicted the land of Zebulun and the land of Naphtali, and afterward did more grievously afflict her by the way of the sea, beyond Jordan, in Galilee of the nations* (Isaiah 9:1). The grievous affliction Isaiah names is this hour: *took... Galilee, all the land of Naphtali, and carried them captive to Assyria* (2 Kings 15:29) — the first plunging of the north into the darkness of exile, to which the prophet at once promises a light.'),
    ('canon','2-kings',15,29,'canon','2-kings',17,6,'free',
      E'*In the ninth year of Hoshea the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes* (2 Kings 17:6). The captivity that begins with *carried them captive to Assyria* (2 Kings 15:29) — Galilee and Naphtali first — runs to its end here, the whole northern kingdom carried away; this chapter is the first stroke of that exile.'),
    ('canon','2-kings',15,29,'canon','matthew',4,15,'free',
      E'*The land of Zabulon, and the land of Nephthalim, by the way of the sea, beyond Jordan, Galilee of the Gentiles* (Matthew 4:15). The very ground first emptied by deportation — *took... Galilee, all the land of Naphtali, and carried them captive to Assyria* (2 Kings 15:29) — is the ground the Formed Son chooses to walk: where the scattering of the northern stick began, *Galilee of the Gentiles* is named again, now as the place the gathering will begin.'),
    ('canon','2-kings',15,29,'canon','matthew',4,16,'free',
      E'*The people which sat in darkness saw great light; and to them which sat in the region and shadow of death light is sprung up* (Matthew 4:16). The captives of *carried them captive to Assyria* (2 Kings 15:29), Naphtali plunged into exile-darkness, are the people on whom the light dawns; the lost sheep of the house of Yashar''el, scattered here, are sought first — victims to be gathered, never enemies cast off.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== threads =====
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-15-the-king-who-overstepped-the-priesthood-smitten-with-leprosy',
  E'The king who overstepped the priesthood, smitten with leprosy',
  E'2 Kings tells it in a single line: *And Yahuah (LORD) smote the king, so that he was a leper unto the day of his death, and dwelt in a several house. And Jotham the king''s son was over the house, judging the people of the land* (2 Kings 15:5). The Chronicler tells why. Azariah — Uzziah — reigned fifty-two years and did right, but *when he was strong, his heart was lifted up to his destruction: for he transgressed against Yahuah Elohav (the LORD his God), and went into the temple of Yahuah (LORD) to burn incense upon the altar of incense* (2 Chronicles 26:16). The priests withstood him to his face: *It appertaineth not unto thee, Uzziah, to burn incense unto Yahuah (LORD), but to the priests the sons of Aaron... go out of the sanctuary; for thou hast trespassed* (2 Chronicles 26:18). And while he raged, *the leprosy even rose up in his forehead before the priests in the house of Yahuah (LORD), from beside the incense altar* (2 Chronicles 26:19), so that *Uzziah the king was a leper unto the day of his death, and dwelt in a several house... for he was cut off from the house of Yahuah (LORD)* (2 Chronicles 26:21). The order of priest and king is the Torah''s own, and the crown does not annul it: *no stranger, which is not of the seed of Aaron, come near to offer incense before Yahuah (LORD); that he be not as Korah, and as his company* (Numbers 16:40). As Miriam was struck — *behold, Miriam became leprous, white as snow* (Numbers 12:10) — for rising against the servant Yahuah set apart, so the king who reached past his appointed place is struck with the same plague and shut out from the same camp. The leprosy is not the Torah made a burden; it is the holy order kept, the boundary defended by Yahuah himself.',
  sv.verse_id, ev.verse_id, 'free', 38850
  FROM _s343_2ki15_lookup sv, _s343_2ki15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=15 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-15-in-the-year-that-king-uzziah-died',
  E'In the year that king Uzziah died — the throne the leper was cut off from',
  E'The long reign closes quietly: *So Azariah slept with his fathers; and they buried him with his fathers in the city of David: and Jotham his son reigned in his stead* (2 Kings 15:7). That death dates one of the great visions of the prophets. *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple* (Isaiah 6:1). The king who had reached for the altar of incense and was cut off from the house of Yahuah dies, and in that very year Isaiah is shown the One enthroned in that house — *the King, Yahuah Tseva''ot (LORD of hosts)* (Isaiah 6:5), the Formed Son seen high and lifted up where the leprous king could no longer come. The earthly throne empties; the heavenly throne is seen full.',
  sv.verse_id, ev.verse_id, 'free', 38853
  FROM _s343_2ki15_lookup sv, _s343_2ki15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=15 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-15-the-fourth-generation-of-jehu-and-the-blood-of-jezreel',
  E'The fourth generation of Jehu, and the blood of Jezreel requited',
  E'Zachariah reigns six months and is murdered: *And Shallum the son of Jabesh conspired against him, and smote him before the people, and slew him, and reigned in his stead* (2 Kings 15:10). The narrator pauses to mark a word fulfilled to the day: *This was the word of Yahuah (LORD) which he spake unto Jehu, saying, Thy sons shall sit on the throne of Yashar''el (Israel) unto the fourth generation. And so it came to pass* (2 Kings 15:12). That word was the reward granted at Jehu''s purge — *thy children of the fourth generation shall sit on the throne of Yashar''el (Israel)* (2 Kings 10:30) — and Zachariah is the fourth; the promise runs out exactly as his blood is spilled. Yet the same stroke requites an older debt, for Hosea had named a son for the valley of slaughter: *I will avenge the blood of Jezreel upon the house of Jehu, and will cause to cease the kingdom of the house of Yashar''el (Israel)* (Hosea 1:4). The throne granted to the fourth generation is the throne where the house of Jehu is cut down — the avenger''s line reaping the blood it once poured out.',
  sv.verse_id, ev.verse_id, 'free', 38856
  FROM _s343_2ki15_lookup sv, _s343_2ki15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=15 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-15-departed-not-from-the-sins-of-jeroboam-the-north-rooted-up',
  E'Departed not from the sins of Jeroboam — the north rooted up out of the land',
  E'Through the bloody succession of this chapter one refrain repeats over king after king: each *did that which was evil in the sight of Yahuah (LORD)... he departed not from the sins of Jeroboam the son of Nebat, who made Yashar''el (Israel) to sin* (2 Kings 15:9, and again of Menahem in 15:18, of Pekahiah in 15:24, of Pekah in 15:28). That unmended breach is the very thing for which Ahijah long before said the north would be torn from the land: *Yahuah (LORD) shall smite Yashar''el (Israel), as a reed is shaken in the water, and he shall root up Yashar''el (Israel) out of this good land... and shall scatter them beyond the river* (1 Kings 14:15), *and he shall give Yashar''el (Israel) up because of the sins of Jeroboam, who did sin, and who made Yashar''el (Israel) to sin* (1 Kings 14:16). The historian who closes the kingdom says the same: *the children of Yashar''el (Israel) walked in all the sins of Jeroboam which he did; they departed not from them* (2 Kings 17:22), *until Yahuah (LORD) removed Yashar''el (Israel) out of his sight... So was Yashar''el (Israel) carried away out of their own land to Assyria* (2 Kings 17:23). The refrain heard over every reign of this chapter is the cause of the scattering it is hastening toward.',
  sv.verse_id, ev.verse_id, 'free', 38859
  FROM _s343_2ki15_lookup sv, _s343_2ki15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=15 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-15-the-first-assyrian-deportation-of-the-northern-tribes',
  E'The first Assyrian deportation of the northern tribes — the scattering of Yashar''el begins',
  E'Assyria''s shadow first falls as a bribe: *And Pul the king of Assyria came against the land: and Menahem gave Pul a thousand talents of silver, that his hand might be with him* (2 Kings 15:19) — but silver only delays the carrying-away. Under Pekah it comes in full: *In the days of Pekah king of Yashar''el (Israel) came Tiglath-pileser king of Assyria, and took Ijon, and Abel-beth-maachah, and Janoah, and Kedesh, and Hazor, and Gilead, and Galilee, all the land of Naphtali, and carried them captive to Assyria* (2 Kings 15:29). This is the FIRST deportation — the scattering of the house of Yashar''el, the northern stick, beginning. The Chronicler names the same hand on the eastern tribes: *the Elohim (God) of Yashar''el (Israel) stirred up the spirit of Pul king of Assyria, and the spirit of Tilgath-pilneser king of Assyria, and he carried them away, even the Reubenites, and the Gadites, and the half tribe of Manasseh... to the river Gozan, unto this day* (1 Chronicles 5:26). It runs to its end in *the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria* (2 Kings 17:6) — Lo-Ammi enacted, the divorced north driven out. Yet the prophet who names this first affliction at once names a light: *at the first he lightly afflicted the land of Zebulun and the land of Naphtali, and afterward did more grievously afflict her... in Galilee of the nations* (Isaiah 9:1) — and the gospel sets the Formed Son down on that very ground: *The land of Zabulon, and the land of Nephthalim, by the way of the sea, beyond Jordan, Galilee of the Gentiles* (Matthew 4:15); *The people which sat in darkness saw great light; and to them which sat in the region and shadow of death light is sprung up* (Matthew 4:16). Where the scattering began, the gathering begins; the lost sheep deported here are sought first — victims to be regathered, never enemies cast off.',
  sv.verse_id, ev.verse_id, 'free', 38862
  FROM _s343_2ki15_lookup sv, _s343_2ki15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=15 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- ===== thread_members =====
-- THREAD 1: the king who overstepped the priesthood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 15:5 -> 2 Chronicles 26:16 — *went into the temple of Yahuah to burn incense*: the trespass 2 Kings only names as the smiting.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=26 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-king-who-overstepped-the-priesthood-smitten-with-leprosy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 15:5 -> 2 Chronicles 26:18 — *it appertaineth not unto thee... but to the priests the sons of Aaron*: the boundary the king crossed.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=26 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-king-who-overstepped-the-priesthood-smitten-with-leprosy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 15:5 -> 2 Chronicles 26:19 — *the leprosy even rose up in his forehead... from beside the incense altar*: the plague at the usurped altar.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=26 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-king-who-overstepped-the-priesthood-smitten-with-leprosy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 15:5 -> 2 Chronicles 26:21 — *a leper unto the day of his death, and dwelt in a several house*: 2 Kings 15:5 almost verbatim, cut off from the house.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=26 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-king-who-overstepped-the-priesthood-smitten-with-leprosy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Kings 15:5 -> Numbers 16:40 — *no stranger... come near to offer incense... that he be not as Korah*: the memorial Uzziah''s leprosy enforces.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-king-who-overstepped-the-priesthood-smitten-with-leprosy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'2 Kings 15:5 -> Numbers 12:10 — *Miriam became leprous, white as snow*: the same plague on the same presumption against Yahuah''s appointed order.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=5
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=12 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-king-who-overstepped-the-priesthood-smitten-with-leprosy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: in the year that king Uzziah died
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 15:7 -> Isaiah 6:1 — *In the year that king Uzziah died I saw also Yahuah... upon a throne*: the prophet''s vision dated to this death.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=7
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-in-the-year-that-king-uzziah-died'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: the fourth generation of Jehu and the blood of Jezreel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 15:12 -> 2 Kings 10:30 — *thy children of the fourth generation shall sit on the throne*: the reward whose term Zachariah closes.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=12
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=10 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-fourth-generation-of-jehu-and-the-blood-of-jezreel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 15:10 -> Hosea 1:4 — *I will avenge the blood of Jezreel upon the house of Jehu*: Shallum''s sword requiting the avenger''s blood.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=10
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-fourth-generation-of-jehu-and-the-blood-of-jezreel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: departed not from the sins of Jeroboam — the north rooted up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 15:9 -> 1 Kings 14:15 — *he shall root up Yashar''el out of this good land... and shall scatter them beyond the river*: Ahijah''s word ripening.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=9
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=14 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-departed-not-from-the-sins-of-jeroboam-the-north-rooted-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 15:18 -> 1 Kings 14:16 — *he shall give Yashar''el up because of the sins of Jeroboam*: the ground for the giving-up, repeated over Menahem.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=18
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=14 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-departed-not-from-the-sins-of-jeroboam-the-north-rooted-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 15:28 -> 2 Kings 17:22 — *they walked in all the sins of Jeroboam... they departed not from them*: the whole north''s verdict in the chapter''s refrain.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=28
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-departed-not-from-the-sins-of-jeroboam-the-north-rooted-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 15:28 -> 2 Kings 17:23 — *carried away out of their own land to Assyria*: the end the unbroken refrain is the road to.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=28
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-departed-not-from-the-sins-of-jeroboam-the-north-rooted-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5: the first Assyrian deportation of the northern tribes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 15:19 -> 1 Chronicles 5:26 — *Pul... and Tilgath-pilneser... carried them away, even the Reubenites, and the Gadites*: the deportation the silver only delays.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=19
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=5 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-first-assyrian-deportation-of-the-northern-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 15:29 -> 1 Chronicles 5:26 — the same Assyrian hand on the eastern tribes; the trans-Jordan and Galilee torn from the land together.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=5 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-first-assyrian-deportation-of-the-northern-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 15:29 -> Isaiah 9:1 — *the land of Naphtali... more grievously afflict her... in Galilee of the nations*: the prophet names this first affliction.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-first-assyrian-deportation-of-the-northern-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 15:29 -> 2 Kings 17:6 — *the king of Assyria took Samaria, and carried Yashar''el away into Assyria*: the full exile this first stroke begins.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-first-assyrian-deportation-of-the-northern-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Kings 15:29 -> Matthew 4:15 — *the land of Nephthalim... Galilee of the Gentiles*: the Formed Son walks the very deported ground.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-first-assyrian-deportation-of-the-northern-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'2 Kings 15:29 -> Matthew 4:16 — *The people which sat in darkness saw great light*: the deported lost sheep are the people on whom the light dawns.'
  FROM cross_reference_threads t
  JOIN _s343_2ki15_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=15 AND sv.verse_number=29
  JOIN _s343_2ki15_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-15-the-first-assyrian-deportation-of-the-northern-tribes'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_16.sql (2 Kings 16) -----
-- Book: 2 Kings  Chapter: 16  Tag: 2ki16  View: _s343_2ki16_lookup
-- Sort band: base 38875, step 3 -> 38875, 38878, 38881
-- Source rows all: 'canon','2-kings',16,v
--
-- 2 Kings 16 coverage:
--   v.3  (made his son pass through the fire / abominations of the heathen)
--        NT:     none warranted (the Torah anchors carry it)
--        Extras: none warranted
--        Tanakh: Lev 18:21 (seed pass through fire to Molech); Deut 18:10 (none that maketh his son pass through fire);
--                Ps 106:37,38 (sacrificed sons/daughters unto devils, innocent blood); Jer 7:31 (Tophet, burn sons in fire);
--                2 Chron 28:3 (burnt his children in the fire) -> THREAD 1
--   v.4  (high places, hills, every green tree) -> folded into thread 1 framing (Deut 12 idolatry pattern), members in thread 3 setting
--   v.5  (Rezin + Pekah besiege Jerusalem) -> Isa 7:1 (the Syro-Ephraimite war, setting of the Immanuel sign);
--                2 Chron 28:5,6 parallel -> THREAD 2
--   v.7  (Ahaz hires Tiglath-pileser, I am thy servant) -> Isa 7:9 (if ye will not believe, ye shall not be established);
--                Isa 8:6 (refuseth the waters of Shiloah, rejoice in Rezin); 2 Chron 28:16 (sent to Assyria for help) -> THREAD 2
--   v.8  (stripped temple silver/gold for Assyria) -> Isa 7:14 (the sign of Immanuel Ahaz refused); Matt 1:23 (Emmanuel fulfilled);
--                Isa 8:7,8 (the king of Assyria, the river overflowing) -> THREAD 2
--   v.10-11 (saw altar at Damascus, Urijah builds a copy) -> Deut 12:30,31 (enquire not after their gods, foreign pattern) -> THREAD 3
--   v.14 (removed the brasen altar of Yahuah) -> 2 Chron 28:23,24 (sacrificed to gods of Damascus, shut house of Yahuah) -> THREAD 3
--   v.15 (king commands Urijah, the brasen altar for me to enquire by) -> Deut 18:10-11 enquiry/divination tie + 2 Chron 28:24 -> THREAD 3
--   v.1,2,6,9,12,13,16,17,18,19,20  NT/Extras/Tanakh: none warranted (regnal frame, war detail, burial formula)
--
-- THREADS:
--   2-kings-16-he-made-his-son-to-pass-through-the-fire-the-molech-abomination   (Tanakh: Lev/Deut/Ps/Jer/2Chron)  tier free
--   2-kings-16-the-faithless-alliance-and-the-sign-of-immanuel-ahaz-refused      (Tanakh: Isa/2Chron + NT: Matt)   tier free
--   2-kings-16-the-altar-of-damascus-worship-corrupted-by-the-foreign-pattern    (Tanakh: Deut/2Chron)            tier free
--
-- Contested/load-bearing framing: 16:3 is read as Torah TRANSGRESSED, not Torah as burden — Lev 18:21 and Deut 18:10
-- forbid the Molech fire outright; the king stands UNDER the Torah, not above it. 16:14 Immanuel context: the Formed
-- Son's sign (Isa 7:14 / Matt 1:23, Elohim with us) is given exactly when Ahaz will not trust — the alliance with
-- Assyria is the unbelief the prophet names, not a neutral policy. 16:10-18 the Damascus altar = the heathen pattern
-- (Deut 12:30-31) entering the very house of Yahuah, the worship Yahuah hates done in his own name.

CREATE TEMP VIEW _s343_2ki16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Molech fire (16:3 / 16:4)
    ('canon','2-kings',16,3,'canon','leviticus',18,21,'free',
      E'*And thou shalt not let any of thy seed pass through the fire to Molech, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 18:21). The Torah named this abomination by name centuries before Ahaz committed it. When 16:3 says he *made his son to pass through the fire, according to the abominations of the heathen*, it is reporting the breaking of a standing command — the king under the Torah, not above it; the same chapter warns *the land itself vomiteth out her inhabitants* (Lev 18:25).'),
    ('canon','2-kings',16,3,'canon','deuteronomy',18,10,'free',
      E'*There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch* (Deuteronomy 18:10). The exact phrase of 16:3, *made his son to pass through the fire*, is the very thing Moses forbade and bound to the abominations *of those nations* (Deut 18:9). Ahaz does after the heathen what Yahuah drove the heathen out for doing.'),
    ('canon','2-kings',16,3,'canon','psalms',106,37,'free',
      E'*Yea, they sacrificed their sons and their daughters unto devils* (Psalm 106:37). The Psalm sings the indictment as covenant history: the next verse, *And shed innocent blood, even the blood of their sons and of their daughters, whom they sacrificed unto the idols of Canaan: and the land was polluted with blood* (Ps 106:38), is what 16:3 enacts in Jerusalem — innocent blood the abomination of the heathen demands.'),
    ('canon','2-kings',16,3,'canon','psalms',106,38,'free',
      E'*And shed innocent blood, even the blood of their sons and of their daughters, whom they sacrificed unto the idols of Canaan: and the land was polluted with blood* (Psalm 106:38). Ahaz *made his son to pass through the fire* and so polluted the land with the innocent blood this Psalm names — the wrath that follows (Ps 106:40, *Therefore was the wrath of Yahuah (LORD) kindled against his people*) is the judgment hanging over 16:3.'),
    ('canon','2-kings',16,3,'canon','jeremiah',7,31,'free',
      E'*And they have built the high places of Tophet, which is in the valley of the son of Hinnom, to burn their sons and their daughters in the fire; which I commanded them not, neither came it into my heart* (Jeremiah 7:31). Jeremiah names the place where the fire of 16:3 burned and the verdict on it: Yahuah *commanded them not* — it was never his worship, only the heathen abomination dressed in his name.'),
    ('canon','2-kings',16,3,'canon','2-chronicles',28,3,'free',
      E'*Moreover he burnt incense in the valley of the son of Hinnom, and burnt his children in the fire, after the abominations of the heathen whom Yahuah (LORD) had cast out before the children of Yashar''el (Israel)* (2 Chronicles 28:3). The Chronicler''s parallel makes 16:3 worse — not *his son* only but *his children* — and locates it in the valley of Hinnom, the Tophet Jeremiah condemns.'),
    ('canon','2-kings',16,4,'canon','deuteronomy',12,31,'free',
      E'*Thou shalt not do so unto Yahuah Elohayka (the LORD thy God): for every abomination to Yahuah (LORD), which he hateth, have they done unto their gods; for even their sons and their daughters they have burnt in the fire to their gods* (Deuteronomy 12:31). Ahaz *sacrificed and burnt incense in the high places, and on the hills, and under every green tree* (16:4) — the very imitation of the nations'' worship Moses forbade, the abomination crowned by burning children in the fire.'),

    -- THREAD 2: the faithless alliance and the Immanuel sign (16:5 / 16:7 / 16:8)
    ('canon','2-kings',16,5,'canon','isaiah',7,1,'free',
      E'*And it came to pass in the days of Ahaz the son of Jotham, the son of Uzziah, king of Yahudah (Judah), that Rezin the king of Syria, and Pekah the son of Remaliah, king of Yashar''el (Israel), went up toward Jerusalem to war against it, but could not prevail against it* (Isaiah 7:1). This is the same siege as 16:5 — *Then Rezin king of Syria and Pekah son of Remaliah king of Yashar''el (Israel) came up to Jerusalem to war* — the Syro-Ephraimite war that is the whole setting of the sign of Immanuel.'),
    ('canon','2-kings',16,5,'canon','2-chronicles',28,5,'free',
      E'*Wherefore Yahuah Elohav (the LORD his God) delivered him into the hand of the king of Syria; and they smote him, and carried away a great multitude of them captives, and brought them to Damascus. And he was also delivered into the hand of the king of Yashar''el (Israel), who smote him with a great slaughter* (2 Chronicles 28:5). The Chronicler reads the siege of 16:5 as Yahuah''s hand — the war is covenant judgment on Ahaz, two houses set against one another, north against south.'),
    ('canon','2-kings',16,7,'canon','isaiah',7,9,'free',
      E'*And the head of Ephraim is Samaria, and the head of Samaria is Remaliah''s son. If ye will not believe, surely ye shall not be established* (Isaiah 7:9). Yahuah offers Ahaz the very deliverance he buys from Assyria in 16:7. *If ye will not believe* is the word against the alliance: instead of trusting, Ahaz sends *I am thy servant and thy son* to Tiglath-pileser — establishing himself by Assyria rather than by faith.'),
    ('canon','2-kings',16,7,'canon','isaiah',8,6,'free',
      E'*Forasmuch as this people refuseth the waters of Shiloah that go softly, and rejoice in Rezin and Remaliah''s son* (Isaiah 8:6). The faithless alliance of 16:7 is the prophet''s charge of refusing the quiet waters of Yahuah for the flood of empire; the next verses bring *the king of Assyria, and all his glory* (Isa 8:7) — the very ally Ahaz hired overflowing into Judah itself.'),
    ('canon','2-kings',16,7,'canon','2-chronicles',28,16,'free',
      E'*At that time did king Ahaz send unto the kings of Assyria to help him* (2 Chronicles 28:16). The Chronicler''s flat verdict on the move of 16:7: in his distress Ahaz *trespass yet more against Yahuah (LORD)* (2 Chron 28:22), seeking the arm of empire instead of his Elohim.'),
    ('canon','2-kings',16,8,'canon','isaiah',7,14,'free',
      E'*Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel* (Isaiah 7:14). When Ahaz would not ask, Yahuah gave the sign anyway — *Elohim with us* — the Formed Son promised in the teeth of the king''s unbelief. Stripping the temple silver and gold for Assyria (16:8) is the unbelief; the sign of Immanuel is the answer Ahaz refused.'),
    ('canon','2-kings',16,8,'canon','isaiah',8,7,'free',
      E'*Now therefore, behold, Yahuah (Lord) bringeth up upon them the waters of the river, strong and many, even the king of Assyria, and all his glory: and he shall come up over all his channels, and go over all his banks* (Isaiah 8:7). The Assyria Ahaz paid in 16:8 with the gold of Yahuah''s house becomes the flood that overflows Judah to the neck (Isa 8:8, *O Immanuel*) — the hired deliverer turned into the rod of judgment.'),
    ('canon','2-kings',16,8,'canon','matthew',1,23,'free',
      E'*Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us* (Matthew 1:23). The sign Ahaz refused in his faithless hour is the sign the Formed Son fulfilled — *Elohim with us* in flesh. Where Ahaz trusted Assyria''s silver, the promise stood until the One who is himself the deliverance came.'),

    -- THREAD 3: the altar of Damascus, foreign pattern in the house of Yahuah (16:10 / 16:14 / 16:15)
    ('canon','2-kings',16,10,'canon','deuteronomy',12,30,'free',
      E'*Take heed to thyself that thou be not snared by following them, after that they be destroyed from before thee; and that thou enquire not after their gods, saying, How did these nations serve their gods? even so will I do likewise* (Deuteronomy 12:30). This is precisely Ahaz''s sin in 16:10 — he *saw an altar that was at Damascus* and sent its *fashion* and *pattern* to be copied into the temple, enquiring after the nations'' worship to do likewise.'),
    ('canon','2-kings',16,14,'canon','2-chronicles',28,24,'free',
      E'*And Ahaz gathered together the vessels of the house of Elohim (God), and cut in pieces the vessels of the house of Elohim (God), and shut up the doors of the house of Yahuah (LORD), and he made him altars in every corner of Jerusalem* (2 Chronicles 28:24). The Chronicler shows the full reach of removing *the brasen altar, which was before Yahuah (LORD)* (16:14): the worship of Yahuah displaced and shut up, pagan altars in its place.'),
    ('canon','2-kings',16,15,'canon','2-chronicles',28,23,'free',
      E'*For he sacrificed unto the gods of Damascus, which smote him: and he said, Because the gods of the kings of Syria help them, therefore will I sacrifice to them, that they may help me. But they were the ruin of him, and of all Yashar''el (Israel)* (2 Chronicles 28:23). The Damascus altar Ahaz commands Urijah to serve in 16:15 — *the brasen altar shall be for me to enquire by* — is no neutral copy: it is the altar of the gods of Damascus, the foreign pattern enthroned in Yahuah''s house, the ruin of the king.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-16-he-made-his-son-to-pass-through-the-fire-the-molech-abomination',
       E'He made his son to pass through the fire — the Molech abomination the Torah forbids',
       E'Of Ahaz it is written that he *made his son to pass through the fire, according to the abominations of the heathen, whom Yahuah (LORD) cast out from before the children of Yashar''el (Israel)* (2 Kings 16:3). This is not a king inventing a new sin; it is a king breaking a command Yahuah had already nailed down by name. *And thou shalt not let any of thy seed pass through the fire to Molech, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 18:21) — and *There shall not be found among you any one that maketh his son or his daughter to pass through the fire* (Deuteronomy 18:10). The Torah is not the burden here; the Torah is the line Ahaz crossed. The king stands under the instruction, not above it.\n\nThe Psalmist sings the same crime as covenant history: *Yea, they sacrificed their sons and their daughters unto devils, And shed innocent blood, even the blood of their sons and of their daughters, whom they sacrificed unto the idols of Canaan: and the land was polluted with blood* (Psalm 106:37,38) — and the wrath that follows (Ps 106:40) is the judgment 16:3 invites. Jeremiah names the place: *they have built the high places of Tophet, which is in the valley of the son of Hinnom, to burn their sons and their daughters in the fire; which I commanded them not, neither came it into my heart* (Jeremiah 7:31). Yahuah *commanded them not* — the fire was never his worship. The Chronicler''s parallel widens it to *burnt his children in the fire, after the abominations of the heathen* (2 Chronicles 28:3), and 16:4''s *high places, and on the hills, and under every green tree* is the very imitation Moses forbade: *for even their sons and their daughters they have burnt in the fire to their gods* (Deuteronomy 12:31). The abomination the nations were cast out for, the king of Yahudah now does.',
       sv.verse_id, ev.verse_id, 'free', 38875
  FROM _s343_2ki16_lookup sv, _s343_2ki16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-16-the-faithless-alliance-and-the-sign-of-immanuel-ahaz-refused',
       E'The faithless alliance — and the sign of Immanuel Ahaz refused',
       E'*Then Rezin king of Syria and Pekah son of Remaliah king of Yashar''el (Israel) came up to Jerusalem to war: and they besieged Ahaz* (2 Kings 16:5). This siege is the whole setting of Isaiah 7: *that Rezin the king of Syria, and Pekah the son of Remaliah, king of Yashar''el (Israel), went up toward Jerusalem to war against it* (Isaiah 7:1). It is the Syro-Ephraimite war — the two houses turned against one another, north against south, which the Chronicler reads as Yahuah''s own hand of judgment: *Yahuah Elohav (the LORD his God) delivered him into the hand of the king of Syria* (2 Chronicles 28:5).\n\nInto that fear Yahuah speaks one word: *If ye will not believe, surely ye shall not be established* (Isaiah 7:9). And he presses a sign on Ahaz — but Ahaz will not ask, will not trust. So in 16:7 he sends to Assyria instead: *I am thy servant and thy son: come up, and save me*, and in 16:8 he strips *the silver and gold that was found in the house of Yahuah (LORD)* to buy the empire''s help. This is the refusal the prophet names: *this people refuseth the waters of Shiloah that go softly, and rejoice in Rezin and Remaliah''s son* (Isaiah 8:6); *At that time did king Ahaz send unto the kings of Assyria to help him* (2 Chronicles 28:16). The hired deliverer becomes the flood: *the king of Assyria... shall come up over all his channels, and go over all his banks* (Isaiah 8:7), overflowing Judah to the neck, *O Immanuel* (Isa 8:8).\n\nYet Yahuah gives the sign whether Ahaz asks or not: *Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel* (Isaiah 7:14) — *Elohim with us*, the Formed Son promised in the teeth of the king''s unbelief. Where Ahaz trusted Assyria''s silver, the promise stood, and it stood until the One who is himself the deliverance came: *they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us* (Matthew 1:23). The sign a faithless king refused is the sign the Formed Son fulfilled.',
       sv.verse_id, ev.verse_id, 'free', 38878
  FROM _s343_2ki16_lookup sv, _s343_2ki16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=16 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-16-the-altar-of-damascus-worship-corrupted-by-the-foreign-pattern',
       E'The altar of Damascus — worship corrupted by the foreign pattern',
       E'King Ahaz *went to Damascus to meet Tiglath-pileser king of Assyria, and saw an altar that was at Damascus: and king Ahaz sent to Urijah the priest the fashion of the altar, and the pattern of it* (2 Kings 16:10), and Urijah built the copy. This is the exact snare Moses warned against: *that thou enquire not after their gods, saying, How did these nations serve their gods? even so will I do likewise* (Deuteronomy 12:30). Ahaz saw how the nations served their gods and did likewise — the heathen pattern carried into the very house of Yahuah.\n\nThen he displaced the true worship: he *brought also the brasen altar, which was before Yahuah (LORD), from the forefront of the house... and put it on the north side of the altar* (16:14), and commanded Urijah, *the brasen altar shall be for me to enquire by* (16:15). The Chronicler shows what this enquiring really was: *For he sacrificed unto the gods of Damascus, which smote him... that they may help me. But they were the ruin of him, and of all Yashar''el (Israel)* (2 Chronicles 28:23). The Damascus altar was no neutral copy — it was the altar of the gods of Damascus enthroned in Yahuah''s house. And so the doors of true worship were shut: *Ahaz gathered together the vessels of the house of Elohim (God), and cut in pieces the vessels of the house of Elohim (God), and shut up the doors of the house of Yahuah (LORD), and he made him altars in every corner of Jerusalem* (2 Chronicles 28:24). The king set himself above the appointed worship, and the foreign pattern in the holy place became his ruin.',
       sv.verse_id, ev.verse_id, 'free', 38881
  FROM _s343_2ki16_lookup sv, _s343_2ki16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=16 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- MEMBERS: THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 18:21 — *thou shalt not let any of thy seed pass through the fire to Molech*: the command Ahaz broke, named centuries before.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=3
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-he-made-his-son-to-pass-through-the-fire-the-molech-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 18:10 — *any one that maketh his son or his daughter to pass through the fire*: the exact phrase of 16:3, bound to the abominations of the nations.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=3
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-he-made-his-son-to-pass-through-the-fire-the-molech-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 106:37 — *they sacrificed their sons and their daughters unto devils*: the covenant history sings the crime Ahaz repeats.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=3
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-he-made-his-son-to-pass-through-the-fire-the-molech-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 106:38 — *shed innocent blood... and the land was polluted with blood*: what passing through the fire does to the land.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=3
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-he-made-his-son-to-pass-through-the-fire-the-molech-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Jeremiah 7:31 — *the high places of Tophet... to burn their sons and their daughters in the fire; which I commanded them not*: it was never Yahuah''s worship.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=3
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-he-made-his-son-to-pass-through-the-fire-the-molech-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'2 Chronicles 28:3 — *burnt his children in the fire, after the abominations of the heathen*: the Chronicler''s parallel, in the valley of Hinnom.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=3
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=28 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-he-made-his-son-to-pass-through-the-fire-the-molech-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Deuteronomy 12:31 — *their sons and their daughters they have burnt in the fire to their gods*: the high-place imitation of 16:4 Moses forbade.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-he-made-his-son-to-pass-through-the-fire-the-molech-abomination'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS: THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 7:1 — *Rezin the king of Syria, and Pekah... went up toward Jerusalem to war*: the same siege as 16:5, the setting of the Immanuel sign.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=5
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=7 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-the-faithless-alliance-and-the-sign-of-immanuel-ahaz-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 28:5 — *Yahuah Elohav (the LORD his God) delivered him into the hand of the king of Syria*: the siege as covenant judgment, two houses at war.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=5
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=28 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-the-faithless-alliance-and-the-sign-of-immanuel-ahaz-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Isaiah 7:9 — *If ye will not believe, surely ye shall not be established*: the word against the alliance Ahaz makes in 16:7.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=7
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=7 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-the-faithless-alliance-and-the-sign-of-immanuel-ahaz-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Isaiah 8:6 — *this people refuseth the waters of Shiloah that go softly, and rejoice in Rezin*: the refusal to trust that the Assyrian alliance enacts.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=7
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-the-faithless-alliance-and-the-sign-of-immanuel-ahaz-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Chronicles 28:16 — *did king Ahaz send unto the kings of Assyria to help him*: the flat verdict on the move of 16:7.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=7
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=28 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-the-faithless-alliance-and-the-sign-of-immanuel-ahaz-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Isaiah 7:14 — *a virgin shall conceive, and bear a son, and shall call his name Immanuel*: the sign given in the teeth of the king''s unbelief.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=8
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=7 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-the-faithless-alliance-and-the-sign-of-immanuel-ahaz-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Isaiah 8:7 — *the king of Assyria, and all his glory... shall come up over all his channels*: the hired deliverer turned into the flood over Judah.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=8
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-the-faithless-alliance-and-the-sign-of-immanuel-ahaz-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Matthew 1:23 — *they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us*: the sign Ahaz refused, fulfilled in the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=8
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-the-faithless-alliance-and-the-sign-of-immanuel-ahaz-refused'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS: THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 12:30 — *enquire not after their gods, saying, How did these nations serve their gods? even so will I do likewise*: exactly Ahaz copying the Damascus altar.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=10
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-the-altar-of-damascus-worship-corrupted-by-the-foreign-pattern'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 28:24 — *shut up the doors of the house of Yahuah (LORD), and he made him altars in every corner*: the true worship displaced by 16:14.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=14
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=28 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-the-altar-of-damascus-worship-corrupted-by-the-foreign-pattern'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Chronicles 28:23 — *he sacrificed unto the gods of Damascus... they were the ruin of him*: the altar of 16:15 was the altar of Damascus'' gods, his ruin.'
  FROM cross_reference_threads t
  JOIN _s343_2ki16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s343_2ki16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=28 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-16-the-altar-of-damascus-worship-corrupted-by-the-foreign-pattern'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_17.sql (2 Kings 17) -----
-- Chapter: 2 Kings 17 — THE FALL OF SAMARIA, the deportation and scattering of the
--   ten northern tribes (the house of Yashar'el / Ephraim / Joseph). The single
--   keystone backstory of the whole two-house framework.
-- Tag: 2ki17   View: _s343_2ki17_lookup
-- Source edition/book: 'canon','2-kings',17,v   |  Sort band: 38900 step 3 (38900..38921)
--
-- 2 Kings 17 coverage:
--   v.6 (deportation)        NT: none warranted   Extras: none warranted (no extra-canon witness narrates Samaria's fall)   Tanakh: 2Ki18:11 (recap); Deut28:64/Lev26:33 (the scattering-sanction); Hosea1:10-11/Ezek37:21/Jer31:10 (the regathering)
--   v.7-12 (idolatry)        NT: none warranted   Extras: none warranted   Tanakh: Deut18:9-12 (abominations of the nations); Deut28:36; Amos5:26
--   v.13 (prophets testify)  NT: none warranted   Extras: none warranted   Tanakh: Amos5:4-6 (seek me and live); Jer3:12-14 (return backsliding Yashar'el)
--   v.14-15 (rejected covenant) NT: none warranted Extras: none warranted   Tanakh: Lev26:14-15; Deut29:25-26; Jer31:32 (covenant they brake)
--   v.16 (two calves)        NT: none warranted   Extras: none warranted   Tanakh: 1Ki12:28,30 (Jeroboam's calves); 1Ki14:15-16 (scatter beyond the river)
--   v.17 (pass through fire/divination) NT: none warranted Extras: none warranted Tanakh: Deut18:10,12
--   v.18,20,23 (removed/rejected) NT: Rom11:1-2,25-26 (cast away? Elohim forbid); Rom9:25-26 (not-my-people) Extras: none warranted Tanakh: Hosea1:10/Ezek37:22 (regather, one nation)
--   v.18,23 (divorce of the north) NT: none warranted Extras: none warranted Tanakh: Jer3:8 (bill of divorce); Hosea2:23 (betroth again); Jer31:9 (Ephraim my firstborn)
--   v.24-33,41 (Samaritan syncretism) NT: John4:22 (ye worship ye know not what) Extras: none warranted Tanakh: Deut18:9 (after the abominations)
--
-- Threads (8):
--   2-kings-17-the-king-of-assyria-carried-yashar-el-away   [canon/Tanakh + Tanakh] free
--   2-kings-17-removed-out-of-his-sight-yet-elohim-cast-not-away-his-people  [canon NT + Tanakh] free
--   2-kings-17-they-rejected-his-statutes-and-his-covenant  [canon Tanakh] free
--   2-kings-17-the-two-calves-of-jeroboam-the-root-of-the-scattering  [canon Tanakh] free
--   2-kings-17-they-feared-other-gods-the-statutes-of-the-heathen  [canon Tanakh] free
--   2-kings-17-yet-yahuah-testified-by-all-the-prophets-turn-ye  [canon Tanakh] free
--   2-kings-17-the-divorced-house-of-yashar-el-to-be-betrothed-again  [canon Tanakh] free
--   2-kings-17-they-feared-yahuah-and-served-their-own-gods-the-samaritan-half-worship  [canon NT + Tanakh] free
--
-- Framing note: This is the chapter where Claude's default replacement reading is most
--   dangerous. Every scattering verse (17:6,18,20,23) is bound FORWARD to the regathering
--   (Hosea1:10-11, Ezek37:21-22, Jer31:9-10) with the Romans 11:1-2 anti-replacement guard
--   made EXPLICIT: removed-from-the-land is NOT cast-off-for-ever. The curse is the Deut28/
--   Lev26 exile-sanction for breaking the covenant, NEVER the Torah itself — the Torah is the
--   covenant they REJECTED (17:13-15). Jeroboam's two calves (1Ki12:28) the root. The
--   Samaritans' fear-Yahuah-and-serve-idols (17:33,41) the half-worship Yahusha names at the
--   well (John4:22). Both olive branches are Yashar'el.

CREATE TEMP VIEW _s343_2ki17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the deportation / scattering of the northern house
    ('canon','2-kings',17,6,  'canon','2-kings',18,11, 'free', E'*And the king of Assyria did carry away Yashar''el (Israel) unto Assyria, and put them in Halah and in Habor by the river of Gozan, and in the cities of the Medes* (2 Kings 18:11). The narrator repeats the deportation verbatim: when *the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor* (2 Kings 17:6), the ten northern tribes are lost among the nations — the scattering of the lost sheep begins.'),
    ('canon','2-kings',17,6,  'canon','deuteronomy',28,64, 'free', E'*And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other* (Deuteronomy 28:64). The Assyrian who *carried Yashar''el (Israel) away into Assyria* (2 Kings 17:6) is the rod of the covenant-sanction Moses foretold — the scattering is the Deut 28 exile-judgment for breaking the covenant, never the Torah itself made a curse.'),
    ('canon','2-kings',17,6,  'canon','leviticus',26,33, 'free', E'*And I will scatter you among the heathen, and will draw out a sword after you: and your land shall be desolate, and your cities waste* (Leviticus 26:33). The deportation — *placed them in Halah and in Habor by the river of Gozan* (2 Kings 17:6) — is the Sinai covenant-curse falling exactly as written, the discipline of a covenant kept, not abolished.'),
    ('canon','2-kings',17,6,  'canon','hosea',1,10, 'free', E'*Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea, which cannot be measured nor numbered; and it shall come to pass, that in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10). The same scattered house that the Assyrian *carried Yashar''el (Israel) away* (2 Kings 17:6) is the seed promised to multiply among the nations and be reclaimed — scattered to be gathered, never replaced.'),
    ('canon','2-kings',17,6,  'canon','ezekiel',37,21, 'free', E'*Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). The very people Assyria *placed... in the cities of the Medes* (2 Kings 17:6) are the ones Yahuah pledges to regather — the deportation is the front half of the two-sticks prophecy.'),
    -- THREAD 2: removed out of his sight, yet not cast away for ever (anti-replacement)
    ('canon','2-kings',17,18, 'canon','romans',11,1, 'free', E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). When the text says Yahuah *removed them out of his sight* (2 Kings 17:18), it does NOT mean cast-off-for-ever: Paul forbids that very reading — the removed are still his people, the natural branches still beloved for the fathers'' sakes.'),
    ('canon','2-kings',17,18, 'canon','romans',11,2, 'free', E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The removal of the northern house — *there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18) — is exile, not abandonment; the foreknown seed is disciplined, scattered, and kept, never replaced by another people.'),
    ('canon','2-kings',17,20, 'canon','romans',9,25, 'free', E'*As he saith also in Osee, I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25). Though Yahuah *rejected all the seed of Yashar''el (Israel)* (2 Kings 17:20), Paul quotes Hosea to show the not-my-people sentence is reversible — the rejected seed is reclaimed, the scattered house called my-people again.'),
    ('canon','2-kings',17,23, 'canon','romans',11,25, 'free', E'*That blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in. And so all Yashar''el (Israel) shall be saved* (Romans 11:25-26). The carrying-away — *So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day* (2 Kings 17:23) — has a terminus: *until*, then *all Yashar''el shall be saved*. The scattering runs toward ingathering, not toward a new people grafted in by confession.'),
    ('canon','2-kings',17,23, 'canon','ezekiel',37,22, 'free', E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel)... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The house *carried away out of their own land to Assyria* (2 Kings 17:23) is the stick of Joseph that will be joined again to the stick of Yahudah — the division ends in reunion, never in replacement.'),
    -- THREAD 3: they rejected his statutes and his covenant (the broken Torah, not a curse)
    ('canon','2-kings',17,15, 'canon','leviticus',26,15, 'free', E'*And if ye shall despise my statutes, or if your soul abhor my judgments, so that ye will not do all my commandments, but that ye break my covenant* (Leviticus 26:15). To *reject his statutes, and his covenant* (2 Kings 17:15) is to trip the exact clause Sinai named — the covenant-curse answers covenant-breaking; the Torah is the inheritance they spurned, not the thing condemning them.'),
    ('canon','2-kings',17,14, 'canon','deuteronomy',29,25, 'free', E'*Because they have forsaken the covenant of Yahuah Elohim (the LORD God) of their fathers, which he made with them when he brought them forth out of the land of Egypt* (Deuteronomy 29:25). They *hardened their necks... that did not believe in Yahuah their Elohim* (2 Kings 17:14); the answer of the exile — *Yahuah rooted them out of their land... and cast them into another land* (Deut 29:28) — is the covenant-lawsuit verdict for forsaking, not the Torah turned enemy.'),
    ('canon','2-kings',17,13, 'canon','deuteronomy',28,15, 'free', E'*But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes... that all these curses shall come upon thee, and overtake thee* (Deuteronomy 28:15). Yahuah testified, *keep my commandments and my statutes, according to all the law* (2 Kings 17:13); refusing the keeping, not the law, is what brought the listed curses down.'),
    ('canon','2-kings',17,15, 'canon','jeremiah',31,32, 'free', E'*Not according to the covenant that I made with their fathers... which my covenant they brake, although I was an husband unto them, saith Yahuah (LORD)* (Jeremiah 31:32). The covenant *that he made with their fathers* which they *rejected* (2 Kings 17:15) is the one Jeremiah says they brake — yet the cure is the same Torah *put... in their inward parts* (Jer 31:33), written on the heart, never replaced.'),
    -- THREAD 4: the two calves of Jeroboam, the root of the scattering
    ('canon','2-kings',17,16, 'canon','1-kings',12,28, 'free', E'*Whereupon the king took counsel, and made two calves of gold, and said unto them, It is too much for you to go up to Jerusalem: behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (1 Kings 12:28). The *two calves* the northern house *made* (2 Kings 17:16) are Jeroboam''s founding calves — the root apostasy that set the whole house on the road to Assyria.'),
    ('canon','2-kings',17,21, 'canon','1-kings',12,30, 'free', E'*And this thing became a sin: for the people went to worship before the one, even unto Dan* (1 Kings 12:30). *Jeroboam drave Yashar''el (Israel) from following Yahuah, and made them sin a great sin* (2 Kings 17:21); the calf-cult at Beth-el and Dan is the great sin named, the wedge driven between the north and the house of David.'),
    ('canon','2-kings',17,22, 'canon','1-kings',14,15, 'free', E'*For Yahuah (LORD) shall smite Yashar''el (Israel)... and shall scatter them beyond the river, because they have made their groves, provoking Yahuah to anger* (1 Kings 14:15). Because *the children of Yashar''el walked in all the sins of Jeroboam* (2 Kings 17:22), the scattering-beyond-the-river that Ahijah foretold is fulfilled — the calf-sin and the grove draw down the exile.'),
    -- THREAD 5: they feared other gods, the statutes of the heathen
    ('canon','2-kings',17,8,  'canon','deuteronomy',18,9, 'free', E'*When thou art come into the land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not learn to do after the abominations of those nations* (Deuteronomy 18:9). To *walk in the statutes of the heathen* (2 Kings 17:8) is to do the very thing the Torah forbade — they learned the abominations of the nations Yahuah had cast out before them.'),
    ('canon','2-kings',17,17, 'canon','deuteronomy',18,10, 'free', E'*There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch* (Deuteronomy 18:10). They *caused their sons and their daughters to pass through the fire, and used divination and enchantments* (2 Kings 17:17) — the exact catalogue of forbidden abominations, the heathen worship the Torah named for destruction.'),
    ('canon','2-kings',17,12, 'canon','deuteronomy',18,12, 'free', E'*For all that do these things are an abomination unto Yahuah (LORD): and because of these abominations Yahuah Elohayka (the LORD thy God) doth drive them out from before thee* (Deuteronomy 18:12). *They served idols, whereof Yahuah had said unto them, Ye shall not do this thing* (2 Kings 17:12); the abominations that drove the nations out now drive Yashar''el out — the land vomits the same sin from a different mouth.'),
    ('canon','2-kings',17,16, 'canon','amos',5,26, 'free', E'*But ye have borne the tabernacle of your Moloch and Chiun your images, the star of your god, which ye made to yourselves* (Amos 5:26). The northern house *worshipped all the host of heaven, and served Baal* (2 Kings 17:16); Amos names the same astral idolatry — *the star of your god* — for which *I cause you to go into captivity beyond Damascus* (Amos 5:27).'),
    -- THREAD 6: yet Yahuah testified by all the prophets, turn ye
    ('canon','2-kings',17,13, 'canon','amos',5,4, 'free', E'*For thus saith Yahuah (LORD) unto the house of Yashar''el (Israel), Seek ye me, and ye shall live* (Amos 5:4). The testimony *by all the prophets... Turn ye from your evil ways* (2 Kings 17:13) is Amos''s very plea to the northern house — *seek me and live*, the offered mercy they would not hear.'),
    ('canon','2-kings',17,13, 'canon','amos',5,6, 'free', E'*Seek Yahuah (LORD), and ye shall live; lest he break out like fire in the house of Joseph, and devour it, and there be none to quench it in Beth-el* (Amos 5:6). The prophets warned *keep my commandments and my statutes* (2 Kings 17:13); Amos warns the house of Joseph that the unheeded call ends in a fire none can quench at Beth-el — the calf-shrine itself.'),
    ('canon','2-kings',17,23, 'canon','jeremiah',3,12, 'free', E'*Go and proclaim these words toward the north, and say, Return, thou backsliding Yashar''el (Israel), saith Yahuah; and I will not cause mine anger to fall upon you: for I am merciful* (Jeremiah 3:12). After Yahuah *removed Yashar''el out of his sight, as he had said by all his servants the prophets* (2 Kings 17:23), the same prophetic voice still calls toward the north — *return, thou backsliding Yashar''el* — the scattered house invited home.'),
    -- THREAD 7: the divorced house of Yashar'el, to be betrothed again
    ('canon','2-kings',17,18, 'canon','jeremiah',3,8, 'free', E'*And I saw, when for all the causes whereby backsliding Yashar''el (Israel) committed adultery I had put her away, and given her a bill of divorce* (Jeremiah 3:8). The removal — *Yahuah was very angry with Yashar''el, and removed them out of his sight* (2 Kings 17:18) — is the bill of divorce against the northern house, the adulterous wife put away yet not cast off for ever.'),
    ('canon','2-kings',17,23, 'canon','hosea',2,23, 'free', E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). The house *carried away... unto this day* (2 Kings 17:23) is the divorced wife Hosea promises to betroth again — *I will sow her unto me in the earth*, Lo-ammi reversed to Ammi.'),
    ('canon','2-kings',17,23, 'canon','hosea',1,11, 'free', E'*Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land: for great shall be the day of Jezreel* (Hosea 1:11). The scattering *out of their own land to Assyria* (2 Kings 17:23) is reversed in the reunion of both houses under one head — the two sticks, the same regathered seed.'),
    ('canon','2-kings',17,18, 'canon','jeremiah',31,9, 'free', E'*They shall come with weeping... for I am a father to Yashar''el (Israel), and Ephraim is my firstborn* (Jeremiah 31:9). Though the north is *removed out of his sight* (2 Kings 17:18), Yahuah still calls Ephraim his firstborn — the divorced son is led home weeping, *He that scattered Yashar''el will gather him* (Jer 31:10).'),
    -- THREAD 8: they feared Yahuah and served their own gods (Samaritan half-worship)
    ('canon','2-kings',17,33, 'canon','john',4,22, 'free', E'*Ye worship ye know not what: we know what we worship: for salvation is of the Yahudim (Jews)* (John 4:22). To the Samaritan woman at Jacob''s well Yahusha names the very half-worship planted here: *They feared Yahuah, and served their own gods* (2 Kings 17:33) — a divided heart that fears Yahuah and serves idols is no covenant-fidelity at all.'),
    ('canon','2-kings',17,41, 'canon','john',4,22, 'free', E'*Ye worship ye know not what: we know what we worship* (John 4:22). *So these nations feared Yahuah, and served their graven images... as did their fathers, so do they unto this day* (2 Kings 17:41); the syncretism handed down through the generations is the mixed worship Yahusha confronts at Sychar — worship that does not know what it worships.'),
    ('canon','2-kings',17,29, 'canon','deuteronomy',18,9, 'free', E'*Thou shalt not learn to do after the abominations of those nations* (Deuteronomy 18:9). *Howbeit every nation made gods of their own, and put them in the houses of the high places which the Samaritans had made* (2 Kings 17:29); the colonists do exactly what the Torah forbade — each nation importing its own abominations into the land Yahuah claims for himself.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== THREADS =====

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-17-the-king-of-assyria-carried-yashar-el-away', E'The king of Assyria carried Yashar''el away — the scattering of the northern house', E'In the ninth year of Hoshea the deportation falls: *In the ninth year of Hoshea the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes* (2 Kings 17:6). The narrator says it twice, lest we miss it: *And the king of Assyria did carry away Yashar''el (Israel) unto Assyria, and put them in Halah and in Habor by the river of Gozan, and in the cities of the Medes* (2 Kings 18:11). Here the ten northern tribes are lost among the nations — the scattering of the lost sheep begins. This is no random catastrophe. Moses had named it: *And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other* (Deuteronomy 28:64), and at Sinai: *And I will scatter you among the heathen, and will draw out a sword after you* (Leviticus 26:33). The Assyrian is the rod of the covenant-sanction — the discipline of a covenant kept, never the Torah turned into a curse. And the scattering already carries its own reversal: *Yet the number of the children of Yashar''el (Israel) shall be as the sand of the sea... and... in the place where it was said unto them, Ye are not my people, there it shall be said unto them, Ye are the sons of the living Elohim (God)* (Hosea 1:10), for *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). Scattered to be gathered — the seed multiplied in the nations, never a people replaced.',
       sv.verse_id, ev.verse_id, 'free', 38900
  FROM _s343_2ki17_lookup sv, _s343_2ki17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=17 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-17-removed-out-of-his-sight-yet-elohim-cast-not-away-his-people', E'Removed out of his sight — yet Elohim cast not away his people', E'*Therefore Yahuah (LORD) was very angry with Yashar''el (Israel), and removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18); *And Yahuah rejected all the seed of Yashar''el* (17:20); *So was Yashar''el carried away out of their own land to Assyria unto this day* (17:23). Read with the default Christianized eye, this is the verse that "casts Israel off for ever." It is not — and Paul forbids that reading in the strongest terms: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham* (Romans 11:1); *Elohim hath not cast away his people which he foreknew* (Romans 11:2). Removed-from-the-land is exile, not abandonment. The not-my-people sentence is reversible by design: *I will call them my people, which were not my people; and her beloved, which was not beloved* (Romans 9:25). And the carrying-away has a terminus written into it: *blindness in part is happened to Yashar''el, until the fulness of the Gentiles be come in. And so all Yashar''el shall be saved* (Romans 11:25-26). The scattering runs toward ingathering: *I will make them one nation in the land... and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). Both olive branches are Yashar''el — the natural and the wild, the same seed, never another people grafted in by confession.',
       sv.verse_id, ev.verse_id, 'free', 38903
  FROM _s343_2ki17_lookup sv, _s343_2ki17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=17 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-17-they-rejected-his-statutes-and-his-covenant', E'They rejected his statutes and his covenant — the Torah broken, never the curse', E'The indictment is precise: *Yet Yahuah (LORD) testified against Yashar''el... saying, Turn ye from your evil ways, and keep my commandments and my statutes, according to all the law which I commanded your fathers* (2 Kings 17:13); but *they hardened their necks... that did not believe in Yahuah their Elohim* (17:14), and *they rejected his statutes, and his covenant that he made with their fathers, and his testimonies* (17:15). The Torah is not what condemns them — the Torah is the inheritance they spurned. To reject the statutes is to trip the exact clause Sinai named: *if ye shall despise my statutes... but that ye break my covenant* (Leviticus 26:15), and Moab named: *Because they have forsaken the covenant of Yahuah Elohim (the LORD God) of their fathers* (Deuteronomy 29:25). The curse is the covenant-sanction for breaking the covenant — *if thou wilt not hearken... that all these curses shall come upon thee* (Deuteronomy 28:15) — answering the refusal-to-keep, not the keeping. And even the broken covenant is not the end of the Torah: *which my covenant they brake, although I was an husband unto them* (Jeremiah 31:32), yet the cure is that same Torah *put... in their inward parts, and write it in their hearts* (Jer 31:33). The law written on the heart is the covenant renewed, never replaced.',
       sv.verse_id, ev.verse_id, 'free', 38906
  FROM _s343_2ki17_lookup sv, _s343_2ki17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=17 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-17-the-two-calves-of-jeroboam-the-root-of-the-scattering', E'The two calves of Jeroboam — the root of the scattering', E'At the head of the indictment stand the calves: *And they left all the commandments of Yahuah (LORD) their Elohim (God), and made them molten images, even two calves, and made a grove, and worshipped all the host of heaven, and served Baal* (2 Kings 17:16). These are not new idols — they are Jeroboam''s founding apostasy come to full harvest: *the king took counsel, and made two calves of gold, and said unto them... behold thy gods, O Yashar''el (Israel), which brought thee up out of the land of Egypt* (1 Kings 12:28). *And this thing became a sin: for the people went to worship before the one, even unto Dan* (1 Kings 12:30). The chapter names this very wedge as the cause: *Jeroboam drave Yashar''el (Israel) from following Yahuah, and made them sin a great sin* (2 Kings 17:21), and *the children of Yashar''el walked in all the sins of Jeroboam which he did; they departed not from them* (17:22). Ahijah had already pronounced the end of that road: *For Yahuah shall smite Yashar''el... and shall scatter them beyond the river, because they have made their groves, provoking Yahuah to anger* (1 Kings 14:15). The golden calves at Beth-el and Dan are the root, and the scattering-beyond-the-river is the fruit.',
       sv.verse_id, ev.verse_id, 'free', 38909
  FROM _s343_2ki17_lookup sv, _s343_2ki17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=17 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-17-they-feared-other-gods-the-statutes-of-the-heathen', E'They feared other gods — walking in the statutes of the heathen', E'The why of the exile is told without flinching: *the children of Yashar''el (Israel) had sinned against Yahuah their Elohim... and had feared other gods, And walked in the statutes of the heathen* (2 Kings 17:7-8); *they built them high places... set them up images and groves in every high hill... burnt incense in all the high places* (17:9-11); *they served idols, whereof Yahuah had said unto them, Ye shall not do this thing* (17:12); *they caused their sons and their daughters to pass through the fire, and used divination and enchantments* (17:17). Every line is the Torah''s own forbidden catalogue thrown back: *thou shalt not learn to do after the abominations of those nations* (Deuteronomy 18:9), *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch* (Deut 18:10), *for all that do these things are an abomination unto Yahuah: and because of these abominations Yahuah doth drive them out from before thee* (Deut 18:12). The abominations that drove the nations out now drive Yashar''el out — the land vomits the same sin from a different mouth. Amos names the astral idol exactly: *ye have borne the tabernacle of your Moloch and Chiun your images, the star of your god, which ye made to yourselves* (Amos 5:26) — and so *I will cause you to go into captivity beyond Damascus* (Amos 5:27).',
       sv.verse_id, ev.verse_id, 'free', 38912
  FROM _s343_2ki17_lookup sv, _s343_2ki17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=17 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-17-yet-yahuah-testified-by-all-the-prophets-turn-ye', E'Yet Yahuah testified by all the prophets — Turn ye, and ye shall live', E'Before the sentence falls, the mercy is offered and offered again: *Yet Yahuah (LORD) testified against Yashar''el (Israel), and against Yahudah (Judah), by all the prophets, and by all the seers, saying, Turn ye from your evil ways, and keep my commandments and my statutes, according to all the law which I commanded your fathers* (2 Kings 17:13). The prophets named here are not abstractions — this is Amos''s very plea to the northern house: *Seek ye me, and ye shall live* (Amos 5:4), *Seek Yahuah (LORD), and ye shall live; lest he break out like fire in the house of Joseph, and devour it, and there be none to quench it in Beth-el* (Amos 5:6) — the fire aimed at the calf-shrine itself. They would not hear; the exile came: *Until Yahuah removed Yashar''el out of his sight, as he had said by all his servants the prophets* (2 Kings 17:23). And still the prophetic voice does not fall silent toward the scattered house: *Go and proclaim these words toward the north, and say, Return, thou backsliding Yashar''el (Israel), saith Yahuah; and I will not cause mine anger to fall upon you: for I am merciful* (Jeremiah 3:12). The same God who removed them keeps calling them home — the warning unheeded becomes the invitation that outlasts the judgment.',
       sv.verse_id, ev.verse_id, 'free', 38915
  FROM _s343_2ki17_lookup sv, _s343_2ki17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=17 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-17-the-divorced-house-of-yashar-el-to-be-betrothed-again', E'The divorced house of Yashar''el — to be betrothed again', E'*Therefore Yahuah (LORD) was very angry with Yashar''el (Israel), and removed them out of his sight* (2 Kings 17:18); *So was Yashar''el carried away out of their own land to Assyria unto this day* (17:23). Read through the prophets, the removal is a bill of divorce against an adulterous wife: *And I saw, when for all the causes whereby backsliding Yashar''el (Israel) committed adultery I had put her away, and given her a bill of divorce* (Jeremiah 3:8). The northern house is put away — but not cast off for ever. The whole of Hosea answers this exile: *I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23) — Lo-ammi reversed to Ammi. *Then shall the children of Yahudah (Judah) and the children of Yashar''el (Israel) be gathered together, and appoint themselves one head, and they shall come up out of the land* (Hosea 1:11), the two houses one again. And the divorced son is still beloved: *They shall come with weeping... for I am a father to Yashar''el (Israel), and Ephraim is my firstborn* (Jeremiah 31:9). The divorce is real; so is the betrothal that answers it — *He that scattered Yashar''el will gather him.*',
       sv.verse_id, ev.verse_id, 'free', 38918
  FROM _s343_2ki17_lookup sv, _s343_2ki17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=17 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-17-they-feared-yahuah-and-served-their-own-gods-the-samaritan-half-worship', E'They feared Yahuah and served their own gods — the Samaritan half-worship', E'Into the emptied cities of the north the king of Assyria pours foreign colonists — *from Babylon, and from Cuthah, and from Ava, and from Hamath, and from Sepharvaim* (2 Kings 17:24) — and a deported priest is sent back to teach them *how they should fear Yahuah (LORD)* (17:28). The result is a divided heart: *Howbeit every nation made gods of their own, and put them in the houses of the high places which the Samaritans had made* (17:29); *So they feared Yahuah, and made unto themselves of the lowest of them priests of the high places* (17:32); *They feared Yahuah, and served their own gods, after the manner of the nations* (17:33); *So these nations feared Yahuah, and served their graven images... as did their fathers, so do they unto this day* (17:41). This is the half-worship the rest of the canon condemns — fearing Yahuah while serving idols is no covenant-fidelity at all, only the Torah''s forbidden mixture: *Thou shalt not learn to do after the abominations of those nations* (Deuteronomy 18:9). And this is the very ground Yahusha names at Jacob''s well, to the Samaritan woman: *Ye worship ye know not what: we know what we worship: for salvation is of the Yahudim (Jews)* (John 4:22). The divided worship planted here in Samaria is the worship that does not know what it worships — answered only when the true worshippers worship the Father in spirit and in truth.',
       sv.verse_id, ev.verse_id, 'free', 38921
  FROM _s343_2ki17_lookup sv, _s343_2ki17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=17 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====

-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 18:11 — the narrator repeats the deportation verbatim: *did carry away Yashar''el (Israel) unto Assyria, and put them in Halah and in Habor*.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=18 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-the-king-of-assyria-carried-yashar-el-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 28:64 — *Yahuah shall scatter thee among all people, from the one end of the earth even unto the other*: the Assyrian is the Deut 28 exile-sanction, not the Torah as curse.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=64
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-the-king-of-assyria-carried-yashar-el-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Leviticus 26:33 — *I will scatter you among the heathen, and will draw out a sword after you*: the Sinai covenant-curse falling exactly as written.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-the-king-of-assyria-carried-yashar-el-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Hosea 1:10 — *the children of Yashar''el shall be as the sand of the sea... Ye are the sons of the living Elohim*: scattered to be reclaimed, not replaced.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-the-king-of-assyria-carried-yashar-el-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Ezekiel 37:21 — *I will take the children of Yashar''el from among the heathen... and bring them into their own land*: the deportation is the front half of the two-sticks prophecy.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-the-king-of-assyria-carried-yashar-el-away'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Romans 11:1 — *Hath Elohim cast away his people? Elohim forbid*: Paul forbids the very replacement reading of 17:18.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=18
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-removed-out-of-his-sight-yet-elohim-cast-not-away-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Romans 11:2 — *Elohim hath not cast away his people which he foreknew*: removal is exile, not abandonment.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=18
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-removed-out-of-his-sight-yet-elohim-cast-not-away-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Romans 9:25 — *I will call them my people, which were not my people*: the not-my-people sentence of 17:20 is reversible by design.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=20
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-removed-out-of-his-sight-yet-elohim-cast-not-away-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Romans 11:25-26 — *blindness in part... until the fulness of the Gentiles be come in. And so all Yashar''el shall be saved*: the carrying-away of 17:23 has a terminus.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=23
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-removed-out-of-his-sight-yet-elohim-cast-not-away-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Ezekiel 37:22 — *one nation... no more two nations*: the scattering runs toward reunion, never replacement.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=23
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-removed-out-of-his-sight-yet-elohim-cast-not-away-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Leviticus 26:15 — *if ye shall despise my statutes... but that ye break my covenant*: rejecting the statutes (17:15) trips the exact Sinai clause.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=15
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-they-rejected-his-statutes-and-his-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 29:25 — *Because they have forsaken the covenant of Yahuah Elohim of their fathers*: the hardened necks of 17:14 are the forsaking the Moab covenant named.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-they-rejected-his-statutes-and-his-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 28:15 — *if thou wilt not hearken... that all these curses shall come upon thee*: the curse answers refusing-to-keep (17:13), not the law itself.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=13
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-they-rejected-his-statutes-and-his-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Jeremiah 31:32 — *which my covenant they brake, although I was an husband unto them*: the broken covenant is renewed (31:33 Torah on the heart), never replaced.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=15
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-they-rejected-his-statutes-and-his-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Kings 12:28 — *made two calves of gold... behold thy gods, O Yashar''el*: the two calves of 17:16 are Jeroboam''s founding apostasy.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=16
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-the-two-calves-of-jeroboam-the-root-of-the-scattering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Kings 12:30 — *this thing became a sin... even unto Dan*: the great sin of 17:21, the wedge between north and the house of David.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=21
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=12 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-the-two-calves-of-jeroboam-the-root-of-the-scattering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Kings 14:15 — *shall scatter them beyond the river, because they have made their groves*: Ahijah foretold the scattering that 17:22 fulfils.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=22
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=14 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-the-two-calves-of-jeroboam-the-root-of-the-scattering'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 18:9 — *thou shalt not learn to do after the abominations of those nations*: walking in the statutes of the heathen (17:8) is the forbidden thing.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=8
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-they-feared-other-gods-the-statutes-of-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 18:10 — *maketh his son or his daughter to pass through the fire... divination*: the exact catalogue 17:17 enacts.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=17
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-they-feared-other-gods-the-statutes-of-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 18:12 — *because of these abominations Yahuah doth drive them out*: the abominations that drove the nations out now drive Yashar''el out (17:12).'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=12
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-they-feared-other-gods-the-statutes-of-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Amos 5:26 — *the tabernacle of your Moloch and Chiun your images, the star of your god*: the host-of-heaven worship of 17:16 named, ending in captivity beyond Damascus.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=16
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-they-feared-other-gods-the-statutes-of-the-heathen'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Amos 5:4 — *Seek ye me, and ye shall live*: the prophets'' testimony of 17:13 is Amos''s plea to the northern house.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=13
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-yet-yahuah-testified-by-all-the-prophets-turn-ye'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Amos 5:6 — *lest he break out like fire in the house of Joseph... none to quench it in Beth-el*: the unheeded call ends in fire at the calf-shrine.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=13
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-yet-yahuah-testified-by-all-the-prophets-turn-ye'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Jeremiah 3:12 — *Return, thou backsliding Yashar''el... for I am merciful*: after the removal of 17:23, the prophetic voice still calls the north home.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=23
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-yet-yahuah-testified-by-all-the-prophets-turn-ye'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Jeremiah 3:8 — *I had put her away, and given her a bill of divorce*: the removal of 17:18 is the divorce of the adulterous northern house.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=18
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-the-divorced-house-of-yashar-el-to-be-betrothed-again'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Hosea 2:23 — *I will say to them which were not my people, Thou art my people*: the carried-away house (17:23) betrothed again, Lo-ammi reversed to Ammi.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=23
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-the-divorced-house-of-yashar-el-to-be-betrothed-again'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Hosea 1:11 — *the children of Yahudah and the children of Yashar''el be gathered together... one head*: the scattering of 17:23 reversed in the reunion of both houses.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=23
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-the-divorced-house-of-yashar-el-to-be-betrothed-again'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Jeremiah 31:9 — *I am a father to Yashar''el, and Ephraim is my firstborn*: the removed house (17:18) still the beloved firstborn son, led home weeping.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=18
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-the-divorced-house-of-yashar-el-to-be-betrothed-again'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 8
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'John 4:22 — *Ye worship ye know not what*: Yahusha names the divided worship of 17:33 to the Samaritan woman at Jacob''s well.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=33
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-they-feared-yahuah-and-served-their-own-gods-the-samaritan-half-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'John 4:22 — *we know what we worship*: the syncretism handed down (17:41, *so do they unto this day*) is the half-worship Yahusha confronts at Sychar.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=41
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-they-feared-yahuah-and-served-their-own-gods-the-samaritan-half-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 18:9 — *Thou shalt not learn to do after the abominations of those nations*: the colonists (17:29) import each nation''s abominations into Yahuah''s land.'
  FROM cross_reference_threads t
  JOIN _s343_2ki17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=17 AND sv.verse_number=29
  JOIN _s343_2ki17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-17-they-feared-yahuah-and-served-their-own-gods-the-samaritan-half-worship'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_18.sql (2 Kings 18) -----
-- 2 Kings 18 — Hezekiah the reformer; Nehushtan; trust + Torah; Rabshakeh's blasphemy
-- TAG: 2ki18   VIEW: _s343_2ki18_lookup   SORT BAND: base 38925, step 3
-- SOURCE rows all: 'canon','2-kings',18,v
--
-- 2 Kings 18 coverage:
--   v.3-6  NT:     none warranted (Torah-king mark; NT echo of Deut6 carried in thread 2 prose)
--          Extras: none warranted
--          Tanakh: Deut 6:4-5 (love/one Yahuah), Deut 6:17 (diligently keep), 2 Kings 17:18-19 (contrast)
--   v.4    NT:     John 3:14-15 (serpent lifted up = Son of Adam lifted up)  ★ thread 1
--          Extras: none warranted (avoid editorial-noisy parses)
--          Tanakh: Numbers 21:8-9 (the brasen serpent Moses made)  ★ thread 1
--   v.9-12 NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Kings 17:6,18,23 (the scattering of the northern house), Deut 6:14-15 (jealous Elohim)  ★ thread 3
--   v.13-16 NT:    none warranted (tribute narrative; folded into thread 4 setting)
--          Extras: none warranted
--          Tanakh: none warranted
--   v.29-35 NT:    none warranted (the answer is Tanakh-internal Isa37)
--          Extras: none warranted
--          Tanakh: Isaiah 36:14,18-20 (the parallel taunt), Psalm 46:6,10 (heathen rage / be still), Isaiah 37:16-17 (the living Elohim reproached → ch19 deliverance)  ★ thread 4
--
-- THREADS:
--   1 2-kings-18-the-brasen-serpent-broken-nehushtan-the-good-type-lifted-up   [Tanakh + NT]  free
--   2 2-kings-18-he-trusted-and-clave-and-kept-his-commandments-the-true-king  [Tanakh]       free
--   3 2-kings-18-samaria-carried-away-the-northern-house-scattered             [Tanakh]       free
--   4 2-kings-18-let-not-hezekiah-deceive-you-blasphemy-against-the-living-el  [Tanakh]       free
--
-- CONTESTED/LOAD-BEARING: 18:4 brasen serpent — the serpent itself was a Yahuah-GIVEN type
--   (Num 21:8-9) and the very figure Yahusha applies to himself lifted up (John 3:14-15); the
--   people made it an IDOL (Nehushtan), so the reformer breaks the idol-relic while the true
--   type stands and is fulfilled in the cross. The breaking is not against the type but against
--   the idolatry of the relic.

CREATE TEMP VIEW _s343_2ki18_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Nehushtan — the good type turned idol, lifted up
    ('canon','2-kings',18,4,'canon','numbers',21,8,'free',E'*And Yahuah (LORD) said unto Moses, Make thee a fiery serpent, and set it upon a pole: and it shall come to pass, that every one that is bitten, when he looketh upon it, shall live* (Numbers 21:8). The brasen serpent Hezekiah *brake in pieces* (2 Kings 18:4) was no pagan thing — it was the Yahuah-given sign of life Moses made at His own word, that the bitten of Yashar''el (Israel) might look and live.'),
    ('canon','2-kings',18,4,'canon','numbers',21,9,'free',E'*And Moses made a serpent of brass, and put it upon a pole, and it came to pass, that if a serpent had bitten any man, when he beheld the serpent of brass, he lived* (Numbers 21:9). This is *the brasen serpent that Moses had made* (2 Kings 18:4). The relic was holy in its purpose; the sin was that *the children of Yashar''el (Israel) did burn incense to it* — they made the sign into an idol, so the reformer destroys the idol while the sign''s meaning stands.'),
    ('canon','2-kings',18,4,'canon','john',3,14,'free',E'*And as Moses lifted up the serpent in the wilderness, even so must the Son of Adam be lifted up* (John 3:14). Yahusha (Jesus) reads the very serpent Hezekiah broke as a type of himself lifted up on the tree. The bronze figure looked-upon-and-living foreshadowed the Formed Son raised up; Hezekiah breaks the idol-relic *Nehushtan* (2 Kings 18:4) precisely because the true type is not a relic but the One it pointed to.'),
    ('canon','2-kings',18,4,'canon','john',3,15,'free',E'*That whosoever believeth in him should not perish, but have eternal life* (John 3:15). The look that healed the serpent-bitten (Numbers 21) becomes the believing look unto the lifted-up Son of Adam. Hezekiah''s shattering of *the brasen serpent* turned idol (2 Kings 18:4) clears the type so it can be fulfilled, not in a worshipped relic, but in the cross.'),
    -- THREAD 2: trust + clave + kept his commandments
    ('canon','2-kings',18,5,'canon','deuteronomy',6,4,'free',E'*Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD)* (Deuteronomy 6:4). Hezekiah *trusted in Yahuah Elohim (the LORD God) of Yashar''el (Israel); so that after him was none like him among all the kings of Yahudah (Judah)* (2 Kings 18:5). His undivided trust is the Shema lived out — the one Yahuah leaned on alone, no Egypt, no idol beside Him.'),
    ('canon','2-kings',18,5,'canon','deuteronomy',6,5,'free',E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5). The whole-hearted love commanded in the Shema is what Scripture credits to Hezekiah: he *trusted in Yahuah Elohim... so that after him was none like him* (2 Kings 18:5). Trust with all the might is the mark of the true king of Yahudah (Judah).'),
    ('canon','2-kings',18,6,'canon','deuteronomy',6,17,'free',E'*Ye shall diligently keep the commandments of Yahuah Elohaychem (the LORD your God), and his testimonies, and his statutes, which he hath commanded thee* (Deuteronomy 6:17). Of Hezekiah it is written that *he clave to Yahuah (LORD), and departed not from following him, but kept his commandments, which Yahuah (LORD) commanded Moses* (2 Kings 18:6). Trust and Torah-keeping are one thing — the Torah is never the curse but the cleaving itself.'),
    ('canon','2-kings',18,6,'canon','2-kings',17,19,'free',E'*Also Yahudah (Judah) kept not the commandments of Yahuah (LORD) their Elohim (God), but walked in the statutes of Yashar''el (Israel) which they made* (2 Kings 17:19). The chapter before indicts even Yahudah for forsaking Torah; against that dark backdrop Hezekiah *kept his commandments, which Yahuah (LORD) commanded Moses* (2 Kings 18:6) — the one king who reverses the drift that scattered the north.'),
    -- THREAD 3: Samaria carried away — the northern house scattered
    ('canon','2-kings',18,11,'canon','2-kings',17,6,'free',E'*In the ninth year of Hoshea the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes* (2 Kings 17:6). 2 Kings 18:11 records the same scattering verbatim — *the king of Assyria did carry away Yashar''el (Israel) unto Assyria, and put them in Halah and in Habor by the river of Gozan, and in the cities of the Medes* — the divorce and exile of the northern house of Yosef (Joseph)/Ephraim, the *Lo-Ammi* people awaiting regathering.'),
    ('canon','2-kings',18,12,'canon','2-kings',17,18,'free',E'*Therefore Yahuah (LORD) was very angry with Yashar''el (Israel), and removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18). The cause Hezekiah''s reign names — *because they obeyed not the voice of Yahuah (LORD) their Elohim (God), but transgressed his covenant* (2 Kings 18:12) — is the very covenant-breaking that severed the two houses, leaving Yahudah alone in the land.'),
    ('canon','2-kings',18,12,'canon','deuteronomy',6,15,'free',E'*(For Yahuah Elohayka (the LORD thy God) is a jealous Elohim (God) among you) lest the anger of Yahuah Elohayka (the LORD thy God) be kindled against thee, and destroy thee from off the face of the earth* (Deuteronomy 6:15). The exile of the north was not arbitrary: they *transgressed his covenant, and all that Moses the servant of Yahuah (LORD) commanded* (2 Kings 18:12) — the curse of Deuteronomy 28 falling for forsaking the covenant, never the covenant itself the curse.'),
    -- THREAD 4: Let not Hezekiah deceive you — blasphemy against the living Elohim
    ('canon','2-kings',18,30,'canon','isaiah',36,15,'free',E'*Neither let Hezekiah make you trust in Yahuah (LORD), saying, Yahuah (LORD) will surely deliver us: this city shall not be delivered into the hand of the king of Assyria* (Isaiah 36:15). Isaiah preserves Rabshakeh''s same taunt word for word — *Neither let Hezekiah make you trust in Yahuah (LORD)* (2 Kings 18:30) — the enemy laboring to pry the people off the trust that is the very mark of the true king.'),
    ('canon','2-kings',18,33,'canon','isaiah',36,18,'free',E'*Beware lest Hezekiah persuade you, saying, Yahuah (LORD) will deliver us. Hath any of the gods of the nations delivered his land out of the hand of the king of Assyria?* (Isaiah 36:18). The Assyrian sets Yahuah on the shelf of the dead idols of the nations — *Hath any of the gods of the nations delivered at all his land out of the hand of the king of Assyria?* (2 Kings 18:33) — the blasphemy of reckoning the living Elohim no better than wood and stone.'),
    ('canon','2-kings',18,35,'canon','isaiah',37,16,'free',E'*O Yahuah Tseva''ot (LORD of hosts), Elohim (God) of Yashar''el (Israel), that dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth: thou hast made heaven and earth* (Isaiah 37:16). To the Rabshakeh''s sneer *that Yahuah (LORD) should deliver Jerusalem out of mine hand* (2 Kings 18:35), Hezekiah answers in prayer by confessing the very thing the enemy denied — Yahuah alone is Elohim of all kingdoms, Maker of heaven and earth.'),
    ('canon','2-kings',18,35,'canon','isaiah',37,17,'free',E'*Incline thine ear, O Yahuah (LORD), and hear; open thine eyes, O Yahuah (LORD), and see: and hear all the words of Sennacherib, which hath sent to reproach the living Elohim (God)* (Isaiah 37:17). The taunt *that Yahuah (LORD) should deliver Jerusalem out of mine hand* (2 Kings 18:35) is named for what it is — a reproach against *the living Elohim* — and Jerusalem''s deliverance in the next chapter answers it.'),
    ('canon','2-kings',18,35,'canon','psalms',46,6,'free',E'*The heathen raged, the kingdoms were moved: he uttered his voice, the earth melted* (Psalm 46:6). Rabshakeh''s boast *that Yahuah (LORD) should deliver Jerusalem out of mine hand* (2 Kings 18:35) is the heathen raging of the psalm — and the answer is not Jerusalem''s strength but Yahuah uttering His voice till the earth melts.'),
    ('canon','2-kings',18,35,'canon','psalms',46,10,'free',E'*Be still, and know that I am Elohim (God): I will be exalted among the heathen, I will be exalted in the earth* (Psalm 46:10). The Assyrian asks *that Yahuah (LORD) should deliver Jerusalem out of mine hand* (2 Kings 18:35); the psalm replies that the same Yahuah whose name he mocks *will be exalted among the heathen* — the very nations he boasts of conquering.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREADS
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-18-the-brasen-serpent-broken-nehushtan-the-good-type-lifted-up', E'The brasen serpent broken — Nehushtan, the good type lifted up', E'Hezekiah *brake in pieces the brasen serpent that Moses had made: for unto those days the children of Yashar''el (Israel) did burn incense to it: and he called it Nehushtan* (2 Kings 18:4). The relic was no pagan thing — *And Yahuah (LORD) said unto Moses, Make thee a fiery serpent, and set it upon a pole: and it shall come to pass, that every one that is bitten, when he looketh upon it, shall live* (Numbers 21:8), and *if a serpent had bitten any man, when he beheld the serpent of brass, he lived* (Numbers 21:9). The figure was Yahuah''s own gift of life-by-looking. The sin was that the people made the sign into an idol and burned incense to it, so the reformer destroys the relic. He does not destroy the type, for Yahusha (Jesus) reads it of himself: *And as Moses lifted up the serpent in the wilderness, even so must the Son of Adam be lifted up: That whosoever believeth in him should not perish, but have eternal life* (John 3:14-15). The look that healed the serpent-bitten foreshadows the believing look unto the lifted-up Formed Son. Hezekiah shatters *Nehushtan* precisely because the true type is not a worshipped relic but the One it pointed to — fulfilled, not in brass, but on the tree.',
       sv.verse_id, ev.verse_id, 'free', 38925
  FROM _s343_2ki18_lookup sv, _s343_2ki18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=18 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-18-he-trusted-and-clave-and-kept-his-commandments-the-true-king', E'He trusted and clave and kept His commandments — the true king', E'*He trusted in Yahuah Elohim (the LORD God) of Yashar''el (Israel); so that after him was none like him among all the kings of Yahudah (Judah), nor any that were before him. For he clave to Yahuah (LORD), and departed not from following him, but kept his commandments, which Yahuah (LORD) commanded Moses* (2 Kings 18:5-6). This is the Shema lived out: *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD): And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:4-5), and *Ye shall diligently keep the commandments of Yahuah Elohaychem (the LORD your God), and his testimonies, and his statutes* (Deuteronomy 6:17). Trust and Torah-keeping are not two things but one — to cleave is to keep. And the marvel is sharpened by the chapter before: *Also Yahudah (Judah) kept not the commandments of Yahuah (LORD) their Elohim (God), but walked in the statutes of Yashar''el (Israel) which they made* (2 Kings 17:19). Where even Yahudah had drifted into the sin that scattered the north, Hezekiah reverses it — the one king who clave. The Torah he kept is the inheritance, never the curse.',
       sv.verse_id, ev.verse_id, 'free', 38928
  FROM _s343_2ki18_lookup sv, _s343_2ki18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=18 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-18-samaria-carried-away-the-northern-house-scattered', E'Samaria carried away — the northern house scattered', E'In Hezekiah''s days the northern kingdom falls: *the king of Assyria did carry away Yashar''el (Israel) unto Assyria, and put them in Halah and in Habor by the river of Gozan, and in the cities of the Medes: Because they obeyed not the voice of Yahuah (LORD) their Elohim (God), but transgressed his covenant* (2 Kings 18:11-12). The chapter before records the same scattering word for word — *the king of Assyria took Samaria, and carried Yashar''el (Israel) away into Assyria, and placed them in Halah and in Habor by the river of Gozan, and in the cities of the Medes* (2 Kings 17:6) — and names the result: *Yahuah (LORD) was very angry with Yashar''el (Israel), and removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18). This is the divorce and exile of the northern house of Yosef (Joseph)/Ephraim, the *Lo-Ammi* people. The cause is covenant-breaking, the jealous love warned of long before: *lest the anger of Yahuah Elohayka (the LORD thy God) be kindled against thee, and destroy thee from off the face of the earth* (Deuteronomy 6:15). The Deuteronomy 28 curse falls for forsaking the covenant — never the covenant itself the curse — and the scattered house waits to be gathered and made one stick again.',
       sv.verse_id, ev.verse_id, 'free', 38931
  FROM _s343_2ki18_lookup sv, _s343_2ki18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=18 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-18-let-not-hezekiah-deceive-you-blasphemy-against-the-living-el', E'Let not Hezekiah deceive you — blasphemy against the living Elohim', E'The Rabshakeh comes up to Jerusalem with a great host and a taunt aimed straight at the trust that marks the true king: *Neither let Hezekiah make you trust in Yahuah (LORD), saying, Yahuah (LORD) will surely deliver us* (2 Kings 18:30). Then the blasphemy proper — *Hath any of the gods of the nations delivered at all his land out of the hand of the king of Assyria?... that Yahuah (LORD) should deliver Jerusalem out of mine hand?* (2 Kings 18:33,35) — reckoning the living Elohim no better than the dead idols of wood and stone. Isaiah preserves the same taunt word for word (*Beware lest Hezekiah persuade you, saying, Yahuah (LORD) will deliver us. Hath any of the gods of the nations delivered his land...* — Isaiah 36:15,18). The Psalm names the scene: *The heathen raged, the kingdoms were moved: he uttered his voice, the earth melted... Be still, and know that I am Elohim (God): I will be exalted among the heathen* (Psalm 46:6,10). And Hezekiah''s answer in prayer confesses the very thing the enemy denied: *thou art the Elohim (God), even thou alone, of all the kingdoms of the earth: thou hast made heaven and earth... hear all the words of Sennacherib, which hath sent to reproach the living Elohim (God)* (Isaiah 37:16-17). The reproach against the living Elohim sets the stage for the deliverance of the next chapter, where the angel of Yahuah answers the blasphemy in one night.',
       sv.verse_id, ev.verse_id, 'free', 38934
  FROM _s343_2ki18_lookup sv, _s343_2ki18_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=18 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- THREAD MEMBERS
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Numbers 21:8 — *Make thee a fiery serpent... every one that is bitten, when he looketh upon it, shall live*: the sign was Yahuah''s own gift of life.'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=4
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-the-brasen-serpent-broken-nehushtan-the-good-type-lifted-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Numbers 21:9 — *the brasen serpent that Moses had made* (2 Ki 18:4); holy in purpose, the sin was the incense burned to it.'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=4
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-the-brasen-serpent-broken-nehushtan-the-good-type-lifted-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'John 3:14 — *even so must the Son of Adam be lifted up*: Yahusha reads the broken serpent as a type of himself on the tree.'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=4
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-the-brasen-serpent-broken-nehushtan-the-good-type-lifted-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'John 3:15 — *whosoever believeth in him should not perish, but have eternal life*: the healing look fulfilled in the believing look.'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=4
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-the-brasen-serpent-broken-nehushtan-the-good-type-lifted-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 6:4 — *Yahuah Eloheinu (The LORD our God) is one Yahuah*: Hezekiah''s undivided trust is the Shema lived.'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=5
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-he-trusted-and-clave-and-kept-his-commandments-the-true-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 6:5 — *love Yahuah Elohayka with all thine heart... soul... might*: trust with all the might marks the true king.'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=5
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-he-trusted-and-clave-and-kept-his-commandments-the-true-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 6:17 — *diligently keep the commandments... testimonies... statutes*: Hezekiah *kept his commandments which Yahuah commanded Moses* (2 Ki 18:6).'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=6
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-he-trusted-and-clave-and-kept-his-commandments-the-true-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 17:19 — *Yahudah kept not the commandments... but walked in the statutes of Yashar''el*: the dark backdrop Hezekiah reverses.'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=6
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-he-trusted-and-clave-and-kept-his-commandments-the-true-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 17:6 — the same scattering verbatim: Yashar''el carried to Halah, Habor, Gozan, the cities of the Medes — the northern house exiled.'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=11
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-samaria-carried-away-the-northern-house-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 17:18 — *removed them out of his sight: there was none left but the tribe of Yahudah only*: the two houses severed by covenant-breaking (2 Ki 18:12).'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=12
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-samaria-carried-away-the-northern-house-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 6:15 — *a jealous Elohim... lest the anger... be kindled*: the Deut 28 curse falls for forsaking the covenant, never the covenant the curse.'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=12
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-samaria-carried-away-the-northern-house-scattered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 36:15 — *Neither let Hezekiah make you trust in Yahuah*: the same taunt preserved, prying the people off the king''s trust.'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=30
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=36 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-let-not-hezekiah-deceive-you-blasphemy-against-the-living-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 36:18 — *Hath any of the gods of the nations delivered his land...*: Yahuah set among the dead idols of wood and stone (2 Ki 18:33).'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=33
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=36 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-let-not-hezekiah-deceive-you-blasphemy-against-the-living-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Isaiah 37:16 — *thou art the Elohim, even thou alone, of all the kingdoms... thou hast made heaven and earth*: Hezekiah confesses what the enemy denied (2 Ki 18:35).'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=35
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-let-not-hezekiah-deceive-you-blasphemy-against-the-living-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Isaiah 37:17 — *Sennacherib, which hath sent to reproach the living Elohim*: the taunt named, and answered in ch 19''s deliverance.'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=35
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-let-not-hezekiah-deceive-you-blasphemy-against-the-living-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Psalm 46:6 — *The heathen raged... he uttered his voice, the earth melted*: Rabshakeh''s boast is the raging the psalm answers.'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=35
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-let-not-hezekiah-deceive-you-blasphemy-against-the-living-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Psalm 46:10 — *Be still, and know that I am Elohim... I will be exalted among the heathen*: the answer the Assyrian cannot conceive.'
  FROM cross_reference_threads t
  JOIN _s343_2ki18_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=18 AND sv.verse_number=35
  JOIN _s343_2ki18_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-18-let-not-hezekiah-deceive-you-blasphemy-against-the-living-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_19.sql (2 Kings 19) -----
-- 2 Kings 19 — Hezekiah, Sennacherib, Isaiah's oracle, the remnant, the angel that smote 185,000
-- TAG: 2ki19   VIEW: _s343_2ki19_lookup   SORT BAND: 38950 step 3 (38950,38953,38956,38959,38962)
--
-- 2 Kings 19 coverage:
--   v.6-7  (Be not afraid / I will send a blast)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Isaiah 37:6-7 (the twin oracle); Psalms 46:1-2 (refuge, will not fear); 2 Chron 32:7-8 (be strong, more with us)
--   v.14-19 (Hezekiah spreads the letter, prays Yahuah's Name be known among the nations, thou only)
--        NT:     none warranted (the bare prayer; covenant-monotheism, left to Tanakh)
--        Extras: none warranted
--        Tanakh: Isaiah 37:14-20 (the twin prayer); Psalms 46:10 (be still, I will be exalted among the heathen); 2 Chron 32:19-20 (railing on the God of Jerusalem, the king prays); Exodus 12:12 (against all the gods of Egypt I execute judgment)
--   v.22-28 (the proud rod judged: the boasting axe, I will put my hook in thy nose)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Isaiah 37:23-29 (twin oracle); Isaiah 10:5 (Assyrian the rod of mine anger); Isaiah 10:15 (shall the axe boast itself against him that heweth)
--   v.30-31 (the remnant escaped of the house of Yahudah takes root downward; the escaped of Zion)
--        NT:     Romans 11:5 (a remnant according to the election of grace — two-house guard)
--        Extras: none warranted
--        Tanakh: Isaiah 37:31-32 (twin); Isaiah 1:9 (except Yahuah had left a very small remnant); Isaiah 10:20-21 (the remnant of Yashar'el shall return)
--   v.32-34 (he shall not come into this city; I will defend it for David's sake)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: folded into thread #1 (be-not-afraid) via Ps 46 / 2 Chron 32:7-8; v.34 David's-sake noted in prose
--   v.35  (the angel of Yahuah smote 185,000 — they were all dead corpses)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: Isaiah 37:36 (twin); 2 Chron 32:21 (Yahuah sent an angel which cut off the mighty men); Exodus 12:29 (the Passover-night smiting of all the firstborn at midnight); Psalms 76:5-6 (the stouthearted spoiled, chariot and horse cast into a dead sleep)
--   v.36-37 (Sennacherib returns, slain by his own sons in the house of Nisroch his god)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: covered in thread #2 prose (the idol cannot save him; Isaiah 37:37-38 the twin); no separate thread warranted
--
-- THREADS (5):
--   2-kings-19-hezekiah-spreads-the-letter-that-all-kingdoms-may-know-thou-art-yahuah-alone  [free]  (Tanakh + Tanakh)
--   2-kings-19-the-proud-rod-judged-the-axe-shall-not-boast-against-him-that-heweth           [free]  (Tanakh)
--   2-kings-19-the-remnant-that-is-escaped-shall-take-root-downward                            [free]  (Tanakh + NT)
--   2-kings-19-the-angel-of-yahuah-smote-the-camp-of-the-assyrians                             [free]  (Tanakh)
--   2-kings-19-be-not-afraid-i-will-defend-this-city                                           [free]  (Tanakh)
-- Christology note: v.35 "the angel of Yahuah" framed in prose as the Formed Son who bears the Name and executes Yahuah's deliverance — Yahuah-and-yet-sent-out, not co-equal-trinity, not a created Arian agent.

-- A. Temp view
CREATE TEMP VIEW _s343_2ki19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- B. cross_references
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Hezekiah spreads the letter, prays the Name be vindicated among the nations
    ('canon','2-kings',19,14,'canon','isaiah',37,14,'free',E'*And Hezekiah received the letter from the hand of the messengers, and read it: and Hezekiah went up unto the house of Yahuah (LORD), and spread it before Yahuah (LORD)* (Isaiah 37:14). Isaiah''s parallel record matches the Kings account word for word — Hezekiah does not answer Sennacherib''s blasphemy with his own arm, but *spread it before Yahuah (LORD)*, laying the reproach of the living Elohim (God) at the throne of the One who dwells between the cherubims.'),
    ('canon','2-kings',19,15,'canon','isaiah',37,16,'free',E'*O Yahuah Tseva''ot (LORD of hosts), Elohim (God) of Yashar''el (Israel), that dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth: thou hast made heaven and earth* (Isaiah 37:16). The twin of Hezekiah''s confession *thou art the Elohim (God), even thou alone, of all the kingdoms of the earth; thou hast made heaven and earth* — covenant-monotheism: Yahuah enthroned over the cherubim of His own ark is the sole Maker, and the idols of Assyria are nothing.'),
    ('canon','2-kings',19,18,'canon','exodus',12,12,'free',E'*For I will pass through the land of Egypt this night, and will smite all the firstborn in the land of Egypt, both man and beast; and against all the gods of Egypt I will execute judgment: I am Yahuah (LORD)* (Exodus 12:12). Hezekiah pleads that Assyria''s gods *were no gods, but the work of men''s hands, wood and stone*; the same Yahuah who *against all the gods of Egypt... execute[d] judgment* on the Passover night is the One who alone can save Jerusalem.'),
    ('canon','2-kings',19,19,'canon','psalms',46,10,'free',E'*Be still, and know that I am Elohim (God): I will be exalted among the heathen, I will be exalted in the earth* (Psalms 46:10). Hezekiah''s plea — *save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only* — is the very prayer the psalm answers: the deliverance is not for Judah''s comfort first but that Yahuah be *exalted among the heathen*, His Name vindicated before the nations.'),
    ('canon','2-kings',19,19,'canon','2-chronicles',32,20,'free',E'*And for this cause Hezekiah the king, and the prophet Isaiah the son of Amoz, prayed and cried to heaven* (2 Chronicles 32:20). The Chronicler records the same crisis: against the railing of Sennacherib who *spake against the Elohim (God) of Jerusalem, as against the gods of the people of the earth* (32:19), the king and the prophet together cry to heaven — matching Hezekiah''s *I beseech thee, save thou us out of his hand*.'),

    -- THREAD 2: the proud rod judged — the axe shall not boast against him that heweth
    ('canon','2-kings',19,22,'canon','isaiah',37,23,'free',E'*Whom hast thou reproached and blasphemed? and against whom hast thou exalted thy voice, and lifted up thine eyes on high? even against the Holy One of Yashar''el (Israel)* (Isaiah 37:23). The twin of the oracle: Sennacherib''s reproach was never against a man or a city but *against the Holy One of Yashar''el (Israel)* — the same charge Yahuah lays in 2 Kings, that the proud king lifted his voice against the LORD Himself.'),
    ('canon','2-kings',19,23,'canon','isaiah',10,5,'free',E'*O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation* (Isaiah 10:5). Sennacherib boasts *With the multitude of my chariots I am come up to the height of the mountains*, not knowing he was only ever *the rod of mine anger* in Yahuah''s hand — an instrument of judgment that mistook itself for the judge.'),
    ('canon','2-kings',19,25,'canon','isaiah',10,15,'free',E'*Shall the axe boast itself against him that heweth therewith? or shall the saw magnify itself against him that shaketh it? as if the rod should shake itself against them that lift it up, or as if the staff should lift up itself, as if it were no wood* (Isaiah 10:15). This is the heart of Yahuah''s answer to the boast — *Hast thou not heard long ago how I have done it... that I have formed it? now have I brought it to pass*: the cities Assyria laid waste, Yahuah had formed long before; the axe magnified itself against the Hand that wielded it.'),
    ('canon','2-kings',19,28,'canon','isaiah',37,29,'free',E'*Because thy rage against me, and thy tumult, is come up into mine ears, therefore will I put my hook in thy nose, and my bridle in thy lips, and I will turn thee back by the way by which thou camest* (Isaiah 37:29). The twin oracle: the proud rod is led home like a beast on a hook and bridle — the boasting axe turned back by the very Hand it defied.'),

    -- THREAD 3: the remnant that is escaped shall take root downward
    ('canon','2-kings',19,30,'canon','isaiah',37,31,'free',E'*And the remnant that is escaped of the house of Yahudah (Judah) shall again take root downward, and bear fruit upward* (Isaiah 37:31). The twin word of promise: the surviving remnant is not a leftover but a planting — it *take[s] root downward* before it *bear[s] fruit upward*, the hidden covenant-life going deep before it shows above ground.'),
    ('canon','2-kings',19,31,'canon','isaiah',1,9,'free',E'*Except Yahuah Tseva''ot (LORD of hosts) had left unto us a very small remnant, we should have been as Sodom, and we should have been like unto Gomorrah* (Isaiah 1:9). The same prophet who promised *out of Jerusalem shall go forth a remnant* names what the remnant means: not Judah''s worthiness but Yahuah''s mercy preserving a seed — *the zeal of Yahuah Tseva''ot (LORD of hosts) shall do this*, lest the covenant-line perish utterly.'),
    ('canon','2-kings',19,31,'canon','isaiah',10,20,'free',E'*And it shall come to pass in that day, that the remnant of Yashar''el (Israel), and such as are escaped of the house of Jacob, shall no more again stay upon him that smote them; but shall stay upon Yahuah (LORD), the Holy One of Yashar''el (Israel), in truth* (Isaiah 10:20). The remnant doctrine runs through both houses: *they that escape out of mount Zion* are the southern witness of the same promise that *the remnant of Yashar''el... shall return* and lean on Yahuah alone.'),
    ('canon','2-kings',19,31,'canon','romans',11,5,'free',E'*Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). Sha''ul (Paul) reaches back to this very deliverance-pattern — *Hath Elohim (God) cast away his people? Elohim (God) forbid... I have reserved to myself seven thousand* — to insist the remnant is never replacement but the preserved covenant-seed: *the root be holy, so are the branches* (Romans 11:16). The escaped of Zion *take root downward* into the same root.'),

    -- THREAD 4: the angel of Yahuah smote the camp of the Assyrians
    ('canon','2-kings',19,35,'canon','isaiah',37,36,'free',E'*Then the angel of Yahuah (LORD) went forth, and smote in the camp of the Assyrians a hundred and fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses* (Isaiah 37:36). The twin record of the impossible victory: no army of Judah marched out — *the angel of Yahuah (LORD)* alone went forth in the night, and 185,000 were *dead corpses* by morning. The Formed One who bears the Name does the LORD''s deliverance.'),
    ('canon','2-kings',19,35,'canon','2-chronicles',32,21,'free',E'*And Yahuah (LORD) sent an angel, which cut off all the mighty men of valour, and the leaders and captains in the camp of the king of Assyria. So he returned with shame of face to his own land* (2 Chronicles 32:21). The Chronicler names the agent plainly — *Yahuah (LORD) sent an angel* — the visible Hand of the LORD, sent out and yet bearing His Name, who cut off the host that mocked the living Elohim (God).'),
    ('canon','2-kings',19,35,'canon','exodus',12,29,'free',E'*And it came to pass, that at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt, from the firstborn of Pharaoh that sat on his throne unto the firstborn of the captive that was in the dungeon* (Exodus 12:29). The deliverance follows the Passover-night pattern: a smiting in the dark by Yahuah''s own going-forth, and at dawn the proud oppressor finds *they were all dead corpses* — *there was not a house where there was not one dead* (Exodus 12:30). Assyria''s camp becomes a second Egypt.'),
    ('canon','2-kings',19,35,'canon','psalms',76,5,'free',E'*The stouthearted are spoiled, they have slept their sleep: and none of the men of might have found their hands* (Psalms 76:5). The psalm sings the very scene — *At thy rebuke, O Elohim (God) of Jacob, both the chariot and horse are cast into a dead sleep* (76:6): the mighty men of Assyria lie down to a sleep they do not wake from, *In Salem also is his tabernacle, and his dwelling place in Zion* (76:2), where He *brake... the arrows of the bow, the shield, and the sword, and the battle*.'),

    -- THREAD 5: be not afraid — I will defend this city
    ('canon','2-kings',19,6,'canon','isaiah',37,6,'free',E'*And Isaiah said unto them, Thus shall ye say unto your master, Thus saith Yahuah (LORD), Be not afraid of the words that thou hast heard, wherewith the servants of the king of Assyria have blasphemed me* (Isaiah 37:6). The twin oracle: the prophet''s word turns the trembling king from the blasphemer''s threat to the LORD''s promise — *Be not afraid... I will send a blast upon him*.'),
    ('canon','2-kings',19,7,'canon','2-chronicles',32,8,'free',E'*With him is an arm of flesh; but with us is Yahuah Eloheinu (the LORD our God) to help us, and to fight our battles. And the people rested themselves upon the words of Hezekiah king of Yahudah (Judah)* (2 Chronicles 32:8). The Chronicler frames the same confidence Isaiah''s oracle gives: Sennacherib has only *an arm of flesh*, and Yahuah will *cause him to fall by the sword in his own land* — the people rest on the LORD who fights for them.'),
    ('canon','2-kings',19,32,'canon','psalms',46,1,'free',E'*Elohim (God) is our refuge and strength, a very present help in trouble* (Psalms 46:1). Yahuah''s pledge *He shall not come into this city... For I will defend this city, to save it, for mine own sake, and for my servant David''s sake* is the psalm made history — *Therefore will not we fear, though the earth be removed* (46:2): Zion stands because Elohim (God) is in the midst of her, not because of her walls.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- C. threads
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-19-hezekiah-spreads-the-letter-that-all-kingdoms-may-know-thou-art-yahuah-alone', E'Hezekiah spreads the letter — that all kingdoms may know thou art Yahuah alone', E'When Sennacherib''s blasphemy reaches the king, Hezekiah answers not with his own arm but at the throne: *Hezekiah went up into the house of Yahuah (LORD), and spread it before Yahuah (LORD)* (2 Kings 19:14). His prayer is the covenant-monotheist confession — *O Yahuah Elohim (LORD God) of Yashar''el (Israel), which dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth; thou hast made heaven and earth* (19:15). Isaiah''s twin record matches it: *thou art the Elohim (God), even thou alone... thou hast made heaven and earth* (Isaiah 37:16). Hezekiah pleads that Assyria''s gods *were no gods, but the work of men''s hands, wood and stone* (19:18) — the same Yahuah who *against all the gods of Egypt... execute[d] judgment* (Exodus 12:12) on the Passover night. And the prayer''s aim is not survival alone but the vindication of the Name: *save thou us out of his hand, that all the kingdoms of the earth may know that thou art Yahuah Elohim (the LORD God), even thou only* (19:19). The psalm answers it exactly — *Be still, and know that I am Elohim (God): I will be exalted among the heathen* (Psalms 46:10); the Chronicler records the same crisis, *Hezekiah the king, and the prophet Isaiah... prayed and cried to heaven* (2 Chronicles 32:20).',
       sv.verse_id, ev.verse_id, 'free', 38950
  FROM _s343_2ki19_lookup sv, _s343_2ki19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=19 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-19-the-proud-rod-judged-the-axe-shall-not-boast-against-him-that-heweth', E'The proud rod judged — the axe shall not boast against him that heweth', E'Yahuah''s oracle turns on Sennacherib the very boast he made. He had bragged *With the multitude of my chariots I am come up to the height of the mountains* (2 Kings 19:23) and *I have digged and drunk strange waters* — but his reproach was never against a city: *against whom hast thou exalted thy voice... even against the Holy One of Yashar''el (Israel)* (19:22; Isaiah 37:23). The LORD answers that the king was only ever the instrument: *O Assyrian, the rod of mine anger, and the staff in their hand is mine indignation* (Isaiah 10:5). The fenced cities Assyria razed, Yahuah had *formed... long ago* and *brought it to pass* (19:25) — so the boast is the absurdity Isaiah named: *Shall the axe boast itself against him that heweth therewith?... as if the rod should shake itself against them that lift it up* (Isaiah 10:15). Therefore the proud rod is led home like a beast: *I will put my hook in thy nose, and my bridle in thy lips, and I will turn thee back by the way by which thou camest* (19:28; Isaiah 37:29). And so he returns and is slain in *the house of Nisroch his god* (19:37) — the idol that could not save him.',
       sv.verse_id, ev.verse_id, 'free', 38953
  FROM _s343_2ki19_lookup sv, _s343_2ki19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=19 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-19-the-remnant-that-is-escaped-shall-take-root-downward', E'The remnant that is escaped shall take root downward', E'The sign Yahuah gives is a planting: *the remnant that is escaped of the house of Yahudah (Judah) shall yet again take root downward, and bear fruit upward* (2 Kings 19:30). The covenant-life goes deep in the dark before it shows above ground — *For out of Jerusalem shall go forth a remnant, and they that escape out of mount Zion: the zeal of Yahuah Tseva''ot (LORD of hosts) shall do this* (19:31; Isaiah 37:31-32). The remnant is never Judah''s worthiness but Yahuah''s mercy preserving a seed: *Except Yahuah Tseva''ot (LORD of hosts) had left unto us a very small remnant, we should have been as Sodom* (Isaiah 1:9). And it runs through both houses — *the remnant of Yashar''el (Israel), and such as are escaped of the house of Jacob... shall stay upon Yahuah (LORD), the Holy One of Yashar''el (Israel), in truth* (Isaiah 10:20). Sha''ul (Paul) reaches back to exactly this preserved-seed pattern: *at this present time also there is a remnant according to the election of grace* (Romans 11:5) — never a replacement people, for *if the root be holy, so are the branches* (Romans 11:16). The escaped of Zion take root downward into that same holy root.',
       sv.verse_id, ev.verse_id, 'free', 38956
  FROM _s343_2ki19_lookup sv, _s343_2ki19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=19 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-19-the-angel-of-yahuah-smote-the-camp-of-the-assyrians', E'The angel of Yahuah smote the camp of the Assyrians — deliverance by Yahuah alone', E'No army of Judah marched out. *And it came to pass that night, that the angel of Yahuah (LORD) went out, and smote in the camp of the Assyrians an hundred fourscore and five thousand: and when they arose early in the morning, behold, they were all dead corpses* (2 Kings 19:35; Isaiah 37:36). The Chronicler names the agent plainly — *Yahuah (LORD) sent an angel, which cut off all the mighty men of valour... in the camp of the king of Assyria* (2 Chronicles 32:21): the visible Hand of the LORD, the Formed One who bears the Name, sent out and yet Himself the deliverance of Yahuah, not a co-equal second God nor a mere created messenger. The pattern is the Passover night written again — *at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt* (Exodus 12:29), and at dawn the proud oppressor finds *there was not a house where there was not one dead* (12:30). The psalm sings the scene: *The stouthearted are spoiled, they have slept their sleep... At thy rebuke, O Elohim (God) of Jacob, both the chariot and horse are cast into a dead sleep* (Psalms 76:5-6). The impossible victory belongs to Yahuah alone.',
       sv.verse_id, ev.verse_id, 'free', 38959
  FROM _s343_2ki19_lookup sv, _s343_2ki19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=35
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=19 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-19-be-not-afraid-i-will-defend-this-city', E'Be not afraid — I will defend this city for mine own sake', E'Against the blasphemy that *the children are come to the birth, and there is not strength to bring forth* (2 Kings 19:3), Isaiah sends the LORD''s word: *Be not afraid of the words which thou hast heard, with which the servants of the king of Assyria have blasphemed me. Behold, I will send a blast upon him... and I will cause him to fall by the sword in his own land* (19:6-7; Isaiah 37:6). The same confidence the Chronicler records: *With him is an arm of flesh; but with us is Yahuah Eloheinu (the LORD our God) to help us, and to fight our battles* (2 Chronicles 32:8). And the LORD''s pledge over the city is the psalm made history — *He shall not come into this city... For I will defend this city, to save it, for mine own sake, and for my servant David''s sake* (19:32-34): *Elohim (God) is our refuge and strength, a very present help in trouble. Therefore will not we fear, though the earth be removed* (Psalms 46:1-2). Zion stands not by her walls but because Yahuah is in the midst of her, and the deliverance is *for mine own sake* — the Name and the covenant with David held fast.',
       sv.verse_id, ev.verse_id, 'free', 38962
  FROM _s343_2ki19_lookup sv, _s343_2ki19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=19 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- D. thread_members
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 37:14 — the twin record: Hezekiah spreads the letter before Yahuah rather than answering the blasphemy himself.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=14
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-hezekiah-spreads-the-letter-that-all-kingdoms-may-know-thou-art-yahuah-alone'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 37:16 — thou art the Elohim alone, Maker of heaven and earth: the covenant-monotheist confession, twin of 2 Kings 19:15.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=15
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-hezekiah-spreads-the-letter-that-all-kingdoms-may-know-thou-art-yahuah-alone'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 12:12 — against all the gods of Egypt I execute judgment: the same Yahuah judges Assyria''s wood-and-stone gods.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=18
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-hezekiah-spreads-the-letter-that-all-kingdoms-may-know-thou-art-yahuah-alone'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalms 46:10 — be still and know I am Elohim; I will be exalted among the heathen: the aim of Hezekiah''s prayer, the Name vindicated.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=19
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-hezekiah-spreads-the-letter-that-all-kingdoms-may-know-thou-art-yahuah-alone'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Chronicles 32:20 — the king and the prophet prayed and cried to heaven: the same crisis, the same answer at the throne.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=19
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=32 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-hezekiah-spreads-the-letter-that-all-kingdoms-may-know-thou-art-yahuah-alone'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 37:23 — the reproach was against the Holy One of Yashar''el: twin of 2 Kings 19:22.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=22
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-the-proud-rod-judged-the-axe-shall-not-boast-against-him-that-heweth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 10:5 — O Assyrian, the rod of mine anger: the boasting king was only ever an instrument in Yahuah''s hand.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=23
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-the-proud-rod-judged-the-axe-shall-not-boast-against-him-that-heweth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Isaiah 10:15 — shall the axe boast against him that heweth: the heart of Yahuah''s answer to the boast (2 Kings 19:25 — I have formed it).'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=25
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-the-proud-rod-judged-the-axe-shall-not-boast-against-him-that-heweth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Isaiah 37:29 — hook in thy nose, bridle in thy lips, turned back: twin of 2 Kings 19:28, the proud rod led home.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=28
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-the-proud-rod-judged-the-axe-shall-not-boast-against-him-that-heweth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 37:31 — take root downward and bear fruit upward: twin of 2 Kings 19:30, the remnant as a planting.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=30
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-the-remnant-that-is-escaped-shall-take-root-downward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 1:9 — except Yahuah had left a very small remnant: the remnant is mercy, not Judah''s worthiness.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=31
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-the-remnant-that-is-escaped-shall-take-root-downward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Isaiah 10:20-21 — the remnant of Yashar''el shall stay upon Yahuah: the same remnant doctrine through the northern house too.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=31
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-the-remnant-that-is-escaped-shall-take-root-downward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Romans 11:5 — a remnant according to the election of grace: never replacement, the preserved covenant-seed; root holy, branches holy.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=31
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-the-remnant-that-is-escaped-shall-take-root-downward'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 37:36 — the angel of Yahuah smote 185,000: the twin record of the impossible victory by Yahuah alone.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=35
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-the-angel-of-yahuah-smote-the-camp-of-the-assyrians'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 32:21 — Yahuah sent an angel which cut off the mighty men: the visible Hand of the LORD, the Formed One bearing the Name.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=35
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=32 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-the-angel-of-yahuah-smote-the-camp-of-the-assyrians'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Exodus 12:29 — at midnight Yahuah smote all the firstborn: the Passover-night smiting pattern, dead corpses by morning.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=35
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-the-angel-of-yahuah-smote-the-camp-of-the-assyrians'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalms 76:5-6 — the stouthearted slept their sleep; chariot and horse cast into a dead sleep: the psalm sings the very scene at Salem/Zion.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=35
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=76 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-the-angel-of-yahuah-smote-the-camp-of-the-assyrians'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 37:6 — be not afraid, the LORD''s word against the blasphemy: twin of 2 Kings 19:6.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=6
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=37 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-be-not-afraid-i-will-defend-this-city'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 32:8 — with him an arm of flesh, but with us Yahuah our God to fight our battles: the same confidence Isaiah''s oracle gives.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=7
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=32 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-be-not-afraid-i-will-defend-this-city'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalms 46:1-2 — Elohim is our refuge and strength; we will not fear: Yahuah''s pledge to defend this city made song, Zion stands by Him not her walls.'
  FROM cross_reference_threads t
  JOIN _s343_2ki19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=19 AND sv.verse_number=32
  JOIN _s343_2ki19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=46 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-19-be-not-afraid-i-will-defend-this-city'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_20.sql (2 Kings 20) -----
-- 2 Kings 20 — Hezekiah's sickness, the heard prayer + fifteen added years, the sign
--   of the sun gone backward, and the FIRST naming of the Babylonian exile of the
--   southern house (Yahudah).
-- Tag: 2ki20   View: _s343_2ki20_lookup   Sort band: 38975 step 3 (38975,38978,38981,38984)
--
-- 2 Kings 20 coverage:
--   v.1-3  (sick unto death; turns face to wall and prays / perfect heart / weeps)
--          NT:     James 5:15-16 (prayer of faith / fervent prayer availeth) — THREAD 1
--          Extras: none warranted
--          Tanakh: Isaiah 38:1-3 (the parallel) ; Psalm 102:24 (take me not away in midst of days) — THREAD 1
--   v.5-6  (I have heard thy prayer, I have seen thy tears; add fifteen years; deliver this city)
--          NT:     James 5:15 (Yahuah shall raise him up) — THREAD 1
--          Extras: none warranted
--          Tanakh: Isaiah 38:5 (parallel) ; 2 Chronicles 32:24 (prayed, he gave him a sign) — THREAD 1
--   v.7    (lump of figs on the boil) — Tanakh: Isaiah 38:21 (the parallel plaister) — THREAD 1 (member)
--   v.8-11 (the sign — shadow on dial of Ahaz goes BACKWARD ten degrees)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Isaiah 38:8 (sun returned ten degrees, parallel) ; Joshua 10:13 (sun stood still — Creator over sun/time) — THREAD 2
--   v.12-15 (Babylon envoys of Berodach-baladan; Hezekiah shews them ALL his treasures)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Isaiah 39:1-4 (the parallel) ; 2 Chronicles 32:31 (Elohim left him, to try him) — THREAD 3
--   v.16-18 (all shall be carried into BABYLON; thy sons eunuchs in the palace of the king of Babylon)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Isaiah 39:6-7 (parallel) ; 2 Kings 24:13 + 25:21 (fulfilment) ; 2 Kings 17:18,23 (northern house already scattered — two-house pairing) — THREAD 3 + THREAD 4
--   v.19   (Good is the word... is it not good if peace and truth be in my days?) — folded into THREAD 3 prose
--   v.20-21 (pool/conduit; slept with fathers; Manasseh reigns) — NT/Extras/Tanakh: none warranted
--
-- Threads:
--   2-kings-20-the-prayer-that-turned-the-sentence-fifteen-years-added   [canon: Isaiah, 2 Chronicles, Psalms, James] tier free
--   2-kings-20-the-sign-of-the-sun-gone-backward-ten-degrees             [canon: Isaiah, Joshua] tier free
--   2-kings-20-the-babylonian-exile-of-the-southern-house-foretold       [canon: Isaiah, 2 Chronicles, 2 Kings] tier free
--   2-kings-20-the-northern-stick-scattered-now-the-southern-foretold    [canon: 2 Kings 17] tier free

CREATE TEMP VIEW _s343_2ki20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 — the heard prayer / fifteen years added
    ('canon','2-kings',20,2,'canon','isaiah',38,2,'free',E'*Then Hezekiah turned his face toward the wall, and prayed unto Yahuah (LORD),* (Isaiah 38:2). Isaiah''s own record of the same hour: where 2 Kings says *he turned his face to the wall, and prayed unto Yahuah (LORD)* (2 Kings 20:2), the prophet of the southern house preserves the king''s turning aside to seek Yahuah alone, not the physicians.'),
    ('canon','2-kings',20,3,'canon','isaiah',38,3,'free',E'*And said, Remember now, O Yahuah (LORD), I beseech thee, how I have walked before thee in truth and with a perfect heart, and have done that which is good in thy sight. And Hezekiah wept sore.* (Isaiah 38:3). The very prayer of 2 Kings 20:3 — *I beseech thee, O Yahuah (LORD), remember now how I have walked before thee in truth and with a perfect heart* — pleaded not flesh-merit but covenant-faithfulness, a walk in Yahuah''s Torah, and the tears were not despised.'),
    ('canon','2-kings',20,3,'canon','psalms',102,24,'free',E'*I said, O my Elohim (God), take me not away in the midst of my days: thy years are throughout all generations.* (Psalm 102:24). The afflicted one''s cry not to be cut off in the midst of his days sings the same plea Hezekiah wept at the wall, *Set thine house in order; for thou shalt die, and not live* (2 Kings 20:1) answered by the One whose *years are throughout all generations.*'),
    ('canon','2-kings',20,5,'canon','isaiah',38,5,'free',E'*Go, and say to Hezekiah, Thus saith Yahuah (LORD), the Elohim (God) of David thy father, I have heard thy prayer, I have seen thy tears: behold, I will add unto thy days fifteen years.* (Isaiah 38:5). Isaiah''s parallel of the turned sentence: the same word that came back before the prophet had left the middle court — *I have heard thy prayer, I have seen thy tears... I will add unto thy days fifteen years* (2 Kings 20:5-6) — the heard prayer that lengthened a life by Yahuah''s word.'),
    ('canon','2-kings',20,5,'canon','2-chronicles',32,24,'free',E'*In those days Hezekiah was sick to the death, and prayed unto Yahuah (LORD): and he spake unto him, and he gave him a sign.* (2 Chronicles 32:24). The Chronicler''s seal on the same deliverance — *he prayed unto Yahuah... and he gave him a sign* — confirms that the added years of 2 Kings 20:5-6 came by prayer answered, not by the figs.'),
    ('canon','2-kings',20,5,'canon','james',5,15,'free',E'*And the prayer of faith shall save the sick, and Yahuah (Lord) shall raise him up; and if he have committed sins, they shall be forgiven him.* (James 5:15). The apostolic word draws the line forward: the king sick unto death whom Yahuah *heard... and raised up* with *I will heal thee* (2 Kings 20:5) is the very pattern of *the prayer of faith* that *shall save the sick.*'),
    ('canon','2-kings',20,3,'canon','james',5,16,'free',E'*Confess your faults one to another, and pray one for another, that ye may be healed. The effectual fervent prayer of a righteous man availeth much.* (James 5:16). Hezekiah''s weeping plea *how I have walked before thee in truth and with a perfect heart* (2 Kings 20:3) is the *effectual fervent prayer of a righteous man* that *availeth much* — a sentence of death reversed because Yahuah heard.'),
    ('canon','2-kings',20,7,'canon','isaiah',38,21,'free',E'*For Isaiah had said, Let them take a lump of figs, and lay it for a plaister upon the boil, and he shall recover.* (Isaiah 38:21). The same remedy in Isaiah''s record matches *Take a lump of figs. And they took and laid it on the boil, and he recovered* (2 Kings 20:7) — the means in Yahuah''s hand, the healing already promised by his word.'),
    -- THREAD 2 — the sign of the sun gone backward
    ('canon','2-kings',20,11,'canon','isaiah',38,8,'free',E'*Behold, I will bring again the shadow of the degrees, which is gone down in the sun dial of Ahaz, ten degrees backward. So the sun returned ten degrees, by which degrees it was gone down.* (Isaiah 38:8). Isaiah''s parallel names what 2 Kings 20:11 records — *he brought the shadow ten degrees backward, by which it had gone down in the dial of Ahaz* — the Creator reversing the very sun on the dial, that the heard prayer might be sealed by a sign.'),
    ('canon','2-kings',20,11,'canon','joshua',10,13,'free',E'*And the sun stood still, and the moon stayed, until the people had avenged themselves upon their enemies. Is not this written in the book of Jasher? So the sun stood still in the midst of heaven, and hasted not to go down about a whole day.* (Joshua 10:13). As Yahuah held the sun still for Joshua, so he drew its shadow backward for Hezekiah — *let the shadow return backward ten degrees* (2 Kings 20:10) — the same hand of the Formed Son over sun and time, the Creator commanding his own creation.'),
    -- THREAD 3 — the Babylonian exile of the southern house foretold
    ('canon','2-kings',20,13,'canon','isaiah',39,2,'free',E'*And Hezekiah was glad of them, and shewed them the house of his precious things, the silver, and the gold, and the spices, and the precious ointment, and all the house of his armour, and all that was found in his treasures: there was nothing in his house, nor in all his dominion, that Hezekiah shewed them not.* (Isaiah 39:2). Isaiah''s parallel records the same display of pride that 2 Kings 20:13 sets down — the treasure paraded before Babylon''s envoys was the very treasure Babylon would one day carry away.'),
    ('canon','2-kings',20,13,'canon','2-chronicles',32,31,'free',E'*Howbeit in the business of the ambassadors of the princes of Babylon, who sent unto him to enquire of the wonder that was done in the land, Elohim (God) left him, to try him, that he might know all that was in his heart.* (2 Chronicles 32:31). The Chronicler reveals the inward trial behind 2 Kings 20:13 — the showing of *all the house of his precious things* to Babylon was the moment *Elohim (God) left him, to try him*, and the lifted-up heart was exposed.'),
    ('canon','2-kings',20,17,'canon','isaiah',39,6,'free',E'*Behold, the days come, that all that is in thine house, and that which thy fathers have laid up in store until this day, shall be carried to Babylon: nothing shall be left, saith Yahuah (LORD).* (Isaiah 39:6). Isaiah''s parallel word matches 2 Kings 20:17 verbatim in burden — the treasure displayed in pride shall be *carried into Babylon: nothing shall be left* — the southern house''s exile named long before it came.'),
    ('canon','2-kings',20,18,'canon','isaiah',39,7,'free',E'*And of thy sons that shall issue from thee, which thou shalt beget, shall they take away; and they shall be eunuchs in the palace of the king of Babylon.* (Isaiah 39:7). The same doom upon the royal seed as 2 Kings 20:18 — *thy sons... they shall be eunuchs in the palace of the king of Babylon* — the captivity of Yahudah''s princes foretold, fulfilled when Daniel and his companions stood in that palace.'),
    ('canon','2-kings',20,17,'canon','2-kings',24,13,'free',E'*And he carried out thence all the treasures of the house of Yahuah (LORD), and the treasures of the king''s house, and cut in pieces all the vessels of gold which Solomon king of Yashar''el (Israel) had made in the temple of Yahuah (LORD), as Yahuah (LORD) had said.* (2 Kings 24:13). The word of 2 Kings 20:17 — *all that is in thine house... shall be carried into Babylon* — comes to pass to the letter, *as Yahuah (LORD) had said*: the treasure shewn to the envoys is the treasure Nebuchadnezzar bears away.'),
    ('canon','2-kings',20,18,'canon','2-kings',25,21,'free',E'*And the king of Babylon smote them, and slew them at Riblah in the land of Hamath. So Yahudah (Judah) was carried away out of their land.* (2 Kings 25:21). The eunuch-prophecy of 2 Kings 20:18 ends here — *So Yahudah (Judah) was carried away out of their land* — the southern house gone into the Babylon that the pride of the treasure-house invited.'),
    -- THREAD 4 — two-house pairing: the northern stick already scattered, now the southern foretold
    ('canon','2-kings',20,18,'canon','2-kings',17,18,'free',E'*Therefore Yahuah (LORD) was very angry with Yashar''el (Israel), and removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only.* (2 Kings 17:18). The northern stick — Yashar''el / Ephraim — was already scattered into Assyria, *there was none left but the tribe of Yahudah (Judah) only*; now in 2 Kings 20:18 the southern stick, Yahudah, hears its own captivity named: both houses go out, both to be gathered again.'),
    ('canon','2-kings',20,17,'canon','2-kings',17,23,'free',E'*Until Yahuah (LORD) removed Yashar''el (Israel) out of his sight, as he had said by all his servants the prophets. So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day.* (2 Kings 17:23). As the north was *carried away out of their own land to Assyria*, so the word of 2 Kings 20:17 carries the south *into Babylon* — the two-house scattering completed, Yashar''el to Assyria and Yahudah to Babylon, awaiting the day the two sticks are made one.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-20-the-prayer-that-turned-the-sentence-fifteen-years-added',
       E'The Prayer That Turned the Sentence — Fifteen Years Added',
       E'Isaiah comes with a death-sentence: *Set thine house in order; for thou shalt die, and not live* (2 Kings 20:1). Hezekiah does not argue or summon physicians — *he turned his face to the wall, and prayed unto Yahuah (LORD)* (20:2), pleading not flesh-merit but a covenant walk: *Remember now, O Yahuah (LORD), I beseech thee, how I have walked before thee in truth and with a perfect heart* (Isaiah 38:3), *And Hezekiah wept sore.* Before the prophet had crossed the middle court the word came back: *I have heard thy prayer, I have seen thy tears: behold, I will heal thee... I will add unto thy days fifteen years* (20:5-6; Isaiah 38:5). The Chronicler seals it — *he prayed unto Yahuah (LORD): and he spake unto him, and he gave him a sign* (2 Chronicles 32:24). His was the cry of Psalm 102:24, *take me not away in the midst of my days*, answered by the One whose *years are throughout all generations*. The apostle draws the pattern forward: *the prayer of faith shall save the sick, and Yahuah (Lord) shall raise him up* (James 5:15), for *the effectual fervent prayer of a righteous man availeth much* (5:16). The figs on the boil (20:7; Isaiah 38:21) were the means in Yahuah''s hand; the healing was the heard prayer.',
       sv.verse_id, ev.verse_id, 'free', 38975
  FROM _s343_2ki20_lookup sv, _s343_2ki20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=20 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-20-the-sign-of-the-sun-gone-backward-ten-degrees',
       E'The Sign of the Sun Gone Backward Ten Degrees',
       E'Hezekiah asks a sign — *What shall be the sign that Yahuah (LORD) will heal me* (2 Kings 20:8) — and Isaiah offers a choice: *shall the shadow go forward ten degrees, or go back ten degrees?* (20:9). The king answers that forward is *a light thing*; *nay, but let the shadow return backward ten degrees* (20:10). So *Isaiah the prophet cried unto Yahuah (LORD): and he brought the shadow ten degrees backward, by which it had gone down in the dial of Ahaz* (20:11). Isaiah''s own record names the wonder: *So the sun returned ten degrees, by which degrees it was gone down* (Isaiah 38:8). This is the Creator over his own creation — the same hand of the Formed Son that once held the sun still over Gibeon for Joshua: *And the sun stood still, and the moon stayed... So the sun stood still in the midst of heaven, and hasted not to go down about a whole day* (Joshua 10:13). The One who fixed the lights of heaven (Genesis 1:14) can stay them and turn them back; time itself bends to seal a heard prayer.',
       sv.verse_id, ev.verse_id, 'free', 38978
  FROM _s343_2ki20_lookup sv, _s343_2ki20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=20 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-20-the-babylonian-exile-of-the-southern-house-foretold',
       E'The Babylonian Exile of the Southern House Foretold',
       E'The envoys of Berodach-baladan of Babylon come with letters and a present, and the healed king, his heart lifted up, *shewed them all the house of his precious things, the silver, and the gold... and all the house of his armour... there was nothing in his house, nor in all his dominion, that Hezekiah shewed them not* (2 Kings 20:13; Isaiah 39:2). The Chronicler exposes the trial: *Elohim (God) left him, to try him, that he might know all that was in his heart* (2 Chronicles 32:31). The pride that displays the treasure invites the spoiler. Isaiah pronounces the doom — and this is the FIRST naming of Yahudah''s Babylonian exile: *all that is in thine house... shall be carried into Babylon: nothing shall be left, saith Yahuah (LORD)* (20:17; Isaiah 39:6), *And of thy sons that shall issue from thee... shall they take away; and they shall be eunuchs in the palace of the king of Babylon* (20:18; Isaiah 39:7) — fulfilled when Daniel stood in that palace. It came to the letter: *he carried out thence all the treasures of the house of Yahuah (LORD)... as Yahuah (LORD) had said* (2 Kings 24:13), and *So Yahudah (Judah) was carried away out of their land* (25:21). Hezekiah''s complacent answer — *Is it not good, if peace and truth be in my days?* (20:19) — left the reckoning to his sons.',
       sv.verse_id, ev.verse_id, 'free', 38981
  FROM _s343_2ki20_lookup sv, _s343_2ki20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=20 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-20-the-northern-stick-scattered-now-the-southern-foretold',
       E'The Northern Stick Scattered, Now the Southern Foretold',
       E'The word over Yahudah in this chapter is the second half of a two-house judgment. The northern house — Yashar''el, Ephraim, the stick of Joseph — was already gone: *Therefore Yahuah (LORD) was very angry with Yashar''el (Israel), and removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18), *So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day* (17:23). Now in 2 Kings 20:17-18 the southern stick, Yahudah, hears its own captivity named — *all that is in thine house... shall be carried into Babylon... and they shall be eunuchs in the palace of the king of Babylon*. Both houses are sent out of the land: the north to Assyria, the south to Babylon. Yet the scattering is never the last word — *He that scattered Yashar''el (Israel) will gather him* (Jeremiah 31:10), and the two sticks become one in his hand (Ezekiel 37:19). The exile foretold here is the dark side of the promise that the divided people will one day be made whole.',
       sv.verse_id, ev.verse_id, 'free', 38984
  FROM _s343_2ki20_lookup sv, _s343_2ki20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=20 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 38:2 — *prayed unto Yahuah (LORD)*; the king turns to the wall, not the physicians.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=2
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=38 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-prayer-that-turned-the-sentence-fifteen-years-added'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Isaiah 38:3 — *how I have walked before thee in truth and with a perfect heart*; the covenant plea, not flesh-merit.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=38 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-prayer-that-turned-the-sentence-fifteen-years-added'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 102:24 — *take me not away in the midst of my days*; the afflicted one''s same cry.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-prayer-that-turned-the-sentence-fifteen-years-added'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Isaiah 38:5 — *I have heard thy prayer... I will add unto thy days fifteen years*; the turned sentence.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=5
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=38 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-prayer-that-turned-the-sentence-fifteen-years-added'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Chronicles 32:24 — *prayed unto Yahuah... and he gave him a sign*; the Chronicler''s seal on the answer.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=5
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=32 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-prayer-that-turned-the-sentence-fifteen-years-added'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'James 5:15 — *the prayer of faith shall save the sick, and Yahuah (Lord) shall raise him up*; the pattern forward.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=5
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-prayer-that-turned-the-sentence-fifteen-years-added'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'James 5:16 — *the effectual fervent prayer of a righteous man availeth much*; Hezekiah''s tears availed.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-prayer-that-turned-the-sentence-fifteen-years-added'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Isaiah 38:21 — *a lump of figs... a plaister upon the boil*; the means in Yahuah''s hand.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=7
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=38 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-prayer-that-turned-the-sentence-fifteen-years-added'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 38:8 — *So the sun returned ten degrees*; Isaiah names the wonder of the dial of Ahaz.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=11
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=38 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-sign-of-the-sun-gone-backward-ten-degrees'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joshua 10:13 — *the sun stood still in the midst of heaven*; the Creator over sun and time, the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=11
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=10 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-sign-of-the-sun-gone-backward-ten-degrees'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Isaiah 39:2 — *shewed them the house of his precious things*; the parallel display of pride before Babylon.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=13
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=39 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-babylonian-exile-of-the-southern-house-foretold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 32:31 — *Elohim (God) left him, to try him*; the inward trial behind the display.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=13
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=32 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-babylonian-exile-of-the-southern-house-foretold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Isaiah 39:6 — *shall be carried to Babylon: nothing shall be left*; the southern exile named.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=17
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=39 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-babylonian-exile-of-the-southern-house-foretold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Isaiah 39:7 — *they shall be eunuchs in the palace of the king of Babylon*; the royal seed taken (Daniel).'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=18
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=39 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-babylonian-exile-of-the-southern-house-foretold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Kings 24:13 — *carried out... all the treasures... as Yahuah (LORD) had said*; the word fulfilled to the letter.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=17
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=24 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-babylonian-exile-of-the-southern-house-foretold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'2 Kings 25:21 — *So Yahudah (Judah) was carried away out of their land*; the prophecy''s end.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=18
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=25 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-babylonian-exile-of-the-southern-house-foretold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 17:18 — *removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only*; the northern stick gone to Assyria.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=18
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-northern-stick-scattered-now-the-southern-foretold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 17:23 — *Yashar''el (Israel) carried away out of their own land to Assyria*; the north, as the south will go to Babylon.'
  FROM cross_reference_threads t
  JOIN _s343_2ki20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=20 AND sv.verse_number=17
  JOIN _s343_2ki20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-20-the-northern-stick-scattered-now-the-southern-foretold'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_21.sql (2 Kings 21) -----
-- Book: 2 Kings, chapter 21 — Manasseh the worst king of Yahudah, and Amon his son
-- Tag: 2ki21   View: _s343_2ki21_lookup   Sort band: 39000 step 3 (39000..39009)
-- Source rows all: 'canon','2-kings',21,v
--
-- 2 Kings 21 coverage:
--   v.1     NT: none warranted   Extras: none warranted   Tanakh: 2Chr 33:1 (parallel regnal note) — recorded, folded into thread 1 frame not a member
--   v.2     NT: none warranted   Extras: none warranted   Tanakh: 2Chr 33:2 — folded into thread 1
--   v.3     NT: none warranted   Extras: none warranted   Tanakh: 2Chr 33:3 (parallel) — MEMBER thread 1
--   v.4     NT: none warranted   Extras: none warranted   Tanakh: 1Kgs 9:3 (the promise contradicted) — MEMBER thread 1
--   v.5     NT: none warranted   Extras: none warranted   Tanakh: (host of heaven in two courts) — folded into thread 1
--   v.6     NT: none warranted   Extras: none warranted   Tanakh: Deut 18:10, Deut 18:11, Deut 18:12 (the named abominations) — MEMBERS thread 2; 2Chr 33:6 parallel folded
--   v.7     NT: none warranted   Extras: none warranted   Tanakh: 1Kgs 9:3 / 1Kgs 9:7 (put-my-name / cut-off warning) — MEMBERS thread 1
--   v.8     NT: none warranted   Extras: none warranted   Tanakh: 2Chr 33:8 (Torah-condition restated) — folded into thread 1 frame; the if-they-observe-Torah clause
--   v.9     NT: none warranted   Extras: none warranted   Tanakh: (seduced them) — folded into thread 3
--   v.10-12 NT: none warranted   Extras: none warranted   Tanakh: (prophets' sentence) — frame for thread 3
--   v.13    NT: none warranted   Extras: none warranted   Tanakh: 2Kgs 24:3 (line of Samaria / measured by the same plummet, exile sealed) — MEMBER thread 3
--   v.14-15 NT: none warranted   Extras: none warranted   Tanakh: (forsake the remnant) — frame for thread 3
--   v.16    NT: none warranted   Extras: none warranted   Tanakh: 2Kgs 24:4 (innocent blood Yahuah would not pardon) + Jer 15:4 (removed because of Manasseh) — MEMBERS thread 3; 2Chr 33:12, 2Chr 33:13 (the late mercy) — MEMBERS thread 4
--   v.17    NT: none warranted   Extras: none warranted   Tanakh: none warranted (chronicle formula)
--   v.18    NT: none warranted   Extras: none warranted   Tanakh: none warranted (burial)
--   v.19-22 NT: none warranted   Extras: none warranted   Tanakh: 2Chr 33:22-23 (Amon did evil, humbled not himself) — folded into thread 4 frame
--   v.23-26 NT: none warranted   Extras: none warranted   Tanakh: none warranted (conspiracy/burial/Josiah succeeds)
--
-- Threads (all canon → tier_required 'free'):
--   1. 2-kings-21-altars-in-the-house-where-yahuah-put-his-name   [Tanakh: 1 Kings, 2 Chronicles]  v.3,4,7
--   2. 2-kings-21-pass-through-the-fire-and-familiar-spirits-the-deut-18-abominations  [Tanakh: Deuteronomy]  v.6
--   3. 2-kings-21-the-line-of-samaria-and-the-innocent-blood-that-sealed-the-exile  [Tanakh: 2 Kings, Jeremiah]  v.13,16
--   4. 2-kings-21-even-the-worst-who-humbleth-himself-the-mercy-of-manassehs-captivity  [Tanakh: 2 Chronicles]  v.16
-- Framework-load-bearing: v.4/7 the deepest desecration = idols in Yahuah's OWN house where He swore to put His name (1Kgs 9:3), contradicting the very covenant-word; the Torah-condition of v.8 ('only if they will observe to do... all the law that my servant Moses commanded') stands — the land is held BY the covenant, Torah never the curse. v.16 the INNOCENT BLOOD is the named cause of the exile the reform cannot avert (2Kgs 24:3-4; Jer 15:4). Thread 4 records, for honesty, the mercy even to the worst king who humbled himself in captivity (2Chr 33:12-13) — the Father's reach.

CREATE TEMP VIEW _s343_2ki21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: altars in the house where Yahuah put His name
    ('canon','2-kings',21,4,'canon','1-kings',9,3,'free',E'*And Yahuah (LORD) said unto him, I have heard thy prayer and thy supplication, that thou hast made before me: I have hallowed this house, which thou hast built, to put my name there for ever; and mine eyes and mine heart shall be there perpetually.* (1 Kings 9:3) This is the very word Manasseh contradicts. Yahuah had hallowed the house and set His name there *for ever*; Manasseh *built altars in the house of Yahuah (LORD), of which Yahuah (LORD) said, In Jerusalem will I put my name* (2 Kings 21:4). The deepest desecration is not idolatry on a hill but a graven image inside the one house chosen to carry the Name.'),
    ('canon','2-kings',21,7,'canon','1-kings',9,3,'free',E'*I have hallowed this house, which thou hast built, to put my name there for ever; and mine eyes and mine heart shall be there perpetually.* (1 Kings 9:3) Manasseh *set a graven image of the grove that he had made in the house, of which Yahuah (LORD) said to David, and to Solomon his son, In this house... which I have chosen out of all tribes of Yashar''el (Israel), will I put my name for ever* (2 Kings 21:7) — he answers the eternal Name-promise with an idol planted in the holy place.'),
    ('canon','2-kings',21,7,'canon','1-kings',9,7,'free',E'*Then will I cut off Yashar''el (Israel) out of the land which I have given them; and this house, which I have hallowed for my name, will I cast out of my sight; and Yashar''el (Israel) shall be a proverb and a byword among all people* (1 Kings 9:7). The same chapter that gave the Name-promise gave its condition: defile the house and it is cast out of His sight. Manasseh''s altars (2 Kings 21:7) trigger exactly this clause — the house chosen *for ever* will be wiped (2 Kings 21:13).'),
    ('canon','2-kings',21,3,'canon','2-chronicles',33,3,'free',E'*For he built again the high places which Hezekiah his father had broken down, and he reared up altars for Baalim, and made groves, and worshipped all the host of heaven, and served them.* (2 Chronicles 33:3) The Chronicler tells the same descent: Manasseh *built up again the high places which Hezekiah his father had destroyed; and he reared up altars for Baal, and made a grove* (2 Kings 21:3) — every reform of the godly father undone by the son.'),
    -- Thread 2: the Deut 18 abominations
    ('canon','2-kings',21,6,'canon','deuteronomy',18,10,'free',E'*There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch* (Deuteronomy 18:10). Manasseh does the very catalogue the Torah forbids: *he made his son pass through the fire, and observed times, and used enchantments* (2 Kings 21:6). The king becomes the abomination Yahuah drove the nations out for.'),
    ('canon','2-kings',21,6,'canon','deuteronomy',18,11,'free',E'*Or a charmer, or a consulter with familiar spirits, or a wizard, or a necromancer.* (Deuteronomy 18:11) Manasseh *dealt with familiar spirits and wizards* (2 Kings 21:6), reaching to the dead and the unclean spirits the Torah names by name — the Torah is not silent on this; he knew the list and crossed every line of it.'),
    ('canon','2-kings',21,6,'canon','deuteronomy',18,12,'free',E'*For all that do these things are an abomination unto Yahuah (LORD): and because of these abominations Yahuah Elohayka (the LORD thy God) doth drive them out from before thee.* (Deuteronomy 18:12) This is the verdict over Manasseh''s whole practice: *he wrought much wickedness in the sight of Yahuah (LORD), to provoke him to anger* (2 Kings 21:6). The nations were cast out for these very things; now a son of Yahudah does them, and the same drive-out hangs over Jerusalem.'),
    -- Thread 3: line of Samaria + innocent blood seal the exile
    ('canon','2-kings',21,13,'canon','2-kings',24,3,'free',E'*Surely at the commandment of Yahuah (LORD) came this upon Yahudah (Judah), to remove them out of his sight, for the sins of Manasseh, according to all that he did* (2 Kings 24:3). The plummet that levelled the north is stretched over the south: *I will stretch over Jerusalem the line of Samaria, and the plummet of the house of Ahab: and I will wipe Jerusalem as a man wipeth a dish* (2 Kings 21:13). Judah is measured by the same line that condemned Yashar''el (Israel) — the south follows the north into exile, and the sins of Manasseh are named as the cause.'),
    ('canon','2-kings',21,16,'canon','2-kings',24,4,'free',E'*And also for the innocent blood that he shed: for he filled Jerusalem with innocent blood; which Yahuah (LORD) would not pardon.* (2 Kings 24:4) Here is the unforgiven thing: *Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another* (2 Kings 21:16). This bloodguilt is the decisive cause of the Babylonian judgment even Josiah''s reform cannot reverse — the blood cries from the ground that Yahuah *would not pardon*.'),
    ('canon','2-kings',21,16,'canon','jeremiah',15,4,'free',E'*And I will cause them to be removed into all kingdoms of the earth, because of Manasseh the son of Hezekiah king of Yahudah (Judah), for that which he did in Jerusalem.* (Jeremiah 15:4) A generation later the prophet still names him: the scattering *into all kingdoms of the earth* is laid to Manasseh, who *filled Jerusalem from one end to another* with innocent blood (2 Kings 21:16). The reform of his grandson Josiah delays but cannot undo it.'),
    -- Thread 4: mercy even to the worst who humbles himself
    ('canon','2-kings',21,16,'canon','2-chronicles',33,12,'free',E'*And when he was in affliction, he besought Yahuah Elohav (the LORD his God), and humbled himself greatly before the Elohim (God) of his fathers* (2 Chronicles 33:12). 2 Kings sets down only the crimes of the worst king — *Manasseh shed innocent blood very much* (2 Kings 21:16); the Chronicler adds the honest sequel: dragged to Babylon with hooks, the worst of all kings *humbled himself greatly*. The seed-promise reaches even here, where a man bows.'),
    ('canon','2-kings',21,16,'canon','2-chronicles',33,13,'free',E'*And prayed unto him: and he was intreated of him, and heard his supplication, and brought him again to Jerusalem into his kingdom. Then Manasseh knew that Yahuah (LORD) he was Elohim (God).* (2 Chronicles 33:13) The king who *filled Jerusalem from one end to another* with innocent blood (2 Kings 21:16) is, in captivity, *intreated of* and *brought again* — Yahuah hears the man who humbles himself, even the worst, though the bloodguilt over the city still stands. Mercy to the penitent and judgment on the blood are not at war; both are true.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- Thread 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-21-altars-in-the-house-where-yahuah-put-his-name',
       E'Altars in the house where Yahuah put His name',
       E'Solomon''s house was hallowed by a covenant-word: *I have hallowed this house, which thou hast built, to put my name there for ever; and mine eyes and mine heart shall be there perpetually* (1 Kings 9:3). Manasseh answers that word with desecration in the holy place itself: he *built altars in the house of Yahuah (LORD), of which Yahuah (LORD) said, In Jerusalem will I put my name* (2 Kings 21:4), and *set a graven image of the grove that he had made in the house... which I have chosen out of all tribes of Yashar''el (Israel), will I put my name for ever* (2 Kings 21:7). The deepest idolatry is not on the high places (though *he built up again the high places which Hezekiah his father had destroyed*, 2 Kings 21:3 — the same descent recorded in 2 Chronicles 33:3) but inside the one chosen house. And the same chapter that gave the Name-promise gave its condition: *this house, which I have hallowed for my name, will I cast out of my sight* (1 Kings 9:7). The covenant holds the land and the house — *only if they will observe to do according to all that I have commanded them, and according to all the law that my servant Moses commanded them* (2 Kings 21:8). Break that, defile that house, and the eternal Name-promise becomes the warrant for the wiping that follows.',
       sv.verse_id, ev.verse_id, 'free', 39000
  FROM _s343_2ki21_lookup sv, _s343_2ki21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=21 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-21-pass-through-the-fire-and-familiar-spirits-the-deut-18-abominations',
       E'Pass through the fire and familiar spirits — the Deuteronomy 18 abominations',
       E'In one verse Manasseh runs the whole catalogue the Torah forbids: *And he made his son pass through the fire, and observed times, and used enchantments, and dealt with familiar spirits and wizards: he wrought much wickedness in the sight of Yahuah (LORD), to provoke him to anger* (2 Kings 21:6). Deuteronomy 18 names every item by name: *There shall not be found among you any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times, or an enchanter, or a witch* (Deuteronomy 18:10); *Or a charmer, or a consulter with familiar spirits, or a wizard, or a necromancer* (Deuteronomy 18:11). And the verdict: *For all that do these things are an abomination unto Yahuah (LORD): and because of these abominations Yahuah Elohayka (the LORD thy God) doth drive them out from before thee* (Deuteronomy 18:12). The nations were cast out of the land for these very practices; now a king of Yahudah (Judah) does them all, and the drive-out the Torah pronounced comes round upon Jerusalem.',
       sv.verse_id, ev.verse_id, 'free', 39003
  FROM _s343_2ki21_lookup sv, _s343_2ki21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=21 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-21-the-line-of-samaria-and-the-innocent-blood-that-sealed-the-exile',
       E'The line of Samaria, and the innocent blood that sealed the exile',
       E'Yahuah passes sentence by the prophets, and the figure is a builder''s tools turned to demolition: *I will stretch over Jerusalem the line of Samaria, and the plummet of the house of Ahab: and I will wipe Jerusalem as a man wipeth a dish, wiping it, and turning it upside down* (2 Kings 21:13). Judah will be measured by the same line and plummet that condemned the northern house — the south following the north into exile. The decisive cause is named twice: *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another* (2 Kings 21:16). When the Babylonian judgment falls, the historian looks back to this very man: *Surely at the commandment of Yahuah (LORD) came this upon Yahudah (Judah), to remove them out of his sight, for the sins of Manasseh, according to all that he did* (2 Kings 24:3); *And also for the innocent blood that he shed: for he filled Jerusalem with innocent blood; which Yahuah (LORD) would not pardon* (2 Kings 24:4). The prophet Jeremiah, a generation on, says the same: *I will cause them to be removed into all kingdoms of the earth, because of Manasseh the son of Hezekiah king of Yahudah (Judah), for that which he did in Jerusalem* (Jeremiah 15:4). Josiah''s great reform delays but cannot avert it; shed innocent blood is the guilt the land itself will not hold.',
       sv.verse_id, ev.verse_id, 'free', 39006
  FROM _s343_2ki21_lookup sv, _s343_2ki21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=21 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-21-even-the-worst-who-humbleth-himself-the-mercy-of-manassehs-captivity',
       E'Even the worst who humbleth himself — the mercy of Manasseh''s captivity',
       E'2 Kings sets down only the crimes — *Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another* (2 Kings 21:16) — and lets the worst king of Yahudah (Judah) sleep with his fathers under judgment. The Chronicler, for honesty, records the sequel the king-list omits: carried captive to Babylon among the thorns, *when he was in affliction, he besought Yahuah Elohav (the LORD his God), and humbled himself greatly before the Elohim (God) of his fathers* (2 Chronicles 33:12). And the answer: *And prayed unto him: and he was intreated of him, and heard his supplication, and brought him again to Jerusalem into his kingdom. Then Manasseh knew that Yahuah (LORD) he was Elohim (God)* (2 Chronicles 33:13). The Father''s reach extends even to the man who filled the city with blood — He hears the one who bows. This is not the bloodguilt pardoned (that judgment over Jerusalem still came); it is mercy to the penitent man set beside judgment on the city''s sin, both held true at once — the warning against any reading that thinks the worst is past Yahuah''s reach.',
       sv.verse_id, ev.verse_id, 'free', 39009
  FROM _s343_2ki21_lookup sv, _s343_2ki21_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=21 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- Members thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I have hallowed this house... to put my name there for ever* (1 Kings 9:3) — the very promise Manasseh''s altars in the house (2 Kings 21:4) defy.'
  FROM cross_reference_threads t
  JOIN _s343_2ki21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=4
  JOIN _s343_2ki21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-21-altars-in-the-house-where-yahuah-put-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'The eternal Name-promise (1 Kings 9:3) again — answered by *a graven image... in the house... will I put my name for ever* (2 Kings 21:7).'
  FROM cross_reference_threads t
  JOIN _s343_2ki21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=7
  JOIN _s343_2ki21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=9 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-21-altars-in-the-house-where-yahuah-put-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*This house... will I cast out of my sight* (1 Kings 9:7) — the Name-promise''s condition, triggered by the idols of 2 Kings 21:7.'
  FROM cross_reference_threads t
  JOIN _s343_2ki21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=7
  JOIN _s343_2ki21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=9 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-21-altars-in-the-house-where-yahuah-put-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He built again the high places which Hezekiah his father had broken down* (2 Chronicles 33:3) — the Chronicler''s parallel to the undone reform of 2 Kings 21:3.'
  FROM cross_reference_threads t
  JOIN _s343_2ki21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=3
  JOIN _s343_2ki21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=33 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-21-altars-in-the-house-where-yahuah-put-his-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Any one that maketh his son or his daughter to pass through the fire, or that useth divination, or an observer of times* (Deuteronomy 18:10) — named in the Torah, done by Manasseh in 2 Kings 21:6.'
  FROM cross_reference_threads t
  JOIN _s343_2ki21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=6
  JOIN _s343_2ki21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-21-pass-through-the-fire-and-familiar-spirits-the-deut-18-abominations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*A consulter with familiar spirits, or a wizard, or a necromancer* (Deuteronomy 18:11) — the dead-consulting Manasseh *dealt with familiar spirits and wizards* (2 Kings 21:6).'
  FROM cross_reference_threads t
  JOIN _s343_2ki21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=6
  JOIN _s343_2ki21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-21-pass-through-the-fire-and-familiar-spirits-the-deut-18-abominations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*All that do these things are an abomination unto Yahuah... doth drive them out from before thee* (Deuteronomy 18:12) — the verdict over Manasseh''s much wickedness (2 Kings 21:6).'
  FROM cross_reference_threads t
  JOIN _s343_2ki21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=6
  JOIN _s343_2ki21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-21-pass-through-the-fire-and-familiar-spirits-the-deut-18-abominations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*For the sins of Manasseh... to remove them out of his sight* (2 Kings 24:3) — Judah measured by the line of Samaria (2 Kings 21:13).'
  FROM cross_reference_threads t
  JOIN _s343_2ki21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=13
  JOIN _s343_2ki21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=24 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-21-the-line-of-samaria-and-the-innocent-blood-that-sealed-the-exile'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*The innocent blood that he shed... which Yahuah would not pardon* (2 Kings 24:4) — the bloodguilt of 2 Kings 21:16 named as the unforgiven cause of exile.'
  FROM cross_reference_threads t
  JOIN _s343_2ki21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=16
  JOIN _s343_2ki21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=24 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-21-the-line-of-samaria-and-the-innocent-blood-that-sealed-the-exile'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Removed into all kingdoms of the earth, because of Manasseh* (Jeremiah 15:4) — the prophet, a generation on, still names the blood of 2 Kings 21:16.'
  FROM cross_reference_threads t
  JOIN _s343_2ki21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=16
  JOIN _s343_2ki21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-21-the-line-of-samaria-and-the-innocent-blood-that-sealed-the-exile'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Members thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*When he was in affliction... humbled himself greatly* (2 Chronicles 33:12) — the sequel to the crimes of 2 Kings 21:16 the king-list omits.'
  FROM cross_reference_threads t
  JOIN _s343_2ki21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=16
  JOIN _s343_2ki21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=33 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-21-even-the-worst-who-humbleth-himself-the-mercy-of-manassehs-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He was intreated of him... brought him again to Jerusalem... Then Manasseh knew that Yahuah he was Elohim* (2 Chronicles 33:13) — mercy to the worst penitent, set beside the unpardoned blood of 2 Kings 21:16.'
  FROM cross_reference_threads t
  JOIN _s343_2ki21_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=21 AND sv.verse_number=16
  JOIN _s343_2ki21_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=33 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-21-even-the-worst-who-humbleth-himself-the-mercy-of-manassehs-captivity'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_22.sql (2 Kings 22) -----
--
-- Chapter: 2 Kings 22 — Josiah finds the Book of the Torah in the house of Yahuah
-- Tag: 2ki22   |  Session prefix: s343   |  View: _s343_2ki22_lookup
-- Sort band: base 39025, step 3  (39025, 39028, 39031, 39034)
--
-- FRAME (per MINION_BRIEF_TANAKH.md): the recovered Word/Torah — the lost book found, the
-- covenant neglected through idolatry then restored. The Torah here is the WORD that convicts
-- and renews the tender heart, NEVER the curse (Deut 28 is the exile-judgment for covenant-
-- BREAKING; the book itself is the covenant inheritance they broke and must return to).
-- Josiah, doer-not-hearer (Jas 1), rends his clothes at the living Word (Heb 4:12); Huldah's
-- oracle = mercy to the one who humbles himself at the Word (Deut 30 return-and-compassion).
--
-- 2 Kings 22 coverage:
--   v.1-7  (Josiah right; temple repair, faithful workmen)
--          NT:     none warranted (narrative setting)
--          Extras: none warranted
--          Tanakh: 2 Chron 34:1-13 parallel (held for the book-found thread, v.8)
--   v.8,10 (Hilkiah FINDS the book of the law; Shaphan reads it)  ★★★
--          NT:     none warranted directly (the Word-recovered weaves through the heart thread)
--          Extras: none warranted
--          Tanakh: 2 Chron 34:14-15 (book found, parallel); Neh 8:1-3 (Torah read again to all);
--                  Deut 30:11-14 (the word very nigh — not hidden, not lost in heaven)  → THREAD 1
--   v.2    (Josiah did right, turned not to the right or left)
--          covered as anchor within thread 1 prose
--   v.11   (the king rent his clothes at the words of the book)  ★★
--          NT:     Heb 4:12 (the word quick and powerful, piercing); Jas 1:22-25 (doers not hearers)
--          Extras: none warranted
--          Tanakh: Ps 119:130 (entrance of thy words giveth light); Ps 119:18 (wondrous things)
--                                                                                   → THREAD 2
--   v.13   (great is the wrath... our fathers have not hearkened... to do all written)  ★
--          NT:     none warranted (the doers-not-hearers note carried in thread 2)
--          Extras: none warranted
--          Tanakh: Deut 28:58 (words of this law in this book); Deut 28:15 / 28:45 (curse for not
--                  hearkening); Deut 29:25-27 (forsook the covenant → anger kindled)  → THREAD 3
--   v.16-17 (I will bring evil... because they have forsaken me, burned incense to other gods)
--          covered within thread 3 (the covenant-breaking sentence, not the Torah cursing)
--   v.18-20 (Huldah: because thine heart was tender and thou humbledst thyself... peace)  ★
--          NT:     none warranted (Deut return/mercy carries it; Jas 4:6/4:10 considered, held —
--                  Tanakh witnesses are the load-bearing ones for the humbled-heart oracle)
--          Extras: none warranted
--          Tanakh: 2 Chron 34:27-28 (parallel oracle); Deut 30:2-3 (return → compassion/gather)
--                                                                                   → THREAD 4
--
-- Threads (4):
--   2-kings-22-the-book-of-the-law-found-in-the-house     [Tanakh] free
--   2-kings-22-the-word-rends-the-tender-heart            [Tanakh+NT] free
--   2-kings-22-great-is-the-wrath-our-fathers-hearkened-not [Tanakh] free
--   2-kings-22-mercy-to-the-one-who-humbles-himself       [Tanakh] free
--

CREATE TEMP VIEW _s343_2ki22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ cross_references ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the book of the law found in the house
    ('canon','2-kings',22,8,'canon','2-chronicles',34,14,'free',
     E'*And when they brought out the money that was brought into the house of Yahuah (LORD), Hilkiah the priest found a book of the law of Yahuah (LORD) given by Moses* (2 Chronicles 34:14). The Chronicler names what 2 Kings declares — *I have found the book of the law in the house of Yahuah (LORD)* (2 Kings 22:8): the very Torah given by Moses, neglected and buried through the idolatrous reigns, recovered amid the temple repair. The covenant-word was never abolished — only lost from the people who forsook it, and now found again in his house.'),
    ('canon','2-kings',22,8,'canon','2-chronicles',34,15,'free',
     E'*And Hilkiah answered and said to Shaphan the scribe, I have found the book of the law in the house of Yahuah (LORD). And Hilkiah delivered the book to Shaphan* (2 Chronicles 34:15). The same announcement as *I have found the book of the law in the house of Yahuah (LORD)* (2 Kings 22:8) — the high priest is the one who recovers the lost Torah and hands it on, that it may be read and obeyed.'),
    ('canon','2-kings',22,8,'canon','nehemiah',8,1,'free',
     E'*And all the people gathered themselves together as one man into the street that was before the water gate; and they spake unto Ezra the scribe to bring the book of the law of Moses, which Yahuah (LORD) had commanded to Yashar''el (Israel)* (Nehemiah 8:1). What Josiah recovers, the returned remnant calls for again after the exile — the same *book of the law*, the same covenant instruction commanded to Yashar''el (Israel). The Torah is the people''s perpetual inheritance, returned to whenever the heart turns back.'),
    ('canon','2-kings',22,10,'canon','nehemiah',8,3,'free',
     E'*And he read therein before the street that was before the water gate from the morning until midday... and the ears of all the people were attentive unto the book of the law* (Nehemiah 8:3). As *Shaphan read it before the king* (2 Kings 22:10), so Ezra reads the same book before all the people — the recovered Word read aloud is the hinge of every covenant-renewal, the doors of the heart opened by the reading.'),
    ('canon','2-kings',22,8,'canon','deuteronomy',30,11,'free',
     E'*For this commandment which I command thee this day, it is not hidden from thee, neither is it far off* (Deuteronomy 30:11). Moses had said the word would never be truly lost — *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deut 30:14). Hilkiah''s finding of *the book of the law in the house of Yahuah (LORD)* (2 Kings 22:8) proves it: neglected, yes, but never far off, recovered the moment the house is sought again.'),
    -- THREAD 2: the word rends the tender heart
    ('canon','2-kings',22,11,'canon','hebrews',4,12,'free',
     E'*For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit... and is a discerner of the thoughts and intents of the heart* (Hebrews 4:12). When *the king had heard the words of the book of the law, that he rent his clothes* (2 Kings 22:11): the recovered Word is not dead parchment but the living sword that pierces — it discerns the heart, and the tender heart is cut to repentance.'),
    ('canon','2-kings',22,11,'canon','james',1,22,'free',
     E'*But be ye doers of the word, and not hearers only, deceiving your own selves* (James 1:22). Josiah does not merely hear — *he rent his clothes* (2 Kings 22:11) and moves to obey. He is the doer, not the deceived hearer, the very pattern James commands.'),
    ('canon','2-kings',22,11,'canon','james',1,25,'free',
     E'*But whoso looketh into the perfect law of liberty, and continueth therein, he being not a forgetful hearer, but a doer of the work, this man shall be blessed in his deed* (James 1:25). The law James calls *perfect... of liberty* is the very book Josiah heard; his rending of his clothes (2 Kings 22:11) and renewed covenant make him the doer-of-the-work who is blessed — the Torah looked into and kept, never the Torah set aside.'),
    ('canon','2-kings',22,11,'canon','psalms',119,130,'free',
     E'*The entrance of thy words giveth light; it giveth understanding unto the simple* (Psalm 119:130). The instant the words of the book entered Josiah''s ears he saw — and *he rent his clothes* (2 Kings 22:11). The recovered Word giving light to the king is the psalmist''s entrance-of-thy-words made history.'),
    ('canon','2-kings',22,11,'canon','psalms',119,18,'free',
     E'*Open thou mine eyes, that I may behold wondrous things out of thy law* (Psalm 119:18). The reading of the book opened the king''s eyes to the covenant he had broken; his torn clothes (2 Kings 22:11) are the answered prayer of one whose eyes are opened by the Torah.'),
    -- THREAD 3: great is the wrath — our fathers hearkened not
    ('canon','2-kings',22,13,'canon','deuteronomy',28,58,'free',
     E'*If thou wilt not observe to do all the words of this law that are written in this book, that thou mayest fear this glorious and fearful name, THE Yahuah (LORD) THY GOD* (Deuteronomy 28:58). This is the very *book that is found* (2 Kings 22:13). Josiah''s dread — *great is the wrath of Yahuah (LORD)... because our fathers have not hearkened unto the words of this book* — is the warning of this book felt at last: the curse fell because the words written in it were not done, never because the words themselves were a curse.'),
    ('canon','2-kings',22,13,'canon','deuteronomy',28,15,'free',
     E'*But it shall come to pass, if thou wilt not hearken unto the voice of Yahuah Elohayka (the LORD thy God), to observe to do all his commandments and his statutes... that all these curses shall come upon thee, and overtake thee* (Deuteronomy 28:15). Josiah names the cause exactly — *because our fathers have not hearkened unto the words of this book* (2 Kings 22:13). The wrath is the announced consequence of covenant-breaking, the Torah''s own stated terms, not the Torah condemning the obedient.'),
    ('canon','2-kings',22,13,'canon','deuteronomy',28,45,'free',
     E'*Moreover all these curses shall come upon thee... because thou hearkenedst not unto the voice of Yahuah Elohayka (the LORD thy God), to keep his commandments and his statutes which he commanded thee* (Deuteronomy 28:45). The wrath Josiah fears (2 Kings 22:13) is this clause coming due — the curse pursues those who would not keep, and the remedy is to return and keep, which is exactly what Josiah moves to do.'),
    ('canon','2-kings',22,17,'canon','deuteronomy',29,25,'free',
     E'*Then men shall say, Because they have forsaken the covenant of Yahuah Elohim (the LORD God) of their fathers, which he made with them when he brought them forth out of the land of Egypt* (Deuteronomy 29:25). Huldah''s sentence — *Because they have forsaken me, and have burned incense unto other gods* (2 Kings 22:17) — is Moses'' covenant-lawsuit fulfilled to the letter: the forsaking of the covenant, not its keeping, kindles the wrath.'),
    ('canon','2-kings',22,17,'canon','deuteronomy',29,27,'free',
     E'*And the anger of Yahuah (LORD) was kindled against this land, to bring upon it all the curses that are written in this book* (Deuteronomy 29:27). The oracle Josiah hears — *therefore my wrath shall be kindled against this place, and shall not be quenched* (2 Kings 22:17) — speaks Moses'' very words back: the kindled anger is the covenant''s own clause against forsaking him, the victims being the idolatrous fathers'' generation that broke faith.'),
    -- THREAD 4: mercy to the one who humbles himself at the Word
    ('canon','2-kings',22,19,'canon','2-chronicles',34,27,'free',
     E'*Because thine heart was tender, and thou didst humble thyself before Elohim (God)... and didst rend thy clothes, and weep before me; I have even heard thee also, saith Yahuah (LORD)* (2 Chronicles 34:27). The Chronicler echoes Huldah word for word (2 Kings 22:19): mercy is not earned by power but answered to the tender, humbled, weeping heart that trembles at the Word.'),
    ('canon','2-kings',22,20,'canon','2-chronicles',34,28,'free',
     E'*Behold, I will gather thee to thy fathers, and thou shalt be gathered to thy grave in peace, neither shall thine eyes see all the evil that I will bring upon this place* (2 Chronicles 34:28). The same promise as *thou shalt be gathered into thy grave in peace* (2 Kings 22:20): the one who humbled himself is spared the evil — judgment deferred for the sake of a tender heart.'),
    ('canon','2-kings',22,19,'canon','deuteronomy',30,2,'free',
     E'*And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul* (Deuteronomy 30:2). Josiah''s tender heart and humbling (2 Kings 22:19) is the very turning-back Moses foretold — the heart returning with all its soul to obey the recovered word.'),
    ('canon','2-kings',22,19,'canon','deuteronomy',30,3,'free',
     E'*That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). The compassion promised to the returning heart answers Josiah''s weeping with mercy — *I also have heard thee* (2 Kings 22:19) — and looks beyond him to the two-house ingathering of all that was scattered, the same compassion to all who humble themselves and return.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ threads ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-22-the-book-of-the-law-found-in-the-house',
       E'The Book of the Torah Found in the House of Yahuah',
       E'For two idolatrous reigns the Torah lay neglected and lost in the very house of Yahuah (LORD). Then, amid the temple repair, *Hilkiah the high priest said unto Shaphan the scribe, I have found the book of the law in the house of Yahuah (LORD). And Hilkiah gave the book to Shaphan, and he read it* (2 Kings 22:8), and *Shaphan read it before the king* (2 Kings 22:10). The Chronicler tells the same: *Hilkiah the priest found a book of the law of Yahuah (LORD) given by Moses* (2 Chronicles 34:14) — the Torah given by Moses, not abolished, only buried by the people who forsook it. The covenant-word was never far off. Moses had promised, *For this commandment which I command thee this day, it is not hidden from thee, neither is it far off* (Deuteronomy 30:11) — *the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it* (Deut 30:14, in v.11''s context). And the same recovered book is read again after the exile: *they spake unto Ezra the scribe to bring the book of the law of Moses, which Yahuah (LORD) had commanded to Yashar''el (Israel)* (Nehemiah 8:1), and *he read therein... and the ears of all the people were attentive unto the book of the law* (Nehemiah 8:3). The found book, read aloud, is the hinge of every return to the covenant.',
       sv.verse_id, ev.verse_id, 'free', 39025
  FROM _s343_2ki22_lookup sv, _s343_2ki22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=22 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-22-the-word-rends-the-tender-heart',
       E'The Word Rends the Tender Heart',
       E'*And it came to pass, when the king had heard the words of the book of the law, that he rent his clothes* (2 Kings 22:11). The recovered Torah is no dead parchment; it is the living word that pierces. *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit... and is a discerner of the thoughts and intents of the heart* (Hebrews 4:12). Josiah does not merely listen — *be ye doers of the word, and not hearers only, deceiving your own selves* (James 1:22) — he is the doer who acts on what he hears, *not a forgetful hearer, but a doer of the work* who *shall be blessed in his deed* (James 1:25), looking into the *perfect law of liberty* and continuing therein, the Torah kept, never set aside. This is the entrance of the Word giving light: *The entrance of thy words giveth light; it giveth understanding unto the simple* (Psalm 119:130) and *Open thou mine eyes, that I may behold wondrous things out of thy law* (Psalm 119:18). The king''s torn clothes are the answered prayer of one whose eyes the Torah has opened.',
       sv.verse_id, ev.verse_id, 'free', 39028
  FROM _s343_2ki22_lookup sv, _s343_2ki22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=22 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-22-great-is-the-wrath-our-fathers-hearkened-not',
       E'Great Is the Wrath — Because Our Fathers Hearkened Not',
       E'*Go ye, enquire of Yahuah (LORD) for me... for great is the wrath of Yahuah (LORD) that is kindled against us, because our fathers have not hearkened unto the words of this book, to do according unto all that which is written concerning us* (2 Kings 22:13). Josiah names the cause precisely: the wrath is for NOT hearkening — the Torah was broken, not binding-as-a-curse. The book he just heard had said so itself: *If thou wilt not observe to do all the words of this law that are written in this book... that all these curses shall come upon thee* (Deuteronomy 28:58, 28:15), *because thou hearkenedst not unto the voice of Yahuah Elohayka (the LORD thy God), to keep his commandments and his statutes* (Deuteronomy 28:45). Huldah''s oracle is Moses'' covenant-lawsuit come due: *Because they have forsaken me, and have burned incense unto other gods... therefore my wrath shall be kindled against this place, and shall not be quenched* (2 Kings 22:17) — exactly *Because they have forsaken the covenant of Yahuah Elohim (the LORD God) of their fathers* (Deuteronomy 29:25), so that *the anger of Yahuah (LORD) was kindled against this land, to bring upon it all the curses that are written in this book* (Deuteronomy 29:27). The curse fell on the forsaking, never on the obedience; the cure is to return to the very words and do them.',
       sv.verse_id, ev.verse_id, 'free', 39031
  FROM _s343_2ki22_lookup sv, _s343_2ki22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=22 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-22-mercy-to-the-one-who-humbles-himself',
       E'Mercy to the One Who Humbles Himself at the Word',
       E'The sentence stands against the place, yet to the king himself comes mercy: *Because thine heart was tender, and thou hast humbled thyself before Yahuah (LORD)... and hast rent thy clothes, and wept before me; I also have heard thee, saith Yahuah (LORD)* (2 Kings 22:19), *Behold therefore, I will gather thee unto thy fathers, and thou shalt be gathered into thy grave in peace; and thine eyes shall not see all the evil* (2 Kings 22:20). The Chronicler repeats the oracle word for word — *Because thine heart was tender, and thou didst humble thyself before Elohim (God)... I have even heard thee also* (2 Chronicles 34:27), *I will gather thee to thy fathers, and thou shalt be gathered to thy grave in peace* (2 Chronicles 34:28). This is Moses'' promise to the returning heart: *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice... with all thine heart, and with all thy soul* (Deuteronomy 30:2), *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). Mercy answers the tender, humbled, weeping heart — and the same compassion reaches beyond Josiah to the two-house ingathering of all that was scattered, all who tremble at the Word and return.',
       sv.verse_id, ev.verse_id, 'free', 39034
  FROM _s343_2ki22_lookup sv, _s343_2ki22_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=22 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ============================ thread_members ============================
-- THREAD 1: the book of the law found in the house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Hilkiah the priest found a book of the law of Yahuah (LORD) given by Moses* (2 Chronicles 34:14) — the parallel naming the recovered book as the Torah of Moses.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=8
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=34 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-the-book-of-the-law-found-in-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I have found the book of the law in the house of Yahuah (LORD)* (2 Chronicles 34:15) — the high priest hands on the recovered Word.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=8
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=34 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-the-book-of-the-law-found-in-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the book of the law of Moses, which Yahuah (LORD) had commanded to Yashar''el (Israel)* (Nehemiah 8:1) — the same book called for again by the returned remnant.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=8
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-the-book-of-the-law-found-in-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the ears of all the people were attentive unto the book of the law* (Nehemiah 8:3) — as Shaphan read before the king, so Ezra reads before the people.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=10
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-the-book-of-the-law-found-in-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*it is not hidden from thee, neither is it far off* (Deuteronomy 30:11) — Moses'' promise that the word is never truly lost, only neglected.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=8
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-the-book-of-the-law-found-in-the-house'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2: the word rends the tender heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword* (Hebrews 4:12) — the living Word that pierces and discerns the heart.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=11
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-the-word-rends-the-tender-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*be ye doers of the word, and not hearers only* (James 1:22) — Josiah acts on what he hears, the doer not the deceived hearer.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=11
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-the-word-rends-the-tender-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*whoso looketh into the perfect law of liberty... a doer of the work, this man shall be blessed in his deed* (James 1:25) — the Torah looked into and kept, never abolished.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=11
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-the-word-rends-the-tender-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*The entrance of thy words giveth light* (Psalm 119:130) — the Word entering Josiah''s ears gave instant light.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=11
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=130
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-the-word-rends-the-tender-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Open thou mine eyes, that I may behold wondrous things out of thy law* (Psalm 119:18) — the king''s torn clothes are the answered prayer of opened eyes.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=11
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-the-word-rends-the-tender-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3: great is the wrath — our fathers hearkened not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*If thou wilt not observe to do all the words of this law that are written in this book* (Deuteronomy 28:58) — the very book Josiah heard naming the consequence of not doing it.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=13
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=58
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-great-is-the-wrath-our-fathers-hearkened-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*if thou wilt not hearken... that all these curses shall come upon thee* (Deuteronomy 28:15) — the curse is for not hearkening, exactly Josiah''s charge against the fathers.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=13
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-great-is-the-wrath-our-fathers-hearkened-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*because thou hearkenedst not... to keep his commandments and his statutes* (Deuteronomy 28:45) — the curse pursues the breaking, and the cure is to return and keep.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=13
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-great-is-the-wrath-our-fathers-hearkened-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Because they have forsaken the covenant of Yahuah Elohim (the LORD God) of their fathers* (Deuteronomy 29:25) — Huldah''s "they have forsaken me" is Moses'' lawsuit fulfilled.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=17
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-great-is-the-wrath-our-fathers-hearkened-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the anger of Yahuah (LORD) was kindled against this land, to bring upon it all the curses that are written in this book* (Deuteronomy 29:27) — the kindled wrath of 2 Kings 22:17 is the covenant''s own clause.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=17
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-great-is-the-wrath-our-fathers-hearkened-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4: mercy to the one who humbles himself
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Because thine heart was tender, and thou didst humble thyself before Elohim (God)... I have even heard thee also* (2 Chronicles 34:27) — the parallel oracle, mercy to the tender heart.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=19
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=34 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-mercy-to-the-one-who-humbles-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*thou shalt be gathered to thy grave in peace, neither shall thine eyes see all the evil* (2 Chronicles 34:28) — judgment deferred for the humbled king.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=20
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=34 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-mercy-to-the-one-who-humbles-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice... with all thine heart* (Deuteronomy 30:2) — Josiah''s tender heart is the turning-back Moses foretold.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=19
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-mercy-to-the-one-who-humbles-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*will have compassion upon thee, and will return and gather thee from all the nations* (Deuteronomy 30:3) — mercy to the returning heart, reaching to the two-house ingathering of all that was scattered.'
  FROM cross_reference_threads t
  JOIN _s343_2ki22_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=22 AND sv.verse_number=19
  JOIN _s343_2ki22_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-22-mercy-to-the-one-who-humbles-himself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_23.sql (2 Kings 23) -----
-- Chapter: 2 Kings 23 — Josiah's great reform (keystone)
-- Tag: 2ki23   View: _s343_2ki23_lookup   Sort band: 39050 step 3 (39050,39053,39056,39059,39062)
-- Source rows ALWAYS 'canon','2-kings',23,v. All targets canon → tier 'free'; all threads tier_required 'free'.
--
-- 2 Kings 23 coverage:
--   v.2-3  (read all the words of the book of the covenant; the king made a covenant before Yahuah, to walk after him and keep his commandments... and ALL the people stood to the covenant)
--          NT:     none warranted (covenant-renewal-at-the-Word is a Tanakh form; the wholehearted love-command FORWARD is woven at v.25 → Deut 6:5)
--          Extras: none warranted
--          Tanakh: Joshua 24:25 (Joshua's covenant at Shechem), Nehemiah 8:1+8:3 (Ezra reads the book of the law, all the people gathered as one man), 2 Chronicles 34:30-31 (the parallel account), Deuteronomy 6:5 (love with all the heart and all the soul) → THREAD 1
--   v.15-18 (the altar at Beth-el broken; bones burned upon it ACCORDING TO THE WORD OF YAHUAH which the man of Elohim proclaimed; Josiah spares that prophet's bones)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 1 Kings 13:2 (the named-Josiah prophecy ~300 yrs old), 1 Kings 13:32 (the saying shall surely come to pass) → THREAD 2
--   v.21-23 (Keep the passover unto Yahuah, AS IT IS WRITTEN in the book of this covenant; surely there was not holden such a passover from the days of the judges)
--          NT:     1 Corinthians 5:7 (Messiah our passover sacrificed for us — the feast filled not abolished), Luke 22:15 (with desire I have desired to eat this passover) → woven FORWARD
--          Extras: none warranted (1 Maccabees feast-restoration is Hanukkah, not Passover)
--          Tanakh: Exodus 12:14 (keep it a feast by an ordinance for ever), Deuteronomy 16:1 (observe the month of Abib, keep the passover), 2 Chronicles 35:1 + 35:18 (the parallel — no passover like it from the days of Samuel) → THREAD 3
--   v.24-25 (like unto him was there no king before him that turned to Yahuah with all his heart... according to all the Torah of Moses)
--          NT:     none warranted (the love-command's NT echo Mark 12:30 left to the gospels' own apparatus)
--          Extras: none warranted
--          Tanakh: Deuteronomy 6:5 (love Yahuah with all thine heart, soul, might) → THREAD 4
--   v.26-27 (NOTWITHSTANDING Yahuah turned not from his great wrath... because of the provocations Manasseh provoked him withal; I will remove Yahudah as I removed Yashar'el)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Kings 21:16 (Manasseh shed innocent blood very much), 2 Kings 24:3 + 24:4 (came upon Yahudah for the sins of Manasseh, the innocent blood Yahuah would not pardon) → THREAD 5
--   v.4-14,19-20,24 (the thoroughness of the reform — vessels of Baal, Topheth, the high places, familiar spirits) carried inside threads 1/2 as the body of the reform; no separate thread warranted.
--   v.28-37 (Josiah's death at Megiddo; Jehoahaz, Jehoiakim) regnal-frame narrative; none warranted.
--
-- THREADS (all targets canon → tier_required 'free'):
--   2-kings-23-the-king-read-all-the-words-of-the-book-of-the-covenant   [Tanakh]  sort 39050
--   2-kings-23-the-altar-at-bethel-broken-the-sure-word-fulfilled        [Tanakh]  sort 39053
--   2-kings-23-keep-the-passover-as-it-is-written                        [Tanakh + NT]  sort 39056
--   2-kings-23-no-king-turned-to-yahuah-with-all-his-heart-like-josiah   [Tanakh]  sort 39059
--   2-kings-23-yet-yahuah-turned-not-from-his-great-wrath                [Tanakh]  sort 39062

CREATE TEMP VIEW _s343_2ki23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================ CROSS_REFERENCES ============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the covenant renewal at the Word (vv.2-3)
    ('canon','2-kings',23,2,'canon','nehemiah',8,1,'free',
      E'*And all the people gathered themselves together as one man into the street that was before the water gate; and they spake unto Ezra the scribe to bring the book of the law of Moses, which Yahuah (LORD) had commanded to Yashar''el (Israel).* (Nehemiah 8:1). When *he read in their ears all the words of the book of the covenant which was found in the house of Yahuah* (2 Kings 23:2), Josiah does what Ezra would do after the exile — the whole people gathered to the Word, the book of the law of Moses at the centre. The reform begins not with the king''s decree but with the reading of the covenant.'),
    ('canon','2-kings',23,2,'canon','nehemiah',8,3,'free',
      E'*And he read therein before the street that was before the water gate from the morning until midday, before the men and the women, and those that could understand; and the ears of all the people were attentive unto the book of the law.* (Nehemiah 8:3). Josiah''s gathering of *all the men of Yahudah (Judah) and all the inhabitants of Jerusalem... both small and great* to hear *all the words of the book of the covenant* (2 Kings 23:2) is the same posture — the ears of the whole people attentive to the Torah, the Word read aloud as the act of restoration.'),
    ('canon','2-kings',23,3,'canon','joshua',24,25,'free',
      E'*So Joshua made a covenant with the people that day, and set them a statute and an ordinance in Shechem.* (Joshua 24:25). When *the king stood by a pillar, and made a covenant before Yahuah (LORD), to walk after Yahuah... And all the people stood to the covenant* (2 Kings 23:3), Josiah stands in Joshua''s place — *choose you this day whom ye will serve... as for me and my house, we will serve Yahuah* (Joshua 24:15). The covenant is never invented anew; it is renewed, the people bound again to the Torah they already received.'),
    ('canon','2-kings',23,3,'canon','2-chronicles',34,31,'free',
      E'*And the king stood in his place, and made a covenant before Yahuah (LORD), to walk after Yahuah (LORD), and to keep his commandments, and his testimonies, and his statutes, with all his heart, and with all his soul, to perform the words of the covenant which are written in this book.* (2 Chronicles 34:31). The Chronicler''s witness is the twin of *the king stood by a pillar, and made a covenant before Yahuah... to keep his commandments and his testimonies and his statutes with all their heart and all their soul* (2 Kings 23:3) — two scrolls preserving one act: the king binds himself and the people to perform the words already written.'),
    ('canon','2-kings',23,3,'canon','deuteronomy',6,5,'free',
      E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5). The covenant Josiah swears — *to keep his commandments and his testimonies and his statutes with all their heart and all their soul* (2 Kings 23:3) — is the Shema spoken back to Yahuah. The book found in the house is Deuteronomy''s own charge; the king answers it in its own words.'),
    -- THREAD 2: the altar at Beth-el broken — the sure word fulfilled (vv.15-18)
    ('canon','2-kings',23,16,'canon','1-kings',13,2,'free',
      E'*And he cried against the altar in the word of Yahuah (LORD), and said, O altar, altar, thus saith Yahuah (LORD); Behold, a child shall be born unto the house of David, Josiah by name; and upon thee shall he offer the priests of the high places that burn incense upon thee, and men''s bones shall be burnt upon thee.* (1 Kings 13:2). Some three hundred years before, the man of Elohim named Josiah to the altar itself. Now *he... took the bones out of the sepulchres, and burned them upon the altar, and polluted it, according to the word of Yahuah (LORD) which the man of Elohim (God) proclaimed* (2 Kings 23:16) — the sure word of Yahuah falling exactly, the king fulfilling a prophecy that bore his name before he was born.'),
    ('canon','2-kings',23,17,'canon','1-kings',13,2,'free',
      E'*Behold, a child shall be born unto the house of David, Josiah by name; and upon thee shall he offer the priests of the high places that burn incense upon thee* (1 Kings 13:2). When the men of the city tell Josiah *It is the sepulchre of the man of Elohim (God), which came from Yahudah (Judah), and proclaimed these things that thou hast done against the altar of Beth-el* (2 Kings 23:17), the king learns whose word he has just performed — the very prophet from Judah who named him at the altar. He spares the prophet''s bones: *Let him alone; let no man move his bones* (23:18).'),
    ('canon','2-kings',23,18,'canon','1-kings',13,32,'free',
      E'*For the saying which he cried by the word of Yahuah (LORD) against the altar in Beth-el, and against all the houses of the high places which are in the cities of Samaria, shall surely come to pass.* (1 Kings 13:32). The old prophet had asked to be buried beside the man of Elohim, certain the word would stand. So Josiah *let his bones alone, with the bones of the prophet that came out of Samaria* (2 Kings 23:18) — the two graves preserved together because *the saying... shall surely come to pass*, and it had.'),
    -- THREAD 3: keep the passover as it is written (vv.21-23)
    ('canon','2-kings',23,21,'canon','exodus',12,14,'free',
      E'*And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever.* (Exodus 12:14). When the king commands *Keep the passover unto Yahuah Elohaychem (the LORD your God), as it is written in the book of this covenant* (2 Kings 23:21), he is restoring the feast Yahuah ordained *for ever* — not founding a new rite. The appointed time had lapsed; Josiah brings it back to the page where it was first commanded.'),
    ('canon','2-kings',23,21,'canon','deuteronomy',16,1,'free',
      E'*Observe the month of Abib, and keep the passover unto Yahuah Elohayka (the LORD thy God): for in the month of Abib Yahuah Elohayka (the LORD thy God) brought thee forth out of Egypt by night.* (Deuteronomy 16:1). *Keep the passover... as it is written in the book of this covenant* (2 Kings 23:21) — and the book of the covenant just found in the house is Deuteronomy, which fixes the passover at the place Yahuah chooses to place his name. Josiah keeps it in Jerusalem precisely *as it is written*.'),
    ('canon','2-kings',23,22,'canon','2-chronicles',35,1,'free',
      E'*Moreover Josiah kept a passover unto Yahuah (LORD) in Jerusalem: and they killed the passover on the fourteenth day of the first month.* (2 Chronicles 35:1). The Chronicler tells the same passover the book of Kings calls unmatched — *Surely there was not holden such a passover from the days of the judges* (2 Kings 23:22). The lamb killed on the fourteenth day of the first month, exactly the day Exodus 12 sets; the feast kept by the book, in its season.'),
    ('canon','2-kings',23,22,'canon','2-chronicles',35,18,'free',
      E'*And there was no passover like to that kept in Yashar''el (Israel) from the days of Samuel the prophet; neither did all the kings of Yashar''el (Israel) keep such a passover as Josiah kept, and the priests, and the Levites, and all Yahudah (Judah) and Yashar''el (Israel) that were present* (2 Chronicles 35:18). The twin of *there was not holden such a passover from the days of the judges... nor of the kings of Yahudah* (2 Kings 23:22). Note both houses are named present — *all Yahudah and Yashar''el* — a foretaste of the gathered people keeping the feast as one.'),
    ('canon','2-kings',23,21,'canon','1-corinthians',5,7,'free',
      E'*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The feast Josiah restores — *Keep the passover unto Yahuah Elohaychem... as it is written* (2 Kings 23:21) — is the very feast the Messiah fills, not abolishes. Sha''ul still reasons *let us keep the feast* (5:8); the passover lamb of Exodus 12, restored by Josiah, finds its fulfillment in the Lamb, the appointed time still kept.'),
    ('canon','2-kings',23,23,'canon','luke',22,15,'free',
      E'*And he said unto them, With desire I have desired to eat this passover with you before I suffer:* (Luke 22:15). *This passover was holden to Yahuah (LORD) in Jerusalem* in Josiah''s eighteenth year (2 Kings 23:23); the same Jerusalem, the same appointed feast, is where the Formed Son keeps it before he suffers. The passover never lapses from the calendar of Yahuah — Josiah restores it, and the Messiah eats it as it is written.'),
    -- THREAD 4: no king turned with all his heart like Josiah (vv.24-25)
    ('canon','2-kings',23,25,'canon','deuteronomy',6,5,'free',
      E'*And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* (Deuteronomy 6:5). The verdict on Josiah is Deuteronomy''s commandment kept in full: *like unto him was there no king... that turned to Yahuah (LORD) with all his heart, and with all his soul, and with all his might, according to all the law of Moses* (2 Kings 23:25). Heart, soul, might — the three measures of the Shema — and *according to all the Torah of Moses*: the wholehearted return the covenant always called for.'),
    -- THREAD 5: yet Yahuah turned not from his great wrath (vv.26-27)
    ('canon','2-kings',23,26,'canon','2-kings',21,16,'free',
      E'*Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* (2 Kings 21:16). Even the greatest reform cannot unspill this: *Notwithstanding Yahuah (LORD) turned not from the fierceness of his great wrath... because of all the provocations that Manasseh had provoked him withal* (2 Kings 23:26). The sentence Manasseh sealed stands; Josiah''s wholehearted return delays the judgment but does not reverse it.'),
    ('canon','2-kings',23,26,'canon','2-kings',24,3,'free',
      E'*Surely at the commandment of Yahuah (LORD) came this upon Yahudah (Judah), to remove them out of his sight, for the sins of Manasseh, according to all that he did;* (2 Kings 24:3). The word spoken in Josiah''s day — *I will remove Yahudah (Judah) also out of my sight, as I have removed Yashar''el (Israel)* (2 Kings 23:27) — comes to pass in his sons'' day, *for the sins of Manasseh*. The two houses share one judgment: as the north was removed, so now the south.'),
    ('canon','2-kings',23,27,'canon','2-kings',24,4,'free',
      E'*And also for the innocent blood that he shed: for he filled Jerusalem with innocent blood; which Yahuah (LORD) would not pardon.* (2 Kings 24:4). *I will... cast off this city Jerusalem which I have chosen, and the house of which I said, My name shall be there* (2 Kings 23:27) — and the reason the exile finally falls is the *innocent blood... which Yahuah would not pardon*. The covenant''s curse is the judgment for blood and idolatry, never the Torah itself; the Torah is the very thing Josiah kept.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-23-the-king-read-all-the-words-of-the-book-of-the-covenant',
  E'The King Read All the Words of the Book of the Covenant',
  E'The reform begins not with a decree but with a reading. *He read in their ears all the words of the book of the covenant which was found in the house of Yahuah (LORD)* (2 Kings 23:2), and then *the king stood by a pillar, and made a covenant before Yahuah (LORD), to walk after Yahuah (LORD), and to keep his commandments and his testimonies and his statutes with all their heart and all their soul, to perform the words of this covenant... And all the people stood to the covenant* (23:3). This is the covenant-renewal form of the whole Tanakh. It is Joshua at Shechem: *So Joshua made a covenant with the people that day, and set them a statute and an ordinance* (Joshua 24:25), having charged them *choose you this day whom ye will serve* (24:15). It is Ezra after the exile: *all the people gathered themselves together as one man... to bring the book of the law of Moses* (Nehemiah 8:1), and *the ears of all the people were attentive unto the book of the law* (8:3). The Chronicler preserves the twin of Josiah''s own oath — *to keep his commandments, and his testimonies, and his statutes, with all his heart, and with all his soul, to perform the words of the covenant which are written in this book* (2 Chronicles 34:31). And the words the king swears are the Shema''s own: *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5). The covenant is never invented; it is renewed — the people bound again to the Torah already given, the book read, the whole congregation standing to it.',
  sv.verse_id, ev.verse_id, 'free', 39050
  FROM _s343_2ki23_lookup sv, _s343_2ki23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=23 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-23-the-altar-at-bethel-broken-the-sure-word-fulfilled',
  E'The Altar at Beth-el Broken — the Sure Word Fulfilled',
  E'Some three hundred years before Josiah was born, a man of Elohim from Judah stood before Jeroboam''s altar at Beth-el and named him: *Behold, a child shall be born unto the house of David, Josiah by name; and upon thee shall he offer the priests of the high places that burn incense upon thee, and men''s bones shall be burnt upon thee* (1 Kings 13:2). The word waited. Now Josiah comes to that very altar, *and as Josiah turned himself, he spied the sepulchres that were there in the mount, and sent, and took the bones out of the sepulchres, and burned them upon the altar, and polluted it, according to the word of Yahuah (LORD) which the man of Elohim (God) proclaimed* (2 Kings 23:16). The king learns whose prophecy he has just performed — *It is the sepulchre of the man of Elohim (God), which came from Yahudah (Judah), and proclaimed these things that thou hast done against the altar of Beth-el* (23:17) — and spares the prophet''s bones (23:18). The old prophet of Beth-el had been certain: *the saying which he cried by the word of Yahuah (LORD)... shall surely come to pass* (1 Kings 13:32), and asked to be buried beside him. So the two graves are preserved together, *with the bones of the prophet that came out of Samaria* (2 Kings 23:18). This is the sure word of Yahuah — named, dated, and exact across three centuries.',
  sv.verse_id, ev.verse_id, 'free', 39053
  FROM _s343_2ki23_lookup sv, _s343_2ki23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=23 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-23-keep-the-passover-as-it-is-written',
  E'Keep the Passover As It Is Written',
  E'*And the king commanded all the people, saying, Keep the passover unto Yahuah Elohaychem (the LORD your God), as it is written in the book of this covenant* (2 Kings 23:21). The appointed time had lapsed; Josiah does not found a new rite but restores the one Yahuah ordained *for ever*: *ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever* (Exodus 12:14). The book just found in the house is Deuteronomy, which fixes the feast — *Observe the month of Abib, and keep the passover unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 16:1) — at the place Yahuah chooses to place his name, and so Josiah keeps it in Jerusalem, *as it is written*. The Chronicler tells the same passover: *they killed the passover on the fourteenth day of the first month* (2 Chronicles 35:1), the exact day Exodus 12 sets; and *there was no passover like to that kept in Yashar''el (Israel) from the days of Samuel the prophet... and all Yahudah (Judah) and Yashar''el (Israel) that were present* (35:18) — both houses named at one table. The book of Kings agrees: *Surely there was not holden such a passover from the days of the judges that judged Yashar''el (Israel), nor in all the days of the kings of Yashar''el (Israel), nor of the kings of Yahudah (Judah)* (2 Kings 23:22). And the feast is not abolished forward but filled: *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7), so *let us keep the feast* (5:8); the Formed Son himself keeps it in that same Jerusalem — *With desire I have desired to eat this passover with you before I suffer* (Luke 22:15). The appointed time stands, restored by the king, kept by the Messiah, as it is written.',
  sv.verse_id, ev.verse_id, 'free', 39056
  FROM _s343_2ki23_lookup sv, _s343_2ki23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=23 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-23-no-king-turned-to-yahuah-with-all-his-heart-like-josiah',
  E'No King Turned to Yahuah with All His Heart Like Josiah',
  E'After the abominations were put away *that he might perform the words of the law which were written in the book that Hilkiah the priest found in the house of Yahuah (LORD)* (2 Kings 23:24), the verdict falls: *And like unto him was there no king before him, that turned to Yahuah (LORD) with all his heart, and with all his soul, and with all his might, according to all the law of Moses; neither after him arose there any like him* (23:25). The measure is Deuteronomy''s own — *thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5). Heart, soul, might: the three measures of the Shema, kept *according to all the Torah of Moses*. This is no abolition of the law and no merit of the flesh; it is the wholehearted return the covenant always called for, the king turning to Yahuah with everything he is — the very obedience the new covenant promises to write upon the heart.',
  sv.verse_id, ev.verse_id, 'free', 39059
  FROM _s343_2ki23_lookup sv, _s343_2ki23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=23 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-23-yet-yahuah-turned-not-from-his-great-wrath',
  E'Yet Yahuah Turned Not from His Great Wrath',
  E'Even the greatest reform in the history of the kings cannot reverse what was already sealed. *Notwithstanding Yahuah (LORD) turned not from the fierceness of his great wrath, wherewith his anger was kindled against Yahudah (Judah), because of all the provocations that Manasseh had provoked him withal* (2 Kings 23:26). The provocation was blood: *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another* (2 Kings 21:16). So the sentence stands — *I will remove Yahudah (Judah) also out of my sight, as I have removed Yashar''el (Israel), and will cast off this city Jerusalem which I have chosen* (23:27) — and it falls in Josiah''s sons'' day: *Surely at the commandment of Yahuah (LORD) came this upon Yahudah (Judah), to remove them out of his sight, for the sins of Manasseh, according to all that he did; and also for the innocent blood that he shed: for he filled Jerusalem with innocent blood; which Yahuah (LORD) would not pardon* (2 Kings 24:3-4). The two houses share one judgment — as the north was removed, so now the south. Josiah''s wholehearted return delays the exile but does not avert it; the reform comes true and good, yet too late to turn the sentence Manasseh''s blood had set. And the curse that falls is the covenant''s judgment for blood and idolatry — never the Torah itself, which is the very thing Josiah kept.',
  sv.verse_id, ev.verse_id, 'free', 39062
  FROM _s343_2ki23_lookup sv, _s343_2ki23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=23 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ============================ THREAD_MEMBERS ============================
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Nehemiah 8:1 — *all the people gathered themselves together as one man... to bring the book of the law of Moses*: the post-exilic twin of the whole people gathered to the Word.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=2
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-the-king-read-all-the-words-of-the-book-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Nehemiah 8:3 — *the ears of all the people were attentive unto the book of the law*: the same posture as Josiah''s gathering, small and great, to hear the covenant read.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=2
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-the-king-read-all-the-words-of-the-book-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Joshua 24:25 — *So Joshua made a covenant with the people that day*: Josiah stands in Joshua''s place, the covenant renewed not invented.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=3
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-the-king-read-all-the-words-of-the-book-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Chronicles 34:31 — the Chronicler''s twin of the king''s oath: *to keep his commandments... with all his heart, and with all his soul, to perform the words of the covenant which are written in this book*.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=3
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=34 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-the-king-read-all-the-words-of-the-book-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Deuteronomy 6:5 — *love Yahuah... with all thine heart, and with all thy soul, and with all thy might*: the Shema spoken back, the book found in the house answered in its own words.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=3
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-the-king-read-all-the-words-of-the-book-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'1 Kings 13:2 — *a child shall be born unto the house of David, Josiah by name*: the named prophecy, ~300 years before, against this very altar.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=16
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=13 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-the-altar-at-bethel-broken-the-sure-word-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Kings 13:2 — Josiah learns whose word he has performed: the man of Elohim from Judah who named him; he spares the prophet''s bones.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=17
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=13 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-the-altar-at-bethel-broken-the-sure-word-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Kings 13:32 — *the saying... shall surely come to pass*: the old prophet''s certainty, why the two graves are preserved together.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=18
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=13 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-the-altar-at-bethel-broken-the-sure-word-fulfilled'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 12:14 — *ye shall keep it a feast by an ordinance for ever*: the passover Josiah restores was ordained for ever, not founded anew.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=21
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-keep-the-passover-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Deuteronomy 16:1 — *keep the passover unto Yahuah Elohayka*: the book of the covenant just found fixes the feast at the place Yahuah names; Josiah keeps it there.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=21
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-keep-the-passover-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Corinthians 5:7 — *Messiah our passover is sacrificed for us*: the feast filled forward, not abolished — *let us keep the feast*.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=21
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-keep-the-passover-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Chronicles 35:1 — the Chronicler''s twin: *they killed the passover on the fourteenth day of the first month*, the exact day Exodus 12 sets.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=22
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=35 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-keep-the-passover-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Chronicles 35:18 — *no passover like to that... from the days of Samuel*, with *all Yahudah and Yashar''el that were present*: both houses at one table.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=22
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=35 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-keep-the-passover-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Luke 22:15 — *With desire I have desired to eat this passover with you before I suffer*: the Formed Son keeps the same feast in the same Jerusalem.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=23
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-keep-the-passover-as-it-is-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Deuteronomy 6:5 — *with all thine heart, and with all thy soul, and with all thy might*: the three measures of the Shema, the verdict on Josiah kept *according to all the Torah of Moses*.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=25
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-no-king-turned-to-yahuah-with-all-his-heart-like-josiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 21:16 — *Manasseh shed innocent blood very much, till he had filled Jerusalem*: the provocation even the greatest reform cannot unspill.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=26
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=21 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-yet-yahuah-turned-not-from-his-great-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 24:3 — *came this upon Yahudah... for the sins of Manasseh*: the word of 23:27 comes to pass in Josiah''s sons'' day; the two houses share one judgment.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=26
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=24 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-yet-yahuah-turned-not-from-his-great-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 24:4 — *the innocent blood... which Yahuah would not pardon*: the reason the exile finally falls; the curse is for blood and idolatry, never the Torah Josiah kept.'
  FROM cross_reference_threads t
  JOIN _s343_2ki23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=23 AND sv.verse_number=27
  JOIN _s343_2ki23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=24 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-23-yet-yahuah-turned-not-from-his-great-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_24.sql (2 Kings 24) -----
-- 2 Kings 24 — Nebuchadnezzar king of Babylon comes up; Jehoiakim servant then rebel;
--   bands of Chaldees/Syrians/Moabites/Ammon sent against Yahudah for the SINS OF
--   MANASSEH and the INNOCENT BLOOD Yahuah would not pardon; Jehoiachin (Jeconiah/Coniah)
--   three months then the FIRST GREAT DEPORTATION to Babylon — king, princes, mighty men,
--   craftsmen and smiths, ten thousand captives, and the TREASURES of the house of Yahuah
--   cut up; Zedekiah made puppet-king, who also rebels.
-- Tag: 2ki24   View: _s343_2ki24_lookup   Sort band: 39075 step 3 (39075,39078,39081)
--
-- 2 Kings 24 coverage:
--   v.1    (Nebuchadnezzar comes up; Jehoiakim servant three years then rebels)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Chronicles 36:6 (Nebuchadnezzar bound him to carry to Babylon) ; Daniel 1:1 (third year of Jehoiakim, Nebuchadnezzar besieged) — THREAD 2 (Daniel)
--   v.2-4  (bands sent against Yahudah; SURELY at the commandment of Yahuah, for the SINS
--           OF MANASSEH and the INNOCENT BLOOD which Yahuah would NOT pardon; remove them out of his sight)
--          NT:     none warranted (innocent-blood/bloodguilt is a Tanakh covenant-lawsuit theme here)
--          Extras: none warranted
--          Tanakh: 2 Kings 21:16 (Manasseh shed innocent blood, filled Jerusalem) ; Jeremiah 15:4 (removed because of Manasseh) ;
--                  2 Kings 17:18,23 (NORTH removed out of sight — two-house pattern) ; 2 Chronicles 36:16 (no remedy) ;
--                  Deuteronomy 28:36,64 (the covenant exile-sanction) — THREAD 1
--   v.5-6  (rest of acts of Jehoiakim; slept with fathers; Jehoiachin reigns) — folded: 6 into THREAD 3 (succession)
--   v.7    (king of Egypt came no more; Babylon took from river of Egypt to Euphrates) — Tanakh: Jeremiah 46:2 — none warranted (adequately covered by chapter frame)
--   v.8-9  (Jehoiachin 18yr, reigned 3 months; did evil) — THREAD 3 (Coniah)
--   v.10-12 (Nebuchadnezzar's servants besiege; Jehoiachin goes out; king of Babylon takes him 8th year)
--          NT:     Matthew 1:11 (Josias begat Jechonias... carried away to Babylon) — THREAD 3
--          Extras: none warranted
--          Tanakh: Daniel 1:1-2 (besieged, vessels carried) ; Jeremiah 22:24-25 (Coniah plucked, given to Nebuchadrezzar) — THREAD 2 + THREAD 3
--   v.13   (carried out ALL the TREASURES of the house of Yahuah; cut in pieces the vessels of gold Solomon made, AS Yahuah had said)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Kings 20:17 (all carried into Babylon, nothing left — Isaiah's word to Hezekiah) ;
--                  Daniel 1:2 (vessels into the treasure house of his god) ; 2 Chronicles 36:18 — THREAD 2
--   v.14-16 (carried away all Jerusalem, princes, mighty men, ten thousand, craftsmen and smiths;
--            Jehoiachin + king's mother/wives/officers to Babylon — the FIRST deportation, Daniel/Ezekiel among them)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Kings 20:18 (thy sons shall be eunuchs in the palace of Babylon) ; Daniel 1:3-6 (king's seed, children of Yahudah) ;
--                  Jeremiah 25:11 (these nations shall serve the king of Babylon seventy years) — THREAD 2
--   v.17-20 (Mattaniah made king, named Zedekiah; did evil; rebels — the last puppet of the house of David)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: 2 Chronicles 36:13 (Zedekiah rebelled, stiffened his neck) ; Jeremiah 52:3 (through anger of Yahuah, Zedekiah rebelled) — THREAD 1 (member v.20, the anger / cast out of his presence)
--
-- Threads:
--   2-kings-24-the-sins-of-manasseh-the-innocent-blood-yahuah-would-not-pardon  [canon: 2 Kings, Jeremiah, 2 Chronicles, Deuteronomy] tier free
--   2-kings-24-the-first-deportation-to-babylon-the-treasures-of-the-house-of-yahuah  [canon: 2 Kings, Daniel, Jeremiah, 2 Chronicles] tier free
--   2-kings-24-jehoiachin-coniah-carried-captive-yet-the-davidic-seed-preserved  [canon: Jeremiah, Matthew] tier free
--
-- Contested/load-bearing framing:
--   * v.3-4 the sealed sentence "for the sins of Manasseh... the innocent blood which Yahuah
--     would NOT pardon" is the 21:16 bloodguilt / Jer 15:4 verdict NOW falling — the SOUTH
--     removed out of his sight as the NORTH was (17:18,23), the two-house exile pattern; the
--     Deut 28 curse is the exile-SANCTION for covenant-breaking, never the Torah itself.
--   * v.13 the treasures cut up "AS Yahuah had said" = Isaiah's word to Hezekiah (20:17) fulfilled.
--   * THREAD 3: Jer 22:30 "Write this man childless" reads against Matt 1:11-12 — Coniah's
--     SEED is barred from the throne by FLESH-succession, yet the royal LINE is preserved
--     THROUGH him (Salathiel) toward Messiah: judgment on the man, the seed-promise kept by Yahuah.

CREATE TEMP VIEW _s343_2ki24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 — the sins of Manasseh / the innocent blood Yahuah would not pardon
    ('canon','2-kings',24,3,'canon','2-kings',21,16,'free',E'*Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* (2 Kings 21:16). This is the very crime now bringing the judgment: where 24:3-4 says the bands came *for the sins of Manasseh... And also for the innocent blood that he shed: for he filled Jerusalem with innocent blood; which Yahuah (LORD) would not pardon*, the sealed sentence pronounced in chapter 21 has come to the door.'),
    ('canon','2-kings',24,3,'canon','jeremiah',15,4,'free',E'*And I will cause them to be removed into all kingdoms of the earth, because of Manasseh the son of Hezekiah king of Yahudah (Judah), for that which he did in Jerusalem.* (Jeremiah 15:4). Jeremiah names the same verdict Kings records — *to remove them out of his sight, for the sins of Manasseh* (2 Kings 24:3) — the bloodguilt of one king ripening into the scattering of the whole southern house *into all kingdoms of the earth.*'),
    ('canon','2-kings',24,3,'canon','2-kings',17,18,'free',E'*Therefore Yahuah (LORD) was very angry with Yashar''el (Israel), and removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only.* (2 Kings 17:18). The northern stick of Yashar''el (Israel) was already *removed out of his sight* through Assyria; now the same words fall on the southern stick of Yahudah (Judah) — *to remove them out of his sight* (2 Kings 24:3) — the two houses under one covenant-judgment, both to be gathered again.'),
    ('canon','2-kings',24,3,'canon','2-kings',17,23,'free',E'*Until Yahuah (LORD) removed Yashar''el (Israel) out of his sight, as he had said by all his servants the prophets. So was Yashar''el (Israel) carried away out of their own land to Assyria unto this day.* (2 Kings 17:23). The north was carried away *as he had said by all his servants the prophets*; the south falls *according to the word of Yahuah (LORD), which he spake by his servants the prophets* (2 Kings 24:2) — the identical formula binds Ephraim''s exile and Yahudah''s into the one two-house pattern of removal and promised regathering.'),
    ('canon','2-kings',24,4,'canon','2-chronicles',36,16,'free',E'*But they mocked the messengers of Elohim (God), and despised his words, and misused his prophets, until the wrath of Yahuah (LORD) arose against his people, till there was no remedy.* (2 Chronicles 36:16). The Chronicler tells why the blood *which Yahuah (LORD) would not pardon* (2 Kings 24:4) could no longer be stayed — long mercy spurned *till there was no remedy*: not Yahuah''s unwillingness to forgive the penitent, but a people who would not turn.'),
    ('canon','2-kings',24,2,'canon','deuteronomy',28,36,'free',E'*Yahuah (LORD) shall bring thee, and thy king which thou shalt set over thee, unto a nation which neither thou nor thy fathers have known; and there shalt thou serve other gods, wood and stone.* (Deuteronomy 28:36). The bands sent against Yahudah *according to the word of Yahuah (LORD)* (2 Kings 24:2) are the covenant exile-sanction Moses set down centuries before — the king and the people carried to *a nation which neither thou nor thy fathers have known*. The curse is the penalty for breaking covenant, never the Torah itself.'),
    ('canon','2-kings',24,20,'canon','deuteronomy',28,64,'free',E'*And Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other; and there thou shalt serve other gods, which neither thou nor thy fathers have known, even wood and stone.* (Deuteronomy 28:64). When 24:20 says *through the anger of Yahuah (LORD) it came to pass... until he had cast them out from his presence*, it is this scattering-sanction of Deuteronomy 28 falling — the threatened scattering *among all people* now executed on the house cast out from his presence.'),
    -- THREAD 2 — the first deportation to Babylon / the treasures of the house of Yahuah
    ('canon','2-kings',24,1,'canon','daniel',1,1,'free',E'*In the third year of the reign of Jehoiakim king of Yahudah (Judah) came Nebuchadnezzar king of Babylon unto Jerusalem, and besieged it.* (Daniel 1:1). Daniel opens his book at the very hour 2 Kings 24:1 records — *In his days Nebuchadnezzar king of Babylon came up* — and Daniel himself is one of the captives this chapter carries away, the witness from inside the exile.'),
    ('canon','2-kings',24,13,'canon','daniel',1,2,'free',E'*And Yahuah (Lord) gave Jehoiakim king of Yahudah (Judah) into his hand, with part of the vessels of the house of Elohim (God): which he carried into the land of Shinar to the house of his god; and he brought the vessels into the treasure house of his god.* (Daniel 1:2). Daniel records the same plunder Kings names — *he carried out thence all the treasures of the house of Yahuah (LORD)... as Yahuah (LORD) had said* (2 Kings 24:13) — the holy vessels set in a Babylonian idol-house, the very cups that would one day be profaned at Belshazzar''s feast.'),
    ('canon','2-kings',24,13,'canon','2-kings',20,17,'free',E'*Behold, the days come, that all that is in thine house, and that which thy fathers have laid up in store unto this day, shall be carried into Babylon: nothing shall be left, saith Yahuah (LORD).* (2 Kings 20:17). The word given to Hezekiah is now fulfilled to the letter: *he carried out thence all the treasures of the house of Yahuah (LORD)... as Yahuah (LORD) had said* (2 Kings 24:13) — the prophecy spoken generations earlier comes home, *nothing shall be left.*'),
    ('canon','2-kings',24,15,'canon','2-kings',20,18,'free',E'*And of thy sons that shall issue from thee, which thou shalt beget, shall they take away; and they shall be eunuchs in the palace of the king of Babylon.* (2 Kings 20:18). Isaiah''s further word to Hezekiah is fulfilled in this deportation — *he carried away Jehoiachin to Babylon, and the king''s mother, and the king''s wives, and his officers* (2 Kings 24:15) — the royal sons taken to serve *in the palace of the king of Babylon*, as Daniel and his companions were.'),
    ('canon','2-kings',24,14,'canon','daniel',1,3,'free',E'*And the king spake unto Ashpenaz the master of his eunuchs, that he should bring certain of the children of Yashar''el (Israel), and of the king''s seed, and of the princes;* (Daniel 1:3). The *all the princes, and all the mighty men of valour... craftsmen and smiths* of 2 Kings 24:14 are the company from which Babylon drew *the king''s seed, and... the princes* — Daniel, Hananiah, Mishael and Azariah among the very captives this chapter carries off.'),
    ('canon','2-kings',24,16,'canon','jeremiah',25,11,'free',E'*And this whole land shall be a desolation, and an astonishment; and these nations shall serve the king of Babylon seventy years.* (Jeremiah 25:11). The captives Babylon brought *captive to Babylon* (2 Kings 24:16) entered the seventy-year servitude Jeremiah had measured out — a fixed term of judgment, not an endless casting-off, for at its end the land would keep her sabbaths and the remnant return.'),
    -- THREAD 3 — Jehoiachin / Coniah carried captive, yet the Davidic seed preserved
    ('canon','2-kings',24,12,'canon','jeremiah',22,24,'free',E'*As I live, saith Yahuah (LORD), though Coniah the son of Jehoiakim king of Yahudah (Judah) were the signet upon my right hand, yet would I pluck thee thence;* (Jeremiah 22:24). The king who *went out to the king of Babylon... and the king of Babylon took him* (2 Kings 24:12) is the Coniah Jeremiah saw plucked off like a signet ring — the crown of the house of David torn from the hand and carried into captivity.'),
    ('canon','2-kings',24,15,'canon','jeremiah',22,30,'free',E'*Thus saith Yahuah (LORD), Write ye this man childless, a man that shall not prosper in his days: for no man of his seed shall prosper, sitting upon the throne of David, and ruling any more in Yahudah (Judah).* (Jeremiah 22:30). The Jehoiachin *carried into captivity from Jerusalem to Babylon* (2 Kings 24:15) is the man written *childless* as to the throne: no son of his flesh would reign in Yahudah (Judah) — judgment sealed on the line as a ruling dynasty, yet the seed itself preserved through the captivity.'),
    ('canon','2-kings',24,12,'canon','matthew',1,11,'free',E'*And Josias begat Jechonias and his brethren, about the time they were carried away to Babylon:* (Matthew 1:11). The genealogy of Messiah marks this very deportation — *the king of Babylon took him in the eighth year of his reign* (2 Kings 24:12) — Jechonias (Jehoiachin/Coniah) standing at the hinge of the generations, *about the time they were carried away to Babylon*, the royal line passing through the judgment.'),
    ('canon','2-kings',24,15,'canon','matthew',1,12,'free',E'*And after they were brought to Babylon, Jechonias begat Salathiel; and Salathiel begat Zorobabel;* (Matthew 1:12). Though Coniah was written childless as to the throne, the line did not perish — *Jechonias begat Salathiel* in the very exile to which 2 Kings 24:15 *carried away Jehoiachin to Babylon*. The seed of David, plucked off and carried captive, is kept by Yahuah straight through the judgment toward Messiah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-24-the-sins-of-manasseh-the-innocent-blood-yahuah-would-not-pardon',
       E'The sins of Manasseh — the innocent blood Yahuah would not pardon',
       E'2 Kings 24 names plainly WHY Babylon came up against Yahudah (Judah): *Surely at the commandment of Yahuah (LORD) came this upon Yahudah (Judah), to remove them out of his sight, for the sins of Manasseh, according to all that he did; And also for the innocent blood that he shed: for he filled Jerusalem with innocent blood; which Yahuah (LORD) would not pardon* (2 Kings 24:3-4). The crime was sealed two chapters earlier — *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another* (2 Kings 21:16) — and Jeremiah pronounces the same verdict: *I will cause them to be removed into all kingdoms of the earth, because of Manasseh the son of Hezekiah king of Yahudah (Judah), for that which he did in Jerusalem* (Jeremiah 15:4). This is no arbitrary wrath. The blood cried, mercy was spurned *till there was no remedy* (2 Chronicles 36:16), and the long-threatened covenant-sanction fell. Hear the two-house pattern in the very wording: the northern stick of Yashar''el (Israel) had already been *removed out of his sight* through Assyria — *there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18), carried away *as he had said by all his servants the prophets* (2 Kings 17:23) — and now the southern stick is removed by the same formula, *according to the word of Yahuah (LORD), which he spake by his servants the prophets* (2 Kings 24:2). Both houses fall under one covenant-judgment, both to be gathered again. And this scattering is the exile-sanction Moses set down long before: *Yahuah (LORD) shall bring thee, and thy king which thou shalt set over thee, unto a nation which neither thou nor thy fathers have known* (Deuteronomy 28:36); *Yahuah (LORD) shall scatter thee among all people, from the one end of the earth even unto the other* (Deuteronomy 28:64) — fulfilled when *through the anger of Yahuah (LORD) it came to pass... until he had cast them out from his presence* (2 Kings 24:20). The curse is the penalty for breaking covenant; it is never the Torah itself, which remains the inheritance the scattered will one day keep again.',
       sv.verse_id, ev.verse_id, 'free', 39075
  FROM _s343_2ki24_lookup sv, _s343_2ki24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=24 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-24-the-first-deportation-to-babylon-the-treasures-of-the-house-of-yahuah',
       E'The first deportation to Babylon — the treasures of the house of Yahuah carried away',
       E'Here begins the great exile. *In his days Nebuchadnezzar king of Babylon came up* (2 Kings 24:1) — the same hour at which Daniel opens his book: *In the third year of the reign of Jehoiakim king of Yahudah (Judah) came Nebuchadnezzar king of Babylon unto Jerusalem, and besieged it* (Daniel 1:1). When the city fell, *he carried out thence all the treasures of the house of Yahuah (LORD), and the treasures of the king''s house, and cut in pieces all the vessels of gold which Solomon king of Yashar''el (Israel) had made in the temple of Yahuah (LORD), as Yahuah (LORD) had said* (2 Kings 24:13). That last phrase — *as Yahuah (LORD) had said* — points back to the word given to Hezekiah a century before: *all that is in thine house... shall be carried into Babylon: nothing shall be left* (2 Kings 20:17); *and of thy sons that shall issue from thee... they shall be eunuchs in the palace of the king of Babylon* (2 Kings 20:18). Both halves of that prophecy now come true. Daniel saw the vessels go: *which he carried into the land of Shinar to the house of his god; and he brought the vessels into the treasure house of his god* (Daniel 1:2) — the holy cups set among idols. And the captives went with them: *he carried away all Jerusalem, and all the princes, and all the mighty men of valour, even ten thousand captives, and all the craftsmen and smiths* (2 Kings 24:14), the very company from which Babylon drew *certain of the children of Yashar''el (Israel), and of the king''s seed, and of the princes* (Daniel 1:3) — Daniel and his three companions among them, Ezekiel soon to follow. This was no endless casting-off but a measured term: *these nations shall serve the king of Babylon seventy years* (Jeremiah 25:11). At the end of it the land would keep her sabbaths and a remnant return. The judgment is severe, the word of Yahuah exact, the mercy already counted in years.',
       sv.verse_id, ev.verse_id, 'free', 39078
  FROM _s343_2ki24_lookup sv, _s343_2ki24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=24 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-24-jehoiachin-coniah-carried-captive-yet-the-davidic-seed-preserved',
       E'Jehoiachin (Coniah) carried captive — yet the Davidic seed preserved toward Messiah',
       E'The crown of the house of David is torn off and carried into Babylon. *Jehoiachin the king of Yahudah (Judah) went out to the king of Babylon, he, and his mother, and his servants, and his princes, and his officers: and the king of Babylon took him in the eighth year of his reign* (2 Kings 24:12); *and he carried away Jehoiachin to Babylon... those carried he into captivity from Jerusalem to Babylon* (2 Kings 24:15). This is the Coniah Jeremiah saw plucked off like a ring from the hand: *though Coniah the son of Jehoiakim king of Yahudah (Judah) were the signet upon my right hand, yet would I pluck thee thence* (Jeremiah 22:24), and over him the hard word was written: *Write ye this man childless, a man that shall not prosper in his days: for no man of his seed shall prosper, sitting upon the throne of David, and ruling any more in Yahudah (Judah)* (Jeremiah 22:30). Judgment fell on the man and on his line as a reigning dynasty — no son of his flesh would sit and rule in Yahudah. And yet the seed itself was not destroyed. The genealogy of Messiah marks this very deportation as a hinge of the generations: *And Josias begat Jechonias and his brethren, about the time they were carried away to Babylon* (Matthew 1:11), and then, in the exile itself, *after they were brought to Babylon, Jechonias begat Salathiel; and Salathiel begat Zorobabel* (Matthew 1:12). The man written childless as to the throne still fathered the line that ran to the Formed Son — the seed of David, plucked off and carried captive, kept by Yahuah straight through the judgment. The dynasty was cut down; the promise was not. The One who would sit on David''s throne for ever came not by the prospering of Coniah''s flesh but by the faithfulness of Yahuah to his word.',
       sv.verse_id, ev.verse_id, 'free', 39081
  FROM _s343_2ki24_lookup sv, _s343_2ki24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=24 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'2 Kings 21:16 — *Manasseh shed innocent blood very much, till he had filled Jerusalem* — the crime now bringing the judgment.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=3
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=21 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-the-sins-of-manasseh-the-innocent-blood-yahuah-would-not-pardon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Jeremiah 15:4 — *removed... because of Manasseh* — the same verdict, the southern house scattered into all kingdoms.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=3
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-the-sins-of-manasseh-the-innocent-blood-yahuah-would-not-pardon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Kings 17:18 — the NORTH *removed out of his sight* — the same words now fall on the south (two-house pattern).'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=3
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-the-sins-of-manasseh-the-innocent-blood-yahuah-would-not-pardon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 17:23 — *as he had said by all his servants the prophets* — same formula as 24:2 binds both houses'' exile.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=3
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-the-sins-of-manasseh-the-innocent-blood-yahuah-would-not-pardon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'2 Chronicles 36:16 — mercy spurned *till there was no remedy* — why the blood could no longer be pardoned.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=4
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-the-sins-of-manasseh-the-innocent-blood-yahuah-would-not-pardon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Deuteronomy 28:36 — the king carried *unto a nation which neither thou nor thy fathers have known* — the exile-sanction.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=2
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-the-sins-of-manasseh-the-innocent-blood-yahuah-would-not-pardon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Deuteronomy 28:64 — *Yahuah shall scatter thee among all people* — fulfilled as he *cast them out from his presence* (24:20).'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=20
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=64
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-the-sins-of-manasseh-the-innocent-blood-yahuah-would-not-pardon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Daniel 1:1 — Daniel opens at this very siege: *came Nebuchadnezzar... and besieged it* — the witness from inside the exile.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=1
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-the-first-deportation-to-babylon-the-treasures-of-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Kings 20:17 — Isaiah''s word to Hezekiah: *all... shall be carried into Babylon: nothing shall be left* — now fulfilled.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=13
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=20 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-the-first-deportation-to-babylon-the-treasures-of-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Daniel 1:2 — the holy vessels *into the treasure house of his god* — the very cups later profaned at Belshazzar''s feast.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=13
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-the-first-deportation-to-babylon-the-treasures-of-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'2 Kings 20:18 — *thy sons... shall be eunuchs in the palace of the king of Babylon* — fulfilled as Jehoiachin is carried off.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=15
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=20 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-the-first-deportation-to-babylon-the-treasures-of-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Daniel 1:3 — *the king''s seed, and... the princes* — Daniel and his companions among the very captives of v.14.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=14
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-the-first-deportation-to-babylon-the-treasures-of-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Jeremiah 25:11 — *these nations shall serve the king of Babylon seventy years* — a measured term, not an endless casting-off.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=16
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-the-first-deportation-to-babylon-the-treasures-of-the-house-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Jeremiah 22:24 — Coniah *the signet upon my right hand* plucked off — the king taken in 24:12.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=12
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=22 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-jehoiachin-coniah-carried-captive-yet-the-davidic-seed-preserved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Jeremiah 22:30 — *Write ye this man childless* as to the throne — judgment on the man, the seed yet preserved.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=15
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=22 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-jehoiachin-coniah-carried-captive-yet-the-davidic-seed-preserved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Matthew 1:11 — *Jechonias... about the time they were carried away to Babylon* — this deportation in Messiah''s genealogy.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=12
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-jehoiachin-coniah-carried-captive-yet-the-davidic-seed-preserved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Matthew 1:12 — *Jechonias begat Salathiel* in the exile — the Davidic line kept straight through the judgment toward Messiah.'
  FROM cross_reference_threads t
  JOIN _s343_2ki24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=24 AND sv.verse_number=15
  JOIN _s343_2ki24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-24-jehoiachin-coniah-carried-captive-yet-the-davidic-seed-preserved'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_2-kings_25.sql (2 Kings 25) -----
-- 2 Kings 25 — THE FALL OF JERUSALEM, the END of the monarchy: the siege and famine, the
--   last Davidic king (Zedekiah) blinded and carried to Babylon; Nebuzar-adan BURNS the house
--   of Yahuah, the king's house, and all Jerusalem, and breaks down the walls; the temple
--   pillars, the brasen sea, and the vessels broken up and borne to Babylon; the land emptied,
--   Gedaliah slain, the remnant fled to Egypt; and the FINAL NOTE OF HOPE — Jehoiachin lifted
--   from prison and given a daily portion at the king's table: the Davidic seed preserved in
--   exile, the lamp still burning toward the regathering and the Messiah.
-- Tag: 2ki25   View: _s343_2ki25_lookup   Sort band: 39100 step 3 (39100,39103,39106,39109,39112)
--
-- 2 Kings 25 coverage:
--   v.1-7  (Nebuchadnezzar besieges; famine; city broken up; Zedekiah flees, taken, sons slain
--           before his eyes, eyes put out, bound and carried to Babylon)
--          NT:     none warranted (the Davidic break — fulfillment is the seed preserved, THREAD 5)
--          Extras: none warranted
--          Tanakh: Jeremiah 39:4-7 (parallel) ; Jeremiah 52:7-11 (parallel) ; Ezekiel 12:13
--                  (I will bring him to Babylon... yet shall he not see it) ; Deuteronomy 28:36
--                  (thy king... unto a nation... thou hast not known) — THREAD 1
--   v.8-17 (Nebuzar-adan burns the house of Yahuah, the king's house, all Jerusalem; breaks
--           down the walls; pillars/brasen sea/vessels broken up and carried to Babylon)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Jeremiah 52:13 (burned the house of Yahuah) ; 2 Chronicles 36:19 (burnt the
--                  house of Elohim, brake down the wall) ; Deuteronomy 28:52 (besiege thee... till
--                  thy high and fenced walls come down) ; Lamentations 1:1 (how doth the city sit
--                  solitary) ; Lamentations 2:9 (her gates are sunk... the law is no more) ;
--                  Psalm 137:1 (by the rivers of Babylon... we wept) — THREAD 2
--   v.18-21 (chief priest Seraiah etc. slain at Riblah; so Yahudah carried away out of their land)
--          Tanakh: folded into THREAD 2 (v.21 the carrying-away) and THREAD 4 (seventy years)
--   v.22-26 (poorest left vinedressers; Gedaliah made ruler, then murdered; remnant flees to Egypt)
--          NT:     none warranted
--          Extras: none warranted
--          Tanakh: Jeremiah 52:16 (left of the poor for vinedressers) ; Jeremiah 39:10 (left of
--                  the poor... gave them vineyards) ; Deuteronomy 28:68 (Yahuah shall bring thee
--                  into Egypt again) — THREAD 3
--   v.21,11 (so Yahudah was carried away out of their land — the captivity that has an appointed end)
--          NT:     none warranted (regathering kept in Tanakh witnesses here)
--          Extras: none warranted
--          Tanakh: Jeremiah 29:10 (after seventy years... I will cause you to return) ;
--                  2 Chronicles 36:21 (until the land had enjoyed her sabbaths... threescore and
--                  ten years) ; Jeremiah 25:11 (these nations shall serve... seventy years) — THREAD 4
--   v.27-30 (Evil-merodach lifts up the head of Jehoiachin out of prison; throne above the kings;
--           changed his prison garments; bread continually before him; a daily allowance for life)
--          NT:     Matthew 1:11-12 (Josias begat Jechonias... and after they were brought to
--                  Babylon, Jechonias begat Salathiel) — the preserved seed runs to Messiah — THREAD 5
--          Extras: none warranted
--          Tanakh: Jeremiah 52:31-34 (the parallel close) ; Ezekiel 37:24 (David my servant
--                  king over them — the line gathered and made one) — THREAD 5
--
-- Threads:
--   2-kings-25-the-last-davidic-king-blinded-and-carried-to-babylon   [canon: Jeremiah, Ezekiel, Deuteronomy] tier free
--   2-kings-25-the-house-of-yahuah-burned-the-walls-broken-down        [canon: Jeremiah, 2 Chronicles, Deuteronomy, Lamentations, Psalms] tier free
--   2-kings-25-the-land-emptied-gedaliah-slain-the-remnant-to-egypt    [canon: Jeremiah, Deuteronomy] tier free
--   2-kings-25-the-seventy-years-the-captivity-that-is-not-the-end     [canon: Jeremiah, 2 Chronicles] tier free
--   2-kings-25-the-final-lamp-jehoiachin-lifted-the-davidic-seed-kept  [canon: Jeremiah, Ezekiel, Matthew] tier free

CREATE TEMP VIEW _s343_2ki25_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 — the last Davidic king blinded and carried to Babylon
    ('canon','2-kings',25,4,'canon','jeremiah',39,4,'free',E'*And it came to pass, that when Zedekiah the king of Yahudah (Judah) saw them, and all the men of war, then they fled, and went forth out of the city by night, by the way of the king''s garden, by the gate betwixt the two walls: and he went out the way of the plain.* (Jeremiah 39:4). Jeremiah''s record of the same flight: *the city was broken up, and all the men of war fled by night by the way of the gate between two walls, which is by the king''s garden* (2 Kings 25:4) — the last king of David''s line slipping out by night, the throne abandoned to the besieger.'),
    ('canon','2-kings',25,5,'canon','jeremiah',52,8,'free',E'*But the army of the Chaldeans pursued after the king, and overtook Zedekiah in the plains of Jericho; and all his army was scattered from him.* (Jeremiah 52:8). Word for word with 2 Kings 25:5 — *the army of the Chaldees pursued after the king, and overtook him in the plains of Jericho: and all his army were scattered from him* — there is no escape from the covenant-sentence; the king is run down in the open plain.'),
    ('canon','2-kings',25,7,'canon','jeremiah',39,6,'free',E'*Then the king of Babylon slew the sons of Zedekiah in Riblah before his eyes: also the king of Babylon slew all the nobles of Yahudah (Judah).* (Jeremiah 39:6). The horror of 2 Kings 25:7 in Jeremiah''s hand — *they slew the sons of Zedekiah before his eyes* — the last sight the Davidic king is permitted before the dark: his own seed cut down, then his own eyes put out.'),
    ('canon','2-kings',25,7,'canon','jeremiah',52,11,'free',E'*Then he put out the eyes of Zedekiah; and the king of Babylon bound him in chains, and carried him to Babylon, and put him in prison till the day of his death.* (Jeremiah 52:11). Jeremiah seals the end of 2 Kings 25:7 — *put out the eyes of Zedekiah, and bound him with fetters of brass, and carried him to Babylon* — the anointed of David''s house blinded, fettered, and shut in a Babylonian prison till he died: the monarchy goes out in chains.'),
    ('canon','2-kings',25,7,'canon','ezekiel',12,13,'free',E'*My net also will I spread upon him, and he shall be taken in my snare: and I will bring him to Babylon to the land of the Chaldeans; yet shall he not see it, though he shall die there.* (Ezekiel 12:13). The prophet had spoken the very riddle now fulfilled in 2 Kings 25:7 — the king *brought to Babylon... yet shall he not see it*: carried to Babylon with his eyes put out, he reached the city he would never look upon, the word of Yahuah accomplished to the letter.'),
    ('canon','2-kings',25,7,'canon','deuteronomy',28,36,'free',E'*Yahuah (LORD) shall bring thee, and thy king which thou shalt set over thee, unto a nation which neither thou nor thy fathers have known; and there shalt thou serve other gods, wood and stone.* (Deuteronomy 28:36). This is no random ruin but the covenant-sanction spoken at Sinai''s renewal: *thy king... unto a nation which... thou hast not known*. The carrying away of Zedekiah in 2 Kings 25:7 is the Deuteronomy 28 curse for covenant-breaking come due — the breach-consequence, never the Torah itself.'),
    -- THREAD 2 — the house of Yahuah burned, the walls broken down (the desolation)
    ('canon','2-kings',25,9,'canon','jeremiah',52,13,'free',E'*And burned the house of Yahuah (LORD), and the king''s house; and all the houses of Jerusalem, and all the houses of the great men, burned he with fire:* (Jeremiah 52:13). The same fire as 2 Kings 25:9 — *he burnt the house of Yahuah (LORD), and the king''s house, and all the houses of Jerusalem* — Solomon''s temple, the dwelling of the Name, given to the flames; the glory departed, the holy place a ruin.'),
    ('canon','2-kings',25,9,'canon','2-chronicles',36,19,'free',E'*And they burnt the house of Elohim (God), and brake down the wall of Jerusalem, and burnt all the palaces thereof with fire, and destroyed all the goodly vessels thereof.* (2 Chronicles 36:19). The Chronicler''s parallel to 2 Kings 25:9-10 — *burnt the house of Elohim (God), and brake down the wall* — names the whole undoing: house, wall, and vessels alike consumed, the city stripped of every defence and every holy thing.'),
    ('canon','2-kings',25,10,'canon','deuteronomy',28,52,'free',E'*And he shall besiege thee in all thy gates, until thy high and fenced walls come down, wherein thou trustedst, throughout all thy land: and he shall besiege thee in all thy gates throughout all thy land, which Yahuah Elohayka (the LORD thy God) hath given thee.* (Deuteronomy 28:52). The breaking down of the walls in 2 Kings 25:10 is the very curse foretold — *until thy high and fenced walls come down, wherein thou trustedst* — and the famine of the siege (25:3) fulfils the same chapter''s siege-horror; the covenant-sanction, not a fate apart from it.'),
    ('canon','2-kings',25,9,'canon','lamentations',1,1,'free',E'*How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* (Lamentations 1:1). The mourning over the very desolation 2 Kings 25:9-10 records: the burned, broken city *sit solitary... as a widow*; the chronicle states the ruin, the lament weeps over it, the comforter far off.'),
    ('canon','2-kings',25,9,'canon','lamentations',2,9,'free',E'*Her gates are sunk into the ground; he hath destroyed and broken her bars: her king and her princes are among the Gentiles: the law is no more; her prophets also find no vision from Yahuah (LORD).* (Lamentations 2:9). The grief answering 2 Kings 25:9 — the gates and bars broken, *her king and her princes are among the Gentiles* — Zedekiah blinded in Babylon, the temple burned, the appointed solemn feasts forgotten (Lamentations 2:6): the visible covenant-life of Zion brought to silence.'),
    ('canon','2-kings',25,11,'canon','psalms',137,1,'free',E'*By the rivers of Babylon, there we sat down, yea, we wept, when we remembered Zion.* (Psalm 137:1). The captives whom Nebuzar-adan *carried away* (2 Kings 25:11) are the very mourners of this psalm — *by the rivers of Babylon... we wept, when we remembered Zion* — torn from the burned city, hanging their harps on the willows, unable to sing the LORD''S song in a strange land.'),
    -- THREAD 3 — the land emptied: Gedaliah slain, the remnant flees to Egypt
    ('canon','2-kings',25,12,'canon','jeremiah',52,16,'free',E'*But Nebuzar-adan the captain of the guard left certain of the poor of the land for vinedressers and for husbandmen.* (Jeremiah 52:16). The same remnant as 2 Kings 25:12 — *the poor of the land to be vinedressers and husbandmen* — only the landless poor left to tend the emptied fields, the people of the covenant scattered and the land all but stripped of its inhabitants.'),
    ('canon','2-kings',25,12,'canon','jeremiah',39,10,'free',E'*But Nebuzar-adan the captain of the guard left of the poor of the people, which had nothing, in the land of Yahudah (Judah), and gave them vineyards and fields at the same time.* (Jeremiah 39:10). Jeremiah''s record of the same emptying behind 2 Kings 25:12 — *left of the poor of the people, which had nothing... and gave them vineyards and fields* — the land that flowed with milk and honey now a near-empty waste held by the poorest, the warning of the prophets come fully due.'),
    ('canon','2-kings',25,26,'canon','deuteronomy',28,68,'free',E'*And Yahuah (LORD) shall bring thee into Egypt again with ships, by the way whereof I spake unto thee, Thou shalt see it no more again: and there ye shall be sold unto your enemies for bondmen and bondwomen, and no man shall buy you.* (Deuteronomy 28:68). The flight of the remnant in 2 Kings 25:26 — *came to Egypt: for they were afraid of the Chaldees* — turns the Exodus backward: redeemed once out of Egypt, the covenant-breakers are driven *into Egypt again*, the curse of Deuteronomy 28 closing the circle the people had run from.'),
    -- THREAD 4 — the seventy years: the captivity that is not the end
    ('canon','2-kings',25,21,'canon','jeremiah',29,10,'free',E'*For thus saith Yahuah (LORD), That after seventy years be accomplished at Babylon I will visit you, and perform my good word toward you, in causing you to return to this place.* (Jeremiah 29:10). The carrying away of 2 Kings 25:21 — *So Yahudah (Judah) was carried away out of their land* — is not Yahuah''s last word. To these same captives the prophet wrote *thoughts of peace, and not of evil, to give you an expected end* (Jeremiah 29:11): the exile has a measured term, and at its end a return.'),
    ('canon','2-kings',25,21,'canon','2-chronicles',36,21,'free',E'*To fulfil the word of Yahuah (LORD) by the mouth of Jeremiah, until the land had enjoyed her sabbaths: for as long as she lay desolate she kept sabbath, to fulfil threescore and ten years.* (2 Chronicles 36:21). The Chronicler reads the desolation of 2 Kings 25:21 as the land keeping the sabbaths Yahudah would not — *to fulfil threescore and ten years* — the appointed rest the people withheld, exacted from the land itself, with the term fixed and the end already in view (2 Chronicles 36:22-23, Cyrus''s decree).'),
    ('canon','2-kings',25,21,'canon','jeremiah',25,11,'free',E'*And this whole land shall be a desolation, and an astonishment; and these nations shall serve the king of Babylon seventy years.* (Jeremiah 25:11). The desolation of 2 Kings 25:21 was spoken beforehand with its limit set: *seventy years*. The judgment is real and the land is emptied, yet the number itself is a mercy — a captivity with a counted end, not an everlasting casting-off.'),
    -- THREAD 5 — the final lamp: Jehoiachin lifted up, the Davidic seed preserved
    ('canon','2-kings',25,27,'canon','jeremiah',52,31,'free',E'*And it came to pass in the seven and thirtieth year of the captivity of Jehoiachin king of Yahudah (Judah), in the twelfth month, in the five and twentieth day of the month, that Evil-merodach king of Babylon in the first year of his reign lifted up the head of Jehoiachin king of Yahudah (Judah), and brought him forth out of prison,* (Jeremiah 52:31). Jeremiah closes his book on the same scene that closes 2 Kings — *did lift up the head of Jehoiachin king of Yahudah (Judah) out of prison* (2 Kings 25:27) — the Davidic heir raised from the dungeon: judgment is not the last word.'),
    ('canon','2-kings',25,28,'canon','jeremiah',52,32,'free',E'*And spake kindly unto him, and set his throne above the throne of the kings that were with him in Babylon,* (Jeremiah 52:32). The same lifting-up as 2 Kings 25:28 — *he spake kindly to him, and set his throne above the throne of the kings that were with him in Babylon* — the seed of David honoured even in exile, set above the captive kings, the lamp of the house of David not extinguished.'),
    ('canon','2-kings',25,29,'canon','jeremiah',52,33,'free',E'*And changed his prison garments: and he did continually eat bread before him all the days of his life.* (Jeremiah 52:33). Word for word with 2 Kings 25:29 — *changed his prison garments: and he did eat bread continually before him all the days of his life* — the prison rags exchanged, a place at the king''s table, a daily portion: the surviving Davidic seed kept and sustained until the day of return draws near.'),
    ('canon','2-kings',25,27,'canon','matthew',1,11,'free',E'*And Josias begat Jechonias and his brethren, about the time they were carried away to Babylon:* (Matthew 1:11). The very Jehoiachin (Jechonias) lifted from prison in 2 Kings 25:27 stands in the line of the Messiah at the hinge of the generations — *about the time they were carried away to Babylon* — the carrying-away marks the turn, and the preserved seed carries the promise through.'),
    ('canon','2-kings',25,29,'canon','matthew',1,12,'free',E'*And after they were brought to Babylon, Jechonias begat Salathiel; and Salathiel begat Zorobabel;* (Matthew 1:12). The bread given daily to Jehoiachin in exile (2 Kings 25:29) kept alive the line that runs on through *Jechonias begat Salathiel* unto *the carrying away into Babylon unto Messiah (Christ)* (Matthew 1:17): the lamp preserved in Babylon is the seed of David out of whom the Messiah comes.'),
    ('canon','2-kings',25,29,'canon','ezekiel',37,24,'free',E'*And David my servant shall be king over them; and they all shall have one shepherd: they shall also walk in my judgments, and observe my statutes, and do them.* (Ezekiel 37:24). The seed kept at the Babylonian table in 2 Kings 25:29 looks beyond the captivity to the promised *David my servant* — the two sticks of Yahudah and Joseph made one in his hand (Ezekiel 37:19), the scattered houses gathered, the throne the exile could not destroy raised up for ever.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-25-the-last-davidic-king-blinded-and-carried-to-babylon',
       E'The Last Davidic King — Blinded and Carried to Babylon',
       E'In the ninth year of Zedekiah''s reign Nebuchadnezzar lays siege, *and the city was besieged unto the eleventh year* (2 Kings 25:2); the famine prevails *and there was no bread for the people of the land* (25:3); then *the city was broken up, and all the men of war fled by night by the way of the gate between two walls* (25:4). Jeremiah records the same flight — *they fled, and went forth out of the city by night, by the way of the king''s garden* (Jeremiah 39:4) — and the same pursuit: *the army of the Chaldeans... overtook Zedekiah in the plains of Jericho; and all his army was scattered from him* (Jeremiah 52:8). There is no escape from the covenant-sentence. The horror at Riblah is total: *they slew the sons of Zedekiah before his eyes, and put out the eyes of Zedekiah, and bound him with fetters of brass, and carried him to Babylon* (25:7; Jeremiah 39:6; 52:11) — the last sight the anointed of David''s house is given is his own seed cut down, then darkness. And the prophet had spoken the very riddle: *I will bring him to Babylon to the land of the Chaldeans; yet shall he not see it, though he shall die there* (Ezekiel 12:13). This is not random ruin but the sanction sworn at Sinai''s renewal — *Yahuah (LORD) shall bring thee, and thy king which thou shalt set over thee, unto a nation which neither thou nor thy fathers have known* (Deuteronomy 28:36): the Deuteronomy 28 curse for covenant-breaking come due. The Torah is never the curse; the breaking of it is. The monarchy of David goes out in chains — yet the seed is not finished (THREAD 5).',
       sv.verse_id, ev.verse_id, 'free', 39100
  FROM _s343_2ki25_lookup sv, _s343_2ki25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=25 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-25-the-house-of-yahuah-burned-the-walls-broken-down',
       E'The House of Yahuah Burned, the Walls Broken Down — the Desolation',
       E'Nebuzar-adan comes, and the dwelling of the Name is given to the fire: *he burnt the house of Yahuah (LORD), and the king''s house, and all the houses of Jerusalem* (2 Kings 25:9; Jeremiah 52:13), *and brake down the walls of Jerusalem round about* (25:10). The Chronicler gathers the whole undoing — *they burnt the house of Elohim (God), and brake down the wall of Jerusalem, and burnt all the palaces thereof with fire* (2 Chronicles 36:19) — and the very pillars Solomon raised, Jachin and Boaz, the brasen sea, the vessels, are *broken in pieces* and the brass borne to Babylon (25:13-17). Solomon''s temple is a ruin; the glory departed. This too was sworn beforehand: *he shall besiege thee in all thy gates, until thy high and fenced walls come down, wherein thou trustedst* (Deuteronomy 28:52) — the siege, the famine, the breached wall, the covenant-sanction to the letter. Where the chronicle records the ruin, the lament weeps over it: *How doth the city sit solitary, that was full of people! how is she become as a widow!* (Lamentations 1:1); *Her gates are sunk into the ground... her king and her princes are among the Gentiles: the law is no more* (Lamentations 2:9), and *Yahuah (LORD) hath caused the solemn feasts and sabbaths to be forgotten in Zion* (Lamentations 2:6). And by the waters of exile the captives Nebuzar-adan carried away (25:11) sit and weep: *By the rivers of Babylon, there we sat down, yea, we wept, when we remembered Zion* (Psalm 137:1). The visible covenant-life of Zion is brought to silence — for covenant-breaking, never because the covenant itself failed.',
       sv.verse_id, ev.verse_id, 'free', 39103
  FROM _s343_2ki25_lookup sv, _s343_2ki25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=25 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-25-the-land-emptied-gedaliah-slain-the-remnant-to-egypt',
       E'The Land Emptied — Gedaliah Slain, the Remnant Fled to Egypt',
       E'The land is all but stripped of its people: *the captain of the guard left of the poor of the land to be vinedressers and husbandmen* (2 Kings 25:12; Jeremiah 52:16) — only the landless poor remain to tend the emptied fields, *the poor of the people, which had nothing... and gave them vineyards and fields* (Jeremiah 39:10). Over this thin remnant Nebuchadnezzar sets Gedaliah, who counsels them, *Fear not to be the servants of the Chaldees: dwell in the land... and it shall be well with you* (25:24). But *Ishmael the son of Nethaniah... of the seed royal, came, and ten men with him, and smote Gedaliah, that he died* (25:25), and in terror the people *arose, and came to Egypt: for they were afraid of the Chaldees* (25:26). The last act turns the Exodus backward: the nation redeemed once out of the house of bondage is driven *into Egypt again* — the very curse spoken at Sinai''s renewal: *Yahuah (LORD) shall bring thee into Egypt again with ships, by the way whereof I spake unto thee, Thou shalt see it no more again* (Deuteronomy 28:68). The land that flowed with milk and honey lies near empty; the people of the covenant are scattered to Babylon and to Egypt alike — yet the scattering is never the end of the promise (THREAD 4, THREAD 5).',
       sv.verse_id, ev.verse_id, 'free', 39106
  FROM _s343_2ki25_lookup sv, _s343_2ki25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=25 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-25-the-seventy-years-the-captivity-that-is-not-the-end',
       E'The Seventy Years — the Captivity That Is Not the End',
       E'*So Yahudah (Judah) was carried away out of their land* (2 Kings 25:21). The chronicle states the bare fact of the exile — but Yahuah had measured its term beforehand, and that measure is itself a mercy. To these same captives Jeremiah wrote: *after seventy years be accomplished at Babylon I will visit you, and perform my good word toward you, in causing you to return to this place* (Jeremiah 29:10), for *I know the thoughts that I think toward you, saith Yahuah (LORD), thoughts of peace, and not of evil, to give you an expected end* (29:11). He had named the number from the first: *these nations shall serve the king of Babylon seventy years* (Jeremiah 25:11). The Chronicler reads the very desolation of 2 Kings 25 as the land keeping the sabbaths the people withheld — *until the land had enjoyed her sabbaths: for as long as she lay desolate she kept sabbath, to fulfil threescore and ten years* (2 Chronicles 36:21) — and closes on the decree of Cyrus that sends the captives home (36:22-23). The carrying-away is real and the city is desolate, but it is a captivity with a counted end, not an everlasting casting-off; the regathering is already written into the judgment.',
       sv.verse_id, ev.verse_id, 'free', 39109
  FROM _s343_2ki25_lookup sv, _s343_2ki25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=25 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-kings-25-the-final-lamp-jehoiachin-lifted-the-davidic-seed-kept',
       E'The Final Lamp — Jehoiachin Lifted Up, the Davidic Seed Preserved',
       E'The book of Kings does not close on the burned temple or the blinded king. Its last word is a door left open. *In the seven and thirtieth year of the captivity of Jehoiachin king of Yahudah (Judah)... Evil-merodach king of Babylon... did lift up the head of Jehoiachin king of Yahudah (Judah) out of prison* (2 Kings 25:27); *he spake kindly to him, and set his throne above the throne of the kings that were with him in Babylon* (25:28; Jeremiah 52:32); *And changed his prison garments: and he did eat bread continually before him all the days of his life* (25:29; Jeremiah 52:33), *a daily rate for every day, all the days of his life* (25:30). The Davidic heir is raised from the dungeon, robed, seated above the captive kings, and given bread at the king''s own table: a faint lamp still burning. For this is the very Jehoiachin who stands in the line of the Messiah — *Josias begat Jechonias and his brethren, about the time they were carried away to Babylon* (Matthew 1:11), *And after they were brought to Babylon, Jechonias begat Salathiel; and Salathiel begat Zorobabel* (Matthew 1:12), the line that runs *from the carrying away into Babylon unto Messiah (Christ)* (Matthew 1:17). The seed preserved at the Babylonian table looks beyond the captivity to the promised one — *David my servant shall be king over them; and they all shall have one shepherd* (Ezekiel 37:24), the two sticks of Yahudah and Joseph made one in his hand (37:19), the scattered houses gathered, the dry bones raised to live (37:5,10). Judgment is not the last word; the covenant-promise survives the exile, and the throne the fire could not destroy is kept for the seed of David for ever.',
       sv.verse_id, ev.verse_id, 'free', 39112
  FROM _s343_2ki25_lookup sv, _s343_2ki25_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='2-kings' AND ev.chapter_number=25 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Jeremiah 39:4 — *they fled... by the way of the king''s garden*; the same night flight of the last king.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=4
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=39 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-last-davidic-king-blinded-and-carried-to-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Jeremiah 52:8 — *overtook Zedekiah in the plains of Jericho... all his army was scattered*; no escape from the sentence.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=5
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-last-davidic-king-blinded-and-carried-to-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Jeremiah 39:6 — *slew the sons of Zedekiah in Riblah before his eyes*; the last sight before the dark.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=7
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=39 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-last-davidic-king-blinded-and-carried-to-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Jeremiah 52:11 — *put out the eyes of Zedekiah... and put him in prison till the day of his death*; the monarchy in chains.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=7
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-last-davidic-king-blinded-and-carried-to-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Ezekiel 12:13 — *I will bring him to Babylon... yet shall he not see it*; the riddle fulfilled in the blinded king.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=7
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=12 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-last-davidic-king-blinded-and-carried-to-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Deuteronomy 28:36 — *thy king... unto a nation which... thou hast not known*; the covenant-sanction, not the Torah, is the curse.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=7
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-last-davidic-king-blinded-and-carried-to-babylon'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Jeremiah 52:13 — *burned the house of Yahuah (LORD), and the king''s house*; Solomon''s temple to the flames.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=9
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-house-of-yahuah-burned-the-walls-broken-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 36:19 — *burnt the house of Elohim (God), and brake down the wall*; house, wall, and vessels alike consumed.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=9
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-house-of-yahuah-burned-the-walls-broken-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 28:52 — *until thy high and fenced walls come down, wherein thou trustedst*; the siege-curse foretold.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=10
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-house-of-yahuah-burned-the-walls-broken-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Lamentations 1:1 — *How doth the city sit solitary... how is she become as a widow!*; the lament over the burned city.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=9
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-house-of-yahuah-burned-the-walls-broken-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Lamentations 2:9 — *her gates are sunk... her king and her princes are among the Gentiles: the law is no more*; Zion silenced.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=9
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-house-of-yahuah-burned-the-walls-broken-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Psalm 137:1 — *By the rivers of Babylon... we wept, when we remembered Zion*; the carried-away captives mourning.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=11
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=137 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-house-of-yahuah-burned-the-walls-broken-down'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Jeremiah 52:16 — *left certain of the poor of the land for vinedressers and for husbandmen*; only the landless poor remain.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=12
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-land-emptied-gedaliah-slain-the-remnant-to-egypt'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Jeremiah 39:10 — *left of the poor of the people, which had nothing... and gave them vineyards and fields*; the land all but emptied.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=12
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=39 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-land-emptied-gedaliah-slain-the-remnant-to-egypt'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Deuteronomy 28:68 — *Yahuah (LORD) shall bring thee into Egypt again*; the Exodus run backward as covenant-curse.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=26
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=68
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-land-emptied-gedaliah-slain-the-remnant-to-egypt'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Jeremiah 29:10 — *after seventy years... I will cause you to return*; the exile has a measured, merciful term.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=21
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-seventy-years-the-captivity-that-is-not-the-end'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'2 Chronicles 36:21 — *until the land had enjoyed her sabbaths... threescore and ten years*; the term fixed, Cyrus''s decree near.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=21
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-seventy-years-the-captivity-that-is-not-the-end'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Jeremiah 25:11 — *these nations shall serve the king of Babylon seventy years*; the number set from the first.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=21
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-seventy-years-the-captivity-that-is-not-the-end'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Jeremiah 52:31 — *lifted up the head of Jehoiachin king of Yahudah (Judah)... out of prison*; Jeremiah closes on the same scene.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=27
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-final-lamp-jehoiachin-lifted-the-davidic-seed-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Jeremiah 52:32 — *set his throne above the throne of the kings... in Babylon*; the Davidic seed honoured in exile.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=28
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-final-lamp-jehoiachin-lifted-the-davidic-seed-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Jeremiah 52:33 — *changed his prison garments: and he did continually eat bread before him*; a place at the king''s table.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=29
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=52 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-final-lamp-jehoiachin-lifted-the-davidic-seed-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Matthew 1:11 — *Josias begat Jechonias... about the time they were carried away to Babylon*; the preserved seed in Messiah''s line.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=27
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-final-lamp-jehoiachin-lifted-the-davidic-seed-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Matthew 1:12 — *Jechonias begat Salathiel; and Salathiel begat Zorobabel*; the line runs on to the Messiah.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=29
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-final-lamp-jehoiachin-lifted-the-davidic-seed-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Ezekiel 37:24 — *David my servant shall be king over them... one shepherd*; the seed gathered, the two houses made one.'
  FROM cross_reference_threads t
  JOIN _s343_2ki25_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='2-kings' AND sv.chapter_number=25 AND sv.verse_number=29
  JOIN _s343_2ki25_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='2-kings-25-the-final-lamp-jehoiachin-lifted-the-davidic-seed-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session343 — 2 Kings cross-references complete.'
