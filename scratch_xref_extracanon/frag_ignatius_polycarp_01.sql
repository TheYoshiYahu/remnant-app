-- ----- fragment: minion_ignatiuspolycarp_01.sql (session253 ignatius-polycarp 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-polycarp ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igpol1 (view _session253_igpol1_lookup). Sort band base 70800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igpol1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-polycarp-1-perfect-athlete
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 1, 'canon', 'galatians', 6, 2, 'free', E'Galatians 6:2 — *Bear ye one another’s burdens, and so fulfil the law of Messiah (Christ).* Ignatius’ “bear the maladies of all” is Sha’ul’s burden-bearing that fulfils—not abolishes—the law (Ignatius-Polycarp 1:1).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 1, 'canon', '1-thessalonians', 5, 14, 'free', E'1 Thessalonians 5:14 — *Now we exhort you, brethren, warn them that are unruly, comfort the feebleminded, support the weak, be patient toward all men.* The athlete who bears all maladies is the patient pastor supporting the weak (Ignatius-Polycarp 1:1).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 1, 'canon', '1-peter', 5, 2, 'free', E'1 Peter 5:2 — *Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind.* The diligent oversight Ignatius urges is Kepha’s willing, ungrudging shepherding (Ignatius-Polycarp 1:1).'),
  -- thread: ignatius-polycarp-1-serpent-and-dove
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 2, 'canon', 'matthew', 10, 16, 'free', E'Matthew 10:16 — *Behold, I send you forth as sheep in the midst of wolves: be ye therefore wise as serpents, and harmless as doves.* Ignatius is quoting the Messiah word-for-word—the serpent’s prudence and the dove’s guilelessness for the shepherd among wolves (Ignatius-Polycarp 1:2).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 2, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The wisdom and watchfulness Ignatius commands answer the prowling adversary Kepha warns of (Ignatius-Polycarp 1:2).'),
  -- thread: ignatius-polycarp-1-anvil-smitten
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 3, 'canon', '1-corinthians', 15, 58, 'free', E'1 Corinthians 15:58 — *Therefore, my beloved brethren, be ye stedfast, unmoveable, always abounding in the work of Yahuah (Lord), forasmuch as ye know that your labour is not in vain in Yahuah (Lord).* The smitten anvil that stands firm is Sha’ul’s stedfast, unmoveable saint (Ignatius-Polycarp 1:3).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 3, 'canon', '2-timothy', 2, 3, 'free', E'2 Timothy 2:3 — *Thou therefore endure hardness, as a good soldier of Yahusha HaMashiach (Jesus Christ).* Ignatius’ great athlete who receives blows and is victorious is the good soldier enduring hardness (Ignatius-Polycarp 1:3).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 3, 'canon', '1-peter', 5, 4, 'free', E'1 Peter 5:4 — *And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away.* The athlete who is victorious through blows wins the unfading crown of the chief Shepherd (Ignatius-Polycarp 1:3).'),
  -- thread: ignatius-polycarp-1-await-him-who-became-visible
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 3, 'canon', '1-corinthians', 15, 3, 'free', E'1 Corinthians 15:3 — *For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures.* Ignatius’ Impassible who suffered for our sake is the Messiah who truly died for sins (Ignatius-Polycarp 1:3).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 3, 'canon', '2-timothy', 2, 8, 'free', E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel.* The Eternal who became visible is the Messiah of David’s seed, truly in the flesh and truly raised (Ignatius-Polycarp 1:3).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 3, 'canon', 'ephesians', 5, 16, 'free', E'Ephesians 5:16 — *Redeeming the time, because the days are evil.* “Mark the seasons... await Him that is above every season” echoes the charge to redeem the time in evil days (Ignatius-Polycarp 1:3).'),
  -- thread: ignatius-polycarp-1-love-wives-as-the-master
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 5, 'canon', 'ephesians', 5, 25, 'free', E'Ephesians 5:25 — *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it.* Ignatius’ charge to love wives “as Yahuah loved the Church” is verbatim Sha’ul’s self-giving love (Ignatius-Polycarp 1:5).'),
  ('lightfoot-apostolic-fathers', 'ignatius-polycarp', 1, 5, 'canon', 'ephesians', 5, 2, 'free', E'Ephesians 5:2 — *And walk in love, as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour.* The sacrificial love that measures marriage is the Messiah’s self-offering (Ignatius-Polycarp 1:5).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igpol1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igpol1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-polycarp-1-perfect-athlete',
       E'Bear the maladies of all, as a perfect athlete',
       E'Ignatius exhorts the shepherd to shoulder the weakness of the whole flock: *Bear the maladies of all, as a perfect athlete. Where there is more toil, there is much gain.* It ain''t new — this is Sha''ul''s own charge: *Bear ye one another’s burdens, and so fulfil the law of Messiah (Christ)* (Galatians 6:2), and *Now we exhort you, brethren, warn them that are unruly, comfort the feebleminded, support the weak, be patient toward all men* (1 Thessalonians 5:14). The faithful elder feeds, not fleeces: *Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly* (1 Peter 5:2).',
       sv.verse_id, ev.verse_id, 'extras', 70800
  FROM _session253_igpol1_lookup sv, _session253_igpol1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-polycarp' AND ev.chapter_number=1 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-polycarp-1-serpent-and-dove',
       E'Wise as the serpent, guileless as the dove',
       E'Against false teachers Ignatius gives the shepherd the Master’s own watchword: *Be thou prudent as the serpent in all things and guileless always as the dove.* It ain''t new—it is verbatim from Yahusha sending out the twelve: *Behold, I send you forth as sheep in the midst of wolves: be ye therefore wise as serpents, and harmless as doves* (Matthew 10:16). And the wolves are real: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 70803
  FROM _session253_igpol1_lookup sv, _session253_igpol1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-polycarp' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-polycarp-1-anvil-smitten',
       E'Stand firm, as an anvil when it is smitten',
       E'Of strange doctrine Ignatius says: *Let not those that seem to be plausible and yet teach strange doctrine dismay thee. Stand thou firm, as an anvil when it is smitten. It is the part of a great athlete to receive blows and be victorious.* It ain''t new—this is Sha’ul’s closing charge: *Therefore, my beloved brethren, be ye stedfast, unmoveable, always abounding in the work of Yahuah (Lord), forasmuch as ye know that your labour is not in vain in Yahuah (Lord)* (1 Corinthians 15:58); and *Thou therefore endure hardness, as a good soldier of Yahusha HaMashiach (Jesus Christ)* (2 Timothy 2:3). The crown comes to the steadfast: *And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away* (1 Peter 5:4).',
       sv.verse_id, ev.verse_id, 'extras', 70806
  FROM _session253_igpol1_lookup sv, _session253_igpol1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-polycarp' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-polycarp-1-await-him-who-became-visible',
       E'Await Him who became visible and suffered for our sake',
       E'The anti-docetic core: *Await Him that is above every season, the Eternal, the Invisible, who became visible for our sake, the Impalpable, the Impassible, who suffered for our sake, who endured in all ways for our sake.* It ain''t new—the Eternal truly took flesh and truly suffered: *For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures* (1 Corinthians 15:3); *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8). And the shepherd must mark the times wisely: *Redeeming the time, because the days are evil* (Ephesians 5:16).',
       sv.verse_id, ev.verse_id, 'extras', 70809
  FROM _session253_igpol1_lookup sv, _session253_igpol1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-polycarp' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-polycarp-1-love-wives-as-the-master',
       E'Love your wives as Yahuah loved His own',
       E'On marriage Ignatius charges: *charge my brothers in the name of Yahusha HaMashiach (Jesus Christ) to love their wives, as Yahuah (Lord) loved the Church.* It ain''t new—it is Sha’ul to the Ephesians: *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it* (Ephesians 5:25), and *And walk in love, as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour* (Ephesians 5:2).',
       sv.verse_id, ev.verse_id, 'extras', 70812
  FROM _session253_igpol1_lookup sv, _session253_igpol1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-polycarp' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-polycarp-1-perfect-athlete
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 6:2 — *Bear ye one another’s burdens, and so fulfil the law of Messiah (Christ).* Ignatius’ “bear the maladies of all” is Sha’ul’s burden-bearing that fulfils—not abolishes—the law (Ignatius-Polycarp 1:1).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-perfect-athlete'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Thessalonians 5:14 — *Now we exhort you, brethren, warn them that are unruly, comfort the feebleminded, support the weak, be patient toward all men.* The athlete who bears all maladies is the patient pastor supporting the weak (Ignatius-Polycarp 1:1).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-perfect-athlete'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:2 — *Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind.* The diligent oversight Ignatius urges is Kepha’s willing, ungrudging shepherding (Ignatius-Polycarp 1:1).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-perfect-athlete'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-polycarp-1-serpent-and-dove
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 10:16 — *Behold, I send you forth as sheep in the midst of wolves: be ye therefore wise as serpents, and harmless as doves.* Ignatius is quoting the Messiah word-for-word—the serpent’s prudence and the dove’s guilelessness for the shepherd among wolves (Ignatius-Polycarp 1:2).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-serpent-and-dove'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The wisdom and watchfulness Ignatius commands answer the prowling adversary Kepha warns of (Ignatius-Polycarp 1:2).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-serpent-and-dove'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-polycarp-1-anvil-smitten
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:58 — *Therefore, my beloved brethren, be ye stedfast, unmoveable, always abounding in the work of Yahuah (Lord), forasmuch as ye know that your labour is not in vain in Yahuah (Lord).* The smitten anvil that stands firm is Sha’ul’s stedfast, unmoveable saint (Ignatius-Polycarp 1:3).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-anvil-smitten'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=58
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 2:3 — *Thou therefore endure hardness, as a good soldier of Yahusha HaMashiach (Jesus Christ).* Ignatius’ great athlete who receives blows and is victorious is the good soldier enduring hardness (Ignatius-Polycarp 1:3).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-anvil-smitten'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:4 — *And when the chief Shepherd shall appear, ye shall receive a crown of glory that fadeth not away.* The athlete who is victorious through blows wins the unfading crown of the chief Shepherd (Ignatius-Polycarp 1:3).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-anvil-smitten'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-polycarp-1-await-him-who-became-visible
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:3 — *For I delivered unto you first of all that which I also received, how that Messiah (Christ) died for our sins according to the scriptures.* Ignatius’ Impassible who suffered for our sake is the Messiah who truly died for sins (Ignatius-Polycarp 1:3).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-await-him-who-became-visible'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel.* The Eternal who became visible is the Messiah of David’s seed, truly in the flesh and truly raised (Ignatius-Polycarp 1:3).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-await-him-who-became-visible'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 5:16 — *Redeeming the time, because the days are evil.* “Mark the seasons... await Him that is above every season” echoes the charge to redeem the time in evil days (Ignatius-Polycarp 1:3).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-await-him-who-became-visible'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-polycarp-1-love-wives-as-the-master
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 5:25 — *Husbands, love your wives, even as Messiah (Christ) also loved the church, and gave himself for it.* Ignatius’ charge to love wives “as Yahuah loved the Church” is verbatim Sha’ul’s self-giving love (Ignatius-Polycarp 1:5).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-love-wives-as-the-master'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 5:2 — *And walk in love, as Messiah (Christ) also hath loved us, and hath given himself for us an offering and a sacrifice to Elohim (God) for a sweetsmelling savour.* The sacrificial love that measures marriage is the Messiah’s self-offering (Ignatius-Polycarp 1:5).'
  FROM cross_reference_threads t, cross_references x, _session253_igpol1_lookup sv, _session253_igpol1_lookup tv
 WHERE t.slug='ignatius-polycarp-1-love-wives-as-the-master'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-polycarp' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

