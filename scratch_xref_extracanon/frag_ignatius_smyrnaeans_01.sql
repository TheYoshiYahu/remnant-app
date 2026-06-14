-- ----- fragment: minion_ignatiussmyrnaeans_01.sql (session253 ignatius-smyrnaeans 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-smyrnaeans ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igsmy1 (view _session253_igsmy1_lookup). Sort band base 70700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igsmy1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-smyrnaeans-1-seed-of-david-flesh
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 1, 'canon', 'romans', 1, 3, 'free', E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* Ignatius''s "truly of the race of David according to the flesh" (1:1) is Paul''s very confession against any who deny the real incarnation.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 1, 'canon', 'romans', 1, 4, 'free', E'Romans 1:4 — *And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* the "Son of Elohim by the Divine will and power" of Smyrnaeans 1:1 is the Son declared with power by the resurrection.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 1, 'canon', 'isaiah', 53, 5, 'free', E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* The "most blessed passion" Ignatius names in 1:1 was wounded-in-the-flesh, foretold by the prophet.'),
  -- thread: ignatius-smyrnaeans-1-handle-me-risen-flesh
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 3, 'canon', 'luke', 24, 39, 'free', E'Luke 24:39 — *Behold my hands and my feet, that it is I myself: handle me, and see; for a spirit hath not flesh and bones, as ye see me have.* Ignatius''s "Lay hold and handle me, and see that I am not a demon without body" (1:3) quotes the risen Messiah''s own proof of flesh.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 3, 'canon', 'luke', 24, 43, 'free', E'Luke 24:43 — *And he took it, and did eat before them.* That "after His resurrection He [both] ate with them and drank with them" (1:3) is the same eating-in-the-flesh that confounds every docetic semblance.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 3, 'canon', 'john', 20, 27, 'free', E'John 20:27 — *Then saith he to Thomas, Reach hither thy finger, and behold my hands; and reach hither thy hand, and thrust it into my side: and be not faithless, but believing.* The disciples who "touched Him" in Smyrnaeans 1:3 did as Thomas did, handling the risen flesh.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 3, 'canon', 'acts', 10, 41, 'free', E'Acts 10:41 — *Not to all the people, but unto witnesses chosen before of Elohim (God), even to us, who did eat and drink with him after he rose from the dead.* Peter names the very eating-and-drinking with the risen Lord that Ignatius rehearses in 1:3.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 3, 'canon', '1-john', 1, 1, 'free', E'1 John 1:1 — *That which was from the beginning, which we have heard, which we have seen with our eyes, which we have looked upon, and our hands have handled, of the Word of life;* John''s hands-have-handled witness undergirds Ignatius''s "they touched Him" in 1:3.'),
  -- thread: ignatius-smyrnaeans-1-suffered-truly-raised
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 2, 'canon', 'isaiah', 53, 7, 'free', E'Isaiah 53:7 — *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* Ignatius''s "He suffered truly" (1:2) is the lamb''s real affliction the prophet saw, not semblance.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 2, 'canon', 'isaiah', 53, 8, 'free', E'Isaiah 53:8 — *He was taken from prison and from judgment: and who shall declare his generation? for he was cut off out of the land of the living: for the transgression of my people was he stricken.* The true death Ignatius defends in 1:2 was foretold as a real cutting-off from the land of the living.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 2, 'canon', 'acts', 10, 40, 'free', E'Acts 10:40 — *Him Elohim (God) raised up the third day, and shewed him openly;* "He raised Himself truly" (1:2) and was shewn openly, the bodily resurrection over against every docetic semblance.'),
  -- thread: ignatius-smyrnaeans-1-prophets-law-moses-gospel
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 5, 'canon', 'matthew', 5, 17, 'free', E'Matthew 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* When Ignatius faults the deniers for spurning "the law of Moses" (1:5), he stands with the Messiah who came to fulfil, not destroy, the Torah.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 5, 'canon', 'matthew', 5, 18, 'free', E'Matthew 5:18 — *For verily I say unto you, Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law, till all be fulfilled.* The law of Moses Ignatius commends in 1:5 endures to the last jot and tittle.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 5, 'canon', 'malachi', 4, 4, 'free', E'Malachi 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* The prophets'' closing charge is the very "law of Moses" Ignatius says the unbelievers refused (1:5).'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 7, 'canon', 'isaiah', 53, 5, 'free', E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* The "passion shown unto us" in the Prophets (1:7) is just this wounded-for-us oracle of Isaiah.'),
  -- thread: ignatius-smyrnaeans-1-eucharist-flesh-suffered
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 6, 'canon', '1-corinthians', 11, 23, 'free', E'1 Corinthians 11:23 — *For I have received of Yahusha (the Lord) that which also I delivered unto you, That Yahusha (the Lord Jesus) the same night in which he was betrayed took bread:* Ignatius''s eucharist that is "the flesh of our Saviour" (1:6) is the supper Paul received and delivered.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 6, 'canon', '1-corinthians', 11, 24, 'free', E'1 Corinthians 11:24 — *And when he had given thanks, he brake it, and said, Take, eat: this is my body, which is broken for you: this do in remembrance of me.* The bread that is His broken body grounds Ignatius''s claim in 1:6 that the eucharist is the flesh that suffered for our sins.'),
  ('lightfoot-apostolic-fathers', 'ignatius-smyrnaeans', 1, 8, 'canon', '1-corinthians', 11, 26, 'free', E'1 Corinthians 11:26 — *For as often as ye eat this bread, and drink this cup, ye do shew the death of Yahusha (the Lord) till he come.* The one valid love-feast Ignatius guards in 1:8 shews forth the very death-and-return the docetists denied.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igsmy1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igsmy1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-smyrnaeans-1-seed-of-david-flesh',
       E'Truly of the seed of David, truly in the flesh',
       E'Against the docetists who said the Messiah only *seemed* to come, Ignatius confesses Him whole: *fully persuaded as touching our Lord that He is truly of the race of David according to the flesh, but Son of Elohim (God) by the Divine will and power, truly born of a virgin and baptized by John... truly nailed up in the flesh for our sakes under Pontius Pilate.* It ain''t new — Paul preached the same double witness: *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* (Romans 1:3) *And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* (Romans 1:4). And the suffering of that flesh was written long before by the prophet: *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* (Isaiah 53:5). The gathering He raises is no church-replacing-Israel but the one body drawn *whether among Yahudim (Jews) or among Gentiles* — the two-house ensign of His resurrection.',
       sv.verse_id, ev.verse_id, 'extras', 70700
  FROM _session253_igsmy1_lookup sv, _session253_igsmy1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-smyrnaeans' AND ev.chapter_number=1 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-smyrnaeans-1-handle-me-risen-flesh',
       E'Lay hold and handle me — the risen flesh',
       E'Ignatius answers the docetists with the upper-room scene: *when He came to Peter and his company, He said to them, Lay hold and handle me, and see that I am not a demon without body. And straightway they touched Him, and they believed... And after His resurrection He [both] ate with them and drank with them as one in the flesh.* It ain''t new — this is the risen Yahusha verbatim: *Behold my hands and my feet, that it is I myself: handle me, and see; for a spirit hath not flesh and bones, as ye see me have.* (Luke 24:39), and *And he took it, and did eat before them.* (Luke 24:43). To doubting Thomas: *Reach hither thy finger, and behold my hands; and reach hither thy hand, and thrust it into my side: and be not faithless, but believing.* (John 20:27). The witnesses who shared His table testified: *Not to all the people, but unto witnesses chosen before of Elohim (God), even to us, who did eat and drink with him after he rose from the dead.* (Acts 10:41). And John, who handled Him: *which we have looked upon, and our hands have handled, of the Word of life;* (1 John 1:1).',
       sv.verse_id, ev.verse_id, 'extras', 70703
  FROM _session253_igsmy1_lookup sv, _session253_igsmy1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-smyrnaeans' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-smyrnaeans-1-suffered-truly-raised',
       E'He suffered truly, not in semblance',
       E'The docetists held that the Messiah only *seemed* to suffer; Ignatius will have none of it: *He suffered truly, as also He raised Himself truly; not... certain unbelievers say, that He suffered in semblance, being themselves mere semblance.* And of his own martyrdom he reasons: *if these things were done by our Lord in semblance, then am I also a prisoner in semblance. And why then have I delivered myself over to death, unto fire, unto sword, unto wild beasts?* It ain''t new — the prophets had testified to the real death: *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter...* (Isaiah 53:7); *he was cut off out of the land of the living: for the transgression of my people was he stricken.* (Isaiah 53:8). And the Father raised that same flesh: *Him Elohim (God) raised up the third day, and shewed him openly;* (Acts 10:40).',
       sv.verse_id, ev.verse_id, 'extras', 70706
  FROM _session253_igsmy1_lookup sv, _session253_igsmy1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-smyrnaeans' AND ev.chapter_number=1 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-smyrnaeans-1-prophets-law-moses-gospel',
       E'Persuaded by the prophets and the law of Moses',
       E'Ignatius rebukes the deniers precisely because they will not heed the whole counsel: *they have not been persuaded by the prophecies nor by the law of Moses, nay nor even to this very hour by the Gospel.* He sends the faithful instead to *give heed to the Prophets, and especially to the Gospel, wherein the passion is shown unto us and the resurrection is accomplished.* The Torah and prophets are honoured, not abolished — it ain''t new. The Messiah Himself bound the law and the prophets to His own person: *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* (Matthew 5:17); *For verily I say unto you, Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law, till all be fulfilled.* (Matthew 5:18). And the closing word of the prophets keeps the same charge: *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* (Malachi 4:4).',
       sv.verse_id, ev.verse_id, 'extras', 70709
  FROM _session253_igsmy1_lookup sv, _session253_igsmy1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-smyrnaeans' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-smyrnaeans-1-eucharist-flesh-suffered',
       E'The Eucharist is the flesh that suffered and was raised',
       E'The docetists *abstain from eucharist (thanksgiving) and prayer, because they allow not that the eucharist is the flesh of our Saviour Yahusha HaMashiach (Jesus Christ), which flesh suffered for our sins, and which the Father of His goodness raised up.* For Ignatius the one bread and one cup are no empty sign but the body broken and the blood poured — and so it is *not lawful apart from the bishop either to baptize or to hold a love-feast.* It ain''t new — Paul delivered the same supper: *That Yahusha (the Lord Jesus) the same night in which he was betrayed took bread:* (1 Corinthians 11:23); *And when he had given thanks, he brake it, and said, Take, eat: this is my body, which is broken for you: this do in remembrance of me.* (1 Corinthians 11:24); *For as often as ye eat this bread, and drink this cup, ye do shew the death of Yahusha (the Lord) till he come.* (1 Corinthians 11:26).',
       sv.verse_id, ev.verse_id, 'extras', 70712
  FROM _session253_igsmy1_lookup sv, _session253_igsmy1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-smyrnaeans' AND ev.chapter_number=1 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-smyrnaeans-1-seed-of-david-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* Ignatius''s "truly of the race of David according to the flesh" (1:1) is Paul''s very confession against any who deny the real incarnation.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-seed-of-david-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:4 — *And declared to be the Son of Elohim (God) with power, according to the spirit of holiness, by the resurrection from the dead:* the "Son of Elohim by the Divine will and power" of Smyrnaeans 1:1 is the Son declared with power by the resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-seed-of-david-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* The "most blessed passion" Ignatius names in 1:1 was wounded-in-the-flesh, foretold by the prophet.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-seed-of-david-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-smyrnaeans-1-handle-me-risen-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 24:39 — *Behold my hands and my feet, that it is I myself: handle me, and see; for a spirit hath not flesh and bones, as ye see me have.* Ignatius''s "Lay hold and handle me, and see that I am not a demon without body" (1:3) quotes the risen Messiah''s own proof of flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-handle-me-risen-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 24:43 — *And he took it, and did eat before them.* That "after His resurrection He [both] ate with them and drank with them" (1:3) is the same eating-in-the-flesh that confounds every docetic semblance.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-handle-me-risen-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 20:27 — *Then saith he to Thomas, Reach hither thy finger, and behold my hands; and reach hither thy hand, and thrust it into my side: and be not faithless, but believing.* The disciples who "touched Him" in Smyrnaeans 1:3 did as Thomas did, handling the risen flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-handle-me-risen-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=20 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 10:41 — *Not to all the people, but unto witnesses chosen before of Elohim (God), even to us, who did eat and drink with him after he rose from the dead.* Peter names the very eating-and-drinking with the risen Lord that Ignatius rehearses in 1:3.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-handle-me-risen-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=10 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 John 1:1 — *That which was from the beginning, which we have heard, which we have seen with our eyes, which we have looked upon, and our hands have handled, of the Word of life;* John''s hands-have-handled witness undergirds Ignatius''s "they touched Him" in 1:3.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-handle-me-risen-flesh'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-smyrnaeans-1-suffered-truly-raised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:7 — *He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth.* Ignatius''s "He suffered truly" (1:2) is the lamb''s real affliction the prophet saw, not semblance.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-suffered-truly-raised'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:8 — *He was taken from prison and from judgment: and who shall declare his generation? for he was cut off out of the land of the living: for the transgression of my people was he stricken.* The true death Ignatius defends in 1:2 was foretold as a real cutting-off from the land of the living.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-suffered-truly-raised'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 10:40 — *Him Elohim (God) raised up the third day, and shewed him openly;* "He raised Himself truly" (1:2) and was shewn openly, the bodily resurrection over against every docetic semblance.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-suffered-truly-raised'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=10 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-smyrnaeans-1-prophets-law-moses-gospel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 5:17 — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil.* When Ignatius faults the deniers for spurning "the law of Moses" (1:5), he stands with the Messiah who came to fulfil, not destroy, the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-prophets-law-moses-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 5:18 — *For verily I say unto you, Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law, till all be fulfilled.* The law of Moses Ignatius commends in 1:5 endures to the last jot and tittle.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-prophets-law-moses-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* The prophets'' closing charge is the very "law of Moses" Ignatius says the unbelievers refused (1:5).'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-prophets-law-moses-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:5 — *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.* The "passion shown unto us" in the Prophets (1:7) is just this wounded-for-us oracle of Isaiah.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-prophets-law-moses-gospel'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-smyrnaeans-1-eucharist-flesh-suffered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 11:23 — *For I have received of Yahusha (the Lord) that which also I delivered unto you, That Yahusha (the Lord Jesus) the same night in which he was betrayed took bread:* Ignatius''s eucharist that is "the flesh of our Saviour" (1:6) is the supper Paul received and delivered.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-eucharist-flesh-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=11 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 11:24 — *And when he had given thanks, he brake it, and said, Take, eat: this is my body, which is broken for you: this do in remembrance of me.* The bread that is His broken body grounds Ignatius''s claim in 1:6 that the eucharist is the flesh that suffered for our sins.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-eucharist-flesh-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 11:26 — *For as often as ye eat this bread, and drink this cup, ye do shew the death of Yahusha (the Lord) till he come.* The one valid love-feast Ignatius guards in 1:8 shews forth the very death-and-return the docetists denied.'
  FROM cross_reference_threads t, cross_references x, _session253_igsmy1_lookup sv, _session253_igsmy1_lookup tv
 WHERE t.slug='ignatius-smyrnaeans-1-eucharist-flesh-suffered'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-smyrnaeans' AND sv.chapter_number=1 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=11 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

