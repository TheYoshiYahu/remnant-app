-- ----- fragment: minion_jubilees_14.sql (session251 jubilees 14) -----
-- Source anchor: jubilees/jubilees ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju14 (view _session251_ju14_lookup). Sort band base 53325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-14-fear-not-i-am-thy-shield
  ('jubilees', 'jubilees', 14, 1, 'canon', 'genesis', 15, 1, 'free', E'Genesis 15:1 — *After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward.* The same word, the same vision, the same "Fear not" — Jubilees 14:1 retells Genesis 15 verbatim.'),
  ('jubilees', 'jubilees', 14, 2, 'canon', 'genesis', 15, 2, 'free', E'Genesis 15:2 — *And Abram said, Yahuah (Lord) GOD, what wilt thou give me, seeing I go childless, and the steward of my house is this Eliezer of Damascus?* Abram''s childless complaint and the steward Eliezer stand in both Jubilees 14:2 and its Genesis source.'),
  ('jubilees', 'jubilees', 14, 3, 'canon', 'genesis', 15, 4, 'free', E'Genesis 15:4 — *And, behold, the word of Yahuah (LORD) came unto him, saying, This shall not be thine heir; but he that shall come forth out of thine own bowels shall be thine heir.* The heir of the bowels, not of the house — Jubilees 14:3 carries the Genesis promise of a true seed.'),
  -- thread: jubilees-14-count-the-stars-believed-righteousness
  ('jubilees', 'jubilees', 14, 5, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The star-numbering sign of the seed is identical in Jubilees 14:4-5 and Genesis 15.'),
  ('jubilees', 'jubilees', 14, 6, 'canon', 'genesis', 15, 6, 'free', E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness.* Jubilees 14:6 preserves the founding word of faith-counted-righteousness exactly as Genesis records it.'),
  ('jubilees', 'jubilees', 14, 6, 'canon', 'romans', 4, 3, 'free', E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* Sha''ul quotes the very verse Jubilees 14:6 retells — righteousness by faith ain''t new.'),
  ('jubilees', 'jubilees', 14, 6, 'canon', 'galatians', 3, 6, 'free', E'Galatians 3:6 — *Even as Abraham believed Elohim (God), and it was accounted to him for righteousness.* The faith reckoned to Abram in Jubilees 14:6 is the ground on which Galatians names the children of faith.'),
  ('jubilees', 'jubilees', 14, 6, 'canon', 'galatians', 3, 7, 'free', E'Galatians 3:7 — *Know ye therefore that they which are of faith, the same are the children of Abraham.* Those of Abram''s faith (Jubilees 14:6) are reckoned his children — the seed kept by faith, not flesh alone.'),
  -- thread: jubilees-14-out-of-ur-land-promise
  ('jubilees', 'jubilees', 14, 6, 'canon', 'genesis', 15, 7, 'free', E'Genesis 15:7 — *And he said unto him, I am Yahuah (LORD) that brought thee out of Ur of the Chaldees, to give thee this land to inherit it.* The self-naming by the deliverance out of Ur (Jubilees 14:6) is Abraham''s election out of the idolatrous nations.'),
  ('jubilees', 'jubilees', 14, 8, 'canon', 'genesis', 15, 8, 'free', E'Genesis 15:8 — *And he said, Yahuah (Lord) GOD, whereby shall I know that I shall inherit it?* Abram''s request for surety of the inheritance stands word for word in Jubilees 14:8.'),
  ('jubilees', 'jubilees', 14, 18, 'canon', 'genesis', 15, 18, 'free', E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* The land covenant from Egypt to the Euphrates is identical in Jubilees 14:18 and Genesis.'),
  ('jubilees', 'jubilees', 14, 6, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The "to you and to your seed after you" of Jubilees 14:6 is the everlasting seed-covenant Genesis 17 seals with circumcision.'),
  -- thread: jubilees-14-pieces-furnace-lamp-four-hundred-years
  ('jubilees', 'jubilees', 14, 11, 'canon', 'genesis', 15, 10, 'free', E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* The dividing of the pieces with the birds undivided is the same rite in Jubilees 14:11.'),
  ('jubilees', 'jubilees', 14, 13, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The four-hundred-year bondage foretold in Jubilees 14:13 is Genesis word for word.'),
  ('jubilees', 'jubilees', 14, 16, 'canon', 'genesis', 15, 17, 'free', E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The smoking furnace and flame passing between the pieces (Jubilees 14:16) is the sign of Yahuah cutting the covenant alone.'),
  ('jubilees', 'jubilees', 14, 13, 'canon', 'exodus', 12, 41, 'free', E'Exodus 12:41 — *And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt.* The affliction-word of Jubilees 14:13 came to pass to the very day — the tablets foretell history before it unfolds.'),
  ('jubilees', 'jubilees', 14, 13, 'enoch', '1-enoch', 81, 1, 'extras', E'1 Enoch 81:1 — *And he said unto me: ''Observe, Enoch, these heavenly tablets, And read what is written thereon, And understand every single fact.''* The four-hundred-year word of Jubilees 14:13 is read off the same heavenly tablets Enoch is shown — the history pre-written.'),
  -- thread: jubilees-14-covenant-with-noah-feast-renewed-for-ever
  ('jubilees', 'jubilees', 14, 20, 'jubilees', 'jubilees', 6, 17, 'extras', E'Jubilees 6:17 — *For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year. And this whole festival was celebrated in heaven from the day of creation till the days of Noah-twenty-six jubilees and five weeks of years: and Noah and his sons observed it for seven jubilees and one week of years, till the day of Noah''s death, and from the day of Noah''s death his sons did away with (it) until the days of Abraham, and they ate blood.* The covenant Abram renews "as we covenanted with Noah" (Jubilees 14:20) is the Feast of Weeks, engraved on the heavenly tablets and kept since creation.'),
  ('jubilees', 'jubilees', 14, 20, 'jubilees', 'jubilees', 6, 19, 'extras', E'Jubilees 6:19 — *But Abraham observed it, and Isaac and Jacob and his children observed it up to your days, and in your days the children of Yashar''el (Israel) forgot it until you celebrated it anew on this mountain.* Jubilees 14:20 shows Abraham renewing the very feast 6:19 says he observed — the patriarchs kept the appointed times, it ain''t new.'),
  ('jubilees', 'jubilees', 14, 20, 'canon', 'leviticus', 23, 15, 'free', E'Leviticus 23:15 — *And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete:* The festival ordinance Abram renews for ever (Jubilees 14:20) is the counted Feast of Weeks fixed in the Torah.'),
  ('jubilees', 'jubilees', 14, 18, 'canon', 'genesis', 15, 18, 'free', E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* Jubilees 14:18-20 anchors the same "in that day" land-covenant of Genesis 15 in the recurring oath-feast.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-14-fear-not-i-am-thy-shield',
       E'Fear not, Abram — the word in the vision, I am thy shield',
       E'Jubilees opens the covenant of the pieces exactly where Genesis does: *"After these things, in the fourth year of this week, on the new moon of the third month, the word of Yahuah (God) came to Abram in a dream, saying: ''Fear not, Abram; I am your defender, and your reward will be exceeding great.''"* (Jubilees 14:1). It ain''t new — it is the *word that came unto Abram in a vision*: *"After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward."* (Genesis 15:1). Abram answers out of his childlessness — *"Yahuah (God), Yahuah (God), what will you give me, seeing I go hence childless..."* (Jubilees 14:2) — the same complaint Genesis records: *"And Abram said, Yahuah (Lord) GOD, what wilt thou give me, seeing I go childless, and the steward of my house is this Eliezer of Damascus?"* (Genesis 15:2). And the heir is named not from the house but from the bowels: *"This (man) will not be your heir, but one that will come out of your own bowels; he will be your heir."* (Jubilees 14:3) answers to *"This shall not be thine heir; but he that shall come forth out of thine own bowels shall be thine heir."* (Genesis 15:4). The chosen line — Abram pulled out of Ur of the Chaldees, out of the idolatrous nations — is given the promise of a seed.',
       sv.verse_id, ev.verse_id, 'extras', 53325
  FROM _session251_ju14_lookup sv, _session251_ju14_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=14 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-14-count-the-stars-believed-righteousness',
       E'Count the stars — he believed, and it was counted for righteousness',
       E'Here is the hinge of the whole framework. Yahuah brings Abram out and bids him number the stars: *"And He brought him forth abroad, and said to him: ''Look toward heaven and number the stars, if you are able to number them.''"* (Jubilees 14:4), and *"And he looked toward heaven, and beheld the stars. And He said to him: ''So shall your seed be.''"* (Jubilees 14:5) — word for word the Genesis sign: *"And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be."* (Genesis 15:5). Then the verse the apostles built upon: *"And he believed in Yahuah (God), and it was counted to him for righteousness."* (Jubilees 14:6) — *"And he believed in Yahuah (LORD); and he counted it to him for righteousness."* (Genesis 15:6). Faith counted for righteousness ain''t new and it ain''t Paul''s invention; Sha''ul simply read it off the page: *"For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness."* (Romans 4:3). And those who walk in that faith are reckoned Abraham''s children: *"Even as Abraham believed Elohim (God), and it was accounted to him for righteousness. Know ye therefore that they which are of faith, the same are the children of Abraham."* (Galatians 3:6-7). The Torah does not become a curse here — election precedes the law, faith precedes the sign, and the seed promised is the seed kept.',
       sv.verse_id, ev.verse_id, 'extras', 53328
  FROM _session251_ju14_lookup sv, _session251_ju14_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=14 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-14-out-of-ur-land-promise',
       E'Out of Ur of the Chaldees — election out of idolatry, the land covenant',
       E'The God of the covenant identifies Himself by the election: *"...I am Yahuah (God) that brought you out of Ur of the Chaldees, to give you the land of the Canaanites to possess it for ever; and I shall be Elohim (God) to you and to your seed after you."* (Jubilees 14:6) — drawn out of the idolatrous Chaldean line, just as Genesis says: *"And he said unto him, I am Yahuah (LORD) that brought thee out of Ur of the Chaldees, to give thee this land to inherit it."* (Genesis 15:7). Abram asks for surety — *"Yahuah (God), Yahuah (God), whereby shall I know that I shall inherit (it)?"* (Jubilees 14:8) / *"And he said, Yahuah (Lord) GOD, whereby shall I know that I shall inherit it?"* (Genesis 15:8). And the land is bounded river to river: *"...To your seed will I give this land, from the river of Egypt to the great river, the river Euphrates..."* (Jubilees 14:18) — *"In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:"* (Genesis 15:18). This "to you and to your seed after you" is the same everlasting seed-covenant Genesis 17 seals: *"And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee."* (Genesis 17:7). Election precedes confession; Yahuah chooses the line and keeps it.',
       sv.verse_id, ev.verse_id, 'extras', 53331
  FROM _session251_ju14_lookup sv, _session251_ju14_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=14 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-14-pieces-furnace-lamp-four-hundred-years',
       E'The pieces, the deep sleep, the furnace and the lamp, the four hundred years',
       E'The cutting of the covenant is retold piece for piece. Abram divides the beasts and drives off the birds: *"And he built there an altar, and sacrificed all these; and he poured their blood upon the altar, and divided them in the midst, and laid them over against each other; but the birds divided he not. And birds came down upon the pieces, and Abram drove them away..."* (Jubilees 14:11) — *"And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not."* (Genesis 15:10). Then the dread sleep and the four-hundred-year word: *"...an horror of great darkness fell upon him, and it was said to Abram: ''Know of a surety that your seed shall be a stranger in a land (that is) not theirs, and they will bring them into bondage, and afflict them four hundred years."* (Jubilees 14:13) — *"And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;"* (Genesis 15:13). And the smoking furnace and flame pass between the pieces: *"...and there was a flame, and behold! a furnace was smoking, and a flame of fire passed between the pieces."* (Jubilees 14:16) — *"...behold a smoking furnace, and a burning lamp that passed between those pieces."* (Genesis 15:17). That bondage-word found its day exactly: *"And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt."* (Exodus 12:41) — the heavenly tablets foretold the affliction and the deliverance before either came to pass.',
       sv.verse_id, ev.verse_id, 'extras', 53334
  FROM _session251_ju14_lookup sv, _session251_ju14_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=14 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-14-covenant-with-noah-feast-renewed-for-ever',
       E'As we covenanted with Noah — the feast renewed for ever, it ain''t new',
       E'Here Jubilees does what only Jubilees does: it grounds the covenant of the pieces in the patriarchal FEAST. *"And on that day we made a covenant with Abram, according as we had covenanted with Noah in this month; and Abram renewed the festival and ordinance for himself for ever."* (Jubilees 14:20). The covenant comes "on the new moon of the third month" (14:1) — the third month, the month of the oath-feast, the Feast of Weeks. Jubilees elsewhere makes this explicit: the covenant-oath feast was kept by Noah and renewed by Abraham and engraved on the heavenly tablets — *"For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year... and Noah and his sons observed it..."* (Jubilees 6:17), and *"But Abraham observed it, and Isaac and Jacob and his children observed it up to your days..."* (Jubilees 6:19). This is Yoshi''s Appointed Times: the feast Abram "renewed for himself for ever" is the Shavuot of Torah, the covenant-feast counted from the wave-sheaf — *"And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete:"* (Leviticus 23:15). It ain''t a later Jewish invention and it ain''t abolished — Abram kept it, the heavenly tablets carry it, and it stands for ever. The seed-promise here begins to bend toward Ishmael and Hagar (14:22-24), but the festival ordinance is fixed.',
       sv.verse_id, ev.verse_id, 'extras', 53337
  FROM _session251_ju14_lookup sv, _session251_ju14_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=14 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-14-fear-not-i-am-thy-shield
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:1 — *After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward.* The same word, the same vision, the same "Fear not" — Jubilees 14:1 retells Genesis 15 verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-fear-not-i-am-thy-shield'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:2 — *And Abram said, Yahuah (Lord) GOD, what wilt thou give me, seeing I go childless, and the steward of my house is this Eliezer of Damascus?* Abram''s childless complaint and the steward Eliezer stand in both Jubilees 14:2 and its Genesis source.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-fear-not-i-am-thy-shield'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:4 — *And, behold, the word of Yahuah (LORD) came unto him, saying, This shall not be thine heir; but he that shall come forth out of thine own bowels shall be thine heir.* The heir of the bowels, not of the house — Jubilees 14:3 carries the Genesis promise of a true seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-fear-not-i-am-thy-shield'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-14-count-the-stars-believed-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The star-numbering sign of the seed is identical in Jubilees 14:4-5 and Genesis 15.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-count-the-stars-believed-righteousness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness.* Jubilees 14:6 preserves the founding word of faith-counted-righteousness exactly as Genesis records it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-count-the-stars-believed-righteousness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* Sha''ul quotes the very verse Jubilees 14:6 retells — righteousness by faith ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-count-the-stars-believed-righteousness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 3:6 — *Even as Abraham believed Elohim (God), and it was accounted to him for righteousness.* The faith reckoned to Abram in Jubilees 14:6 is the ground on which Galatians names the children of faith.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-count-the-stars-believed-righteousness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Galatians 3:7 — *Know ye therefore that they which are of faith, the same are the children of Abraham.* Those of Abram''s faith (Jubilees 14:6) are reckoned his children — the seed kept by faith, not flesh alone.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-count-the-stars-believed-righteousness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-14-out-of-ur-land-promise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:7 — *And he said unto him, I am Yahuah (LORD) that brought thee out of Ur of the Chaldees, to give thee this land to inherit it.* The self-naming by the deliverance out of Ur (Jubilees 14:6) is Abraham''s election out of the idolatrous nations.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-out-of-ur-land-promise'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:8 — *And he said, Yahuah (Lord) GOD, whereby shall I know that I shall inherit it?* Abram''s request for surety of the inheritance stands word for word in Jubilees 14:8.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-out-of-ur-land-promise'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* The land covenant from Egypt to the Euphrates is identical in Jubilees 14:18 and Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-out-of-ur-land-promise'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The "to you and to your seed after you" of Jubilees 14:6 is the everlasting seed-covenant Genesis 17 seals with circumcision.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-out-of-ur-land-promise'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-14-pieces-furnace-lamp-four-hundred-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* The dividing of the pieces with the birds undivided is the same rite in Jubilees 14:11.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-pieces-furnace-lamp-four-hundred-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years;* The four-hundred-year bondage foretold in Jubilees 14:13 is Genesis word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-pieces-furnace-lamp-four-hundred-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The smoking furnace and flame passing between the pieces (Jubilees 14:16) is the sign of Yahuah cutting the covenant alone.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-pieces-furnace-lamp-four-hundred-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 12:41 — *And it came to pass at the end of the four hundred and thirty years, even the selfsame day it came to pass, that all the hosts of Yahuah (LORD) went out from the land of Egypt.* The affliction-word of Jubilees 14:13 came to pass to the very day — the tablets foretell history before it unfolds.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-pieces-furnace-lamp-four-hundred-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 81:1 — *And he said unto me: ''Observe, Enoch, these heavenly tablets, And read what is written thereon, And understand every single fact.''* The four-hundred-year word of Jubilees 14:13 is read off the same heavenly tablets Enoch is shown — the history pre-written.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-pieces-furnace-lamp-four-hundred-years'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=81 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-14-covenant-with-noah-feast-renewed-for-ever
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 6:17 — *For this reason it is ordained and written on the heavenly tables, that they should celebrate the feast of weeks in this month once a year, to renew the covenant every year. And this whole festival was celebrated in heaven from the day of creation till the days of Noah-twenty-six jubilees and five weeks of years: and Noah and his sons observed it for seven jubilees and one week of years, till the day of Noah''s death, and from the day of Noah''s death his sons did away with (it) until the days of Abraham, and they ate blood.* The covenant Abram renews "as we covenanted with Noah" (Jubilees 14:20) is the Feast of Weeks, engraved on the heavenly tablets and kept since creation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-covenant-with-noah-feast-renewed-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 6:19 — *But Abraham observed it, and Isaac and Jacob and his children observed it up to your days, and in your days the children of Yashar''el (Israel) forgot it until you celebrated it anew on this mountain.* Jubilees 14:20 shows Abraham renewing the very feast 6:19 says he observed — the patriarchs kept the appointed times, it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-covenant-with-noah-feast-renewed-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:15 — *And ye shall count unto you from the morrow after the sabbath, from the day that ye brought the sheaf of the wave offering; seven sabbaths shall be complete:* The festival ordinance Abram renews for ever (Jubilees 14:20) is the counted Feast of Weeks fixed in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-covenant-with-noah-feast-renewed-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates:* Jubilees 14:18-20 anchors the same "in that day" land-covenant of Genesis 15 in the recurring oath-feast.'
  FROM cross_reference_threads t, cross_references x, _session251_ju14_lookup sv, _session251_ju14_lookup tv
 WHERE t.slug='jubilees-14-covenant-with-noah-feast-renewed-for-ever'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

