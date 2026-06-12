-- ----- fragment: minion_judith_07.sql (session253 judith 7) -----
-- Source anchor: apocrypha/judith ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt7 (view _session253_jdt7_lookup). Sort band base 60150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-7-licks-up-the-earth
  ('apocrypha', 'judith', 7, 11, 'canon', 'isaiah', 41, 11, 'free', E'Isaiah 41:11 — *Behold, all they that were incensed against thee shall be ashamed and confounded: they shall be as nothing; and they that strive with thee shall perish.* Holofernes'' counsellors promise that not one of his host shall perish (Judith 7:11), but the word over Israel hands that perishing back to the besieger.'),
  ('apocrypha', 'judith', 7, 4, 'canon', 'isaiah', 41, 12, 'free', E'Isaiah 41:12 — *Thou shalt seek them, and shalt not find them, even them that contended with thee: they that war against thee shall be as nothing, and as a thing of nought.* The multitude that seems able to lick up the face of the earth in Judith 7:4 is, before Yahuah, a thing of nought.'),
  ('apocrypha', 'judith', 7, 2, 'canon', '1-samuel', 2, 7, 'free', E'1 Samuel 2:7 — *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up.* Hannah''s song answers the hundred and seventy thousand of Judith 7:2: the count of footmen and horsemen decides nothing, for the bringing low is His.'),
  -- thread: judith-7-water-cut-off
  ('apocrypha', 'judith', 7, 13, 'canon', 'lamentations', 4, 4, 'free', E'Lamentations 4:4 — *The tongue of the sucking child cleaveth to the roof of his mouth for thirst: the young children ask bread, and no man breaketh it unto them.* Jeremiah''s siege-grief is the very horror Holofernes'' counsel intends in Judith 7:13, that thirst should kill the children of Bethulia.'),
  -- thread: judith-7-faint-and-murmur
  ('apocrypha', 'judith', 7, 22, 'canon', 'exodus', 17, 3, 'free', E'Exodus 17:3 — *And the people thirsted there for water; and the people murmured against Moses, and said, Wherefore is this that thou hast brought us up out of Egypt, to kill us and our children and our cattle with thirst?* Bethulia''s fainting and murmuring for thirst in Judith 7:22 re-runs Rephidim, the same fear for the children dying of thirst.'),
  ('apocrypha', 'judith', 7, 27, 'canon', 'numbers', 21, 5, 'free', E'Numbers 21:5 — *And the people spake against Elohim (God), and against Moses, Wherefore have ye brought us up out of Egypt to die in the wilderness? for there is no bread, neither is there any water; and our soul loatheth this light bread.* The cry that surrender is better than death by thirst (Judith 7:27) is the wilderness murmur — preferring Egypt to the proving.'),
  -- thread: judith-7-sold-and-proven
  ('apocrypha', 'judith', 7, 28, 'canon', 'deuteronomy', 8, 2, 'free', E'Deuteronomy 8:2 — *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no.* Bethulia''s confession of being chastened for fathers'' sins (Judith 7:28) is the Deuteronomic proving — the siege is meant to search the heart.'),
  ('apocrypha', 'judith', 7, 25, 'canon', 'deuteronomy', 8, 3, 'free', E'Deuteronomy 8:3 — *And he humbled thee, and suffered thee to hunger, and fed thee with manna, which thou knewest not, neither did thy fathers know; that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live.* The cry that Yahuah has sold them to thirst (Judith 7:25) misreads the hunger and thirst that are meant to teach dependence on Him.'),
  -- thread: judith-7-wait-five-days
  ('apocrypha', 'judith', 7, 30, 'canon', 'psalms', 27, 14, 'free', E'Psalm 27:14 — *Wait on Yahuah (LORD): be of good courage, and he shall strengthen thine heart: wait, I say, on Yahuah (LORD).* Ozias'' plea to endure five days for Yahuah''s mercy (Judith 7:30) is precisely this waiting and good courage that strengthens the heart.'),
  ('apocrypha', 'judith', 7, 25, 'canon', '2-chronicles', 20, 12, 'free', E'2 Chronicles 20:12 — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* Bethulia''s confession that they have no helper (Judith 7:25) finds its right answer in Jehoshaphat''s turning of helplessness toward Yahuah.'),
  ('apocrypha', 'judith', 7, 30, 'canon', '2-chronicles', 20, 15, 'free', E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* The five-day stay of Judith 7:30 waits on exactly this — that the deliverance belongs to Yahuah and not to Bethulia''s spears.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-7-licks-up-the-earth',
       E'The host that would lick up the earth',
       E'Holofernes the captain of Nebuchadnezzar — the kingdom-of-man tyrant who claims the worship owed to Yahuah alone — moves his measureless host against little Bethulia: *Then their strong men removed their camps in that day, and the army of the men of war was an hundred and seventy thousand footmen, and twelve thousand horsemen, beside the baggage, and other men that were afoot among them, a very great multitude* (Judith 7:2), until *the children of Yashar''el (Israel), when they saw the multitude of them, were greatly troubled, and said every one to his neighbour, Now will these men lick up the face of the earth* (Judith 7:4). It is the old boast of the proud against the seed Yahuah has chosen — and the old promise stands against it: *Behold, all they that were incensed against thee shall be ashamed and confounded: they shall be as nothing; and they that strive with thee shall perish* (Isaiah 41:11); *Thou shalt seek them, and shalt not find them, even them that contended with thee: they that war against thee shall be as nothing, and as a thing of nought* (Isaiah 41:12). For it is His way to bring the towering low: *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up* (1 Samuel 2:7). The system that covers the face of the whole land is itself the thing of nought.',
       sv.verse_id, ev.verse_id, 'extras', 60150
  FROM _session253_jdt7_lookup sv, _session253_jdt7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=7 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-7-water-cut-off',
       E'The water cut off',
       E'The Edomites and Moabites counsel the tyrant to spare his sword and let thirst do the killing: *Remain in your camp, and keep all the men of your army, and let your servants get into their hands the fountain of water, which issues forth of the foot of the mountain* (Judith 7:12); *For all the inhabitants of Bethulia have their water thence; so shall thirst kill them, and they shall give up their city* (Judith 7:13). So the host seizes the springs: *they pitched in the valley, and took the waters, and the fountains of the waters of the children of Yashar''el (Israel)* (Judith 7:17), and the cisterns run dry. The picture of a besieged people perishing for thirst is Jeremiah''s lament over Zion: *The tongue of the sucking child cleaveth to the roof of his mouth for thirst: the young children ask bread, and no man breaketh it unto them* (Lamentations 4:4). The kingdom of man fights by famine and drought — but the well it cannot reach is Yahuah''s mercy.',
       sv.verse_id, ev.verse_id, 'extras', 60153
  FROM _session253_jdt7_lookup sv, _session253_jdt7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=7 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-7-faint-and-murmur',
       E'The people faint and murmur for water',
       E'When the vessels of water fail, the people sink: *Therefore their young children were out of heart, and their women and young men fainted for thirst, and fell down in the streets of the city, and by the passages of the gates, and there was no longer any strength in them* (Judith 7:22); and they turn on their rulers — *Now therefore call them to you, and deliver the whole city for a spoil to the people of Holofernes... For it is better for us to be made a spoil to them, than to die for thirst* (Judith 7:26-27). It is the wilderness murmur all over again, the test of faith under thirst that Israel has failed before: *And the people thirsted there for water; and the people murmured against Moses, and said, Wherefore is this that thou hast brought us up out of Egypt, to kill us and our children and our cattle with thirst?* (Exodus 17:3); *And the people spake against Elohim (God), and against Moses, Wherefore have ye brought us up out of Egypt to die in the wilderness? for there is no bread, neither is there any water; and our soul loatheth this light bread* (Numbers 21:5). The proving is the same — would they rather be slaves and spoil than wait on Yahuah?',
       sv.verse_id, ev.verse_id, 'extras', 60156
  FROM _session253_jdt7_lookup sv, _session253_jdt7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=7 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-7-sold-and-proven',
       E'Sold into their hands — the proving',
       E'The people read their distress as abandonment: *For now we have no helper: but Yahuah (God) has sold us into their hands, that we should be thrown down before them with thirst and great destruction* (Judith 7:25); and yet even in the complaint they confess the covenant logic — *our Elohim (God) and Yahuah (God) of our fathers, which punishes us according to our sins and the sins of our fathers* (Judith 7:28). This is the wilderness school of Deuteronomy: the want of water and bread is not Yahuah forsaking but Yahuah humbling and proving. *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2); *And he humbled thee, and suffered thee to hunger, and fed thee with manna... that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). The thirst is the test, not the verdict.',
       sv.verse_id, ev.verse_id, 'extras', 60159
  FROM _session253_jdt7_lookup sv, _session253_jdt7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=7 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-7-wait-five-days',
       E'Endure five days — wait on Yahuah',
       E'Against the clamour to surrender, Ozias begs a holy stay of judgment: *Brothers, be of good courage, let us yet endure five days, in the which space Yahuah (God), our Elohim (God) may turn his mercy toward us; for he will not forsake us utterly* (Judith 7:30). It is the very posture the Psalmist commands and Jehoshaphat embodied — to stand still and let Yahuah be the deliverer of His chosen, the battle being not Israel''s might but His. *Wait on Yahuah (LORD): be of good courage, and he shall strengthen thine heart: wait, I say, on Yahuah (LORD)* (Psalm 27:14). When another great multitude came against Judah, the king laid the whole helplessness before Him — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee* (2 Chronicles 20:12) — and the answer came: *Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s)* (2 Chronicles 20:15). Ozias'' five days set the stage for the woman''s hand by which the weak will confound the mighty.',
       sv.verse_id, ev.verse_id, 'extras', 60162
  FROM _session253_jdt7_lookup sv, _session253_jdt7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=30
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=7 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-7-licks-up-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 41:11 — *Behold, all they that were incensed against thee shall be ashamed and confounded: they shall be as nothing; and they that strive with thee shall perish.* Holofernes'' counsellors promise that not one of his host shall perish (Judith 7:11), but the word over Israel hands that perishing back to the besieger.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-licks-up-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 41:12 — *Thou shalt seek them, and shalt not find them, even them that contended with thee: they that war against thee shall be as nothing, and as a thing of nought.* The multitude that seems able to lick up the face of the earth in Judith 7:4 is, before Yahuah, a thing of nought.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-licks-up-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Samuel 2:7 — *Yahuah (LORD) maketh poor, and maketh rich: he bringeth low, and lifteth up.* Hannah''s song answers the hundred and seventy thousand of Judith 7:2: the count of footmen and horsemen decides nothing, for the bringing low is His.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-licks-up-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-7-water-cut-off
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lamentations 4:4 — *The tongue of the sucking child cleaveth to the roof of his mouth for thirst: the young children ask bread, and no man breaketh it unto them.* Jeremiah''s siege-grief is the very horror Holofernes'' counsel intends in Judith 7:13, that thirst should kill the children of Bethulia.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-water-cut-off'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-7-faint-and-murmur
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 17:3 — *And the people thirsted there for water; and the people murmured against Moses, and said, Wherefore is this that thou hast brought us up out of Egypt, to kill us and our children and our cattle with thirst?* Bethulia''s fainting and murmuring for thirst in Judith 7:22 re-runs Rephidim, the same fear for the children dying of thirst.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-faint-and-murmur'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=17 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 21:5 — *And the people spake against Elohim (God), and against Moses, Wherefore have ye brought us up out of Egypt to die in the wilderness? for there is no bread, neither is there any water; and our soul loatheth this light bread.* The cry that surrender is better than death by thirst (Judith 7:27) is the wilderness murmur — preferring Egypt to the proving.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-faint-and-murmur'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=21 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-7-sold-and-proven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 8:2 — *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no.* Bethulia''s confession of being chastened for fathers'' sins (Judith 7:28) is the Deuteronomic proving — the siege is meant to search the heart.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-sold-and-proven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 8:3 — *And he humbled thee, and suffered thee to hunger, and fed thee with manna, which thou knewest not, neither did thy fathers know; that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live.* The cry that Yahuah has sold them to thirst (Judith 7:25) misreads the hunger and thirst that are meant to teach dependence on Him.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-sold-and-proven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-7-wait-five-days
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 27:14 — *Wait on Yahuah (LORD): be of good courage, and he shall strengthen thine heart: wait, I say, on Yahuah (LORD).* Ozias'' plea to endure five days for Yahuah''s mercy (Judith 7:30) is precisely this waiting and good courage that strengthens the heart.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-wait-five-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=27 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 20:12 — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* Bethulia''s confession that they have no helper (Judith 7:25) finds its right answer in Jehoshaphat''s turning of helplessness toward Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-wait-five-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God''s).* The five-day stay of Judith 7:30 waits on exactly this — that the deliverance belongs to Yahuah and not to Bethulia''s spears.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt7_lookup sv, _session253_jdt7_lookup tv
 WHERE t.slug='judith-7-wait-five-days'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=7 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

