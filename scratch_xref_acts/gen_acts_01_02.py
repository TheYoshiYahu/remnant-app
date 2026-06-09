#!/usr/bin/env python3
"""S217 Acts 1-2 pilot fragment generator.
Pulls every TARGET verse verbatim from the parsed editions so the note quotes the
real text (fidelity gate passes by construction), wraps it in come-and-see prose,
and emits the edition-aware FULL-LIBRARY SQL fragment (S212 John template shape).
Connective prose / framework reading is authored here; the quoted verse is the parse.
"""
import json, os, sys, re

BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'source-texts', 'parsed')
EDFILES = {'canon':'canon','enoch':'enoch','jubilees':'jubilees','jasher':'jasher',
 'apocrypha':'apocrypha','apocrypha-charles-vol1':'apocrypha-charles-vol1',
 'pseudepigrapha':'pseudepigrapha-charles-vol2','adam-eve-conflict':'adam-eve-conflict',
 'apocalypse-of-abraham':'apocalypse-of-abraham','ascension-isaiah':'ascension-isaiah',
 'sonnini-acts-29':'sonnini-acts-29'}
VERSE = {}
for es, fn in EDFILES.items():
    d = json.load(open(os.path.join(BASE, fn + '.json')))
    for b in d['books']:
        bid = b.get('book_id') or b.get('slug')
        for c in b['chapters']:
            cn = c.get('number') or c.get('chapter_number')
            for v in c.get('verses', []):
                VERSE[(es, bid, cn, v['number'])] = v['text']

def txt(ed, slug, ch, v):
    t = VERSE.get((ed, slug, ch, v))
    if t is None:
        sys.exit(f"MISSING VERSE {ed} {slug} {ch}:{v}")
    return t.rstrip(' ⸻').strip()

def esc(s):
    # Normalize any accidental straight-apostrophe doubling in authored prose (source
    # verse text never contains '' ), then escape uniformly for the E'...' literal.
    s = s.replace("\\", "\\\\")
    s = re.sub(r"'+", "'", s)
    return s.replace("'", "''")

def norm_ap(s):
    return s.replace("''", "'")

# ---- Thread definitions -------------------------------------------------------
# member = dict(src_v, ed, slug, ch, v, cite, connect, frag, mconn[, src_ch])
# src chapter defaults to the thread's book chapter (1 or 2) unless src_ch given.
THREADS = []

THREADS.append(dict(
 slug='acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering',
 title="Restore again the kingdom to Yashar''el — the twelve-tribe gathering",
 sort=5000, a_start=('acts',1,6), a_end=('acts',1,8), src_ch=1,
 summary=("When the disciples ask the risen Messiah *wilt thou at this time restore again "
   "the kingdom to Yashar''el (Israel)?* (Acts 1:6), he does not correct the hope — he tells "
   "them the timing belongs to the Father (Acts 1:7) and turns them to witness *unto the "
   "uttermost part of the earth* (Acts 1:8), out where the scattered are. The restoration "
   "they ask after is the prophets'' own. Ezekiel names it: *I will take the children of "
   "Yashar''el (Israel) from among the heathen … and bring them into their own land* (Ezekiel "
   "37:21), made *one nation … and one king … no more two nations* (Ezekiel 37:22). Amos names "
   "it: *in that day will I raise up the tabernacle of David that is fallen* (Amos 9:11). "
   "Isaiah names it: *he shall … assemble the outcasts of Yashar''el (Israel), and gather "
   "together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah "
   "11:12). The Hebrew library carried the same gathering-hope from inside the exile: Tobit, "
   "captive of the Assyrian dispersion, says *again Yahuah (God) will have mercy on them, and "
   "bring them again into the land* (Tobit 14:5); 2 Esdras names the very tribes — *those are "
   "the ten tribes, which were carried away prisoners out of their own land* (2 Esdras 13:40); "
   "Ecclesiasticus names the forerunner''s charge, *to restore the tribes of Jacob* "
   "(Ecclesiasticus 48:10). And Yahusha (Jesus) had already shown the shape of the restored "
   "kingdom — *ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar''el "
   "(Israel)* (Matthew 19:28) — the same gathering the Yerushalayim (Jerusalem) council will "
   "later confess from Amos: *I will return, and will build again the tabernacle of David, "
   "which is fallen down* (Acts 15:16). The kingdom restored to Yashar''el is the twelve-tribe "
   "gathering the whole library promised — not a new people put in its place."),
 members=[
  dict(src_v=6, ed='canon', slug='ezekiel', ch=37, v=21, cite='Ezekiel 37:21',
   connect="The disciples'' question in Acts 1:6 is the prophet''s own. Ezekiel names the gathering that restores the kingdom: the scattered taken from among the heathen and brought into their own land.",
   frag="I will take the children of Yashar'el (Israel) from among the heathen, whither they be gone, and will gather them on every side",
   mconn="— the scattered gathered home, the kingdom of Acts 1:6 restored."),
  dict(src_v=6, ed='canon', slug='ezekiel', ch=37, v=22, cite='Ezekiel 37:22',
   connect="The restored kingdom is the two houses made one — one nation, one king, the divided kingdom of Ephraim and Yahudah (Judah) ended. That is the restoration the disciples ask after in Acts 1:6.",
   frag="they shall be no more two nations, neither shall they be divided into two kingdoms any more at all",
   mconn="Ephraim and Yahudah (Judah) one kingdom under one king."),
  dict(src_v=6, ed='canon', slug='amos', ch=9, v=11, cite='Amos 9:11',
   connect="The restored kingdom is the raised tabernacle of David — the very prophecy James will quote over the gathering at the council (Acts 15:16). Acts 1:6''s restoration and Amos''s fallen-tabernacle-raised are one hope.",
   frag="In that day will I raise up the tabernacle of David that is fallen",
   mconn="the restored kingdom James quotes at Acts 15:16."),
  dict(src_v=6, ed='canon', slug='isaiah', ch=11, v=12, cite='Isaiah 11:12',
   connect="The restoration is the assembling of the outcasts and the dispersed from the four corners of the earth. *Restore again the kingdom to Yashar''el* (Acts 1:6) is Isaiah''s ensign for the nations and the scattered seed gathered home.",
   frag="assemble the outcasts of Yashar'el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth",
   mconn="the dispersed gathered from the four corners — the restoration of Acts 1:6."),
  dict(src_v=6, ed='apocrypha', slug='tobit', ch=14, v=5, cite='Tobit 14:5',
   connect="The Hebrew library confessed the same gathering-hope from inside the dispersion. Tobit, a captive of the Assyrian exile, names the mercy that brings the scattered back into the land — the restoration Acts 1:6 asks after, spoken by one of the northern scattered.",
   frag="again Yahuah (God) will have mercy on them, and bring them again into the land",
   mconn="the exile's own gathering-hope — the kingdom restored."),
  dict(src_v=6, ed='apocrypha', slug='2-esdras', ch=13, v=40, cite='2 Esdras 13:40',
   connect="2 Esdras names the very tribes in question — the ten tribes carried away by Assyria, kept for the latter time. The kingdom restored to Yashar''el (Acts 1:6) is these named, traced, scattered tribes brought home, not a spiritualized remnant.",
   frag="Those are the ten tribes, which were carried away prisoners out of their own land",
   mconn="the named tribes kept for the latter time, restored."),
  dict(src_v=6, ed='apocrypha', slug='ecclesiasticus', ch=48, v=10, cite='Ecclesiasticus 48:10',
   connect="The library names the forerunner''s charge: *to restore the tribes of Jacob.* The restoration the disciples ask about in Acts 1:6 is the tribes of Jacob restored — the work of the spirit of Elijah, the turning of hearts before the great day.",
   frag="to turn the heart of the father to the son, and to restore the tribes of Jacob",
   mconn="the forerunner's charge — the tribes restored, the hearts turned."),
  dict(src_v=8, ed='canon', slug='matthew', ch=19, v=28, cite='Matthew 19:28',
   connect="Yahusha (Jesus) had already shown the shape of the restored kingdom — twelve thrones judging the twelve tribes of Yashar''el (Israel). The power received in Acts 1:8 is witness to that gathering, the regeneration when the Son of Adam sits on the throne of his glory.",
   frag="ye also shall sit upon twelve thrones, judging the twelve tribes of Yashar'el (Israel)",
   mconn="the shape of the restored kingdom Acts 1:6 asks after."),
  dict(src_v=8, ed='canon', slug='acts', ch=15, v=16, cite='Acts 15:16',
   connect="When the council later weighs the gathering, James answers with Amos — *I will … build again the tabernacle of David, which is fallen down.* The restoration of Acts 1:6 and the rebuilt tabernacle of Acts 15:16 are one hope: the twelve-tribe kingdom raised, not replaced.",
   frag="I will return, and will build again the tabernacle of David, which is fallen down",
   mconn="Amos's prophecy over the gathering — the kingdom raised, not replaced."),
 ]))

THREADS.append(dict(
 slug='acts-1-the-cloud-received-him-and-his-return-on-the-clouds',
 title="A cloud received him — the Son of Adam taken up and returning on the clouds",
 sort=5010, a_start=('acts',1,9), a_end=('acts',1,12), src_ch=1,
 summary=("*A cloud received him out of their sight* (Acts 1:9), and two men in white promise "
   "*this same Yahusha (Jesus) … shall so come in like manner as ye have seen him go* (Acts "
   "1:11). The cloud is the Formed-one''s own chariot. Daniel saw the same figure on the same "
   "clouds — *one like the Son of Adam came with the clouds of heaven* (Daniel 7:13) — the kaph "
   "honoring the incarnation: he resembled mortal-man because he took on flesh, while remaining "
   "the cloud-rider brought before the Ancient of days to receive the everlasting kingdom. The "
   "Revelation names the manner of the return: *behold, he cometh with clouds; and every eye "
   "shall see him* (Revelation 1:7). And Zechariah names the place: they watched him go from the "
   "mount of Olives (Acts 1:12), and *his feet shall stand in that day upon the mount of Olives* "
   "(Zechariah 14:4) — he ascended from Olivet and to Olivet he returns. The Hebrew library "
   "already named the coming the angels promise: *behold! He cometh with ten thousands of His "
   "set-apart ones, to execute judgement upon all* (1 Enoch 1:9) — the same coming Jude quoted. "
   "The One taken up in a cloud returns on the clouds with the hosts of heaven."),
 members=[
  dict(src_v=9, ed='canon', slug='daniel', ch=7, v=13, cite='Daniel 7:13',
   connect="*A cloud received him out of their sight* (Acts 1:9). Daniel saw the same figure on the same clouds — *one like the Son of Adam* — the kaph honoring the incarnation: he resembled mortal-man because he took on flesh, while remaining the Formed cloud-rider brought before the Ancient of days to receive the everlasting kingdom.",
   frag="one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days",
   mconn="the kaph honoring the incarnation — the Formed cloud-rider taken up (Acts 1:9)."),
  dict(src_v=11, ed='canon', slug='revelation', ch=1, v=7, cite='Revelation 1:7',
   connect="*Shall so come in like manner as ye have seen him go* (Acts 1:11). The Revelation names the manner of the return — he comes with clouds, and every eye sees him. He went up in a cloud; he comes again on the clouds.",
   frag="Behold, he cometh with clouds; and every eye shall see him",
   mconn="the same-manner return promised in Acts 1:11."),
  dict(src_v=12, ed='canon', slug='zechariah', ch=14, v=4, cite='Zechariah 14:4',
   connect="They watched him go from the mount called Olivet (Acts 1:12), and Zechariah names where his feet return — upon the mount of Olives. He ascended from Olivet; to Olivet he descends. The same-manner return is mapped to the same mountain.",
   frag="his feet shall stand in that day upon the mount of Olives, which is before Jerusalem on the east",
   mconn="he ascended from Olivet (Acts 1:12); to Olivet he returns."),
  dict(src_v=11, ed='enoch', slug='1-enoch', ch=1, v=9, cite='1 Enoch 1:9',
   connect="The Hebrew library named the coming the angels promise — *He cometh with ten thousands of His set-apart ones, to execute judgement upon all.* The same-manner return of Acts 1:11 is the Enochic coming-with-the-holy-myriads that Jude quoted; the One taken up returns with the hosts of heaven.",
   frag="He cometh with ten thousands of His set-apart ones To execute judgement upon all",
   mconn="the coming-with-the-myriads Jude quoted — the One taken up returns with the hosts."),
 ]))

THREADS.append(dict(
 slug='acts-1-the-betrayer-and-the-psalms-of-the-familiar-friend',
 title="The betrayer's place — the psalms of the familiar friend who lifted up his heel",
 sort=5018, a_start=('acts',1,16), a_end=('acts',1,20), src_ch=1,
 summary=("Peter reads Judas''s end out of the Psalms — *this scripture must needs have been "
   "fulfilled, which the Ruach HaKodesh (Holy Spirit) by the mouth of David spake before "
   "concerning Judas* (Acts 1:16) — and quotes two of them over the vacant place: *let his "
   "habitation be desolate* (Psalm 69:25) and *his bishoprick let another take* (Psalm 109:8). "
   "These are the psalms of the persecuted righteous one, and behind them stands the wound "
   "David named directly: *mine own familiar friend, in whom I trusted, which did eat of my "
   "bread, hath lifted up his heel against me* (Psalm 41:9) — the very verse Yahusha (Jesus) "
   "had applied to Judas at the supper: *he that eateth bread with me hath lifted up his heel "
   "against me* (John 13:18). The betrayer at the table is the ancient pattern of the friend "
   "who eats the bread and turns; the office he forfeits does not stay empty, for the lot will "
   "fall on Matthias (Acts 1:26)."),
 members=[
  dict(src_v=20, ed='canon', slug='psalms', ch=69, v=25, cite='Psalm 69:25',
   connect="Peter reads Judas''s desolation out of the Psalms — *let their habitation be desolate.* Psalm 69, the psalm of the persecuted righteous one, names the desolation that falls on the betrayer of the innocent sufferer.",
   frag="Let their habitation be desolate; and let none dwell in their tents",
   mconn="the betrayer's desolation Peter reads over Judas (Acts 1:20)."),
  dict(src_v=20, ed='canon', slug='psalms', ch=109, v=8, cite='Psalm 109:8',
   connect="*And his bishoprick let another take* (Acts 1:20) is Psalm 109''s *let another take his office.* The office is not left empty; the lot will fall on Matthias. The psalm of the betrayed righteous one supplies the very pattern of the vacancy filled.",
   frag="Let his days be few; and let another take his office",
   mconn="the vacant office filled — the lot on Matthias."),
  dict(src_v=16, ed='canon', slug='psalms', ch=41, v=9, cite='Psalm 41:9',
   connect="*This scripture must needs have been fulfilled … concerning Judas* (Acts 1:16). David, the persecuted king, had named the wound: the familiar friend who ate his bread and lifted up his heel. The betrayer at the table is the ancient pattern.",
   frag="mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me",
   mconn="the table-friend who turns — the ancient pattern of Judas."),
  dict(src_v=16, ed='canon', slug='john', ch=13, v=18, cite='John 13:18',
   connect="Yahusha (Jesus) himself had quoted that psalm over Judas at the supper — *he that eateth bread with me hath lifted up his heel against me.* What the Ruach HaKodesh (Holy Spirit) spoke by the mouth of David (Acts 1:16), the Messiah applied to the one dipping in the dish.",
   frag="He that eateth bread with me hath lifted up his heel against me",
   mconn="Yahusha (Jesus) applied the psalm to Judas at the supper."),
 ]))

THREADS.append(dict(
 slug='acts-2-pentecost-shavuot-the-fire-of-sinai-and-the-torah-on-the-heart',
 title="Pentecost is Shavuot — the fire of Sinai and the Torah written on the heart",
 sort=5024, a_start=('acts',2,1), a_end=('acts',2,4), src_ch=2,
 summary=("*When the day of Pentecost was fully come* (Acts 2:1) — the day was Shavuot, the "
   "feast of weeks. The Hebrew library names what the feast is for: it is celebrated *to renew "
   "the covenant every year* (Jubilees 6:17), *the feast of weeks and the feast of first-fruits* "
   "(Jubilees 6:21). The Spirit falls on the covenant-renewal feast, not on a day that abolishes "
   "the covenant. And the fire that falls — *cloven tongues like as of fire* (Acts 2:3) — is the "
   "fire of Sinai, where *Yahuah (LORD) descended upon it in fire* (Exodus 19:18) to give the "
   "Torah on the mountain. What the fire wrote on stone, the Spirit now writes on the heart: *I "
   "will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33); *I "
   "will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27). The "
   "Spirit and the Torah are one motion, never rivals. Paul names the same writing — *written "
   "not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in "
   "fleshy tables of the heart* (2 Corinthians 3:3) — and Hebrews seals it: *I will put my laws "
   "into their mind, and write them in their hearts* (Hebrews 8:10). Pentecost is the law moved "
   "from the mountain to the heart, the covenant renewed, not undone."),
 members=[
  dict(src_v=1, ed='jubilees', slug='jubilees', ch=6, v=17, cite='Jubilees 6:17',
   connect="*When the day of Pentecost was fully come* (Acts 2:1) — the day was the feast of weeks, Shavuot. The Hebrew library names what the feast is for: to renew the covenant every year. The Spirit falls on the covenant-renewal feast, not on a day that abolishes the covenant.",
   frag="they should celebrate the feast of weeks in this month once a year, to renew the covenant every year",
   mconn="Shavuot is covenant-renewal — the day the Spirit falls (Acts 2:1)."),
  dict(src_v=1, ed='jubilees', slug='jubilees', ch=6, v=21, cite='Jubilees 6:21',
   connect="Shavuot is the feast of weeks and the feast of firstfruits. Pentecost is the firstfruits day — and the three thousand added that day (Acts 2:41) are the firstfruits of the gathering harvest, the down-payment of the Spirit on the feast of firstfruits.",
   frag="For it is the feast of weeks and the feast of first-fruits",
   mconn="Pentecost the firstfruits day — the three thousand the firstfruits harvest."),
  dict(src_v=3, ed='canon', slug='exodus', ch=19, v=18, cite='Exodus 19:18',
   connect="*Cloven tongues like as of fire* (Acts 2:3) fall as the fire fell on Sinai — the mountain altogether on smoke because Yahuah (LORD) descended on it in fire. The fire that gave the Torah on the mountain is the fire that writes it on the heart at Pentecost.",
   frag="mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire",
   mconn="the Sinai fire that gave Torah is the Pentecost fire that writes it (Acts 2:3)."),
  dict(src_v=4, ed='canon', slug='jeremiah', ch=31, v=33, cite='Jeremiah 31:33',
   connect="The Spirit poured at Pentecost is the new-covenant Spirit Jeremiah named — *I will put my law in their inward parts, and write it in their hearts.* The Spirit does not lead away from the Torah; he writes it within. Pentecost is the law on the heart, not the law undone.",
   frag="I will put my law in their inward parts, and write it in their hearts",
   mconn="the new-covenant Spirit writes the Torah within, not away."),
  dict(src_v=4, ed='canon', slug='ezekiel', ch=36, v=27, cite='Ezekiel 36:27',
   connect="Ezekiel names the same gift in the same breath as the Spirit — *I will put my spirit within you, and cause you to walk in my statutes.* The filling of Acts 2:4 is the Spirit who causes the walk in the statutes; Spirit and Torah are one motion.",
   frag="I will put my spirit within you, and cause you to walk in my statutes",
   mconn="Spirit and Torah one motion — the filling of Acts 2:4."),
  dict(src_v=4, ed='canon', slug='2-corinthians', ch=3, v=3, cite='2 Corinthians 3:3',
   connect="Paul names the Pentecost writing — written not with ink but with the Spirit of the living Elohim (God), not in tables of stone but in fleshy tables of the heart. The Spirit given at Pentecost is the finger that moves the Sinai-writing from stone to heart.",
   frag="written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart",
   mconn="the Sinai-writing moved from stone to heart."),
  dict(src_v=4, ed='canon', slug='hebrews', ch=8, v=10, cite='Hebrews 8:10',
   connect="Hebrews quotes the same Jeremiah promise as fulfilled — *I will put my laws into their mind, and write them in their hearts.* The covenant Pentecost inaugurates is the Torah internalized, the statutes set in the mind by the Spirit.",
   frag="I will put my laws into their mind, and write them in their hearts",
   mconn="the covenant Pentecost inaugurates — Torah internalized."),
 ]))

THREADS.append(dict(
 slug='acts-2-the-outpouring-of-the-spirit-on-all-flesh-and-the-latter-rain',
 title="The outpouring of the Spirit on all flesh — the latter-rain on the gathering",
 sort=5032, a_start=('acts',2,16), a_end=('acts',2,21), src_ch=2,
 summary=("Peter names the prophet over Pentecost — *this is that which was spoken by the "
   "prophet Joel* (Acts 2:16): *I will pour out of my Spirit upon all flesh* (Acts 2:17), the "
   "very words of Joel — *I will pour out my spirit upon all flesh; and your sons and your "
   "daughters shall prophesy* (Joel 2:28). Pentecost is the beginning of Joel''s latter-day "
   "outpouring, the Spirit falling as the gathering of the scattered seed opens. The other "
   "prophets name the same poured Spirit and whose it is: *I have poured out my spirit upon the "
   "house of Yashar''el (Israel)* (Ezekiel 39:29); *I will pour my spirit upon thy seed, and my "
   "blessing upon thine offspring* (Isaiah 44:3). Moses had longed for the very day — *would "
   "Elohim (God) that all the LORD''S people were prophets* (Numbers 11:29). And the promise "
   "closes where Joel closes: *whosoever shall call on the name of Yahuah (Lord) shall be saved* "
   "(Acts 2:21), Joel''s *whosoever shall call on the name of Yahuah (LORD) shall be delivered … "
   "in the remnant whom Yahuah (LORD) shall call* (Joel 2:32). Paul reads it the same — "
   "*whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans 10:13) — and "
   "names the Spirit *shed on us abundantly through Yahusha HaMashiach (Jesus Christ)* (Titus "
   "3:6), poured not to end the walk but to enable it, the sentence running on to the good works "
   "the Spirit makes possible. The calling is the Father''s, the saved are the called, and the "
   "called are the remnant he was always gathering home."),
 members=[
  dict(src_v=17, ed='canon', slug='joel', ch=2, v=28, cite='Joel 2:28',
   connect="Peter names the prophet — *I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy.* Pentecost is the beginning of Joel''s latter-day outpouring, the Spirit falling on Yah''s people as the gathering of the scattered seed opens.",
   frag="I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy",
   mconn="the latter-day outpouring begun at Pentecost (Acts 2:17)."),
  dict(src_v=21, ed='canon', slug='joel', ch=2, v=32, cite='Joel 2:32',
   connect="*Whosoever shall call on the name of Yahuah (Lord) shall be saved* (Acts 2:21) is Joel''s *whosoever shall call on the name of Yahuah (LORD) shall be delivered … in the remnant whom Yahuah (LORD) shall call.* The calling is the remnant''s; the saved are the called — those who hear because they were his before the foundation of the world.",
   frag="whosoever shall call on the name of Yahuah (LORD) shall be delivered",
   mconn="the remnant whom Yahuah calls — the saved are the called."),
  dict(src_v=17, ed='canon', slug='ezekiel', ch=39, v=29, cite='Ezekiel 39:29',
   connect="Ezekiel names the same outpouring as the seal on the gathering — *I have poured out my spirit upon the house of Yashar''el (Israel).* The Spirit poured at Pentecost is the Spirit poured on the house of Yashar''el, the down-payment of the ingathering.",
   frag="I have poured out my spirit upon the house of Yashar'el (Israel)",
   mconn="the outpouring sealing the ingathering."),
  dict(src_v=18, ed='canon', slug='isaiah', ch=44, v=3, cite='Isaiah 44:3',
   connect="Isaiah names whose the poured Spirit is — *I will pour my spirit upon thy seed, and my blessing upon thine offspring.* The servants and handmaidens of Acts 2:18 on whom the Spirit falls are the seed and the offspring, the covenant lineage, not a self-selected company.",
   frag="I will pour my spirit upon thy seed, and my blessing upon thine offspring",
   mconn="the Spirit on the seed and offspring — the covenant lineage."),
  dict(src_v=18, ed='canon', slug='numbers', ch=11, v=29, cite='Numbers 11:29',
   connect="Moses had longed for the very day — *would Elohim (God) that all the LORD''S people were prophets, and that Yahuah (LORD) would put his spirit upon them!* Pentecost answers the longing: the Spirit once on the seventy elders now poured on sons and daughters, servants and handmaids.",
   frag="would Elohim (God) that all the LORD’S people were prophets",
   mconn="Moses's longing answered at Pentecost."),
  dict(src_v=21, ed='canon', slug='romans', ch=10, v=13, cite='Romans 10:13',
   connect="Paul quotes the same Joel line over the same gathering — *whosoever shall call upon the name of Yahuah (Lord) shall be saved.* The name called upon is the name of Yahuah; the Formed-one Yahusha (Jesus) and the name of Yahuah are not two saviours but one.",
   frag="whosoever shall call upon the name of Yahuah (Lord) shall be saved",
   mconn="the name called is the name of Yahuah — one Saviour."),
  dict(src_v=17, ed='canon', slug='titus', ch=3, v=6, cite='Titus 3:6',
   connect="The poured Spirit of Pentecost is the Spirit shed on us abundantly through Yahusha HaMashiach (Jesus Christ) — and the sentence does not end at grace: it runs on to the good works the Spirit enables (Titus 3:8), the walk in the statutes. The outpouring is for the renewed walk, not its abolition.",
   frag="Which he shed on us abundantly through Yahusha HaMashiach (Jesus Christ) our Saviour",
   mconn="the poured Spirit — for the renewed walk, the sentence ending in good works."),
 ]))

THREADS.append(dict(
 slug='acts-2-david-foresaw-the-resurrection-the-holy-one-not-left-to-corruption',
 title="David foresaw the resurrection — the Holy One not left to see corruption",
 sort=5040, a_start=('acts',2,25), a_end=('acts',2,31), src_ch=2,
 summary=("Peter reads the resurrection out of David — *thou wilt not leave my soul in hell, "
   "neither wilt thou suffer thine Holy One to see corruption* (Acts 2:27), quoting David''s "
   "own psalm: *for thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One "
   "to see corruption* (Psalm 16:10). David is dead and buried, his sepulchre still with them "
   "(Acts 2:29); he spoke not of himself but of the Holy One whose flesh would not see "
   "corruption. *Thou hast made known to me the ways of life* (Acts 2:28) is David''s *thou wilt "
   "shew me the path of life* (Psalm 16:11) — the path through death the Holy One walked and "
   "opened. Paul preaches the same psalm to the same end at Antioch: *thou shalt not suffer "
   "thine Holy One to see corruption* (Acts 13:35) — David saw corruption, but the One raised "
   "saw none. Two sermons, one psalm, one resurrection."),
 members=[
  dict(src_v=27, ed='canon', slug='psalms', ch=16, v=10, cite='Psalm 16:10',
   connect="Peter reads the resurrection out of David — *for thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* David, dead and buried (Acts 2:29), spoke not of himself but of the Holy One whose flesh would not see corruption.",
   frag="thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption",
   mconn="David spoke of the Holy One's uncorrupted flesh (Acts 2:27)."),
  dict(src_v=28, ed='canon', slug='psalms', ch=16, v=11, cite='Psalm 16:11',
   connect="*Thou hast made known to me the ways of life* (Acts 2:28) is David''s *thou wilt shew me the path of life: in thy presence is fulness of joy.* The path of life through death is the resurrection road the Holy One walked and opened.",
   frag="Thou wilt shew me the path of life: in thy presence is fulness of joy",
   mconn="the resurrection road — made known to me the ways of life (Acts 2:28)."),
  dict(src_v=31, ed='canon', slug='acts', ch=13, v=35, cite='Acts 13:35',
   connect="Paul preaches the same psalm to the same end at Antioch — *thou shalt not suffer thine Holy One to see corruption.* David saw corruption (Acts 13:36); the One raised saw none. The two sermons read one psalm to one resurrection.",
   frag="Thou shalt not suffer thine Holy One to see corruption",
   mconn="the same psalm to the same resurrection at Antioch."),
 ]))

THREADS.append(dict(
 slug='acts-2-yahuah-said-unto-my-lord-the-formed-enthroned-at-the-right-hand',
 title="Yahuah said unto my Lord — the Formed enthroned at the right hand",
 sort=5046, a_start=('acts',2,33), a_end=('acts',2,36), src_ch=2,
 summary=("Peter ends the sermon at the enthronement — *Yahuah (LORD) said unto my Lord, Sit "
   "thou on my right hand* (Acts 2:34), David''s own psalm where Yahuah the Father speaks to "
   "the Lord at his right hand: *Yahuah (LORD) said unto my Lord, Sit thou at my right hand* "
   "(Psalm 110:1). The Lord David calls Lord is the Formed drawn from the Formless, seated in "
   "power — and *made … both Lord and Messiah (Lord and Christ)* (Acts 2:36) is the dominion "
   "Daniel saw given to the Son of Adam: *there was given him dominion, and glory, and a "
   "kingdom … an everlasting dominion* (Daniel 7:14). The Hebrew library saw the same "
   "enthronement: *Yahuah (God) of Spirits named the Elect One, and seated him on the throne of "
   "His glory* (1 Enoch 62:1); *this is the Son of Adam who is born unto righteousness* (1 Enoch "
   "62:7). Yahusha (Jesus) had pressed the Pharisees with the same psalm — *Yahuah (LORD) said "
   "unto my Lord* (Matthew 22:44) — how is the Messiah David''s son and David''s Lord at once? "
   "The riddle Pentecost answers: he is David''s son in the flesh and David''s Lord as the "
   "Formed Yahuah. The making of Acts 2:36 is the exaltation Paul names — *every tongue should "
   "confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the "
   "Father* (Philippians 2:11) — and Hebrews seals the session said to the Son, not to any "
   "angel: *Sit on my right hand, until I make thine enemies thy footstool* (Hebrews 1:13). The "
   "Formed and the Formless, never collapsed, never two gods."),
 members=[
  dict(src_v=34, ed='canon', slug='psalms', ch=110, v=1, cite='Psalm 110:1',
   connect="*Yahuah (LORD) said unto my Lord, Sit thou on my right hand* (Acts 2:34) is David''s own psalm — Yahuah the Father speaks to the Lord at his right hand, the Formed drawn from the Formless, seated in power. David''s Lord is the Messiah David called Lord.",
   frag="Yahuah (LORD) said unto my Lord, Sit thou at my right hand",
   mconn="the Father speaks to the Lord at his right hand (Acts 2:34)."),
  dict(src_v=36, ed='canon', slug='daniel', ch=7, v=14, cite='Daniel 7:14',
   connect="*Made … both Lord and Messiah (Lord and Christ)* (Acts 2:36) is the dominion Daniel saw given to the Son of Adam — dominion, glory, and an everlasting kingdom. The enthronement at the right hand is the everlasting dominion granted to the one like the Son of Adam.",
   frag="there was given him dominion, and glory, and a kingdom",
   mconn="the everlasting kingdom to the Son of Adam — both Lord and Messiah (Acts 2:36)."),
  dict(src_v=34, ed='enoch', slug='1-enoch', ch=62, v=1, cite='1 Enoch 62:1',
   connect="The Hebrew library saw the same enthronement — *Yahuah (God) of Spirits named the Elect One, and seated him on the throne of His glory.* The right-hand seat of Acts 2:34 is the throne of glory the Parables gave the Elect One, the chosen Son of Adam set to judge.",
   frag="named the Elect One, And seated him on the throne of His glory",
   mconn="the throne of glory of Acts 2:34's right-hand seat."),
  dict(src_v=36, ed='enoch', slug='1-enoch', ch=62, v=7, cite='1 Enoch 62:7',
   connect="The Parables name him — *this is the Son of Adam who is born unto righteousness … the righteousness of the Head of Days forsakes him not.* The Yahusha (Jesus) made both Lord and Messiah (Acts 2:36) is the named Son of Adam of the Hebrew library, the Chosen One before Yahuah (God) of Spirits.",
   frag="This is the Son of Adam who is born unto righteousness",
   mconn="the named Son of Adam — the Yahusha made Lord and Messiah."),
  dict(src_v=34, ed='canon', slug='matthew', ch=22, v=44, cite='Matthew 22:44',
   connect="Yahusha (Jesus) had pressed the Pharisees with the same verse — *Yahuah (LORD) said unto my Lord, Sit thou on my right hand* — how does David call his own son Lord? The riddle Acts 2:34-36 answers: the Messiah is David''s son in the flesh and David''s Lord as the Formed Yahuah.",
   frag="Yahuah (LORD) said unto my Lord, Sit thou on my right hand, till I make thine enemies thy footstool",
   mconn="the riddle Acts 2:34-36 answers — David's son and David's Lord."),
  dict(src_v=36, ed='canon', slug='philippians', ch=2, v=11, cite='Philippians 2:11',
   connect="The making of Acts 2:36 is the exaltation of Philippians — *every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* The kyrios title is his by exaltation; he is Lord, and the Father is glorified in it — the Formed and the Formless, never collapsed.",
   frag="every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father",
   mconn="the kyrios title by exaltation — Lord, to the Father's glory."),
  dict(src_v=36, ed='canon', slug='hebrews', ch=1, v=13, cite='Hebrews 1:13',
   connect="Hebrews seals the right-hand session — *Sit on my right hand, until I make thine enemies thy footstool* — said to the Son, not to any angel. The enthronement Peter proclaims at Pentecost is the Son seated above the angelic host.",
   frag="Sit on my right hand, until I make thine enemies thy footstool",
   mconn="said to the Son, not the angels — the Pentecost enthronement."),
 ]))

THREADS.append(dict(
 slug='acts-2-the-promise-to-them-that-are-afar-off-the-scattered-called-home',
 title="The promise to them that are afar off — the scattered called home",
 sort=5052, a_start=('acts',2,38), a_end=('acts',2,39), src_ch=2,
 summary=("Peter closes the call — *the promise is unto you, and to your children, and to all "
   "that are afar off, even as many as Yahuah Eloheinu (the Lord our God) shall call* (Acts "
   "2:39). The afar-off are not other peoples; they are the dispersed of Yahuah''s own. Isaiah "
   "names the far and the near as one healing — *Peace, peace to him that is far off, and to him "
   "that is near* (Isaiah 57:19). Moses names the gathering of the driven-out — *if any of thine "
   "be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD "
   "thy God) gather thee* (Deuteronomy 30:4). And the calling is the Father''s, as Joel said — "
   "*the remnant whom Yahuah (LORD) shall call* (Joel 2:32). Paul names the afar-off made nigh: "
   "*ye who sometimes were far off are made nigh by the blood of Messiah (Christ)* (Ephesians "
   "2:13) — the *aliens from the commonwealth of Yashar''el (Israel)* (Ephesians 2:12), the "
   "scattered house estranged from its own covenant by exile, the Lo-Ammi brought home — and the "
   "two houses made one: *came and preached peace to you which were afar off, and to them that "
   "were nigh* (Ephesians 2:17). These are not strangers spliced into a people they were never "
   "of; they are the seed scattered far and called near, hearing because election made them his "
   "before they heard."),
 members=[
  dict(src_v=39, ed='canon', slug='isaiah', ch=57, v=19, cite='Isaiah 57:19',
   connect="*The promise is unto you … and to all that are afar off* (Acts 2:39). Isaiah names the far and the near as one healing — *Peace, peace to him that is far off, and to him that is near.* The afar-off are the dispersed of Yahuah''s own, scattered far and brought near.",
   frag="Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD)",
   mconn="the far and near one healing — the dispersed brought near (Acts 2:39)."),
  dict(src_v=39, ed='canon', slug='deuteronomy', ch=30, v=4, cite='Deuteronomy 30:4',
   connect="The afar-off are the driven-out Moses promised to gather — *if any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah Elohayka (the LORD thy God) gather thee.* The promise to them afar off (Acts 2:39) is the gathering of the scattered seed from the ends of the earth.",
   frag="from thence will Yahuah Elohayka (the LORD thy God) gather thee, and from thence will he fetch thee",
   mconn="the driven-out gathered from the ends — them afar off."),
  dict(src_v=39, ed='canon', slug='joel', ch=2, v=32, cite='Joel 2:32',
   connect="*Even as many as Yahuah Eloheinu (the Lord our God) shall call* (Acts 2:39) is Joel''s *the remnant whom Yahuah (LORD) shall call.* The calling is the Father''s; those afar off who answer are the remnant he calls — hearing reveals what election made true before they heard, no name added after the foundation of the world.",
   frag="in the remnant whom Yahuah (LORD) shall call",
   mconn="as many as Yahuah shall call (Acts 2:39) — the called remnant."),
  dict(src_v=39, ed='canon', slug='ephesians', ch=2, v=13, cite='Ephesians 2:13',
   connect="Paul names the afar-off made nigh — *ye who sometimes were far off are made nigh by the blood of Messiah (Christ).* These are the aliens from the commonwealth of Yashar''el (Israel) (Ephesians 2:12) — the scattered house estranged from its own covenant by exile, the Lo-Ammi brought home, not strangers spliced into a people they were never of.",
   frag="ye who sometimes were far off are made nigh by the blood of Messiah (Christ)",
   mconn="the estranged house brought home — not strangers spliced in."),
  dict(src_v=39, ed='canon', slug='ephesians', ch=2, v=17, cite='Ephesians 2:17',
   connect="*Came and preached peace to you which were afar off, and to them that were nigh* (Ephesians 2:17). The far and the near are the two houses — the scattered of Yashar''el (Israel) far off in the nations and the near of Yahudah (Judah) — made one in the Messiah, the dividing wall of the exile broken down.",
   frag="came and preached peace to you which were afar off, and to them that were nigh",
   mconn="the two houses made one — scattered Yashar'el and near Yahudah."),
 ]))

# ---- Emit SQL -----------------------------------------------------------------
TAG = 'a0102'
VIEW = f'_s217_{TAG}_lookup'
EDITIONS = ("'canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',"
            "'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah',"
            "'sonnini-acts-29'")

def tier_of(ed):
    return 'free' if ed == 'canon' else 'extras'

# verify all frags are verbatim substrings
for th in THREADS:
    for m in th['members']:
        actual = txt(m['ed'], m['slug'], m['ch'], m['v'])
        if norm_ap(m['frag']) not in actual:
            sys.exit(f"FRAG NOT VERBATIM in {m['cite']}:\n  frag={m['frag']!r}\n  text={actual!r}")

out = []
out.append("-- ----- fragment: minion_acts_01_02.sql (S217 Acts 1-2 pilot) -----")
out.append("-- =====================================================================")
out.append("-- S217 minion — ACTS 1-2 (the proving range) FULL-LIBRARY cross-references")
out.append("-- =====================================================================")
out.append("-- Range:  ACTS 1-2.  Tag: a0102 (temp view _s217_a0102_lookup).  Sort band: 5000-5099.")
out.append("-- Source is ALWAYS the canon Acts verse; targets span Tanakh + extra-canonical + NT.")
out.append("-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.")
out.append("--")
out.append("-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):")
out.append("--  ACTS 1:")
out.append("--   v.6-8  restore-the-kingdom  Tanakh: Ezekiel 37:21-22, Amos 9:11, Isaiah 11:12")
out.append("--          Extras: Tobit 14:5, 2 Esdras 13:40, Ecclesiasticus 48:10  NT: Matthew 19:28, Acts 15:16")
out.append("--   v.9-12 ascension/return     Tanakh: Daniel 7:13, Zechariah 14:4  Extras: 1 Enoch 1:9  NT: Revelation 1:7")
out.append("--   v.13-15 upper-room/120      Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative roster)")
out.append("--   v.16-20 Judas/the psalms    Tanakh: Psalm 69:25, 109:8, 41:9  Extras: none warranted  NT: John 13:18")
out.append("--   v.21-26 lots/Matthias       Tanakh: (Proverbs 16:33 weighed) none added  Extras: none warranted  NT: none warranted")
out.append("--  ACTS 2:")
out.append("--   v.1-4  Pentecost/Shavuot     Tanakh: Exodus 19:18, Jeremiah 31:33, Ezekiel 36:27")
out.append("--          Extras: Jubilees 6:17,21  NT: 2 Corinthians 3:3, Hebrews 8:10")
out.append("--   v.5-13 tongues/nations       Tanakh: (Genesis 11 Babel weighed) none added  Extras: none warranted  NT: none warranted")
out.append("--   v.16-21 Joel outpouring       Tanakh: Joel 2:28,32, Ezekiel 39:29, Isaiah 44:3, Numbers 11:29")
out.append("--          Extras: (Testaments XII Levi/Judah outpouring weighed; cleanest witnesses canon) none added  NT: Romans 10:13, Titus 3:6")
out.append("--   v.22-32 resurrection/Psalm 16 Tanakh: Psalm 16:10-11  Extras: none warranted  NT: Acts 13:35")
out.append("--   v.33-36 Psalm 110 enthroned   Tanakh: Psalm 110:1, Daniel 7:14  Extras: 1 Enoch 62:1,7  NT: Matthew 22:44, Philippians 2:11, Hebrews 1:13")
out.append("--   v.37-39 afar-off called       Tanakh: Isaiah 57:19, Deuteronomy 30:4, Joel 2:32  Extras: (Tobit 13:5 weighed; threaded above) none added  NT: Ephesians 2:13,17")
out.append("--   v.40-47 firstfruits commune   Tanakh: none added (Shavuot/firstfruits carried in v.1-4 thread)  Extras/NT: none warranted")
out.append("-- =====================================================================\n")

out.append(f"CREATE TEMP VIEW {VIEW} AS")
out.append("SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id")
out.append("  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id")
out.append("  JOIN editions e ON b.edition_id = e.id")
out.append(f" WHERE e.slug IN ({EDITIONS});\n")

# B. cross_references — build VALUES rows (comments + data), comma on every data row except the last
out.append("WITH input(src_edition, src_slug, src_ch, src_v,")
out.append("           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES")
entries = []  # (is_comment, text)
for th in THREADS:
    entries.append((True, f"  -- thread: {th['slug']}"))
    for m in th['members']:
        actual = txt(m['ed'], m['slug'], m['ch'], m['v'])
        note = f"*{actual}* ({m['cite']}). {m['connect']}"
        sch = m.get('src_ch', th['src_ch'])
        line = "  ('canon', 'acts', {sc}, {sv}, '{te}', '{ts}', {tc}, {tv}, '{tier}', E'{note}')".format(
            sc=sch, sv=m['src_v'], te=m['ed'], ts=m['slug'], tc=m['ch'], tv=m['v'],
            note=esc(note), tier=tier_of(m['ed']))
        entries.append((False, line))
last_data_idx = max(i for i, (isc, _) in enumerate(entries) if not isc)
for i, (isc, text) in enumerate(entries):
    if isc:
        out.append(text)
    else:
        out.append(text + ('' if i == last_data_idx else ','))
out.append(")")
out.append("INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)")
out.append("SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier")
out.append("  FROM input i")
out.append(f"  JOIN {VIEW} sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v")
out.append(f"  JOIN {VIEW} tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v")
out.append(" WHERE sv.verse_id <> tv.verse_id")
out.append("ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;\n")

# C. threads
out.append("-- ----- threads -----")
for th in THREADS:
    members = th['members']
    tier = 'extras' if any(tier_of(m['ed']) == 'extras' for m in members) else 'free'
    sb, se = th['a_start'], th['a_end']
    out.append("INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)")
    out.append("SELECT '{slug}',".format(slug=th['slug']))
    out.append("       E'{t}',".format(t=esc(th['title'])))
    out.append("       E'{s}',".format(s=esc(th['summary'])))
    out.append("       sv.verse_id, ev.verse_id, '{tier}', {sort}".format(tier=tier, sort=th['sort']))
    out.append(f"  FROM {VIEW} sv, {VIEW} ev")
    out.append(" WHERE sv.edition_slug='{e}' AND sv.book_slug='{b}' AND sv.chapter_number={c} AND sv.verse_number={v}".format(e='canon', b=sb[0], c=sb[1], v=sb[2]))
    out.append("   AND ev.edition_slug='{e}' AND ev.book_slug='{b}' AND ev.chapter_number={c} AND ev.verse_number={v}".format(e='canon', b=se[0], c=se[1], v=se[2]))
    out.append("ON CONFLICT (slug) DO NOTHING;\n")

# D. thread_members
out.append("-- ----- thread_members -----")
for th in THREADS:
    out.append(f"-- members: {th['slug']}")
    for i, m in enumerate(th['members'], start=1):
        mnote = f"{m['cite']} — *{m['frag']}* {m['mconn']}"
        sch = m.get('src_ch', th['src_ch'])
        out.append("INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)")
        out.append("SELECT t.id, x.id, {so}, E'{mn}'".format(so=i, mn=esc(mnote)))
        out.append(f"  FROM cross_reference_threads t, cross_references x, {VIEW} sv, {VIEW} tv")
        out.append(" WHERE t.slug='{slug}'".format(slug=th['slug']))
        out.append("   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number={c} AND sv.verse_number={v}".format(c=sch, v=m['src_v']))
        out.append("   AND tv.edition_slug='{e}' AND tv.book_slug='{b}' AND tv.chapter_number={c} AND tv.verse_number={v}".format(e=m['ed'], b=m['slug'], c=m['ch'], v=m['v']))
        out.append("   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'")
        out.append("ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;\n")

frag_sql = "\n".join(out) + "\n"
open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'minion_acts_01_02.sql'), 'w').write(frag_sql)
ncr = sum(len(th['members']) for th in THREADS)
print(f"OK — {len(THREADS)} threads, {ncr} cross_reference rows, {ncr} member rows")
for th in THREADS:
    tier = 'extras' if any(tier_of(m['ed'])=='extras' for m in th['members']) else 'free'
    print(f"  [{tier:6}] sort {th['sort']}  {th['slug']}  ({len(th['members'])} members)")
