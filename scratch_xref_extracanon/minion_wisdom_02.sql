-- ----- fragment: minion_thewisdomofsolomon_02.sql (session253 the-wisdom-of-solomon 2) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis02 (view _session253_wis02_lookup). Sort band base 58025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-2-suffering-righteous-passion
  ('apocrypha', 'the-wisdom-of-solomon', 2, 13, 'canon', 'matthew', 27, 43, 'free', E'Matthew 27:43 — *He trusted in Elohim (God); let him deliver him now, if he will have him: for he said, I am the Son of Elohim (God).* The mockers at the cross speak the ungodly''s reasoning of Wisdom of Solomon 2:13 almost word for word — the righteous one who calls himself the child of Yahuah.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 18, 'canon', 'psalms', 22, 8, 'free', E'Psalm 22:8 — *He trusted on Yahuah (LORD) that he would deliver him: let him deliver him, seeing he delighted in him.* The taunt ''if the just man be the son of Yahuah, he will help him'' of Wisdom of Solomon 2:18 is the psalmist''s scornful ''let him deliver him.'''),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 20, 'canon', 'john', 19, 7, 'free', E'John 19:7 — *The Yahudim (Jews) answered him, We have a law, and by our law he ought to die, because he made himself the Son of Elohim (God).* The shameful-death verdict of Wisdom of Solomon 2:20 is pressed on the exact ground that he made himself the Son of Elohim.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 19, 'canon', 'isaiah', 53, 7, 'free', E'Isaiah 53:7 — *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* The despite, torture, and meekness tested in Wisdom of Solomon 2:19 is the silent Lamb of Isaiah''s suffering servant.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 12, 'canon', 'isaiah', 3, 10, 'free', E'Isaiah 3:10 — *Say ye to the righteous, that it shall be well with him: for they shall eat the fruit of their doings.* The ungodly''s lying-in-wait for the righteous in Wisdom of Solomon 2:12 inverts the prophet''s promise that it shall be well with the just.'),
  -- thread: wisdom-2-the-falsely-condemned-just
  ('apocrypha', 'the-wisdom-of-solomon', 2, 20, 'canon', 'james', 5, 6, 'free', E'James 5:6 — *Ye have condemned and killed the just; and he doth not resist you.* James names the very crime the ungodly plot in Wisdom of Solomon 2:20 — condemning the unresisting righteous one to death.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 19, 'apocrypha', 'the-history-of-susanna', 1, 28, 'extras', E'The History of Susanna 1:28 — *And it came to pass the next day, when the people were assembled to her husband Joacim, the two elders came also full of mischievous imagination against Susanna to put her to death.* Susanna''s accusers act out the despiteful examination of the righteous in Wisdom of Solomon 2:19.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 18, 'apocrypha', 'the-history-of-susanna', 1, 60, 'extras', E'The History of Susanna 1:60 — *With that all the assembly cried out with a loud voice, and praised Yahuah (God), who saves them that trust in him.* Susanna''s deliverance answers the ungodly''s wager in Wisdom of Solomon 2:18 — the just man''s Elohim does help him.'),
  -- thread: wisdom-2-let-us-eat-and-drink
  ('apocrypha', 'the-wisdom-of-solomon', 2, 6, 'canon', 'isaiah', 22, 13, 'free', E'Isaiah 22:13 — *And behold joy and gladness, slaying oxen, and killing sheep, eating flesh, and drinking wine: let us eat and drink; for to morrow we shall die.* The ''let us enjoy the good things that are present'' of Wisdom of Solomon 2:6 is the very feast the prophet rebukes.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 6, 'canon', '1-corinthians', 15, 32, 'free', E'1 Corinthians 15:32 — *If after the manner of men I have fought with beasts at Ephesus, what advantageth it me, if the dead rise not? let us eat and drink; for to morrow we die.* Paul ties this creed to denying the resurrection — exactly the ''no returning'' reasoning behind Wisdom of Solomon 2:6.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 9, 'canon', 'luke', 12, 19, 'free', E'Luke 12:19 — *And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry.* The rich fool''s portion echoes ''this is our portion, and our lot is this'' of Wisdom of Solomon 2:9.'),
  -- thread: wisdom-2-oppress-the-poor-righteous
  ('apocrypha', 'the-wisdom-of-solomon', 2, 10, 'canon', 'amos', 2, 6, 'free', E'Amos 2:6 — *Thus saith Yahuah (LORD); For three transgressions of Yashar''el (Israel), and for four, I will not turn away the punishment thereof; because they sold the righteous for silver, and the poor for a pair of shoes.* The oppression of the poor righteous man in Wisdom of Solomon 2:10 is the sin Yahuah swears to judge.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 10, 'canon', 'amos', 2, 7, 'free', E'Amos 2:7 — *That pant after the dust of the earth on the head of the poor, and turn aside the way of the meek: and a man and his father will go in unto the same maid, to profane my holy name.* The trampling of the poor and the meek answers the unsparing cruelty of Wisdom of Solomon 2:10.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 11, 'canon', 'james', 5, 6, 'free', E'James 5:6 — *Ye have condemned and killed the just; and he doth not resist you.* Making strength ''the law of justice'' in Wisdom of Solomon 2:11 ends in the condemned and unresisting just one of James.'),
  -- thread: wisdom-2-immortal-image-envy-of-devil
  ('apocrypha', 'the-wisdom-of-solomon', 2, 23, 'canon', 'genesis', 1, 27, 'free', E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* The man made ''an image of his own eternity'' in Wisdom of Solomon 2:23 is the image of Elohim in the creation account.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 24, 'canon', 'genesis', 3, 4, 'free', E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The ''envy of the devil'' that brought death in Wisdom of Solomon 2:24 is the serpent''s lie that began it.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 24, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him.* The devil who brought death by envy in Wisdom of Solomon 2:24 is the murderer and liar from the beginning.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 24, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* Paul''s account of death entering the world matches ''through envy of the devil came death into the world'' of Wisdom of Solomon 2:24.'),
  ('apocrypha', 'the-wisdom-of-solomon', 2, 23, 'apocrypha', 'the-wisdom-of-solomon', 3, 1, 'extras', E'The Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The immortality for which man was created in Wisdom of Solomon 2:23 is secured for the righteous in the next chapter''s hope.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-2-suffering-righteous-passion',
       E'The just man who calls himself the child of Yahuah — condemned to a shameful death',
       E'The ungodly resolve against the righteous one: *Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law, and objecteth to our infamy the transgressings of our education* (Wisdom of Solomon 2:12); *He professeth to have the knowledge of Yahuah (God): and he calls himself the child of Yahuah (God)* (Wisdom of Solomon 2:13); *For if the just man be the son of Yahuah (God), he will help him, and deliver him from the hand of his enemies* (Wisdom of Solomon 2:18); *Let us condemn him with a shameful death: for by his own saying he shall be respected* (Wisdom of Solomon 2:20). It ain''t new — this is the script the mockers read aloud at Golgotha. *He trusted in Elohim (God); let him deliver him now, if he will have him: for he said, I am the Son of Elohim (God)* (Matthew 27:43); the same taunt the psalmist heard, *He trusted on Yahuah (LORD) that he would deliver him: let him deliver him, seeing he delighted in him* (Psalm 22:8); and the very charge of the accusers, *We have a law, and by our law he ought to die, because he made himself the Son of Elohim (God)* (John 19:7). The prophet already named the silent Lamb of that shameful death — *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter* (Isaiah 53:7). The Passion was written into the witness centuries before the cross stood up.',
       sv.verse_id, ev.verse_id, 'extras', 58025
  FROM _session253_wis02_lookup sv, _session253_wis02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-2-the-falsely-condemned-just',
       E'Ye have condemned and killed the just — the righteous one slain by false counsel',
       E'The plot is to put the innocent to a violent end: *Let us examine him with despitefulness and torture, that we may know his meekness, and prove his patience* (Wisdom of Solomon 2:19); *Let us condemn him with a shameful death: for by his own saying he shall be respected* (Wisdom of Solomon 2:20). The apostle pronounces the verdict over every such tribunal: *Ye have condemned and killed the just; and he doth not resist you* (James 5:6). This is the very pattern judged in Susanna, where the wicked elders *came also full of mischievous imagination against Susanna to put her to death* (The History of Susanna 1:28) — and the righteous one is vindicated when *all the assembly cried out with a loud voice, and praised Yahuah (God), who saves them that trust in him* (The History of Susanna 1:60). The condemnation is real; so is the deliverance.',
       sv.verse_id, ev.verse_id, 'extras', 58028
  FROM _session253_wis02_lookup sv, _session253_wis02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-2-let-us-eat-and-drink',
       E'Let us eat and drink, for to morrow we die — the creed of those who deny the resurrection',
       E'Because they say *after our end there is no returning: for it is fast sealed, so that no man comes again* (Wisdom of Solomon 2:5), the ungodly conclude: *Come on therefore, let us enjoy the good things that are present: and let us speedily use the creatures like as in youth* (Wisdom of Solomon 2:6); *Let none of us go without his part of our voluptuousness... for this is our portion, and our lot is this* (Wisdom of Solomon 2:9). It ain''t new — this is the carousing the prophet condemned: *let us eat and drink; for to morrow we shall die* (Isaiah 22:13). The apostle quotes the same creed as the fruit of denying the resurrection — *if the dead rise not? let us eat and drink; for to morrow we die* (1 Corinthians 15:32) — and the Master casts it as the rich fool''s soul-talk, *Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* (Luke 12:19). The denial of the world to come always ends at the same table.',
       sv.verse_id, ev.verse_id, 'extras', 58031
  FROM _session253_wis02_lookup sv, _session253_wis02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-2-oppress-the-poor-righteous',
       E'Let us oppress the poor righteous man — strength made the law of justice',
       E'The ungodly enthrone might over right: *Let us oppress the poor righteous man, let us not spare the widow, nor reverence the ancient gray hairs of the aged* (Wisdom of Solomon 2:10); *Let our strength be the law of justice: for that which is feeble is found to be nothing worth* (Wisdom of Solomon 2:11). This is the very oppression Yahuah swore to judge: *because they sold the righteous for silver, and the poor for a pair of shoes; That pant after the dust of the earth on the head of the poor, and turn aside the way of the meek* (Amos 2:6-7). And it ends where chapter 2 began — in the condemned just one: *Ye have condemned and killed the just; and he doth not resist you* (James 5:6). Torah stands: it is the widow, the poor, and the aged whom the covenant defends.',
       sv.verse_id, ev.verse_id, 'extras', 58034
  FROM _session253_wis02_lookup sv, _session253_wis02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-2-immortal-image-envy-of-devil',
       E'Yahuah created man immortal, the image of his eternity — death by envy of the devil',
       E'The chapter closes by exposing the lie under the ungodly''s despair: *For Yahuah (God) created man to be immortal, and made him to be an image of his own eternity* (Wisdom of Solomon 2:23); *Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it* (Wisdom of Solomon 2:24). It ain''t new — this is Eden read straight. Man bears the divine image: *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him* (Genesis 1:27). The devil''s envy and lie brought death — *And the serpent said unto the woman, Ye shall not surely die* (Genesis 3:4) — for *He was a murderer from the beginning, and abode not in the truth* (John 8:44). The apostle states it plainly: *as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). And the contrary portion stands — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1).',
       sv.verse_id, ev.verse_id, 'extras', 58037
  FROM _session253_wis02_lookup sv, _session253_wis02_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=2 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-2-suffering-righteous-passion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 27:43 — *He trusted in Elohim (God); let him deliver him now, if he will have him: for he said, I am the Son of Elohim (God).* The mockers at the cross speak the ungodly''s reasoning of Wisdom of Solomon 2:13 almost word for word — the righteous one who calls himself the child of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-suffering-righteous-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=27 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 22:8 — *He trusted on Yahuah (LORD) that he would deliver him: let him deliver him, seeing he delighted in him.* The taunt ''if the just man be the son of Yahuah, he will help him'' of Wisdom of Solomon 2:18 is the psalmist''s scornful ''let him deliver him.'''
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-suffering-righteous-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 19:7 — *The Yahudim (Jews) answered him, We have a law, and by our law he ought to die, because he made himself the Son of Elohim (God).* The shameful-death verdict of Wisdom of Solomon 2:20 is pressed on the exact ground that he made himself the Son of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-suffering-righteous-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:7 — *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* The despite, torture, and meekness tested in Wisdom of Solomon 2:19 is the silent Lamb of Isaiah''s suffering servant.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-suffering-righteous-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 3:10 — *Say ye to the righteous, that it shall be well with him: for they shall eat the fruit of their doings.* The ungodly''s lying-in-wait for the righteous in Wisdom of Solomon 2:12 inverts the prophet''s promise that it shall be well with the just.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-suffering-righteous-passion'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-2-the-falsely-condemned-just
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 5:6 — *Ye have condemned and killed the just; and he doth not resist you.* James names the very crime the ungodly plot in Wisdom of Solomon 2:20 — condemning the unresisting righteous one to death.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-the-falsely-condemned-just'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'The History of Susanna 1:28 — *And it came to pass the next day, when the people were assembled to her husband Joacim, the two elders came also full of mischievous imagination against Susanna to put her to death.* Susanna''s accusers act out the despiteful examination of the righteous in Wisdom of Solomon 2:19.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-the-falsely-condemned-just'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-history-of-susanna' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'The History of Susanna 1:60 — *With that all the assembly cried out with a loud voice, and praised Yahuah (God), who saves them that trust in him.* Susanna''s deliverance answers the ungodly''s wager in Wisdom of Solomon 2:18 — the just man''s Elohim does help him.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-the-falsely-condemned-just'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-history-of-susanna' AND tv.chapter_number=1 AND tv.verse_number=60
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-2-let-us-eat-and-drink
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 22:13 — *And behold joy and gladness, slaying oxen, and killing sheep, eating flesh, and drinking wine: let us eat and drink; for to morrow we shall die.* The ''let us enjoy the good things that are present'' of Wisdom of Solomon 2:6 is the very feast the prophet rebukes.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-let-us-eat-and-drink'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=22 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:32 — *If after the manner of men I have fought with beasts at Ephesus, what advantageth it me, if the dead rise not? let us eat and drink; for to morrow we die.* Paul ties this creed to denying the resurrection — exactly the ''no returning'' reasoning behind Wisdom of Solomon 2:6.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-let-us-eat-and-drink'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 12:19 — *And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry.* The rich fool''s portion echoes ''this is our portion, and our lot is this'' of Wisdom of Solomon 2:9.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-let-us-eat-and-drink'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-2-oppress-the-poor-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Amos 2:6 — *Thus saith Yahuah (LORD); For three transgressions of Yashar''el (Israel), and for four, I will not turn away the punishment thereof; because they sold the righteous for silver, and the poor for a pair of shoes.* The oppression of the poor righteous man in Wisdom of Solomon 2:10 is the sin Yahuah swears to judge.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-oppress-the-poor-righteous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Amos 2:7 — *That pant after the dust of the earth on the head of the poor, and turn aside the way of the meek: and a man and his father will go in unto the same maid, to profane my holy name.* The trampling of the poor and the meek answers the unsparing cruelty of Wisdom of Solomon 2:10.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-oppress-the-poor-righteous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:6 — *Ye have condemned and killed the just; and he doth not resist you.* Making strength ''the law of justice'' in Wisdom of Solomon 2:11 ends in the condemned and unresisting just one of James.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-oppress-the-poor-righteous'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-2-immortal-image-envy-of-devil
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:27 — *So Elohim (God) created man in his own image, in the image of Elohim (God) created he him; male and female created he them.* The man made ''an image of his own eternity'' in Wisdom of Solomon 2:23 is the image of Elohim in the creation account.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-immortal-image-envy-of-devil'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:4 — *And the serpent said unto the woman, Ye shall not surely die.* The ''envy of the devil'' that brought death in Wisdom of Solomon 2:24 is the serpent''s lie that began it.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-immortal-image-envy-of-devil'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him.* The devil who brought death by envy in Wisdom of Solomon 2:24 is the murderer and liar from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-immortal-image-envy-of-devil'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned.* Paul''s account of death entering the world matches ''through envy of the devil came death into the world'' of Wisdom of Solomon 2:24.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-immortal-image-envy-of-devil'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'The Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The immortality for which man was created in Wisdom of Solomon 2:23 is secured for the righteous in the next chapter''s hope.'
  FROM cross_reference_threads t, cross_references x, _session253_wis02_lookup sv, _session253_wis02_lookup tv
 WHERE t.slug='wisdom-2-immortal-image-envy-of-devil'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=2 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

