-- ----- fragment: minion_1adameve_45.sql (session253 1-adam-eve 45) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch45. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae45 (view _session253_1ae45_lookup). Sort band base 65100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae45_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-45-satan-broke-his-word
  ('adam-eve-conflict', '1-adam-eve', 45, 5, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The Word tells Adam Satan never kept his word; Yahusha names that same liar the father of every lie, the enemy from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 45, 8, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The deceiver who promised Adam light only to drag him "out of light into darkness" is the very one who disguises his darkness as light.'),
  ('adam-eve-conflict', '1-adam-eve', 45, 5, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The one who kindled the fire "in which he meant to burn you and Eve" is the same adversary prowling to devour, named here as Adam''s enemy.'),
  ('adam-eve-conflict', '1-adam-eve', 45, 5, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The Satan who exalted and then betrayed Adam outside the garden is the old serpent who deceiveth the whole world to the end.'),
  -- thread: 1-adam-eve-45-the-serpent-and-the-seed
  ('adam-eve-conflict', '1-adam-eve', 45, 9, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The fire that will "encompass about both you and your descendants" is the serpent''s lifelong striking at the seed declared at Eden''s gate.'),
  ('adam-eve-conflict', '1-adam-eve', 45, 9, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The enemy who encircles Adam''s seed with fire is the Satan Yahuah promises to bruise under His people''s feet.'),
  ('adam-eve-conflict', '1-adam-eve', 45, 9, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The plague of fire "that will be burning around you" is the work of the devil the Son came to destroy.'),
  -- thread: 1-adam-eve-45-not-until-my-coming
  ('adam-eve-conflict', '1-adam-eve', 45, 11, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The "Word" who comforts Adam and is sent "who is My Word" is the eternal Logos, Elohim Himself.'),
  ('adam-eve-conflict', '1-adam-eve', 45, 11, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who promises "My Word comes... He will make a way for you" is the same Word made flesh to open the way of rest.'),
  ('adam-eve-conflict', '1-adam-eve', 45, 10, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The "day My covenant is fulfilled" is the fulness of time when the Son was sent, made of a woman — the seed promised to Adam.'),
  ('adam-eve-conflict', '1-adam-eve', 45, 11, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The deliverance promised "until My coming" was foreordained before the foundation, manifest in these last times for the children of Adam.'),
  -- thread: 1-adam-eve-45-the-word-parts-the-fire
  ('adam-eve-conflict', '1-adam-eve', 45, 11, 'canon', 'exodus', 14, 21, 'free', E'Exodus 14:21 — *And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* The Word who orders the fire to "split itself in half" so Adam passes is the same who divides the sea to make a way for His people.'),
  ('adam-eve-conflict', '1-adam-eve', 45, 11, 'canon', 'exodus', 14, 22, 'free', E'Exodus 14:22 — *And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left.* As Israel walked through the parted sea on dry ground, Adam goes through the parted fire by the order of the Word.'),
  ('adam-eve-conflict', '1-adam-eve', 45, 11, 'canon', 'joshua', 3, 16, 'free', E'Joshua 3:16 — *That the waters which came down from above stood and rose up upon an heap very far from the city Adam, that is beside Zaretan... and the people passed over right against Jericho.* The Word parts the fire for Adam just as He heaped up Jordan''s waters at the city that bears Adam''s name, making a way through.'),
  ('adam-eve-conflict', '1-adam-eve', 45, 11, 'canon', 'daniel', 3, 25, 'free', E'Daniel 3:25 — *He answered and said, Lo, I see four men loose, walking in the midst of the fire, and they have no hurt; and the form of the fourth is like the Son of Elohim (God).* The Word who brings Adam unharmed through the splitting flame is the Son of Elohim who walks with His own in the furnace.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae45_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae45_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-45-satan-broke-his-word',
       E'Satan kept not his word — he was your enemy from the first day',
       E'The Word of Elohim names the deceiver to Adam: *"See, O Adam, how Satan has exalted you! He has deprived you of the Godhead, and of an exalted state like Me, and has not kept his word to you; but has, after all, become your enemy. He is the one who made this fire in which he meant to burn you and Eve"* (1-adam-eve 45:5), and *"he wished to make you come out of light into darkness; and from an exalted state to degradation"* (1-adam-eve 45:8). It ain''t new — the fire around the cave is the same serpent who struck in Eden, the murderer and liar from the beginning. *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* (John 8:44). His lie is dressed as light: *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14). The roaring lion still walks: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* (1 Peter 5:8). And he is the same dragon the heavens cast out: *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world.* (Revelation 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 65100
  FROM _session253_1ae45_lookup sv, _session253_1ae45_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=45 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-45-the-serpent-and-the-seed',
       E'The fire encompasses your descendants — the seed-war from the first day',
       E'The Word warns Adam that Satan''s fire is not for him alone: *"know that it will encompass about both you and your descendants, when you obey his command; that he will plague you with fire; and that you will go down into hell after you are dead"* (1-adam-eve 45:9). This is the enmity declared at the gate of Eden — Satan striking at the seed of the woman down all the generations. *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). The bruising of the serpent''s head is the very deliverance Yahuah promises Adam here: *the Elohim of peace shall bruise Satan under your feet shortly* (Romans 16:20). And the Son was manifested for exactly this end: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 65103
  FROM _session253_1ae45_lookup sv, _session253_1ae45_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=45 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-45-not-until-my-coming',
       E'Not until My coming — the Word who is My Word makes a way',
       E'Into Adam''s hell-shadowed dread the Word sets the Messianic hope: *"You will not be delivered from it until My coming... not until My Word comes and makes a way for you on the day My covenant is fulfilled"* (1-adam-eve 45:10), and *"There is no way for you at present to come from this life to rest, not until My Word comes, who is My Word. Then He will make a way for you, and you shall have rest"* (1-adam-eve 45:11). The Comforter who speaks to Adam IS the Logos, and He foretells His own incarnation in the fulness of time. *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) — *And the Word was made flesh, and dwelt among us... full of grace and truth.* (John 1:14). The day of the covenant came at the appointed hour: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law.* (Galatians 4:4). And this coming was no afterthought but foreordained from the very foundation Adam stood at: *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you.* (1 Peter 1:20).',
       sv.verse_id, ev.verse_id, 'extras', 65106
  FROM _session253_1ae45_lookup sv, _session253_1ae45_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=45 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-45-the-word-parts-the-fire',
       E'The Word splits the fire — a way made through the flame',
       E'Then the Logos acts as He spoke: *"Then Elohim (God) called with His Word to the fire that burned around the cave, that it split itself in half, until Adam had gone through it. Then the fire parted itself by Elohim''s (God''s) order, and a way was made for Adam"* (1-adam-eve 45:11). The Word who makes a way through the fire is the same who later cleaves the sea and the river for His people. *And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* (Exodus 14:21) — *And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground.* (Exodus 14:22). So too the Jordan stood up in a heap before the ark at the city named for Adam himself: *That the waters which came down from above stood and rose up upon an heap very far from the city Adam... and the people passed over right against Jericho.* (Joshua 3:16). And the Son of Elohim still stands unhurt with His own in the furnace: *Lo, I see four men loose, walking in the midst of the fire, and they have no hurt; and the form of the fourth is like the Son of Elohim (God).* (Daniel 3:25).',
       sv.verse_id, ev.verse_id, 'extras', 65109
  FROM _session253_1ae45_lookup sv, _session253_1ae45_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=11
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=45 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-45-satan-broke-his-word
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The Word tells Adam Satan never kept his word; Yahusha names that same liar the father of every lie, the enemy from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-satan-broke-his-word'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The deceiver who promised Adam light only to drag him "out of light into darkness" is the very one who disguises his darkness as light.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-satan-broke-his-word'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* The one who kindled the fire "in which he meant to burn you and Eve" is the same adversary prowling to devour, named here as Adam''s enemy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-satan-broke-his-word'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The Satan who exalted and then betrayed Adam outside the garden is the old serpent who deceiveth the whole world to the end.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-satan-broke-his-word'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-45-the-serpent-and-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The fire that will "encompass about both you and your descendants" is the serpent''s lifelong striking at the seed declared at Eden''s gate.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-the-serpent-and-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The enemy who encircles Adam''s seed with fire is the Satan Yahuah promises to bruise under His people''s feet.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-the-serpent-and-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The plague of fire "that will be burning around you" is the work of the devil the Son came to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-the-serpent-and-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-45-not-until-my-coming
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The "Word" who comforts Adam and is sent "who is My Word" is the eternal Logos, Elohim Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-not-until-my-coming'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who promises "My Word comes... He will make a way for you" is the same Word made flesh to open the way of rest.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-not-until-my-coming'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The "day My covenant is fulfilled" is the fulness of time when the Son was sent, made of a woman — the seed promised to Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-not-until-my-coming'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The deliverance promised "until My coming" was foreordained before the foundation, manifest in these last times for the children of Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-not-until-my-coming'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-45-the-word-parts-the-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 14:21 — *And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided.* The Word who orders the fire to "split itself in half" so Adam passes is the same who divides the sea to make a way for His people.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-the-word-parts-the-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 14:22 — *And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left.* As Israel walked through the parted sea on dry ground, Adam goes through the parted fire by the order of the Word.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-the-word-parts-the-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=14 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 3:16 — *That the waters which came down from above stood and rose up upon an heap very far from the city Adam, that is beside Zaretan... and the people passed over right against Jericho.* The Word parts the fire for Adam just as He heaped up Jordan''s waters at the city that bears Adam''s name, making a way through.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-the-word-parts-the-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 3:25 — *He answered and said, Lo, I see four men loose, walking in the midst of the fire, and they have no hurt; and the form of the fourth is like the Son of Elohim (God).* The Word who brings Adam unharmed through the splitting flame is the Son of Elohim who walks with His own in the furnace.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae45_lookup sv, _session253_1ae45_lookup tv
 WHERE t.slug='1-adam-eve-45-the-word-parts-the-fire'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=45 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

