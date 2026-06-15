-- ----- fragment: minion_exodus_5.sql (Exodus 5) -----
-- Chapter: Exodus 5 — "Who is Yahuah, that I should obey his voice?"; bricks without straw;
--   the bondage deepened; Moses' complaint.  Tag: ex05.  Session prefix: s305.
--   Sort band base 29100 (step 3): 29100, 29103, 29106, 29109.
--
-- Exodus 5 coverage:
--   v.1   (Let my people go, that they may hold a feast unto me in the wilderness)
--         NT:     none warranted (the feast-purpose is carried laterally; see thread 1)
--         Extras: Jasher 79:48 (three days in the wilderness to sacrifice) — thread 1
--         Tanakh: Exod 7:5 / 14:4 know-that-I-am-Yahuah (thread 2) — feast-purpose framed in thread 1 prose
--   v.2   (Who is Yahuah... I know not Yahuah, neither will I let Yashar'el go) ★
--         NT:     1 Cor — none; 2 Thessalonians 1:8 (them that know not Elohim) — thread 1
--         Extras: Jasher 79:44 + 79:46 (I have not found the name... I know not Yahuah) — thread 1
--         Tanakh: 1 Samuel 2:12 (sons of Belial, they knew not Yahuah); Psalm 14:1 (fool: no Elohim) — thread 1
--                 Exod 7:5; 14:4 (the Egyptians SHALL know that I am Yahuah) — thread 2
--   v.6-19 (bricks without straw; let more work be laid upon the men) ★
--         NT:     none warranted (restrained; pattern of affliction-before-deliverance)
--         Extras: Jasher 79:52 (ordered the labor more severe than yesterday) — thread 3
--         Tanakh: Exodus 2:23-24 (the groaning that came up unto Elohim) — thread 3 (lateral)
--   v.20-23 (Moses' complaint: wherefore hast thou so evil entreated this people?) ★
--         NT:     none warranted (the prophet's lament answered in ch6, not the NT)
--         Extras: Jasher 79:54 (Why have you ill treated your people?) — thread 4
--         Tanakh: Habakkuk 1:2-3; Psalm 13:1; Jeremiah 20:7 (the sent one's why-hast-thou) — thread 4
--
-- Threads (4):
--   1. exodus-5-who-is-yahuah-that-i-should-obey   (5:1-2)   tier=extras  [canon: 1Sam2:12, Ps14:1, 2Thess1:8 | extras: Jasher 79:44,46,48]
--   2. exodus-5-the-egyptians-shall-know-i-am-yahuah (5:2)   tier=free    [canon: Exod7:5, Exod14:4]
--   3. exodus-5-bricks-without-straw                (5:6-19)  tier=extras  [canon: Exod2:23, Exod2:24 | extras: Jasher 79:52]
--   4. exodus-5-wherefore-hast-thou-so-evil-entreated (5:20-23) tier=extras [canon: Hab1:2, Ps13:1, Jer20:7 | extras: Jasher 79:54]
--
-- Framework notes:
--   * 5:1-2 — the let-my-people-go demand is UNTO worship/the feast (Lev 23 appointed-times
--     purpose of the Exodus); Pharaoh's "who is Yahuah" / "I know not Yahuah" is the archetype
--     of the proud who will be brought to KNOW the Name. Jasher gives the same scene almost
--     verbatim (he searches his records, cannot find the Name, declares "I know not Yahuah").
--   * 5:2 answered by 7:5 / 14:4 — the plagues and the sea exist so "the Egyptians SHALL know
--     that I am Yahuah." Defiant ignorance overturned into forced knowledge.
--   * 5:6-19 — bondage made heavier the moment deliverance is announced; lateral to the
--     groaning of 2:23-24. Restrained: the tightening of the oppressor's grip just before he breaks.
--   * 5:20-23 — the sent one's honest "why hast thou" lament; lateral to Habakkuk, Psalm 13,
--     Jeremiah 20. Yahuah's answer is ch6 (the covenant Name + the seven I-wills).

CREATE TEMP VIEW _s305_ex05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =========================================================================================
-- B. cross_references
-- =========================================================================================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: who is Yahuah / I know not Yahuah (5:1-2)
    ('canon','exodus',5,2,'canon','1-samuel',2,12,'free',
      E'*Now the sons of Eli were sons of Belial; they knew not Yahuah (LORD).* (1 Samuel 2:12) Pharaoh''s *Who is Yahuah (LORD), that I should obey his voice... I know not Yahuah (LORD)* (Exodus 5:2) is the same root posture: not honest doubt but the contempt of the proud who will not bow. The sons of Belial wear the priest''s robe and still *knew not Yahuah* — willful ignorance of the Name is the mark of the one set against the covenant.'),
    ('canon','exodus',5,2,'canon','psalms',14,1,'free',
      E'*The fool hath said in his heart, There is no Elohim (God). They are corrupt, they have done abominable works, there is none that doeth good.* (Psalm 14:1) Pharaoh''s *I know not Yahuah (LORD), neither will I let Yashar''el (Israel) go* (Exodus 5:2) is that fool''s creed turned against the deliverer. To deny the Name is never neutral — it issues at once in *abominable works*, here the crushing of Yahuah''s firstborn son.'),
    ('canon','exodus',5,2,'canon','2-thessalonians',1,8,'free',
      E'*In flaming fire taking vengeance on them that know not Elohim (God), and that obey not the gospel of our Lord Yahusha HaMashiach (Lord Jesus Christ):* (2 Thessalonians 1:8) The judgment falls on *them that know not Elohim* — the very category Pharaoh names for himself: *I know not Yahuah (LORD)* (Exodus 5:2). The plagues that answer his boast are the down-payment of that flaming-fire vengeance reserved for every proud power that will not know the Name.'),
    ('canon','exodus',5,2,'jasher','jasher',79,44,'extras',
      E'*And Pharaoh said to Moses and Aaron, Behold I have not found the name of your Elohim written in this book, and his name I know not.* (Jasher 79:44) Jasher retells the very scene: Pharaoh ransacks the chronicles of Egypt''s kings for the Name and cannot find it. His *I know not Yahuah (LORD)* (Exodus 5:2) is here shown as a deliberate search that turns up empty because Yahuah is no idol catalogued among the dead gods of Egypt.'),
    ('canon','exodus',5,2,'jasher','jasher',79,46,'extras',
      E'*And Pharaoh turned to Moses and Aaron and said to them, I know not Yahuah (the Lord) whom you have declared, neither will I send his people.* (Jasher 79:46) Almost word for word with *I know not Yahuah (LORD), neither will I let Yashar''el (Israel) go* (Exodus 5:2). The restored witness preserves the same defiant pairing — ignorance of the Name welded to refusal to release the people.'),
    ('canon','exodus',5,1,'jasher','jasher',79,48,'extras',
      E'*Now therefore send us, that we may take a journey for three days in the wilderness, and there may sacrifice to him, for from the days of our going down to Egypt, he has not taken from our hands either burnt offering, oblation or sacrifice...* (Jasher 79:48) This unfolds the purpose behind *Let my people go, that they may hold a feast unto me in the wilderness* (Exodus 5:1): the Exodus is FOR worship — the wilderness sacrifice, the appointed feast unto Yahuah, owed since Egypt swallowed them.'),
    -- Thread 2: the Egyptians shall know that I am Yahuah (5:2 answered)
    ('canon','exodus',5,2,'canon','exodus',7,5,'free',
      E'*And the Egyptians shall know that I am Yahuah (LORD), when I stretch forth mine hand upon Egypt, and bring out the children of Yashar''el (Israel) from among them.* (Exodus 7:5) This is the direct answer to *Who is Yahuah... I know not Yahuah* (Exodus 5:2). The boast is overturned point for point: the proud "I know not" becomes the forced *the Egyptians shall know that I am Yahuah*. The plagues exist to teach the Name Pharaoh refused.'),
    ('canon','exodus',5,2,'canon','exodus',14,4,'free',
      E'*And I will harden Pharaoh''s heart, that he shall follow after them; and I will be honoured upon Pharaoh, and upon all his host; that the Egyptians may know that I am Yahuah (LORD). And they did so.* (Exodus 14:4) At the sea the same purpose is sealed: *that the Egyptians may know that I am Yahuah*. The arc that opens with Pharaoh''s contemptuous *I know not Yahuah (LORD)* (Exodus 5:2) closes with all Egypt drowned in the knowledge of the Name they would not honour.'),
    -- Thread 3: bricks without straw (5:6-19)
    ('canon','exodus',5,7,'canon','exodus',2,23,'free',
      E'*And it came to pass in process of time, that the king of Egypt died: and the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage.* (Exodus 2:23) The straw withdrawn and the tale of bricks unchanged — *Ye shall no more give the people straw to make brick... yet not ought of your work shall be diminished* (Exodus 5:7) — deepens the very *bondage* whose groaning had already risen to Yahuah. The affliction tightens just before the redeemer''s hand is bared.'),
    ('canon','exodus',5,9,'canon','exodus',2,24,'free',
      E'*And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* (Exodus 2:24) Pharaoh''s *Let there more work be laid upon the men, that they may labour therein* (Exodus 5:9) only swells the groaning that Yahuah has already heard and bound to His covenant with the fathers. The heavier the burden, the nearer the remembered promise — the oppressor''s grip clenches hardest the moment before it is broken.'),
    ('canon','exodus',5,9,'jasher','jasher',79,52,'extras',
      E'*And he drove them from him, and he ordered the labor upon Israel to be more severe than it was yesterday and before.* (Jasher 79:52) The restored account names the same cruelty as *Let there more work be laid upon the men* (Exodus 5:9): the announcement of deliverance is answered by Pharaoh with intensified bondage — the tyrant''s instinct to crush harder the people he is about to lose.'),
    -- Thread 4: Moses' complaint — wherefore hast thou so evil entreated (5:20-23)
    ('canon','exodus',5,22,'canon','habakkuk',1,2,'free',
      E'*O Yahuah (LORD), how long shall I cry, and thou wilt not hear! even cry out unto thee of violence, and thou wilt not save!* (Habakkuk 1:2) Moses'' *Yahuah (Lord), wherefore hast thou so evil entreated this people? why is it that thou hast sent me?* (Exodus 5:22) is the same honest lament of the sent one — the prophet who cries out when deliverance seems only to deepen the violence. The complaint is not unbelief; it is faith pressing Yahuah for the salvation He promised.'),
    ('canon','exodus',5,22,'canon','psalms',13,1,'free',
      E'*How long wilt thou forget me, O Yahuah (LORD)? for ever? how long wilt thou hide thy face from me?* (Psalm 13:1) Moses'' *wherefore hast thou so evil entreated this people?* (Exodus 5:22) sings in the same key — the believer who feels forgotten while the enemy is exalted. The Psalter validates the lament: such crying out is the covenant''s own language, not its breach.'),
    ('canon','exodus',5,22,'canon','jeremiah',20,7,'free',
      E'*O Yahuah (LORD), thou hast deceived me, and I was deceived: thou art stronger than I, and hast prevailed: I am in derision daily, every one mocketh me.* (Jeremiah 20:7) Jeremiah''s anguish at being SENT into reproach matches Moses'' *why is it that thou hast sent me?* (Exodus 5:22). Both prophets pour out the bitterness of obedience that seems only to worsen the affliction — and both are answered, not rebuked, by the One who sent them.'),
    ('canon','exodus',5,23,'jasher','jasher',79,54,'extras',
      E'*And Moses returned to Yahuah (the Lord) and said, Why have you ill treated your people? for since I came to speak to Pharaoh what you did send me for, he has exceedingly ill used the children of Israel.* (Jasher 79:54) The restored witness gives Moses'' complaint in the same breath as *he hath done evil to this people; neither hast thou delivered thy people at all* (Exodus 5:23) — the sent one''s honest grief that his obedience has, so far, only made the bondage heavier.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =========================================================================================
-- C. cross_reference_threads
-- =========================================================================================
-- Thread 1: who is Yahuah, that I should obey (5:1-2)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-5-who-is-yahuah-that-i-should-obey',
       E'Who is Yahuah, that I should obey? — the proud who will be made to know the Name',
       E'The demand is for worship: *Let my people go, that they may hold a feast unto me in the wilderness* (Exodus 5:1). The Exodus is not merely an escape from labour but a release UNTO the appointed feast — the same purpose Jasher preserves, *that we may take a journey for three days in the wilderness, and there may sacrifice to him* (Jasher 79:48). Pharaoh answers with the archetypal contempt of the proud: *Who is Yahuah (LORD), that I should obey his voice to let Yashar''el (Israel) go? I know not Yahuah (LORD), neither will I let Yashar''el (Israel) go* (Exodus 5:2). The restored Jasher shows this is no idle word — he searches the chronicles of Egypt''s kings for the Name and comes up empty: *Behold I have not found the name of your Elohim written in this book, and his name I know not* (Jasher 79:44), then declares almost verbatim with Moses, *I know not Yahuah (the Lord) whom you have declared, neither will I send his people* (Jasher 79:46). This willful ignorance of the Name is the canon''s signature of the covenant''s enemies: *Now the sons of Eli were sons of Belial; they knew not Yahuah (LORD)* (1 Samuel 2:12), and *The fool hath said in his heart, There is no Elohim (God)... there is none that doeth good* (Psalm 14:1). It runs forward to the final reckoning, when the flaming fire takes *vengeance on them that know not Elohim (God), and that obey not the gospel of our Lord Yahusha HaMashiach (Lord Jesus Christ)* (2 Thessalonians 1:8). Pharaoh''s "I know not" is the boast of every proud power that refuses to bow — and the whole book of the plagues exists to overturn it into the knowledge it would not give.',
       sv.verse_id, ev.verse_id, 'extras', 29100
  FROM _s305_ex05_lookup sv, _s305_ex05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- Thread 2: the Egyptians shall know that I am Yahuah (5:2)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-5-the-egyptians-shall-know-i-am-yahuah',
       E'I know not Yahuah — answered: that the Egyptians may know that I am Yahuah',
       E'Pharaoh''s defiant *I know not Yahuah (LORD), neither will I let Yashar''el (Israel) go* (Exodus 5:2) is a boast the rest of the book exists to demolish. Yahuah names the very purpose of the plagues as the undoing of that ignorance: *And the Egyptians shall know that I am Yahuah (LORD), when I stretch forth mine hand upon Egypt, and bring out the children of Yashar''el (Israel) from among them* (Exodus 7:5). The arc is sealed at the sea: *I will be honoured upon Pharaoh, and upon all his host; that the Egyptians may know that I am Yahuah (LORD)* (Exodus 14:4). What opens as a proud "I know not" is overturned, point for point, into a forced "they shall know" — the Name Pharaoh would not honour is graven into Egypt by ten judgments and the drowning of the sea. The Most High will be known: by the willing, in worship; by the proud, in judgment.',
       sv.verse_id, ev.verse_id, 'free', 29103
  FROM _s305_ex05_lookup sv, _s305_ex05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=5 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- Thread 3: bricks without straw (5:6-19)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-5-bricks-without-straw',
       E'Bricks without straw — the bondage made heavier just before it breaks',
       E'When deliverance is announced the oppressor''s grip clenches harder. Pharaoh commands *Ye shall no more give the people straw to make brick, as heretofore: let them go and gather straw for themselves* (Exodus 5:7), and yet the full tale of bricks must stand: *Let there more work be laid upon the men, that they may labour therein* (Exodus 5:9). The burden does not lighten at the word of freedom — it doubles. Yet this very deepening of the bondage runs straight back to the cry Yahuah has already heard: *the children of Yashar''el (Israel) sighed by reason of the bondage, and they cried, and their cry came up unto Elohim (God) by reason of the bondage* (Exodus 2:23), *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob* (Exodus 2:24). The restored Jasher records the same cruelty: *he ordered the labor upon Israel to be more severe than it was yesterday and before* (Jasher 79:52). The pattern is set for the whole canon — the affliction tightens hardest in the hour before the redeemer''s hand is bared. The remembered covenant does not fail because the burden grows; the heavier the brick-tale, the nearer the promise to the fathers.',
       sv.verse_id, ev.verse_id, 'extras', 29106
  FROM _s305_ex05_lookup sv, _s305_ex05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=5 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- Thread 4: Moses' complaint (5:20-23)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-5-wherefore-hast-thou-so-evil-entreated',
       E'Wherefore hast thou so evil entreated this people? — the sent one''s honest lament',
       E'When obedience seems only to worsen the affliction, the sent one cries out. The officers turn on Moses (*Yahuah (LORD) look upon you, and judge*, Exodus 5:21), and Moses turns to Yahuah: *Yahuah (Lord), wherefore hast thou so evil entreated this people? why is it that thou hast sent me? For since I came to Pharaoh to speak in thy name, he hath done evil to this people; neither hast thou delivered thy people at all* (Exodus 5:22-23). The restored Jasher carries the same complaint: *Why have you ill treated your people? for since I came to speak to Pharaoh what you did send me for, he has exceedingly ill used the children of Israel* (Jasher 79:54). This is not the speech of unbelief but the covenant''s own honest language, the prophet pressing Yahuah for the salvation He promised. Habakkuk cries it — *O Yahuah (LORD), how long shall I cry, and thou wilt not hear!* (Habakkuk 1:2); the Psalmist sings it — *How long wilt thou forget me, O Yahuah (LORD)? for ever?* (Psalm 13:1); and Jeremiah, sent into reproach, pours it out — *O Yahuah (LORD), thou hast deceived me... I am in derision daily, every one mocketh me* (Jeremiah 20:7). Each sent one is answered, not rebuked. Moses'' answer comes at once in the next chapter — the covenant Name spoken afresh and the seven I-wills of deliverance (Exodus 6).',
       sv.verse_id, ev.verse_id, 'extras', 29109
  FROM _s305_ex05_lookup sv, _s305_ex05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=5 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=5 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- =========================================================================================
-- D. cross_reference_thread_members
-- =========================================================================================
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (2,'canon','1-samuel',2,12,1,E'*they knew not Yahuah (LORD)* (1 Samuel 2:12) — the sons of Belial wear the priest''s robe yet share Pharaoh''s contempt of the Name; willful ignorance of Yahuah marks the covenant''s enemies.'),
    (2,'canon','psalms',14,1,2,E'*The fool hath said in his heart, There is no Elohim (God)... there is none that doeth good* (Psalm 14:1) — the denial of the Name is never neutral; it issues at once in abominable works, here the crushing of Yahuah''s firstborn.'),
    (2,'canon','2-thessalonians',1,8,3,E'*taking vengeance on them that know not Elohim (God)* (2 Thessalonians 1:8) — Pharaoh names his own category, *I know not Yahuah*; the plagues are the down-payment of the flaming-fire reckoning on every proud power that will not know the Name.'),
    (2,'jasher','jasher',79,44,4,E'*Behold I have not found the name of your Elohim written in this book, and his name I know not* (Jasher 79:44) — the restored scene: Pharaoh ransacks Egypt''s royal chronicles for the Name and finds nothing, for Yahuah is no idol catalogued among the dead gods.'),
    (2,'jasher','jasher',79,46,5,E'*I know not Yahuah (the Lord) whom you have declared, neither will I send his people* (Jasher 79:46) — almost word for word with Exodus 5:2; ignorance of the Name welded to refusal to release the people.'),
    (1,'jasher','jasher',79,48,6,E'*that we may take a journey for three days in the wilderness, and there may sacrifice to him* (Jasher 79:48) — unfolds *that they may hold a feast unto me* (Exodus 5:1): the Exodus is FOR worship, the appointed sacrifice owed since Egypt.')
  ) AS m(src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-5-who-is-yahuah-that-i-should-obey'
  JOIN _s305_ex05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=5 AND sv.verse_number=m.src_v
  JOIN _s305_ex05_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-5-who-is-yahuah-that-i-should-obey'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (7,5,1,E'*the Egyptians shall know that I am Yahuah (LORD)* (Exodus 7:5) — the direct answer to *I know not Yahuah*: the proud "I know not" overturned into the forced "they shall know."'),
    (14,4,2,E'*that the Egyptians may know that I am Yahuah (LORD)* (Exodus 14:4) — at the sea the arc is sealed; the Name Pharaoh would not honour is graven into Egypt by judgment.')
  ) AS m(tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-5-the-egyptians-shall-know-i-am-yahuah'
  JOIN _s305_ex05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=5 AND sv.verse_number=2
  JOIN _s305_ex05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (7,'canon','exodus',2,23,1,E'*their cry came up unto Elohim (God) by reason of the bondage* (Exodus 2:23) — the straw withdrawn deepens the very bondage whose groaning had already risen to Yahuah.'),
    (9,'canon','exodus',2,24,2,E'*Elohim (God) heard their groaning, and... remembered his covenant with Abraham, with Isaac, and with Jacob* (Exodus 2:24) — the heavier the burden, the nearer the remembered promise to the fathers.'),
    (9,'jasher','jasher',79,52,3,E'*he ordered the labor upon Israel to be more severe than it was yesterday and before* (Jasher 79:52) — the restored witness names the same cruelty: deliverance announced, bondage intensified.')
  ) AS m(src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-5-bricks-without-straw'
  JOIN _s305_ex05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=5 AND sv.verse_number=m.src_v
  JOIN _s305_ex05_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-5-bricks-without-straw'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (22,'canon','habakkuk',1,2,1,E'*O Yahuah (LORD), how long shall I cry, and thou wilt not hear!* (Habakkuk 1:2) — the sent one''s honest lament; faith pressing Yahuah for the salvation He promised, not unbelief.'),
    (22,'canon','psalms',13,1,2,E'*How long wilt thou forget me, O Yahuah (LORD)? for ever?* (Psalm 13:1) — the Psalter validates the cry of the one who feels forgotten while the enemy is exalted.'),
    (22,'canon','jeremiah',20,7,3,E'*thou hast deceived me... I am in derision daily, every one mocketh me* (Jeremiah 20:7) — Jeremiah''s anguish at being SENT into reproach matches Moses'' *why is it that thou hast sent me?*'),
    (23,'jasher','jasher',79,54,4,E'*Why have you ill treated your people? for since I came to speak to Pharaoh... he has exceedingly ill used the children of Israel* (Jasher 79:54) — the restored witness gives Moses'' grief in the same breath as Exodus 5:23.')
  ) AS m(src_v,tgt_ed,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-5-wherefore-hast-thou-so-evil-entreated'
  JOIN _s305_ex05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=5 AND sv.verse_number=m.src_v
  JOIN _s305_ex05_lookup tv ON tv.edition_slug=m.tgt_ed AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-5-wherefore-hast-thou-so-evil-entreated'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
