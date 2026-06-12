-- ----- fragment: minion_therestofesther_14.sql (session253 the-rest-of-esther 14) -----
-- Source anchor: apocrypha/the-rest-of-esther ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: roe14 (view _session253_roe14_lookup). Sort band base 60500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_roe14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: rest-of-esther-14-sackcloth-and-ashes
  ('apocrypha', 'the-rest-of-esther', 14, 2, 'canon', 'joel', 2, 12, 'free', E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* The prophet''s call to fasting-and-mourning is the very rite Esther enacts in ashes and torn hair.'),
  ('apocrypha', 'the-rest-of-esther', 14, 2, 'canon', 'joel', 2, 13, 'free', E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* Esther''s humbled body and laid-away glory is the outward sign of the inward rending Joel demands.'),
  ('apocrypha', 'the-rest-of-esther', 14, 1, 'apocrypha', 'judith', 9, 1, 'extras', E'Judith 9:1 — *Judith fell upon her face, and put ashes upon her head, and uncovered the sackcloth with which she was clothed; and about the time that the incense of that evening was offered in Jerusalem in the house of Yahuah (God) Judith cried with a loud voice, and said,* Esther''s deliverer-sister begins her own intercession in the same ashes, fear of death turned into prayer.'),
  ('apocrypha', 'the-rest-of-esther', 14, 2, 'canon', 'matthew', 6, 17, 'free', E'Matthew 6:17 — *But thou, when thou fastest, anoint thine head, and wash thy face;* Esther''s secret, ash-strewn fast — joy laid aside for the Father alone — is the very hiddenness the Messiah commands.'),
  -- thread: rest-of-esther-14-no-helper-but-thee
  ('apocrypha', 'the-rest-of-esther', 14, 3, 'canon', 'psalms', 22, 11, 'free', E'Psalm 22:11 — *Be not far from me; for trouble is near; for there is none to help.* Esther''s ''no helper but thee'' is the Passion-psalm''s own none-to-help, the righteous left utterly alone with God.'),
  ('apocrypha', 'the-rest-of-esther', 14, 14, 'canon', 'psalms', 25, 16, 'free', E'Psalm 25:16 — *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted.* David''s desolate-and-afflicted plea is the same word Esther twice calls herself, the helpless turned wholly toward Yahuah.'),
  ('apocrypha', 'the-rest-of-esther', 14, 14, 'apocrypha', 'judith', 9, 11, 'extras', E'Judith 9:11 — *For your power stands not in multitude nor your might in strong men: for you are a Yahuah (God) of the afflicted, an helper of the oppressed, an upholder of the weak, a protector of the forlorn, a saviour of them that are without hope.* Judith confesses the very Helper-of-the-forlorn that Esther leans on, two women with no help but Him.'),
  -- thread: rest-of-esther-14-chosen-inheritance
  ('apocrypha', 'the-rest-of-esther', 14, 5, 'canon', 'exodus', 19, 5, 'free', E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* The peculiar-treasure of Sinai is the ''perpetual inheritance'' Esther was taught from her youth.'),
  ('apocrypha', 'the-rest-of-esther', 14, 5, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Israel taken ''from among all people'' is Moses'' chosen-above-all-people, the ground of Esther''s confidence.'),
  -- thread: rest-of-esther-14-we-have-sinned
  ('apocrypha', 'the-rest-of-esther', 14, 6, 'canon', 'daniel', 9, 5, 'free', E'Daniel 9:5 — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments:* Daniel''s confession in exile is Esther''s ''we have sinned before thee,'' the captive owning the covenant''s justice.'),
  ('apocrypha', 'the-rest-of-esther', 14, 7, 'canon', 'nehemiah', 9, 33, 'free', E'Nehemiah 9:33 — *Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly:* Esther''s ''O Yahuah, you are righteous'' echoes the post-exile confession that God is just even in the hand of the enemy.'),
  ('apocrypha', 'the-rest-of-esther', 14, 6, 'canon', 'leviticus', 26, 41, 'free', E'Leviticus 26:41 — *And that I also have walked contrary unto them, and have brought them into the land of their enemies; if then their uncircumcised hearts be humbled, and they then accept of the punishment of their iniquity:* The Torah foretold the giving-into-enemy-hands and the humbled heart that turns it back, the frame Esther prays inside.'),
  -- thread: rest-of-esther-14-sceptre-and-the-king-of-nations
  ('apocrypha', 'the-rest-of-esther', 14, 11, 'canon', 'psalms', 115, 4, 'free', E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* The ''them that be nothing'' Esther begs God not to crown are the lifeless hand-made idols the psalm exposes.'),
  ('apocrypha', 'the-rest-of-esther', 14, 12, 'canon', 'jeremiah', 10, 10, 'free', E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* The living everlasting King stands against the nothing-idols, the ''King of the nations'' Esther invokes.'),
  ('apocrypha', 'the-rest-of-esther', 14, 13, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* Esther asks God to ''turn his heart'' before the lion-king — the very thing Proverbs says is wholly in Yahuah''s hand.'),
  ('apocrypha', 'the-rest-of-esther', 14, 13, 'apocrypha', 'judith', 9, 13, 'extras', E'Judith 9:13 — *And make my speech and deceit to be their wound and stripe, who have purposed cruel things against your covenant, and your hallowed house, and against the top of Sion, and against the house of the possession of your children.* Judith too asks God to arm her speech against the enemy of the covenant, the sister-prayer to Esther''s ''eloquent speech before the lion.'''),
  -- thread: rest-of-esther-14-abhor-the-crown-and-the-table
  ('apocrypha', 'the-rest-of-esther', 14, 17, 'canon', 'daniel', 1, 8, 'free', E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Esther''s refusal of Aman''s table and the king''s wine is Daniel''s same purposed-heart refusal of the king''s defiling meat.'),
  ('apocrypha', 'the-rest-of-esther', 14, 15, 'canon', 'psalms', 119, 46, 'free', E'Psalm 119:46 — *I will speak of thy testimonies also before kings, and will not be ashamed.* Esther''s abhorrence of heathen glory before a heathen throne is the psalmist''s unashamed witness of the testimonies before kings.'),
  ('apocrypha', 'the-rest-of-esther', 14, 18, 'canon', 'psalms', 25, 16, 'free', E'Psalm 25:16 — *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted.* Esther''s joy ''only in Yahuah God of Abraham'' amid the king''s feast is the desolate one''s single turning toward Him.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_roe14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_roe14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-14-sackcloth-and-ashes',
       E'She laid away her glorious apparel and covered her head with ashes',
       E'Before she dares the king''s gate, the queen strips off the crown''s splendour and goes down into mourning: *And laid away her glorious apparel, and put on the garments of anguish and mourning: and instead of precious ointments, she covered her head with ashes and dung, and she humbled her body greatly, and all the places of her joy she filled with her torn hair.* (the-rest-of-esther 14:2). It ain''t new — this is the prophets'' own liturgy of repentance, *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12), the heart rent and not the garment. Her sister-deliverer Judith does the same before her own peril: *Judith fell upon her face, and put ashes upon her head, and uncovered the sackcloth with which she was clothed* (Judith 9:1). And the Messiah seals that the fast is for the Father and not for show: *But thou, when thou fastest, anoint thine head, and wash thy face* (Matthew 6:17).',
       sv.verse_id, ev.verse_id, 'extras', 60500
  FROM _session253_roe14_lookup sv, _session253_roe14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=14 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-14-no-helper-but-thee',
       E'Help me, desolate woman, which have no helper but thee',
       E'She names herself by her need: *And she prayed to Yahuah (God) of Yashar''el (Israel), saying, O my Elohim (God), you only art our King: help me, desolate woman, which have no helper but you* (the-rest-of-esther 14:3), and again *help me that am desolate, and which have no other help but you* (the-rest-of-esther 14:14). This is the cry of the forsaken Psalter — *Be not far from me; for trouble is near; for there is none to help* (Psalm 22:11) — and *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted* (Psalm 25:16). Judith names the same God: *you are a Yahuah (God) of the afflicted, an helper of the oppressed, an upholder of the weak, a protector of the forlorn, a saviour of them that are without hope* (Judith 9:11).',
       sv.verse_id, ev.verse_id, 'extras', 60503
  FROM _session253_roe14_lookup sv, _session253_roe14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=14 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-14-chosen-inheritance',
       E'Thou tookest Israel for a perpetual inheritance',
       E'Her plea is grounded in election: *From my youth up I have heard in the tribe of my family that you, O Yahuah (God), tookest Yashar''el (Israel) from among all people, and our fathers from all their predecessors, for a perpetual inheritance, and you have performed whatsoever you did promise them* (the-rest-of-esther 14:5). It ain''t new — this is Sinai''s own word, *if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people* (Exodus 19:5), and *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6). The election stands; the seed is kept.',
       sv.verse_id, ev.verse_id, 'extras', 60506
  FROM _session253_roe14_lookup sv, _session253_roe14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=14 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-14-we-have-sinned',
       E'We have sinned before thee — thou art righteous',
       E'Like every true intercessor she confesses for her people before she asks: *And now we have sinned before you: therefore have you given us into the hands of our enemies, Because we worshipped their gods: O Yahuah (God), you are righteous* (the-rest-of-esther 14:6-7). This is Daniel''s prayer breath for breath — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments* (Daniel 9:5) — and Nehemiah''s, *Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly* (Nehemiah 9:33). The Torah named the captivity beforehand, healed by the humbled heart: *if then their uncircumcised hearts be humbled, and they then accept of the punishment of their iniquity* (Leviticus 26:41). Mercy is real, never cheap.',
       sv.verse_id, ev.verse_id, 'extras', 60509
  FROM _session253_roe14_lookup sv, _session253_roe14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=14 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-14-sceptre-and-the-king-of-nations',
       E'Give not thy sceptre to them that be nothing',
       E'She wars not against flesh but against the system of dead gods: *O Yahuah (God), give not your sceptre to them that be nothing, and let them not laugh at our fall* (the-rest-of-esther 14:11), pleading to the *King of the nations, and Yahuah (God) of all power* (14:12) and asking that the king''s heart be turned: *Give me eloquent speech in my mouth before the lion: turn his heart to hate him that fighteth against us* (14:13). The idols ''that be nothing'' are the mouthless, eyeless work of hands — *Their idols are silver and gold, the work of men''s hands. They have mouths, but they speak not* (Psalm 115:4-5) — over against *Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king* (Jeremiah 10:10). And the heathen lion''s heart is His to turn: *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1).',
       sv.verse_id, ev.verse_id, 'extras', 60512
  FROM _session253_roe14_lookup sv, _session253_roe14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=14 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-14-abhor-the-crown-and-the-table',
       E'I abhor the crown and the table of the uncircumcised',
       E'Her hidden Torah-faithfulness is laid bare: *you know that I hate the glory of the unrighteous, and abhor the bed of the uncircumcised, and of all the heathen* (the-rest-of-esther 14:15); she abhors the diadem itself, *I abhor it as a menstruous rag* (14:16), and she keeps the dietary line in the heart of the palace — *yours handmaid has not eaten at Aman''s table, and that I have not greatly esteemed the king''s feast, nor drunk the wine of the drink offerings* (14:17). This is Daniel in Babylon: *Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank* (Daniel 1:8). And it is the unashamed confession before kings, *I will speak of thy testimonies also before kings, and will not be ashamed* (Psalm 119:46). The crown abhorred, the heart''s joy only in *Yahuah (God) of Abraham* (14:18).',
       sv.verse_id, ev.verse_id, 'extras', 60515
  FROM _session253_roe14_lookup sv, _session253_roe14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=14 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: rest-of-esther-14-sackcloth-and-ashes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* The prophet''s call to fasting-and-mourning is the very rite Esther enacts in ashes and torn hair.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sackcloth-and-ashes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:13 — *And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil.* Esther''s humbled body and laid-away glory is the outward sign of the inward rending Joel demands.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sackcloth-and-ashes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judith 9:1 — *Judith fell upon her face, and put ashes upon her head, and uncovered the sackcloth with which she was clothed; and about the time that the incense of that evening was offered in Jerusalem in the house of Yahuah (God) Judith cried with a loud voice, and said,* Esther''s deliverer-sister begins her own intercession in the same ashes, fear of death turned into prayer.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sackcloth-and-ashes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='judith' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 6:17 — *But thou, when thou fastest, anoint thine head, and wash thy face;* Esther''s secret, ash-strewn fast — joy laid aside for the Father alone — is the very hiddenness the Messiah commands.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sackcloth-and-ashes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-14-no-helper-but-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 22:11 — *Be not far from me; for trouble is near; for there is none to help.* Esther''s ''no helper but thee'' is the Passion-psalm''s own none-to-help, the righteous left utterly alone with God.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-no-helper-but-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 25:16 — *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted.* David''s desolate-and-afflicted plea is the same word Esther twice calls herself, the helpless turned wholly toward Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-no-helper-but-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judith 9:11 — *For your power stands not in multitude nor your might in strong men: for you are a Yahuah (God) of the afflicted, an helper of the oppressed, an upholder of the weak, a protector of the forlorn, a saviour of them that are without hope.* Judith confesses the very Helper-of-the-forlorn that Esther leans on, two women with no help but Him.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-no-helper-but-thee'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='judith' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-14-chosen-inheritance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* The peculiar-treasure of Sinai is the ''perpetual inheritance'' Esther was taught from her youth.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-chosen-inheritance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* Israel taken ''from among all people'' is Moses'' chosen-above-all-people, the ground of Esther''s confidence.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-chosen-inheritance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-14-we-have-sinned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:5 — *We have sinned, and have committed iniquity, and have done wickedly, and have rebelled, even by departing from thy precepts and from thy judgments:* Daniel''s confession in exile is Esther''s ''we have sinned before thee,'' the captive owning the covenant''s justice.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-we-have-sinned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 9:33 — *Howbeit thou art just in all that is brought upon us; for thou hast done right, but we have done wickedly:* Esther''s ''O Yahuah, you are righteous'' echoes the post-exile confession that God is just even in the hand of the enemy.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-we-have-sinned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 26:41 — *And that I also have walked contrary unto them, and have brought them into the land of their enemies; if then their uncircumcised hearts be humbled, and they then accept of the punishment of their iniquity:* The Torah foretold the giving-into-enemy-hands and the humbled heart that turns it back, the frame Esther prays inside.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-we-have-sinned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-14-sceptre-and-the-king-of-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* The ''them that be nothing'' Esther begs God not to crown are the lifeless hand-made idols the psalm exposes.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sceptre-and-the-king-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* The living everlasting King stands against the nothing-idols, the ''King of the nations'' Esther invokes.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sceptre-and-the-king-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* Esther asks God to ''turn his heart'' before the lion-king — the very thing Proverbs says is wholly in Yahuah''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sceptre-and-the-king-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Judith 9:13 — *And make my speech and deceit to be their wound and stripe, who have purposed cruel things against your covenant, and your hallowed house, and against the top of Sion, and against the house of the possession of your children.* Judith too asks God to arm her speech against the enemy of the covenant, the sister-prayer to Esther''s ''eloquent speech before the lion.'''
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-sceptre-and-the-king-of-nations'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='judith' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-14-abhor-the-crown-and-the-table
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Esther''s refusal of Aman''s table and the king''s wine is Daniel''s same purposed-heart refusal of the king''s defiling meat.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-abhor-the-crown-and-the-table'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 119:46 — *I will speak of thy testimonies also before kings, and will not be ashamed.* Esther''s abhorrence of heathen glory before a heathen throne is the psalmist''s unashamed witness of the testimonies before kings.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-abhor-the-crown-and-the-table'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 25:16 — *Turn thee unto me, and have mercy upon me; for I am desolate and afflicted.* Esther''s joy ''only in Yahuah God of Abraham'' amid the king''s feast is the desolate one''s single turning toward Him.'
  FROM cross_reference_threads t, cross_references x, _session253_roe14_lookup sv, _session253_roe14_lookup tv
 WHERE t.slug='rest-of-esther-14-abhor-the-crown-and-the-table'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

