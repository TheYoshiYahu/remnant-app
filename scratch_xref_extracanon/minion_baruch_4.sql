-- ----- fragment: minion_baruchwiththeletterofjeremiah_04.sql (session253 baruch-with-the-letter-of-jeremiah 4) -----
-- Source anchor: apocrypha/baruch-with-the-letter-of-jeremiah ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: bar4 (view _session253_bar4_lookup). Sort band base 60775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_bar4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: baruch-4-book-of-the-commandments
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1, 'canon', 'leviticus', 18, 5, 'free', E'Leviticus 18:5 — *Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD).* The Torah is the law of life Baruch 4:1 names, the keeping of which is to come to life.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1, 'canon', 'psalms', 19, 7, 'free', E'Psalms 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* The same perfect, soul-converting law that endureth for ever is the wisdom Baruch 4:1 holds out as the book of the commandments.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 1, 'canon', 'deuteronomy', 30, 14, 'free', E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The commandment is not far off but near and keepable, exactly the take-hold-of-it nearness Baruch 4:1-2 presses.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 2, 'canon', 'deuteronomy', 30, 12, 'free', E'Deuteronomy 30:12 — *It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* The light is not beyond reach to be fetched; turn and take hold of it, says Baruch 4:2.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 2, 'canon', 'romans', 10, 6, 'free', E'Romans 10:6 — *But the righteousness which is of faith speaketh on this wise, Say not in thine heart, Who shall ascend into heaven? (that is, to bring Messiah (Christ) down from above:)* Paul reads Moses'' near-word as faith laying hold of the same Wisdom Baruch 4:2 calls Jacob to take hold of.'),
  -- thread: baruch-4-sacrificing-to-devils
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 7, 'canon', 'deuteronomy', 32, 17, 'free', E'Deuteronomy 32:17 — *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* The Song of Moses is the very indictment Baruch 4:7 repeats: sacrificing to devils, not to Yahuah.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 7, 'canon', 'psalms', 106, 37, 'free', E'Psalms 106:37 — *Yea, they sacrificed their sons and their daughters unto devils,* The Psalter names the demonic worship that provoked the wrath Baruch 4:6-7 says delivered Israel to the enemies.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 7, 'canon', '1-corinthians', 10, 20, 'free', E'1 Corinthians 10:20 — *But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God): and I would not that ye should have fellowship with devils.* Paul confirms Baruch 4:7''s framework — idolatry is fellowship with devils, the system of dead gods, never to be shared.'),
  -- thread: baruch-4-jerusalem-the-widow
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 12, 'canon', 'lamentations', 1, 1, 'free', E'Lamentations 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* The widowed, forsaken Zion of Baruch 4:12 is the solitary widow-city Jeremiah already wept over.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 10, 'canon', 'lamentations', 1, 16, 'free', E'Lamentations 1:16 — *For these things I weep; mine eye, mine eye runneth down with water, because the comforter that should relieve my soul is far from me: my children are desolate, because the enemy prevailed.* Zion''s weeping over desolate children matches Baruch 4:10''s captivity of her sons and daughters.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 12, 'canon', 'lamentations', 1, 5, 'free', E'Lamentations 1:5 — *Her adversaries are the chief, her enemies prosper; for Yahuah (LORD) hath afflicted her for the multitude of her transgressions: her children are gone into captivity before the enemy.* Baruch 4:12 gives the same reason for the desolation: the children departed from the law and were carried away.'),
  -- thread: baruch-4-mercy-shall-soon-come
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 22, 'canon', 'isaiah', 40, 1, 'free', E'Isaiah 40:1 — *Comfort ye, comfort ye my people, saith your Elohim (God).* The mercy soon to come from the Everlasting Saviour in Baruch 4:22 is the very comfort Isaiah is commanded to speak to Yahuah''s people.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 22, 'canon', 'isaiah', 66, 13, 'free', E'Isaiah 66:13 — *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem.* The joy-from-the-Holy-One of Baruch 4:22 is Yahuah''s mother-comfort poured out in Jerusalem.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 23, 'canon', 'isaiah', 54, 7, 'free', E'Isaiah 54:7 — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* Baruch 4:23''s sending-out with weeping and giving-back with joy is the brief forsaking and great-mercy gathering Isaiah promises the widow-city.'),
  -- thread: baruch-4-tread-upon-his-neck
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 28, 'canon', 'deuteronomy', 30, 2, 'free', E'Deuteronomy 30:2 — *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul;* Baruch 4:28''s call to return and seek him ten times more is Moses'' wholehearted return that turns the captivity.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 25, 'canon', 'isaiah', 51, 23, 'free', E'Isaiah 51:23 — *But I will put it into the hand of them that afflict thee; which have said to thy soul, Bow down, that we may go over: and thou hast laid thy body as the ground, and as the street, to them that went over.* The cup passes to the persecutor, and the once-trodden tread upon the enemy''s neck, just as Baruch 4:25 foresees his destruction.'),
  -- thread: baruch-4-look-toward-the-east
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 37, 'canon', 'isaiah', 43, 5, 'free', E'Isaiah 43:5 — *Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west;* Baruch 4:37''s sons gathered from east to west are the seed Yahuah promises to bring from the east and gather from the west.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 37, 'canon', 'isaiah', 43, 6, 'free', E'Isaiah 43:6 — *I will say to the north, Give up; and to the south, Keep not back: bring my sons from far, and my daughters from the ends of the earth;* The four-winds regathering of sons and daughters in Isaiah is the very return Baruch 4:37 sees coming by the word of the Holy One.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 36, 'canon', 'isaiah', 49, 18, 'free', E'Isaiah 49:18 — *Lift up thine eyes round about, and behold: all these gather themselves together, and come to thee. As I live, saith Yahuah (LORD), thou shalt surely clothe thee with them all, as with an ornament, and bind them on thee, as a bride doeth.* Baruch 4:36''s call to Jerusalem to look and behold the coming joy is Isaiah''s lift-up-thine-eyes upon the gathering children.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 36, 'canon', 'isaiah', 60, 4, 'free', E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The sons-from-far and daughters returning to Zion are the regathered children Baruch 4:36-37 bids Jerusalem look east to behold.'),
  -- thread: baruch-4-happy-art-thou-israel
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 4, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The things pleasing to Yahuah made known in Baruch 4:4 are the life-and-good Moses set before Israel to choose.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 4, 4, 'canon', 'romans', 10, 2, 'free', E'Romans 10:2 — *For I bear them record that they have a zeal of Elohim (God), but not according to knowledge.* Paul honours the very knowledge of Elohim entrusted to Israel that Baruch 4:4 calls happy — the honour not to be handed to a strange nation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_bar4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_bar4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-book-of-the-commandments',
       E'The book of the commandments, the law that endureth for ever',
       E'Wisdom is not an abstraction but a book you can hold and keep: *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* (Baruch 4:1) — *Turn you, O Jacob, and take hold of it: walk in the presence of the light thereof, that you may be illuminated.* (Baruch 4:2). Moses already set it this near and this plain: *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* (Deuteronomy 30:14), having denied it was hidden — *It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* (Deuteronomy 30:12) — the very text Paul re-reads of the righteousness of faith, *Say not in thine heart, Who shall ascend into heaven? (that is, to bring Messiah (Christ) down from above:)* (Romans 10:6). The law is the law of life, never the law-as-curse: *Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD).* (Leviticus 18:5), and *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* (Psalms 19:7). It ain''t new — Wisdom and Torah are one book.',
       sv.verse_id, ev.verse_id, 'extras', 60775
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-sacrificing-to-devils',
       E'They provoked him by sacrificing to devils, not to Yahuah',
       E'The exile''s root is named without flinching: *You were sold to the nations, not for your destruction: but because you moved Yahuah (God) to wrath, you were delivered to the enemies.* (Baruch 4:6) — *For you provoked him that made you by sacrificing to devils, and not to Yahuah (God).* (Baruch 4:7). The charge is the Song of Moses verbatim in spirit: *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* (Deuteronomy 32:17). The Psalter records the cost of that whoring: *Yea, they sacrificed their sons and their daughters unto devils,* (Psalms 106:37). And Paul, dismantling the System of dead gods, says the same of all idol-worship: *But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God): and I would not that ye should have fellowship with devils.* (1 Corinthians 10:20). The polemic is against the demonic system, not a people — and the discipline is fatherly, *not for your destruction*.',
       sv.verse_id, ev.verse_id, 'extras', 60778
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-jerusalem-the-widow',
       E'Jerusalem the widow, left desolate of her children',
       E'Mother Zion speaks as a bereaved widow: *Let no man rejoice over me, a widow, and forsaken of many, who for the sins of my children am left desolate; because they departed from the law of Yahuah (God).* (Baruch 4:12) — *For I saw the captivity of my sons and daughters, which the Everlasting brought upon them.* (Baruch 4:10). Lamentations sang it first: *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* (Lamentations 1:1), and *For these things I weep; mine eye, mine eye runneth down with water, because the comforter that should relieve my soul is far from me: my children are desolate, because the enemy prevailed.* (Lamentations 1:16). The cause is the same — *Her adversaries are the chief, her enemies prosper; for Yahuah (LORD) hath afflicted her for the multitude of her transgressions: her children are gone into captivity before the enemy.* (Lamentations 1:5). The grief is real; so is the turn that follows.',
       sv.verse_id, ev.verse_id, 'extras', 60781
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-mercy-shall-soon-come',
       E'Be of good cheer: mercy and salvation shall soon come',
       E'The lament breaks into hope without going cheap: *For my hope is in the Everlasting, that he will save you; and joy is come to me from the Holy One, because of the mercy which shall soon come to you from the Everlasting our Saviour.* (Baruch 4:22) — *For I sent you out with mourning and weeping: but Yahuah (God) will give you to me again with joy and gladness for ever.* (Baruch 4:23). This is Isaiah''s gospel of comfort: *Comfort ye, comfort ye my people, saith your Elohim (God).* (Isaiah 40:1), and the mother-tenderness of *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem.* (Isaiah 66:13). The forsaking is a moment; the gathering is everlasting: *For a small moment have I forsaken thee; but with great mercies will I gather thee.* (Isaiah 54:7). Mercy soon-coming, mourning turned to joy — the same Everlasting Saviour.',
       sv.verse_id, ev.verse_id, 'extras', 60784
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-tread-upon-his-neck',
       E'Return and seek him: the enemy''s destruction, the foe''s mourning',
       E'Patient endurance is promised vindication, and repentance is real turning: *My children, suffer patiently the wrath that is come upon you from Yahuah (God): for your enemy has persecuted you; but shortly you shall see his destruction, and shall tread upon his neck.* (Baruch 4:25) — *For as it was your mind to go astray from Yahuah (God): so, being returned, seek him ten times more.* (Baruch 4:28). The seek-him-and-return is Moses'' own promise of restored captivity: *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul;* (Deuteronomy 30:2). The cup of fury passes to the persecutor: *But I will put it into the hand of them that afflict thee; which have said to thy soul, Bow down, that we may go over: and thou hast laid thy body as the ground, and as the street, to them that went over.* (Isaiah 51:23) — the trodden become the treaders, *shall tread upon his neck*. The mercy is never cheap; the turning is wholehearted.',
       sv.verse_id, ev.verse_id, 'extras', 60787
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-look-toward-the-east',
       E'Look toward the east: thy children gathered from east and west',
       E'The chapter ends in the two-house regathering: *O Jerusalem, look about you toward the east, and behold the joy that comes to you from Yahuah (God).* (Baruch 4:36) — *Lo, your sons come, whom you sentest away, they come gathered together from the east to the west by the word of the Holy One, rejoicing in the glory of Yahuah (God).* (Baruch 4:37). This is Isaiah''s gathering from the four winds: *Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west;* (Isaiah 43:5) — *I will say to the north, Give up; and to the south, Keep not back: bring my sons from far, and my daughters from the ends of the earth;* (Isaiah 43:6). It is the widow-city told to lift her eyes and count returning children: *Lift up thine eyes round about, and behold: all these gather themselves together, and come to thee. As I live, saith Yahuah (LORD), thou shalt surely clothe thee with them all, as with an ornament, and bind them on thee, as a bride doeth.* (Isaiah 49:18), and *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* (Isaiah 60:4). Not a church replacing Israel — the scattered sons and daughters of the two houses, gathered home by the word of the Holy One.',
       sv.verse_id, ev.verse_id, 'extras', 60790
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=36
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-4-happy-art-thou-israel',
       E'Happy art thou, O Israel: the things pleasing to Yahuah made known',
       E'Election is a gift to be guarded, not bartered: *Give not yours honour to another, nor the things that are profitable to you to a strange nation.* (Baruch 4:3) — *O Yashar''el (Israel), happy are we: for things that are pleasing to Yahuah (God) are made known to us.* (Baruch 4:4). It is Moses'' wonder that the near, doable word was given to this people: *See, I have set before thee this day life and good, and death and evil;* (Deuteronomy 30:15). And it carries the Torah-witness Paul still grants Israel — *For I bear them record that they have a zeal of Elohim (God), but not according to knowledge.* (Romans 10:2) — the honour not to be given to another, the knowledge of what pleases Yahuah, kept within the covenant people.',
       sv.verse_id, ev.verse_id, 'extras', 60793
  FROM _session253_bar4_lookup sv, _session253_bar4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: baruch-4-book-of-the-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 18:5 — *Ye shall therefore keep my statutes, and my judgments: which if a man do, he shall live in them: I am Yahuah (LORD).* The Torah is the law of life Baruch 4:1 names, the keeping of which is to come to life.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-book-of-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 19:7 — *The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* The same perfect, soul-converting law that endureth for ever is the wisdom Baruch 4:1 holds out as the book of the commandments.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-book-of-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:14 — *But the word is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it.* The commandment is not far off but near and keepable, exactly the take-hold-of-it nearness Baruch 4:1-2 presses.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-book-of-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 30:12 — *It is not in heaven, that thou shouldest say, Who shall go up for us to heaven, and bring it unto us, that we may hear it, and do it?* The light is not beyond reach to be fetched; turn and take hold of it, says Baruch 4:2.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-book-of-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 10:6 — *But the righteousness which is of faith speaketh on this wise, Say not in thine heart, Who shall ascend into heaven? (that is, to bring Messiah (Christ) down from above:)* Paul reads Moses'' near-word as faith laying hold of the same Wisdom Baruch 4:2 calls Jacob to take hold of.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-book-of-the-commandments'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-4-sacrificing-to-devils
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:17 — *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* The Song of Moses is the very indictment Baruch 4:7 repeats: sacrificing to devils, not to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-sacrificing-to-devils'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 106:37 — *Yea, they sacrificed their sons and their daughters unto devils,* The Psalter names the demonic worship that provoked the wrath Baruch 4:6-7 says delivered Israel to the enemies.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-sacrificing-to-devils'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 10:20 — *But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God): and I would not that ye should have fellowship with devils.* Paul confirms Baruch 4:7''s framework — idolatry is fellowship with devils, the system of dead gods, never to be shared.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-sacrificing-to-devils'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-4-jerusalem-the-widow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Lamentations 1:1 — *How doth the city sit solitary, that was full of people! how is she become as a widow! she that was great among the nations, and princess among the provinces, how is she become tributary!* The widowed, forsaken Zion of Baruch 4:12 is the solitary widow-city Jeremiah already wept over.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-jerusalem-the-widow'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 1:16 — *For these things I weep; mine eye, mine eye runneth down with water, because the comforter that should relieve my soul is far from me: my children are desolate, because the enemy prevailed.* Zion''s weeping over desolate children matches Baruch 4:10''s captivity of her sons and daughters.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-jerusalem-the-widow'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Lamentations 1:5 — *Her adversaries are the chief, her enemies prosper; for Yahuah (LORD) hath afflicted her for the multitude of her transgressions: her children are gone into captivity before the enemy.* Baruch 4:12 gives the same reason for the desolation: the children departed from the law and were carried away.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-jerusalem-the-widow'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-4-mercy-shall-soon-come
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:1 — *Comfort ye, comfort ye my people, saith your Elohim (God).* The mercy soon to come from the Everlasting Saviour in Baruch 4:22 is the very comfort Isaiah is commanded to speak to Yahuah''s people.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-mercy-shall-soon-come'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:13 — *As one whom his mother comforteth, so will I comfort you; and ye shall be comforted in Jerusalem.* The joy-from-the-Holy-One of Baruch 4:22 is Yahuah''s mother-comfort poured out in Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-mercy-shall-soon-come'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 54:7 — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* Baruch 4:23''s sending-out with weeping and giving-back with joy is the brief forsaking and great-mercy gathering Isaiah promises the widow-city.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-mercy-shall-soon-come'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-4-tread-upon-his-neck
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:2 — *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul;* Baruch 4:28''s call to return and seek him ten times more is Moses'' wholehearted return that turns the captivity.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-tread-upon-his-neck'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 51:23 — *But I will put it into the hand of them that afflict thee; which have said to thy soul, Bow down, that we may go over: and thou hast laid thy body as the ground, and as the street, to them that went over.* The cup passes to the persecutor, and the once-trodden tread upon the enemy''s neck, just as Baruch 4:25 foresees his destruction.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-tread-upon-his-neck'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-4-look-toward-the-east
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 43:5 — *Fear not: for I am with thee: I will bring thy seed from the east, and gather thee from the west;* Baruch 4:37''s sons gathered from east to west are the seed Yahuah promises to bring from the east and gather from the west.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-look-toward-the-east'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 43:6 — *I will say to the north, Give up; and to the south, Keep not back: bring my sons from far, and my daughters from the ends of the earth;* The four-winds regathering of sons and daughters in Isaiah is the very return Baruch 4:37 sees coming by the word of the Holy One.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-look-toward-the-east'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 49:18 — *Lift up thine eyes round about, and behold: all these gather themselves together, and come to thee. As I live, saith Yahuah (LORD), thou shalt surely clothe thee with them all, as with an ornament, and bind them on thee, as a bride doeth.* Baruch 4:36''s call to Jerusalem to look and behold the coming joy is Isaiah''s lift-up-thine-eyes upon the gathering children.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-look-toward-the-east'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The sons-from-far and daughters returning to Zion are the regathered children Baruch 4:36-37 bids Jerusalem look east to behold.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-look-toward-the-east'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-4-happy-art-thou-israel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* The things pleasing to Yahuah made known in Baruch 4:4 are the life-and-good Moses set before Israel to choose.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-happy-art-thou-israel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 10:2 — *For I bear them record that they have a zeal of Elohim (God), but not according to knowledge.* Paul honours the very knowledge of Elohim entrusted to Israel that Baruch 4:4 calls happy — the honour not to be handed to a strange nation.'
  FROM cross_reference_threads t, cross_references x, _session253_bar4_lookup sv, _session253_bar4_lookup tv
 WHERE t.slug='baruch-4-happy-art-thou-israel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

