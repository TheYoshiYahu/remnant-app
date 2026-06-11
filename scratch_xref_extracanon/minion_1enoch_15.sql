-- ----- fragment: minion_1enoch_15.sql (session250 1-enoch 15) -----
-- Source anchor: enoch/1-enoch ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en15 (view _session250_en15_lookup). Sort band base 50350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-15-watchers-petition-refused
  ('enoch', '1-enoch', 15, 2, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads back the very refusal of Enoch 15:2 — there is no intercession for the Watchers, only chains reserved unto the great day.'),
  ('enoch', '1-enoch', 15, 2, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter, like Enoch 15:2, denies the angels any pardon: not spared, but reserved unto judgment.'),
  ('enoch', '1-enoch', 15, 2, 'jubilees', 'jubilees', 10, 5, 'extras', E'Jubilees 10:5 — *And You know how Your Watchers, the fathers of these spirits, acted in my day: and as for these spirits which are living, imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant, my Elohim (God); for these are malignant, and created in order to destroy.* The prayer Heaven answers is Noah''s against the Watchers, never the Watchers'' for themselves — the same refusal Enoch carries in 15:2.'),
  -- thread: 1-enoch-15-left-heaven-defiled-begat-giants
  ('enoch', '1-enoch', 15, 3, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Enoch 15:3 names these ''sons of Elohim'' as the Watchers and turns Moses'' line into a direct charge: ye left heaven and took to yourselves wives.'),
  ('enoch', '1-enoch', 15, 3, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants Enoch 15:3 says the Watchers ''begotten'' are Moses'' nephilim — the same offspring, the same crossing of kinds.'),
  ('enoch', '1-enoch', 15, 3, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees tells Enoch 15:3 in the same words — angels, chosen wives, giants begotten.'),
  ('enoch', '1-enoch', 15, 4, 'jubilees', 'jubilees', 7, 21, 'extras', E'Jubilees 7:21 — *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness.* Noah names the sin Enoch 15:4 condemns — Watchers transgressing ''the law of their ordinances,'' rebellion against the Creator''s appointed order, not law made curse.'),
  -- thread: 1-enoch-15-giants-become-evil-spirits
  ('enoch', '1-enoch', 15, 6, 'canon', 'matthew', 12, 43, 'free', E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The restless, earth-bound spirit Yahusha (Jesus) describes is exactly Enoch 15:6''s giant-spirit whose dwelling is on the earth, seeking a body and finding no true home.'),
  ('enoch', '1-enoch', 15, 7, 'jubilees', 'jubilees', 10, 1, 'extras', E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees shows the spirits of Enoch 15:7 already at work after the Flood — the surviving giant-spirits leading astray and destroying mankind.'),
  ('enoch', '1-enoch', 15, 6, 'apocrypha', 'the-wisdom-of-solomon', 14, 6, 'extras', E'Wisdom of Solomon 14:6 — *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation.* Wisdom remembers the proud giants of Enoch 15:6 perishing in the Flood while righteous seed was preserved in the ark.'),
  -- thread: 1-enoch-15-earthbound-spirits-till-the-judgement
  ('enoch', '1-enoch', 15, 11, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The mortality decreed on flesh in Genesis 6:3 is the very death Enoch 15:4-11 traces — the giants ''die and perish,'' and their spirits are loosed until the great judgement.'),
  ('enoch', '1-enoch', 15, 11, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s ''judgment of the great day'' is Enoch 15:11''s ''great judgement in which the age shall be consummated, over the Watchers and the godless.'''),
  ('enoch', '1-enoch', 15, 9, 'enoch', '1-enoch', 16, 4, 'extras', E'1 Enoch 16:4 — *Say to them therefore: “You have no peace.”* The next chapter seals the verdict Enoch 15:9-11 announces: the Watchers and their destroying spirits are granted no peace, only the consummation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-15-watchers-petition-refused',
       E'Enoch''s commission: the Watchers should not be interceded for',
       E'Enoch, sent up by the trembling Watchers to plead their case, is turned back with the verdict already fixed: *’Fear not, Enoch, thou righteous man and scribe of righteousness: approach hither and hear my voice.* … *You should intercede for men, and not men for you’* (1 Enoch 15:1-2). The petition is refused because these are not weak men but rebels against the Creator''s order, and the apostles preserve the sentence exactly: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6), and again *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Jubilees voices the counter-prayer Yahuah (God) does answer — not the Watchers'' plea but Noah''s, *and as for these spirits which are living, imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant* (Jubilees 10:5). It ain''t new: Jude and Peter did not invent the bound-angels doctrine; they were reading the Watchers, and the framework holds — the sin is rebellion against the Maker''s appointed order, and Torah-keeping righteousness (the scribe of righteousness himself) stands on the other side of the judgement.',
       sv.verse_id, ev.verse_id, 'extras', 50350
  FROM _session250_en15_lookup sv, _session250_en15_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-15-left-heaven-defiled-begat-giants',
       E'The charge: heaven left, women defiled, giants begotten',
       E'The indictment laid on the Watchers is Genesis 6 spoken back to them as accusation: *Wherefore have ye left the high, holy, and eternal heaven, and lain with women, and defiled yourselves with the daughters of men and taken to yourselves wives, and done like the children of earth, and begotten giants (as your) sons?* (1 Enoch 15:3), holy spiritual ones who *have lusted after flesh and blood as those also do who die and perish* (1 Enoch 15:4). This is the canon''s own sentence: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them* (Genesis 6:4). Jubilees tells it the same way — *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants* (Jubilees 5:1) — and names the sin precisely: *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness* (Jubilees 7:21). It ain''t new: Genesis 6''s terse ''sons of Elohim'' is unfolded here as the Watchers, and the seed-war — the tares sown among the wheat — has its root in this crossing of the appointed boundary between the spirits of heaven and the children of earth.',
       sv.verse_id, ev.verse_id, 'extras', 50353
  FROM _session250_en15_lookup sv, _session250_en15_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=15 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-15-giants-become-evil-spirits',
       E'The origin of evil spirits from the dead giants',
       E'Here the canon''s demonology is given its root: the slain giants do not simply die — *And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling* (1 Enoch 15:6), for *Evil spirits have proceeded from their bodies; because they are born from men and from the holy Watchers is their beginning and primal origin* (1 Enoch 15:7). The Gospels assume exactly this homeless, earth-bound spirit: *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none* (Matthew 12:43) — a disembodied thing wandering the earth seeking a dwelling, just as Enoch describes. Jubilees carries the same teaching forward into Noah''s day: *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them* (Jubilees 10:1). And the apocrypha remembers that the giants did perish in the Flood even as their spirits remained: *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel* (Wisdom of Solomon 14:6). It ain''t new: when Yahusha (Jesus) casts out unclean spirits He is acting on the very order Enoch lays down — the demons are the surviving spirits of the nephilim, the bitter fruit of the Watchers'' crossing.',
       sv.verse_id, ev.verse_id, 'extras', 50356
  FROM _session250_en15_lookup sv, _session250_en15_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=15 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-15-earthbound-spirits-till-the-judgement',
       E'Earth-bound spirits afflict mankind until the great judgement',
       E'The spirits of the dead giants are fixed to the earth and given over to torment the living until the consummation: *but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling* (1 Enoch 15:8), and they *afflict, oppress, destroy, attack, do battle, and work destruction on the earth* (1 Enoch 15:9), warring *until the day of the consummation, the great judgement in which the age shall be consummated, over the Watchers and the godless* (1 Enoch 15:11). The flesh that bred them was already under sentence by Yahuah (LORD): *My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* (Genesis 6:3) — the same mortality Enoch 15:4 names, that the Watchers lusted ''as those also do who die and perish.'' Their final reckoning is the great-day judgement Jude preserves word for word: *the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). And the sentence Enoch carries back closes the parallel chapter with no pardon: *Say to them therefore: “You have no peace”* (1 Enoch 16:4). It ain''t new — the spirits'' temporary leash and their certain end are one continuous teaching from Genesis 6 through Enoch into Jude; Torah stands, the godless are judged, and the righteous wait out the consummation.',
       sv.verse_id, ev.verse_id, 'extras', 50359
  FROM _session250_en15_lookup sv, _session250_en15_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=15 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-15-watchers-petition-refused
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads back the very refusal of Enoch 15:2 — there is no intercession for the Watchers, only chains reserved unto the great day.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-watchers-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter, like Enoch 15:2, denies the angels any pardon: not spared, but reserved unto judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-watchers-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 10:5 — *And You know how Your Watchers, the fathers of these spirits, acted in my day: and as for these spirits which are living, imprison them and hold them fast in the place of condemnation, and let them not bring destruction on the sons of your servant, my Elohim (God); for these are malignant, and created in order to destroy.* The prayer Heaven answers is Noah''s against the Watchers, never the Watchers'' for themselves — the same refusal Enoch carries in 15:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-watchers-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-15-left-heaven-defiled-begat-giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Enoch 15:3 names these ''sons of Elohim'' as the Watchers and turns Moses'' line into a direct charge: ye left heaven and took to yourselves wives.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-left-heaven-defiled-begat-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants Enoch 15:3 says the Watchers ''begotten'' are Moses'' nephilim — the same offspring, the same crossing of kinds.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-left-heaven-defiled-begat-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees tells Enoch 15:3 in the same words — angels, chosen wives, giants begotten.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-left-heaven-defiled-begat-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 7:21 — *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness.* Noah names the sin Enoch 15:4 condemns — Watchers transgressing ''the law of their ordinances,'' rebellion against the Creator''s appointed order, not law made curse.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-left-heaven-defiled-begat-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-15-giants-become-evil-spirits
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* The restless, earth-bound spirit Yahusha (Jesus) describes is exactly Enoch 15:6''s giant-spirit whose dwelling is on the earth, seeking a body and finding no true home.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-giants-become-evil-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees shows the spirits of Enoch 15:7 already at work after the Flood — the surviving giant-spirits leading astray and destroying mankind.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-giants-become-evil-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 14:6 — *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation.* Wisdom remembers the proud giants of Enoch 15:6 perishing in the Flood while righteous seed was preserved in the ark.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-giants-become-evil-spirits'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-15-earthbound-spirits-till-the-judgement
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The mortality decreed on flesh in Genesis 6:3 is the very death Enoch 15:4-11 traces — the giants ''die and perish,'' and their spirits are loosed until the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-earthbound-spirits-till-the-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude''s ''judgment of the great day'' is Enoch 15:11''s ''great judgement in which the age shall be consummated, over the Watchers and the godless.'''
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-earthbound-spirits-till-the-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 16:4 — *Say to them therefore: “You have no peace.”* The next chapter seals the verdict Enoch 15:9-11 announces: the Watchers and their destroying spirits are granted no peace, only the consummation.'
  FROM cross_reference_threads t, cross_references x, _session250_en15_lookup sv, _session250_en15_lookup tv
 WHERE t.slug='1-enoch-15-earthbound-spirits-till-the-judgement'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=16 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

