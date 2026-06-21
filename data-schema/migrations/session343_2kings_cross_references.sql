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


COMMIT;
\echo 'session343 — 2 Kings cross-references complete.'
