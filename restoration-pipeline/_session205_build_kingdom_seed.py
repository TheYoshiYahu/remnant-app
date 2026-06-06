#!/usr/bin/env python3
"""Session 205 — generate the Kingdom (Blue Pill) seed SQL from canon.json.

THE KINGDOM — the nothing-new overlay (Yoshi, S205): every new-testament
mention of what the Messiah did, what the good news is, what the kingdom
is, what grace is — paired with the scripture it was taught from, both
quoted in full. Nothing in the new testament is new; every beginning
declared the end. Five strands: gathering, good_news, kingdom, grace,
teaching.

Every quote in every card is pulled live from source-texts/parsed/canon.json
so the card text is the exact restored verse text (sacred names intact,
son-of-Adam restoration exactly as the pipeline landed them). The
connective prose is hand-curated here and checker-gated before load
(Red Line #11 — the gathering is the scattered house coming home, no
false-inclusion leak, no spiritualized-Israel leak; Red Line #10 —
grace as the means of return; Red Line #12; quote-don't-cite; sacred
names).

Output: data-schema/migrations/session205_kingdom_seed_v1.sql
Idempotent: ON CONFLICT (verse_id) DO UPDATE — re-running refreshes cards.

Run:  python3 restoration-pipeline/_session205_build_kingdom_seed.py
Then: python3 api/apply_migration.py data-schema/migrations/session205_kingdom_seed_v1.sql
"""

import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
CANON = os.path.join(ROOT, "source-texts", "parsed", "canon.json")
OUT = os.path.join(ROOT, "data-schema", "migrations", "session205_kingdom_seed_v1.sql")

DISPLAY = {
    "psalms": "Psalm",
    "song-of-solomon": "Song of Solomon",
}


def display_name(slug: str) -> str:
    if slug in DISPLAY:
        return DISPLAY[slug]
    return " ".join(
        w if w.isdigit() else w.capitalize() for w in slug.split("-")
    )


with open(CANON) as f:
    canon = json.load(f)
BOOKS = {b["book_id"]: b for b in canon["books"]}
SINGLE_CHAPTER = {"jude", "philemon", "obadiah", "2-john", "3-john"}


def verse_text(slug: str, ch: int, vn: int) -> str:
    chap = next(c for c in BOOKS[slug]["chapters"] if c["number"] == ch)
    return next(v for v in chap["verses"] if v["number"] == vn)["text"]


def ref_str(slug: str, ch: int, v1: int, v2: int | None = None) -> str:
    name = display_name(slug)
    if slug in SINGLE_CHAPTER:
        return f"{name} {v1}" if v2 is None else f"{name} {v1}-{v2}"
    if v2 is None:
        return f"{name} {ch}:{v1}"
    return f"{name} {ch}:{v1}-{v2}"


def Q(slug: str, ch: int, v1: int, v2: int | None = None) -> str:
    """A full stand-alone-italics quote paragraph, citation at the end."""
    last = v2 if v2 is not None else v1
    text = " ".join(verse_text(slug, ch, n) for n in range(v1, last + 1))
    return f"*{text}* ({ref_str(slug, ch, v1, v2)})"


def P(prose: str) -> str:
    return prose.strip()


# ---------------------------------------------------------------------------
# The full-sweep card set (Yoshi, S205: "full sweep now"). The type
# specimen (John 10:16 <-> Ezekiel 37:15-22, the proof card) leads; the
# four sweep sections follow (Matthew+Mark, Luke+Acts, John+Revelation,
# Epistles). 'mark' is the verse that carries the mark; 'mirrors' are
# the quoted Tanakh anchors (they carry the SAME card; a mirror already
# claimed by an earlier card stays with that card — first wins, the
# generator skips and warns). body is the come-and-see card: every
# load-bearing verse quoted in full, stand-alone italics; connective
# prose minimal — the verses do the work and the proclaimer steps aside.
# ---------------------------------------------------------------------------

CARDS = [
    # ===== THE TYPE SPECIMEN — the proof card (signed off at S205 proof) =====
    dict(
        mark=("john", 10, 16),
        mirrors=[("ezekiel", 37, 16), ("ezekiel", 37, 17),
                 ("ezekiel", 37, 21), ("ezekiel", 37, 22)],
        strand="gathering",
        strand_label="The gathering",
        card_title="One fold, one shepherd — the two sticks made one in his hand",
        anchor_refs=["Ezekiel 37:15-22", "John 10:16"],
        body=[
            Q("john", 10, 16),
            P(
                "Nothing in this saying is new. The inherited reading hands "
                "the other sheep to the nations at large — a new people "
                "joined to the fold by belief. But the shepherd is speaking "
                "inside a prophecy his hearers could go and read. Six "
                "hundred years earlier, the word had already named the "
                "other sheep, the bringing, and the one fold:"
            ),
            Q("ezekiel", 37, 16),
            Q("ezekiel", 37, 17),
            Q("ezekiel", 37, 21),
            Q("ezekiel", 37, 22),
            P(
                "Two sticks: Yahudah (Judah), and Joseph in the hand of "
                "Ephraim — the southern house, and the northern house "
                "scattered among the heathen. Not this fold, and other "
                "sheep. The promise is that both become *one* in his hand "
                "— one stick, one nation, one king. When the shepherd says "
                "*them also I must bring, and there shall be one fold, and "
                "one shepherd,* he is not adding a new people to the "
                "flock; he is enacting the gathering Ezekiel watched — the "
                "scattered house coming home to the fold it was scattered "
                "from. The end was declared from the beginning; the saying "
                "is the prophecy walking."
            ),
        ],
    ),
]


# ===== EXHAUSTIVE WAVE — Yoshi's own finds (S205b) =====
CARDS += [
    dict(
        mark=("matthew", 4, 19),
        mirrors=[("jeremiah", 16, 14), ("jeremiah", 16, 15), ("jeremiah", 16, 16)],
        strand="gathering",
        strand_label="The gathering",
        card_title="I will make you fishers of men — the fishers Jeremiah said would be sent",
        anchor_refs=["Jeremiah 16:14-16", "Matthew 4:18-19"],
        body=[
            Q("matthew", 4, 18, 19),
            P(
                "Why fishers? The trade is not a coincidence the calling "
                "plays on — it is a commission the prophets had already "
                "written. Jeremiah names the fishers, and names what they "
                "are sent to do:"
            ),
            Q("jeremiah", 16, 14),
            Q("jeremiah", 16, 15),
            Q("jeremiah", 16, 16),
            P(
                "The fishers are sent inside a second-exodus oath: the day "
                "is coming when the children of Yashar'el (Israel) will no "
                "longer swear by the Elohim (God) who brought them out of "
                "Egypt, but by the one who brought them from the land of "
                "the north and from all the lands where he had driven them. "
                "The fishing IS the gathering of the driven-out. So the "
                "first thing he does at the start of his ministry is walk "
                "the shore and commission the fishers Jeremiah watched for "
                "— *follow me, and I will make you fishers of men.* The "
                "inherited reading hears a charming metaphor for "
                "evangelism at large; the prophet had already said whom "
                "the nets are for."
            ),
        ],
    ),
]

# ===== SWEEP: MATTHEW + MARK =====
CARDS += [

    # ================= MATTHEW =================
    dict(
        mark=("matthew", 1, 21),
        mirrors=[("psalms", 130, 8)],
        strand="good_news",
        strand_label="The good news",
        card_title="He shall save his people from their sins — where is that recorded?",
        anchor_refs=["Psalm 130:7-8", "Matthew 1:21"],
        body=[
            Q("matthew", 1, 21),
            Q("psalms", 130, 7, 8),
            P(
                "The angel does not say he shall save mankind in general. He "
                "says *his people* — and the psalm had already named them: "
                "*he shall redeem Yashar'el (Israel) from all his iniquities.* "
                "One phrase carries the whole psalm. The plenteous redemption "
                "Yashar'el (Israel) was told to hope for is the work the child "
                "is named for — Yahusha (Jesus), *Yahuah (God) saves.* The "
                "name and the mission are the psalm's promise walking."
            ),
        ],
    ),
    dict(
        mark=("matthew", 4, 4),
        mirrors=[("deuteronomy", 8, 3), ("deuteronomy", 6, 16), ("deuteronomy", 6, 13)],
        strand="teaching",
        strand_label="The teaching",
        card_title="Three answers in the wilderness — all three from one book",
        anchor_refs=[
            "Deuteronomy 8:3",
            "Deuteronomy 6:16",
            "Deuteronomy 6:13",
            "Matthew 4:4-10",
        ],
        body=[
            Q("matthew", 4, 4),
            Q("deuteronomy", 8, 3),
            Q("matthew", 4, 7),
            Q("deuteronomy", 6, 16),
            Q("matthew", 4, 10),
            Q("deuteronomy", 6, 13),
            P(
                "Three temptations, three answers, and every answer is "
                "Deuteronomy — the instruction given to Yashar'el (Israel) in "
                "its own wilderness testing. Yahusha (Jesus) improvises "
                "nothing against the tempter. He stands where the nation "
                "stumbled and answers with the same words the nation was "
                "given. The Torah that fed and tested the wilderness "
                "generation is the whole armory of the wilderness of "
                "Matthew 4."
            ),
        ],
    ),
    dict(
        mark=("matthew", 4, 17),
        mirrors=[("daniel", 2, 44), ("daniel", 7, 27)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The kingdom of heaven is at hand — Daniel had already named it",
        anchor_refs=["Daniel 2:44", "Daniel 7:27", "Matthew 4:17"],
        body=[
            Q("matthew", 4, 17),
            Q("daniel", 2, 44),
            Q("daniel", 7, 27),
            P(
                "*The kingdom of heaven* is not a new idiom coined in "
                "Galilee. Daniel watched the Elohim (God) of heaven set up a "
                "kingdom that breaks every empire in pieces and stands for "
                "ever — and saw that kingdom given to a people, the people of "
                "the saints. When Yahusha (Jesus) opens his preaching with "
                "*the kingdom of heaven is at hand,* hearers who carried "
                "Daniel knew exactly which kingdom: the one no empire "
                "survives, given to a people. The proclamation presupposes "
                "the prophecy."
            ),
        ],
    ),
    dict(
        mark=("matthew", 5, 5),
        mirrors=[("psalms", 37, 11), ("psalms", 37, 29)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The meek shall inherit the earth — a land promise, quoted",
        anchor_refs=["Psalm 37:11", "Psalm 37:29", "Matthew 5:5"],
        body=[
            Q("matthew", 5, 5),
            Q("psalms", 37, 11),
            Q("psalms", 37, 29),
            P(
                "The beatitude is Psalm 37, nearly word for word — and Psalm "
                "37 is a land psalm. The meek inherit the land and dwell "
                "therein for ever, while the wicked are cut off from it. The "
                "inherited reading hears a gentle sentiment and looks away "
                "toward heaven. The psalm being quoted looks toward the "
                "earth — the inheritance the kingdom restores to the meek "
                "who wait on Yahuah (God)."
            ),
        ],
    ),
    dict(
        mark=("matthew", 8, 11),
        mirrors=[("isaiah", 43, 5), ("psalms", 107, 3)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Many shall come from the east and west — who is travelling?",
        anchor_refs=["Isaiah 43:5-6", "Psalm 107:2-3", "Matthew 8:11"],
        body=[
            Q("matthew", 8, 11),
            Q("isaiah", 43, 5, 6),
            Q("psalms", 107, 2, 3),
            P(
                "The inherited reading hears the nations streaming into a "
                "kingdom forfeited by Yashar'el (Israel). But the travelers "
                "from east and west had a name before Matthew wrote them "
                "down. Isaiah hears Yahuah (God) command the compass points "
                "to give up *thy seed* — *bring my sons from far.* The psalm "
                "sings of the redeemed *gathered out of the lands, from the "
                "east, and from the west.* The many who sit down with "
                "Abraham, Isaac, and Jacob are Abraham's scattered seed "
                "coming home from the lands of their scattering. The table "
                "is the homecoming the prophets promised."
            ),
        ],
    ),
    dict(
        mark=("matthew", 10, 6),
        mirrors=[("jeremiah", 50, 6), ("ezekiel", 34, 6)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Go rather to the lost sheep — the prophets filed the missing-persons report",
        anchor_refs=["Jeremiah 50:6", "Ezekiel 34:6", "Matthew 10:5-6"],
        body=[
            Q("matthew", 10, 5, 6),
            Q("jeremiah", 50, 6),
            Q("ezekiel", 34, 6),
            P(
                "*Lost sheep* is not a figure of speech invented for the "
                "sending. It is a case the prophets had already opened: *my "
                "people hath been lost sheep,* scattered upon all the face "
                "of the earth, *and none did search or seek after them.* "
                "The twelve are sent as the search party Ezekiel said was "
                "missing — and the mission's address, the house of Yashar'el "
                "(Israel), is the flock's name on the report."
            ),
        ],
    ),
    dict(
        mark=("matthew", 11, 5),
        mirrors=[("isaiah", 35, 5), ("isaiah", 61, 1)],
        strand="good_news",
        strand_label="The good news",
        card_title="Tell John what you hear and see — the answer is Isaiah, line by line",
        anchor_refs=["Isaiah 35:5-6", "Isaiah 61:1", "Matthew 11:4-5"],
        body=[
            Q("matthew", 11, 4, 5),
            Q("isaiah", 35, 5, 6),
            Q("isaiah", 61, 1),
            P(
                "John asks from prison whether he is the one. The answer "
                "makes no claim and cites no credential — it lists evidence, "
                "and the heart of the list is Isaiah, line by line: blind "
                "eyes opened, "
                "deaf ears unstopped, the lame leaping, good tidings "
                "preached to the poor. John, who knew the scrolls, could "
                "check the list against the prophecy himself. The good news "
                "is identified by being the thing the prophets described, "
                "doing what they said it would do."
            ),
        ],
    ),
    dict(
        mark=("matthew", 11, 28),
        mirrors=[("jeremiah", 6, 16)],
        strand="grace",
        strand_label="Grace",
        card_title="Rest for your souls — found in the old paths",
        anchor_refs=["Jeremiah 6:16", "Matthew 11:28-30"],
        body=[
            Q("matthew", 11, 28, 30),
            Q("jeremiah", 6, 16),
            P(
                "*Ye shall find rest unto your souls* is Jeremiah's "
                "sentence, and in Jeremiah the rest has one location: the "
                "old paths, the good way — *walk therein.* The inherited "
                "reading sets the easy yoke against the commandments, as if "
                "rest were the alternative to the way. The verse being "
                "quoted says the opposite. The rest is what the good way "
                "feels like when the one who gives it carries the burden "
                "home. Grace does not retire the old paths; it returns the "
                "weary traveler onto them."
            ),
        ],
    ),
    dict(
        mark=("matthew", 13, 31),
        mirrors=[("ezekiel", 17, 22), ("daniel", 4, 12)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The mustard seed tree — planted first in Ezekiel",
        anchor_refs=["Ezekiel 17:22-23", "Daniel 4:12", "Matthew 13:31-32"],
        body=[
            Q("matthew", 13, 31, 32),
            Q("ezekiel", 17, 22, 23),
            Q("daniel", 4, 12),
            P(
                "The furniture of the parable is prophetic stock. Ezekiel "
                "hears Yahuah (God) promise to take a tender twig and plant "
                "it himself in the mountain of the height of Yashar'el "
                "(Israel), where it becomes a goodly cedar and *under it "
                "shall dwell all fowl of every wing.* Daniel's visions "
                "speak the same idiom — a kingdom as a great tree whose "
                "boughs house the fowls of heaven. A small thing planted by "
                "Yahuah (God)'s own hand, growing into the tree where the "
                "scattered find lodging: the parable is the planting promise "
                "retold, the kingdom of heaven given Ezekiel's shape."
            ),
        ],
    ),
    dict(
        mark=("matthew", 13, 43),
        mirrors=[("daniel", 12, 3)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The righteous shall shine as the sun — Daniel saw the brightness first",
        anchor_refs=["Daniel 12:3", "Matthew 13:43"],
        body=[
            Q("matthew", 13, 43),
            Q("daniel", 12, 3),
            P(
                "The explanation of the wheat and the tares ends on a "
                "sentence from Daniel — the wise shining as the brightness "
                "of the firmament at the time of the end. The harvest, the "
                "separating, the shining: the parable closes its teaching by "
                "landing on the prophecy it was unfolding the whole time. "
                "*Who hath ears to hear* — the hearer with Daniel in his "
                "ears had already heard it."
            ),
        ],
    ),
    dict(
        mark=("matthew", 15, 24),
        mirrors=[("jeremiah", 50, 17), ("ezekiel", 34, 31)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The lost sheep of the house of Yashar'el (Israel) — the flock has a name",
        anchor_refs=["Jeremiah 50:17", "Ezekiel 34:30-31", "Matthew 15:24"],
        body=[
            Q("matthew", 15, 24),
            Q("jeremiah", 50, 17),
            Q("ezekiel", 34, 30, 31),
            P(
                "*Yashar'el (Israel) is a scattered sheep* — Jeremiah names "
                "the flock and names the drivers: Assyria first, Babylon "
                "after. Ezekiel closes his shepherd prophecy by naming the "
                "flock again — *they, even the house of Yashar'el (Israel), "
                "are my people... ye my flock, the flock of my pasture.* So "
                "when the mission is stated — not sent but unto the lost "
                "sheep of the house of Yashar'el (Israel) — it is not a "
                "narrowing of compassion. It is the address written on the "
                "gathering promise. The flock the prophets said would be "
                "sought is the flock being sought."
            ),
        ],
    ),
    dict(
        mark=("matthew", 18, 11),
        mirrors=[("ezekiel", 34, 16)],
        strand="good_news",
        strand_label="The good news",
        card_title="Come to save that which was lost — spoken first in the first person",
        anchor_refs=["Ezekiel 34:16", "Matthew 18:11"],
        body=[
            Q("matthew", 18, 11),
            Q("ezekiel", 34, 16),
            P(
                "No *as it is written* introduces it, but the sentence was "
                "already written. *I will seek that which was lost* is the "
                "promise of Ezekiel's shepherd chapter — the recovery of the "
                "scattered flock, the broken bound up, the driven-away "
                "brought again. When the Son of Adam names his errand, he "
                "names it in the promise's own words. The good news is not "
                "a new rescue invented in Galilee; it is the old rescue "
                "arriving."
            ),
        ],
    ),
    dict(
        mark=("matthew", 21, 33),
        mirrors=[("isaiah", 5, 1), ("isaiah", 5, 7)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The vineyard parable — Isaiah built the set",
        anchor_refs=["Isaiah 5:1-2", "Isaiah 5:7", "Matthew 21:33"],
        body=[
            Q("matthew", 21, 33),
            Q("isaiah", 5, 1, 2),
            Q("isaiah", 5, 7),
            Q("matthew", 21, 40, 41),
            P(
                "Hedge, winepress, tower — the parable builds its vineyard "
                "from Isaiah's song, plank by plank, and Isaiah had named "
                "the vineyard before the parable opened its mouth: *the "
                "vineyard of Yahuah Tseva'ot (LORD of hosts) is the house "
                "of Yashar'el (Israel), and the men of Yahudah (Judah) his "
                "pleasant plant.* The hearers in the temple courts knew the "
                "song. The indictment lands where Isaiah's landed — on the "
                "keepers who returned the owner no fruit — not on the "
                "vineyard itself. The vineyard is not uprooted; its "
                "husbandry changes hands."
            ),
        ],
    ),
    dict(
        mark=("matthew", 22, 37),
        mirrors=[("deuteronomy", 6, 5), ("leviticus", 19, 18)],
        strand="teaching",
        strand_label="The teaching",
        card_title="The two great commandments — both quoted from Torah",
        anchor_refs=["Deuteronomy 6:5", "Leviticus 19:18", "Matthew 22:36-40"],
        body=[
            Q("matthew", 22, 36, 40),
            Q("deuteronomy", 6, 5),
            Q("leviticus", 19, 18),
            P(
                "Asked for the greatest commandment, Yahusha (Jesus) authors "
                "nothing. He quotes — Deuteronomy for the love of Yahuah "
                "(God), Leviticus for the love of neighbor — and then hangs "
                "*all the law and the prophets* on the two pegs Torah itself "
                "provided. The inherited reading hears a new ethic replacing "
                "an old code. The text shows a teacher answering a Torah "
                "question with Torah, and calling the whole of it one "
                "fabric."
            ),
        ],
    ),
    dict(
        mark=("matthew", 24, 31),
        mirrors=[("isaiah", 11, 12), ("deuteronomy", 30, 4)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Gather his elect from the four winds — whose homecoming is this?",
        anchor_refs=["Deuteronomy 30:3-4", "Isaiah 11:12", "Matthew 24:31"],
        body=[
            Q("matthew", 24, 31),
            Q("deuteronomy", 30, 3, 4),
            Q("isaiah", 11, 12),
            P(
                "The trumpet and the four winds belong to a promise older "
                "than the Mount of Olives. Moses: if any of thine be driven "
                "out unto the outmost parts of heaven, *from thence will he "
                "fetch thee.* Isaiah: the outcasts of Yashar'el (Israel) "
                "assembled, the dispersed of Yahudah (Judah) gathered from "
                "the four corners of the earth — two houses, named. The "
                "inherited reading hears a generic removal of believers from "
                "the earth. The scriptures underneath are speaking of a "
                "homecoming, and they name who is coming home."
            ),
        ],
    ),
    dict(
        mark=("matthew", 26, 28),
        mirrors=[("jeremiah", 31, 31), ("jeremiah", 31, 34)],
        strand="grace",
        strand_label="Grace",
        card_title="Blood of the new covenant — whose covenant, and what it writes",
        anchor_refs=["Jeremiah 31:31-34", "Matthew 26:28"],
        body=[
            Q("matthew", 26, 28),
            Q("jeremiah", 31, 31),
            Q("jeremiah", 31, 33, 34),
            P(
                "*The new testament... for the remission of sins* — every "
                "piece of it is Jeremiah's. The covenant is new, and it is "
                "made with the house of Yashar'el (Israel) and the house of "
                "Yahudah (Judah) — both houses, named. Its content is Torah "
                "written in the inward parts, not Torah retired. Its mercy "
                "is iniquity forgiven, sin remembered no more — the "
                "remission the cup announces. Grace here is not a release "
                "from the Father's ways; it is the Father writing his ways "
                "where they cannot be lost again."
            ),
        ],
    ),
    dict(
        mark=("matthew", 26, 31),
        mirrors=[("zechariah", 13, 7), ("micah", 2, 12)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Smite the shepherd — and the breaker goes up before the flock",
        anchor_refs=["Zechariah 13:7", "Micah 2:12-13", "Matthew 26:31-32"],
        body=[
            Q("matthew", 26, 31, 32),
            Q("zechariah", 13, 7),
            Q("micah", 2, 12, 13),
            P(
                "The scattering is quoted from Zechariah with the formula "
                "attached — *it is written.* The next sentence, *I will go "
                "before you into Galilee,* is quoted from nowhere, and it is "
                "Micah. Yahuah (God) promises to gather the remnant of "
                "Yashar'el (Israel) like sheep into the fold, and then *the "
                "breaker is come up before them... their king shall pass "
                "before them.* Scattered that night, gathered after — and "
                "the risen king walking ahead of the flock, exactly where "
                "Micah placed him. The scattering and the going-before are "
                "one prophetic arc, spoken in one breath at the table."
            ),
        ],
    ),
    # ================= MARK =================
    dict(
        mark=("mark", 1, 15),
        mirrors=[("isaiah", 52, 7), ("daniel", 7, 22)],
        strand="good_news",
        strand_label="The good news",
        card_title="The time is fulfilled — whose clock, whose news",
        anchor_refs=["Isaiah 52:7", "Daniel 7:22", "Mark 1:14-15"],
        body=[
            Q("mark", 1, 14, 15),
            Q("isaiah", 52, 7),
            Q("daniel", 7, 22),
            P(
                "*Gospel* — good news — is Isaiah's word for one specific "
                "announcement: peace published, salvation published, *thy "
                "Elohim (God) reigneth* said to Zion. And *the time is "
                "fulfilled* presupposes Daniel's clock, where a time is "
                "appointed and *the time came that the saints possessed the "
                "kingdom.* Mark's opening sentence is two prophets "
                "compressed: the herald's announcement, arriving at the "
                "appointed hour. The good news was never a new religion. It "
                "is the news Isaiah's herald was always going to bring."
            ),
        ],
    ),
    dict(
        mark=("mark", 4, 29),
        mirrors=[("joel", 3, 13)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="He putteth in the sickle — Joel's harvest",
        anchor_refs=["Joel 3:13", "Mark 4:26-29"],
        body=[
            Q("mark", 4, 26, 29),
            Q("joel", 3, 13),
            P(
                "The parable's last line is Joel's, almost verbatim: *put ye "
                "in the sickle, for the harvest is ripe.* In Joel the sickle "
                "marks the day of Yahuah (God) — the gathering to judgment "
                "when the wickedness is full. The kingdom of Elohim (God) "
                "grows quietly, blade and ear and full corn, the sower "
                "sleeping and rising — but it grows toward Joel's day. The "
                "parable does not soften the harvest. It teaches the "
                "patience that precedes it."
            ),
        ],
    ),
    dict(
        mark=("mark", 10, 45),
        mirrors=[("hosea", 13, 14), ("isaiah", 53, 12)],
        strand="grace",
        strand_label="Grace",
        card_title="A ransom for many — Hosea's promise to a buried house",
        anchor_refs=["Hosea 13:14", "Isaiah 53:12", "Mark 10:45"],
        body=[
            Q("mark", 10, 45),
            Q("hosea", 13, 14),
            Q("isaiah", 53, 12),
            P(
                "*Ransom* was promised before it was paid. Hosea speaks it "
                "over Ephraim — the scattered northern house, dead in its "
                "iniquity: *I will ransom them from the power of the grave; "
                "I will redeem them from death.* Isaiah had measured the "
                "price: a soul poured out unto death, *the sin of many* "
                "borne. The Son of Adam giving his life a ransom *for many* "
                "is both texts meeting — the promised redemption, at the "
                "prophesied cost, for a house that was as good as buried."
            ),
        ],
    ),
    dict(
        mark=("mark", 11, 17),
        mirrors=[("isaiah", 56, 6), ("isaiah", 56, 7), ("isaiah", 56, 8)],
        strand="gathering",
        strand_label="The gathering",
        card_title="A house of prayer — and the verse after the one he quoted",
        anchor_refs=["Isaiah 56:7-8", "Mark 11:17"],
        body=[
            Q("mark", 11, 17),
            Q("isaiah", 56, 6, 8),
            P(
                "He quotes Isaiah's seventh verse; the eighth was in every "
                "hearer's memory. The house of prayer belongs to a gathering "
                "promise: Adonai Yahuah (the Lord GOD) *which gathereth the "
                "outcasts of Yashar'el (Israel)* — and gathers still others "
                "to those already gathered. The strangers of Isaiah 56 are "
                "the estranged: covenant seed made foreign by the "
                "scattering, brought back to the holy mountain and the "
                "covenant they lost. The cleansing of the courts defends "
                "the address where the gathered are received. A den of "
                "thieves was standing in the doorway of the homecoming."
            ),
        ],
    ),
    dict(
        mark=("mark", 12, 29),
        mirrors=[("deuteronomy", 6, 4), ("hosea", 6, 6)],
        strand="teaching",
        strand_label="The teaching",
        card_title="Hear, O Yashar'el (Israel) — the first commandment begins with the Shema",
        anchor_refs=["Deuteronomy 6:4", "Hosea 6:6", "Mark 12:29-33"],
        body=[
            Q("mark", 12, 29, 31),
            Q("deuteronomy", 6, 4),
            Q("mark", 12, 32, 33),
            Q("hosea", 6, 6),
            P(
                "Asked for the first of all the commandments, Yahusha "
                "(Jesus) begins where Torah begins it — *Hear, O Yashar'el "
                "(Israel)* — quoting the summons and the address along with "
                "the command. And the scribe who answers well answers in a "
                "prophet's words: love *more than all whole burnt offerings "
                "and sacrifices* is Hosea's *I desired mercy, and not "
                "sacrifice.* Teacher and scribe are trading scriptures, each "
                "recognizing the other's source — two readers of one book "
                "agreeing on what it says. Nothing in the exchange is new, "
                "and the scribe is told he is not far from the kingdom of "
                "Elohim (God)."
            ),
        ],
    ),
]

# ===== SWEEP: LUKE + ACTS =====
CARDS += [


    # ------------------------------------------------------------------
    # LUKE 1:16-17 — the forerunner's commission is Malachi's last words
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 1, 17),
        mirrors=[("malachi", 4, 5), ("malachi", 4, 6)],
        strand="teaching",
        strand_label="The teaching",
        card_title="In the spirit and power of Elias",
        anchor_refs=["Malachi 4:4-6", "Luke 1:16-17"],
        body=[
            Q("luke", 1, 16, 17),
            Q("malachi", 4, 4, 6),
            P("The forerunner's job description is the closing paragraph of the prophets, repeated almost word for word. And notice where that paragraph begins: one verse before the Elijah promise, Malachi says *Remember ye the law of Moses.* The turning of hearts and the remembering of the Torah of Horeb stand together in one breath — the message that makes ready a people prepared for Yahuah (God) is not a new message but a return to the oldest one."),
            P("Notice also who is being made ready: *many of the children of Yashar'el (Israel) shall he turn.* The people being prepared are the people the prophets were always preparing."),
        ],
    ),

    # ------------------------------------------------------------------
    # LUKE 1:32-33 — the throne of David, the kingdom with no end
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 1, 32),
        mirrors=[("isaiah", 9, 7), ("daniel", 2, 44)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The throne of his father David",
        anchor_refs=["Isaiah 9:6-7", "Daniel 2:44", "Luke 1:32-33"],
        body=[
            Q("luke", 1, 32, 33),
            Q("isaiah", 9, 6, 7),
            Q("daniel", 2, 44),
            P("Gabriel announces nothing new. The throne is David's throne from Isaiah; the kingdom that shall have no end is Daniel's kingdom that shall never be destroyed and shall not be left to other people. The angel names the kingdom's address — *the house of Jacob* — and its duration — *for ever.*"),
            P("The inherited reading spiritualizes the throne into heaven and hands the house of Jacob to another people. The announcement itself allows neither move: a literal throne, a named house, a kingdom no other people inherits."),
        ],
    ),

    # ------------------------------------------------------------------
    # LUKE 1:46-55 — the Magnificat is Hannah's prayer re-sung
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 1, 54),
        mirrors=[("1-samuel", 2, 8), ("psalms", 98, 3)],
        strand="grace",
        strand_label="Grace",
        card_title="In remembrance of his mercy",
        anchor_refs=["1 Samuel 2:6-8", "Psalm 98:3", "Luke 1:46-55"],
        body=[
            Q("luke", 1, 46, 55),
            Q("1-samuel", 2, 6, 8),
            Q("psalms", 98, 3),
            P("Mary's song is Hannah's prayer re-sung — the mighty brought down, the lowly lifted, the hungry filled, the rich sent away. She did not compose a new theology of mercy; she sang the one her mothers sang."),
            P("And watch where the song lands: *He hath holpen his servant Yashar'el (Israel), in remembrance of his mercy; as he spake to our fathers, to Abraham, and to his seed for ever.* The mercy is remembered mercy — covenant mercy, spoken to a named seed, kept toward the house of Yashar'el (Israel) as the psalm says. Grace, at the door of the gospel, is Yahuah (God) remembering what he promised Abraham."),
        ],
    ),

    # ------------------------------------------------------------------
    # LUKE 1:68-75 — the Benedictus is the covenant oath walking
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 1, 73),
        mirrors=[("genesis", 22, 16), ("psalms", 105, 9)],
        strand="good_news",
        strand_label="The good news",
        card_title="The oath which he sware to our father Abraham",
        anchor_refs=["Genesis 22:16-17", "Psalm 105:8-10", "Luke 1:68-75"],
        body=[
            Q("luke", 1, 68, 75),
            Q("genesis", 22, 16, 17),
            Q("psalms", 105, 8, 10),
            P("Zacharias, filled with the Ruach HaKodesh (Holy Spirit), defines the visitation before the child is a day old: Yahuah (God) has *visited and redeemed his people* — to perform the mercy promised to the fathers, to remember his holy covenant, the oath sworn to Abraham. The good news at its birth is covenant memory, the by-myself-have-I-sworn of Genesis 22, remembered to a thousand generations and confirmed to Yashar'el (Israel) for an everlasting covenant."),
            P("And the oath's purpose, in Zacharias's mouth: delivered *that we might serve him without fear, in holiness and righteousness.* The deliverance is for the serving — redemption returns the redeemed to the ways of the one who swore."),
        ],
    ),

    # ------------------------------------------------------------------
    # LUKE 2:29-32 — Simeon speaks Isaiah 49, the raising of the tribes
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 2, 32),
        mirrors=[("isaiah", 49, 5), ("isaiah", 49, 6)],
        strand="gathering",
        strand_label="The gathering",
        card_title="To raise up the tribes of Jacob",
        anchor_refs=["Isaiah 49:5-6", "Luke 2:29-32", "Acts 13:47"],
        body=[
            Q("luke", 2, 29, 32),
            Q("isaiah", 49, 5, 6),
            Q("acts", 13, 47),
            P("Simeon's two clauses — light to the Gentiles, glory of thy people Yashar'el (Israel) — are Isaiah 49:6. And Isaiah names what the light is given for: *to raise up the tribes of Jacob, and to restore the preserved of Yashar'el (Israel).* The servant's commission is the gathering; the light goes out to the nations because the scattered seed is living in the nations. The inherited reading hears a new audience where the prophet named the old family."),
            P("A generation later, Paul reads the same verse aloud as his own marching orders. The mission to the nations and the raising of the tribes are one sentence in the source both moments were taught from."),
        ],
    ),

    # ------------------------------------------------------------------
    # LUKE 4:17-21 — the synagogue scroll, stopped mid-verse
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 4, 21),
        mirrors=[("isaiah", 61, 1), ("isaiah", 61, 2)],
        strand="good_news",
        strand_label="The good news",
        card_title="This day is this scripture fulfilled in your ears",
        anchor_refs=["Isaiah 61:1-2", "Luke 4:17-21"],
        body=[
            Q("luke", 4, 17, 21),
            Q("isaiah", 61, 1, 2),
            P("Read the two passages side by side and watch where he closed the book. Isaiah's sentence continues — *and the day of vengeance of our Elohim (God)* — and he stopped before it, rolled the scroll, sat down, and said the scripture was fulfilled. What was fulfilled that day was the proclamation of the acceptable year; the day of vengeance still waited."),
            P("And hear who Isaiah's good tidings are addressed to: the brokenhearted, the captives, the bound. That is exile language. The gospel he announced in Nazareth is liberty proclaimed to a people in captivity — the good news is the captives' homecoming begun."),
        ],
    ),

    # ------------------------------------------------------------------
    # LUKE 7:22 — the answer to John is Isaiah 35, the highway home
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 7, 22),
        mirrors=[("isaiah", 35, 5), ("isaiah", 35, 10)],
        strand="good_news",
        strand_label="The good news",
        card_title="Tell John what things ye have seen and heard",
        anchor_refs=["Isaiah 35:5-6, 10", "Luke 7:22"],
        body=[
            Q("luke", 7, 22),
            Q("isaiah", 35, 5, 6),
            Q("isaiah", 35, 10),
            P("John sent from prison to ask, *art thou he that should come?* — and the answer is not an argument but a checklist from Isaiah 35: blind eyes opened, deaf ears unstopped, the lame leaping. The signs were chosen because the prophet had already published them."),
            P("And Isaiah 35 has a destination. The chapter the signs come from ends with the ransomed of Yahuah (God) returning and coming to Zion with songs. The miracles are not credentials floating free — they are mile-markers on the road whose end is the return of the ransomed."),
        ],
    ),

    # ------------------------------------------------------------------
    # LUKE 12:32 — flock + given kingdom in one verse: Daniel and Micah
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 12, 32),
        mirrors=[("daniel", 7, 27), ("micah", 4, 8)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Your Father's good pleasure to give you the kingdom",
        anchor_refs=["Daniel 7:27", "Micah 4:8", "Luke 12:32"],
        body=[
            Q("luke", 12, 32),
            Q("daniel", 7, 27),
            Q("micah", 4, 8),
            P("One small verse, two prophets speaking inside it. Daniel saw the kingdom *given* — given to the people of the saints, an everlasting kingdom. Micah addressed the *tower of the flock* and promised the kingdom would come to it. Flock and given-kingdom were already joined in the prophets; Yahusha (Jesus) speaks them in a single breath to a little flock that had been taught both."),
            P("The kingdom is not seized, earned, or built by the flock. It is the Father's good pleasure to give it — to the same people the prophets said it would be given."),
        ],
    ),

    # ------------------------------------------------------------------
    # LUKE 13:28-29 — the four compass points belong to the prophets
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 13, 29),
        mirrors=[("isaiah", 43, 5), ("psalms", 107, 3)],
        strand="gathering",
        strand_label="The gathering",
        card_title="They shall come from the east, and from the west",
        anchor_refs=["Isaiah 43:5-6", "Psalm 107:2-3", "Luke 13:28-29"],
        body=[
            Q("luke", 13, 28, 29),
            Q("isaiah", 43, 5, 6),
            Q("psalms", 107, 2, 3),
            P("East, west, north, south. The inherited reading hears the nations streaming in to replace the patriarchs' children — but the four compass points were already assigned. Isaiah: *I will bring thy seed from the east... my sons from far, and my daughters from the ends of the earth.* The psalm: the redeemed *gathered out of the lands, from the east, and from the west, from the north, and from the south.*"),
            P("Those who sit down with Abraham, Isaac, and Jacob in the kingdom are arriving from the four winds because that is where the seed was scattered. The warning in the saying falls on the unrepentant standing near — not on the family coming home."),
        ],
    ),

    # ------------------------------------------------------------------
    # LUKE 15:4-7 — the lost sheep is the scattered-house parable
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 15, 4),
        mirrors=[("ezekiel", 34, 6), ("jeremiah", 50, 17)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Rejoice with me; for I have found my sheep which was lost",
        anchor_refs=["Ezekiel 34:6", "Jeremiah 50:17", "Luke 15:4-7"],
        body=[
            Q("luke", 15, 4, 7),
            Q("ezekiel", 34, 6),
            Q("jeremiah", 50, 17),
            P("The parable's vocabulary is the prophets'. Jeremiah had already named the sheep: *Yashar'el (Israel) is a scattered sheep; the lions have driven him away* — Assyria first, Babylon last. Ezekiel had already filed the complaint: the flock scattered on all the face of the earth, *and none did search or seek after them.*"),
            P("So the shepherd who leaves the ninety and nine and goes after that which is lost *until he find it* is the answer to Ezekiel's none-did-search. The joy in heaven is the owner's joy over his own sheep recovered — the parable is the gathering told at the scale of one."),
        ],
    ),

    # ------------------------------------------------------------------
    # LUKE 15:18-24 — the prodigal's speech is Ephraim's, recorded
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 15, 20),
        mirrors=[("jeremiah", 31, 18), ("jeremiah", 31, 20)],
        strand="grace",
        strand_label="Grace",
        card_title="When he was yet a great way off",
        anchor_refs=["Jeremiah 31:18-20", "Luke 15:18-24"],
        body=[
            Q("luke", 15, 18, 24),
            Q("jeremiah", 31, 18, 20),
            P("The son in the far country is not anonymous. Jeremiah recorded his speech centuries earlier: Ephraim bemoaning himself, chastised, turned, repenting, ashamed of the reproach of his youth — *turn thou me, and I shall be turned.* And Jeremiah recorded the Father's answer: *Is Ephraim my dear son?... my bowels are troubled for him; I will surely have mercy upon him.*"),
            P("The father who sees the boy a great way off and runs is the surely-have-mercy of Jeremiah 31 with its robe flying. Grace here is the embrace on the road — and the road leads home, back into the Father's house and the Father's ways. The son is restored to sonship, not released from it."),
        ],
    ),

    # ------------------------------------------------------------------
    # LUKE 19:9-10 — the type specimen: Ezekiel's I-will re-spoken
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 19, 10),
        mirrors=[("ezekiel", 34, 16)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Come to seek and to save that which was lost",
        anchor_refs=["Ezekiel 34:16", "Luke 19:9-10"],
        body=[
            Q("luke", 19, 9, 10),
            Q("ezekiel", 34, 16),
            P("In Ezekiel, Yahuah (God) speaks in the first person: *I will seek that which was lost.* In Jericho, the Son of Adam says he *is come* to do exactly that — no citation formula, no as-it-is-written. The promise is simply re-spoken as his own errand."),
            P("And the verse before tells you what was found: salvation comes to Zacchaeus's house *forsomuch as he also is a son of Abraham.* The lost being sought and saved are the seed — a son of Abraham recovered to his own inheritance."),
        ],
    ),

    # ------------------------------------------------------------------
    # LUKE 22:28-30 — twelve thrones, and the psalm that set them
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 22, 30),
        mirrors=[("psalms", 122, 4), ("psalms", 122, 5)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Thrones judging the twelve tribes of Yashar'el (Israel)",
        anchor_refs=["Psalm 122:4-5", "Luke 22:28-30"],
        body=[
            Q("luke", 22, 28, 30),
            Q("psalms", 122, 4, 5),
            P("On the night the covenant was cut, he appointed a kingdom — and described it in furniture: a table, and thrones judging the twelve tribes of Yashar'el (Israel). David's city already held that furniture in song: *there are set thrones of judgment, the thrones of the house of David,* in the place whither the tribes go up."),
            P("Twelve thrones for twelve tribes, set in the house of David. The kingdom he appointed at the table is the one the psalm had been singing all along — nothing in it transferred to another people, nothing in it dissolved into metaphor. The tribes go up; the thrones are set; the appointment stands."),
        ],
    ),

    # ------------------------------------------------------------------
    # LUKE 24:46-47 — repentance among all nations is itself written
    # ------------------------------------------------------------------
    dict(
        mark=("luke", 24, 47),
        mirrors=[("isaiah", 55, 7), ("jeremiah", 16, 19)],
        strand="teaching",
        strand_label="The teaching",
        card_title="Thus it is written... among all nations",
        anchor_refs=["Isaiah 55:7", "Jeremiah 16:19", "Luke 24:46-47"],
        body=[
            Q("luke", 24, 46, 47),
            Q("isaiah", 55, 7),
            Q("jeremiah", 16, 19),
            P("*Thus it is written* — including the part the inherited reading treats as new: repentance and remission preached among all nations. Isaiah wrote the repentance: let him *return* unto Yahuah (God), and he will abundantly pardon. Repentance in the prophets' tongue is return."),
            P("And Jeremiah heard what the preaching among all nations produces: they *shall come unto thee from the ends of the earth, and shall say, Surely our fathers have inherited lies.* The preaching goes out into every nation because the scattered seed lives in every nation, and the sheep hear. The confession of inherited lies is the sound of the return beginning."),
        ],
    ),

    # ------------------------------------------------------------------
    # ACTS 1:6-7 — the last question: he corrects the when, not the what
    # ------------------------------------------------------------------
    dict(
        mark=("acts", 1, 6),
        mirrors=[("ezekiel", 37, 22), ("jeremiah", 33, 7)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Wilt thou at this time restore again the kingdom to Yashar'el (Israel)?",
        anchor_refs=["Ezekiel 37:22", "Jeremiah 33:7", "Acts 1:6-7"],
        body=[
            Q("acts", 1, 6, 7),
            Q("ezekiel", 37, 22),
            Q("jeremiah", 33, 7),
            P("After forty days of the risen Messiah (Christ) teaching them the kingdom, this is the disciples' last question — and it is the prophets' question word for word: one nation in the land, one king over them all, the captivity of Yahudah (Judah) and the captivity of Yashar'el (Israel) returned and built as at the first."),
            P("The inherited reading treats the question as a misunderstanding he never got around to fixing. But read his answer: he corrects the *when* — not for you to know the times or the seasons — and never the *what.* The restoration stands; only the calendar is sealed in the Father's own power."),
        ],
    ),

    # ------------------------------------------------------------------
    # ACTS 2:5, 16-18 — the dispersion gathered at Shavuot hears Joel
    # ------------------------------------------------------------------
    dict(
        mark=("acts", 2, 5),
        mirrors=[("joel", 2, 28), ("joel", 2, 29)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Devout men, out of every nation under heaven",
        anchor_refs=["Joel 2:27-29", "Acts 2:5, 16-18"],
        body=[
            Q("acts", 2, 5),
            Q("acts", 2, 16, 18),
            Q("joel", 2, 27, 29),
            P("Look at the audience before the sermon: Yahudim (Jews), devout men, *out of every nation under heaven* — the dispersion itself, drawn up to Jerusalem for Shavuot. The first hearers of the outpouring are the scattered, gathered."),
            P("And the text Peter opens does not float free. One verse before the promise of the Spirit, Joel says *ye shall know that I am in the midst of Yashar'el (Israel)... and my people shall never be ashamed.* The outpouring on all flesh sits inside Joel's restoration of his people — and it lands, first, in the ears of the dispersion come home for the feast."),
        ],
    ),

    # ------------------------------------------------------------------
    # ACTS 2:38-39 — "afar off" is the prophets' address for the exiles
    # ------------------------------------------------------------------
    dict(
        mark=("acts", 2, 39),
        mirrors=[("isaiah", 57, 19), ("daniel", 9, 7)],
        strand="good_news",
        strand_label="The good news",
        card_title="To all that are afar off",
        anchor_refs=["Isaiah 57:19", "Daniel 9:7", "Acts 2:38-39"],
        body=[
            Q("acts", 2, 38, 39),
            Q("isaiah", 57, 19),
            Q("daniel", 9, 7),
            P("*Afar off* is not a vague gesture toward humanity in general — it is the prophets' fixed address for the dispersion. Daniel prays it as geography: all Yashar'el (Israel), *that are near, and that are far off, through all the countries whither thou hast driven them.* Isaiah speaks peace along the same line: to him that is far off, and to him that is near — with healing attached."),
            P("Peter's promise runs down the dispersion's mailing list: you, your children, and all that are afar off — *even as many as Yahuah (God) shall call.* The calling does not create the family; it reveals it, wherever the scattering carried them."),
        ],
    ),

    # ------------------------------------------------------------------
    # ACTS 3:19-21 — the times of restitution = the second recovery
    # ------------------------------------------------------------------
    dict(
        mark=("acts", 3, 21),
        mirrors=[("isaiah", 11, 11), ("isaiah", 11, 12)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The times of restitution of all things",
        anchor_refs=["Isaiah 11:11-12", "Acts 3:19-21"],
        body=[
            Q("acts", 3, 19, 21),
            Q("isaiah", 11, 11, 12),
            P("Peter says the heaven must hold the Messiah (Christ) *until the times of restitution of all things, which Elohim (God) hath spoken by the mouth of all his holy prophets since the world began.* So ask the prophets what they spoke. Isaiah's answer: the hand set *the second time* to recover the remnant — the outcasts of Yashar'el (Israel) assembled, the dispersed of Yahudah (Judah) gathered from the four corners of the earth."),
            P("The restitution of all things is not an abstraction; it is the gathering the prophets unanimously promised. The Messiah (Christ) waits in heaven on the restoration's appointed times — the apostles preached the delay as the proof the gathering was still coming, not a sign it had been cancelled."),
        ],
    ),

    # ------------------------------------------------------------------
    # ACTS 3:25-26 — the Abrahamic blessing defined: turned from iniquity
    # ------------------------------------------------------------------
    dict(
        mark=("acts", 3, 26),
        mirrors=[("genesis", 22, 18)],
        strand="grace",
        strand_label="Grace",
        card_title="Sent him to bless you, in turning away every one of you from his iniquities",
        anchor_refs=["Genesis 22:18", "Acts 3:25-26"],
        body=[
            Q("acts", 3, 25, 26),
            Q("genesis", 22, 18),
            P("Peter quotes the seed-blessing sworn to Abraham and then, in the next sentence, defines what the blessing is: *sent him to bless you, in turning away every one of you from his iniquities.* The blessing is the turning. Not a pardon that leaves a man standing where he stood — the blessing of Abraham, in the apostle's mouth, is the man brought back from his iniquities to the ways of Yahuah (God)."),
            P("That is grace as the prophets carry it: the means of return. The gift and the turning are one motion — he blesses by bringing home."),
        ],
    ),

    # ------------------------------------------------------------------
    # ACTS 15:14-17 — the council settled by Amos: David's tabernacle
    # ------------------------------------------------------------------
    dict(
        mark=("acts", 15, 16),
        mirrors=[("amos", 9, 11), ("amos", 9, 12)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="I will build again the tabernacle of David, which is fallen",
        anchor_refs=["Amos 9:11-12, 14", "Acts 15:14-17"],
        body=[
            Q("acts", 15, 14, 17),
            Q("amos", 9, 11, 12),
            Q("amos", 9, 14),
            P("The Jerusalem council's verdict is not settled by a vote but by a prophet. James hears that a people for Yahuah (God)'s name is being taken out of the nations, and says *to this agree the words of the prophets* — then reads Amos: the fallen tabernacle of David raised, its ruins rebuilt, possessed by those *which are called by my name.* Three verses later Amos names the same work plainly: *I will bring again the captivity of my people of Yashar'el (Israel).*"),
            P("The people being taken out of the nations are the people called by his name living in the nations — and their ingathering is, in James's reading, the rebuilding of David's kingdom. The council heard the mission to the nations and recognized the restoration text."),
        ],
    ),

    # ------------------------------------------------------------------
    # ACTS 26:6-7 — on trial for the hope of the twelve tribes
    # ------------------------------------------------------------------
    dict(
        mark=("acts", 26, 7),
        mirrors=[("hosea", 1, 10), ("hosea", 1, 11)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Unto which promise our twelve tribes hope to come",
        anchor_refs=["Hosea 1:10-11", "Acts 26:6-7"],
        body=[
            Q("acts", 26, 6, 7),
            Q("hosea", 1, 10, 11),
            P("Paul, on trial for his life, names the charge himself: the hope of the promise made to the fathers — the promise *unto which our twelve tribes... hope to come.* Twelve. Not one house, not a remnant of Yahudah (Judah) only, not a new community wearing the old name. The hope he is chained for is the restoration of all twelve."),
            P("Hosea had already written that hope out: the not-my-people called *sons of the living Elohim (God),* and the children of Yahudah (Judah) and the children of Yashar'el (Israel) gathered together under one head. The inherited reading passes over the twelve tribes in Paul's sentence; Paul staked his trial on them."),
        ],
    ),

    # ------------------------------------------------------------------
    # ACTS 28:20 — the hope of Yashar'el: Ezekiel's lost hope restored
    # ------------------------------------------------------------------
    dict(
        mark=("acts", 28, 20),
        mirrors=[("ezekiel", 37, 11), ("ezekiel", 37, 12)],
        strand="gathering",
        strand_label="The gathering",
        card_title="For the hope of Yashar'el (Israel) I am bound with this chain",
        anchor_refs=["Ezekiel 37:11-14", "Acts 28:20"],
        body=[
            Q("acts", 28, 20),
            Q("ezekiel", 37, 11, 14),
            P("Paul's last self-description in the book of Acts. What is *the hope of Yashar'el (Israel)?* Ezekiel heard the whole house of Yashar'el (Israel) say it out loud: *our bones are dried, and our hope is lost.* And he heard the answer: graves opened, the Spirit put within, the people placed in their own land — *then shall ye know that I Yahuah (LORD) have spoken it, and performed it.*"),
            P("The hope Paul wears the chain for is the hope the dry bones lost and Yahuah (God) swore to restore. Acts opens with the apostles asking for the kingdom restored to Yashar'el (Israel) and closes with its apostle chained for the hope of Yashar'el (Israel) — the proclamation never changed its subject."),
        ],
    ),
]

# ===== SWEEP: JOHN + 1-3 JOHN + REVELATION =====
CARDS += [


    # ------------------------------------------------------------------
    # JOHN
    # ------------------------------------------------------------------

    dict(
        mark=("john", 3, 5),
        mirrors=[("ezekiel", 36, 25), ("ezekiel", 36, 27)],
        strand="grace",
        strand_label="Grace",
        card_title="Born of water and of the Spirit — Ezekiel's promise to the gathered",
        anchor_refs=["Ezekiel 36:24-27", "John 3:5-10"],
        body=[
            Q("john", 3, 5, 8),
            Q("ezekiel", 36, 24, 27),
            Q("john", 3, 9, 10),
            P("Water and Spirit together are not a riddle Yahusha (Jesus) invented that night. They are Ezekiel's oracle, and the oracle is a homecoming: it opens with Yahuah (God) gathering his people out of all countries and bringing them into their own land, and it closes with the Spirit causing them to walk in his statutes. The clean water, the new heart, the Spirit within — all of it is the equipment of the return."),
            P("That is why a master of Yashar'el (Israel) is asked how he could not know these things. The inherited reading hands on the new birth but not the verses it was taught from — and so it misses that the new heart is given for walking in the statutes, not for leaving them. The birth from above is the scattered seed coming home to Yahuah (God) and to his ways in one motion."),
        ],
    ),

    dict(
        mark=("john", 6, 35),
        mirrors=[("exodus", 16, 4), ("psalms", 78, 24), ("psalms", 78, 25)],
        strand="good_news",
        strand_label="The good news",
        card_title="Bread from heaven — and the test that came down with it",
        anchor_refs=["Exodus 16:4", "Psalm 78:24-25", "John 6:31-35"],
        body=[
            Q("john", 6, 31, 35),
            Q("psalms", 78, 24, 25),
            Q("exodus", 16, 4),
            P("The crowd quotes the psalm; the psalm sings the wilderness story; and the wilderness story tells why the bread rained down in the first place — that I may prove them, whether they will walk in my law, or no. Bread from heaven was never separate from walking in the Torah of Yahuah (God). The manna and the test came down together."),
            P("So when Yahusha (Jesus) says I am the bread of life, he is not replacing the old bread with something the wilderness never knew. He is the true bread on the same road, feeding the same family the manna fed — the children of Yashar'el (Israel) on their way home."),
        ],
    ),

    dict(
        mark=("john", 6, 44),
        mirrors=[("jeremiah", 31, 3), ("jeremiah", 31, 10)],
        strand="grace",
        strand_label="Grace",
        card_title="Except the Father draw him — with lovingkindness have I drawn thee",
        anchor_refs=["Jeremiah 31:3, 10", "John 6:44"],
        body=[
            Q("john", 6, 44),
            Q("jeremiah", 31, 3),
            Q("jeremiah", 31, 10),
            P("Draw is not a new word. It is the Father's own first-person covenant word, spoken of old to Yashar'el (Israel): with lovingkindness have I drawn thee. And the same chapter tells the nations and the isles afar off what the drawing is — he that scattered Yashar'el (Israel) will gather him, and keep him, as a shepherd doth his flock."),
            P("The drawing and the gathering are one act. No one comes except the Father draws, because the coming is the scattered being pulled home by the everlasting love that never let them go. Grace is the cord in the Father's hand."),
        ],
    ),

    dict(
        mark=("john", 6, 45),
        mirrors=[("isaiah", 54, 13), ("jeremiah", 31, 34)],
        strand="teaching",
        strand_label="The teaching",
        card_title="They shall be all taught of Elohim (God) — and the prophets name whose children",
        anchor_refs=["Isaiah 54:13", "Jeremiah 31:34", "John 6:45"],
        body=[
            Q("john", 6, 45),
            Q("isaiah", 54, 13),
            Q("jeremiah", 31, 34),
            P("It is written in the prophets — and here is where. Isaiah speaks the promise to the forsaken wife being restored: all thy children shall be taught of Yahuah (God). The all is her children — the children of the woman Yahuah (God) is taking back. Jeremiah says the same of the houses under the new covenant: they shall all know me, from the least of them unto the greatest."),
            P("Every man that hath heard, and hath learned of the Father, cometh — the hearing reveals whose children they are. The teaching promised to the restored family is the teaching now drawing them to the Messiah (Christ)."),
        ],
    ),

    dict(
        mark=("john", 7, 37),
        mirrors=[("isaiah", 55, 1), ("isaiah", 44, 3)],
        strand="grace",
        strand_label="Grace",
        card_title="If any man thirst — the waters were already poured for Jacob's seed",
        anchor_refs=["Isaiah 55:1", "Isaiah 44:1-3", "John 7:37-38"],
        body=[
            Q("john", 7, 37, 38),
            Q("isaiah", 55, 1),
            Q("isaiah", 44, 1, 3),
            P("On the last great day of the feast he stands and cries an invitation Isaiah had already cried: Ho, every one that thirsteth, come ye to the waters — without money and without price. The drink is free. That is grace, spoken centuries before in the same voice."),
            P("And the second oracle names who the water was promised to: hear, O Jacob my servant; I will pour my spirit upon thy seed, and my blessing upon thine offspring. The rivers of living water are the Spirit poured on the seed of Ya'aqov (Jacob) — the thirsty, scattered offspring the prophets never stopped addressing."),
        ],
    ),

    dict(
        mark=("john", 11, 52),
        mirrors=[("isaiah", 11, 12), ("ezekiel", 11, 17)],
        strand="gathering",
        strand_label="The gathering",
        card_title="To gather together in one the children scattered abroad",
        anchor_refs=["Isaiah 11:12", "Ezekiel 11:17", "John 11:51-52"],
        body=[
            Q("john", 11, 51, 52),
            Q("isaiah", 11, 12),
            Q("ezekiel", 11, 17),
            P("The evangelist states the purpose of the death in one flat sentence: not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad. The scattered abroad are not a figure of speech. Isaiah names them — the outcasts of Yashar'el (Israel) and the dispersed of Yahudah (Judah), both houses, assembled from the four corners of the earth. Ezekiel hears the same promise: gathered from the people, assembled out of the countries, given the land."),
            P("The inherited reading walks past this verse on its way to the cross. But the verse is the cross's own stated purpose: the ensign lifted up, and the scattering reversed."),
        ],
    ),

    dict(
        mark=("john", 16, 32),
        mirrors=[("zechariah", 13, 7), ("zechariah", 13, 9)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Scattered, every man to his own — the sword, the shepherd, and the little ones",
        anchor_refs=["Zechariah 13:7-9", "John 16:32"],
        body=[
            Q("john", 16, 32),
            Q("zechariah", 13, 7),
            Q("zechariah", 13, 9),
            P("No citation formula here — the prophecy simply happens. The shepherd is smitten and the sheep scatter, exactly as Zechariah's sword-oracle wrote it. But the oracle does not end at the scattering: I will turn mine hand upon the little ones. The hand turns toward them, not away."),
            P("And the same oracle carries the scattering all the way to its destination — through the fire, refined as silver, until the words pass between them again: I will say, It is my people; and they shall say, Yahuah (God) is my Elohim (God). The night the disciples scattered, every man to his own, is the small portrait of the houses' long scattering — and the same prophet already wrote how it ends."),
        ],
    ),

    # ------------------------------------------------------------------
    # 1 JOHN / 2 JOHN
    # ------------------------------------------------------------------

    dict(
        mark=("1-john", 2, 7),
        mirrors=[("deuteronomy", 6, 5), ("deuteronomy", 6, 6), ("leviticus", 19, 18)],
        strand="teaching",
        strand_label="The teaching",
        card_title="No new commandment — the old one ye had from the beginning",
        anchor_refs=["Deuteronomy 6:5-6", "Leviticus 19:18", "1 John 2:7-8"],
        body=[
            Q("1-john", 2, 7, 8),
            Q("deuteronomy", 6, 5, 6),
            Q("leviticus", 19, 18),
            P("The apostle says it himself, plainer than any argument: I write no new commandment unto you, but an old commandment which ye had from the beginning. The word heard from the beginning is Moses' word — love Yahuah (God) with all the heart, and love thy neighbour as thyself. Both commandments were already in the Torah, and the Torah said the words shall be in thine heart."),
            P("What is new is not the commandment. It is the hour — the darkness is past, and the true light now shineth. The light is new; the commandment it shines on is as old as the covenant. There is nothing new in the New Testament; here the New Testament says so."),
        ],
    ),

    dict(
        mark=("1-john", 5, 3),
        mirrors=[("deuteronomy", 30, 11), ("deuteronomy", 30, 14)],
        strand="teaching",
        strand_label="The teaching",
        card_title="His commandments are not grievous — not hidden, not far off, very nigh",
        anchor_refs=["Deuteronomy 30:11-14", "1 John 5:3"],
        body=[
            Q("1-john", 5, 3),
            Q("deuteronomy", 30, 11, 14),
            P("Not grievous is Moses' own assessment, restated. The commandment is not hidden, not far off, not in heaven, not beyond the sea — it is very nigh unto thee, in thy mouth, and in thy heart, that thou mayest do it. The apostle and the Torah give the same verdict on the same commandments."),
            P("The inherited reading was handed a different verdict — the commandments as a burden grace removes. But the two witnesses on the page agree against it: keeping his commandments is what the love of Elohim (God) is, and the commandments themselves were given near and light."),
        ],
    ),

    dict(
        mark=("2-john", 1, 6),
        mirrors=[("genesis", 26, 5)],
        strand="teaching",
        strand_label="The teaching",
        card_title="As ye have heard from the beginning — older than the mountain",
        anchor_refs=["Genesis 26:5", "2 John 1:5-6"],
        body=[
            Q("2-john", 1, 5, 6),
            Q("genesis", 26, 5),
            P("Twice in two verses the elder reaches for the same phrase: from the beginning. How far back does the beginning go? Before Sinai, Yahuah (God) tells Isaac why the promise stands: because that Abraham obeyed my voice, and kept my charge, my commandments, my statutes, and my laws. Commandments, statutes, and laws — the full covenant vocabulary — kept by the father of the promise generations before the mountain smoked."),
            P("The walk the elder commends to the lady and her children is not a first-century innovation and not a Sinai-only regime. It is the family walk from the beginning: love walking after his commandments."),
        ],
    ),

    # ------------------------------------------------------------------
    # REVELATION
    # ------------------------------------------------------------------

    dict(
        mark=("revelation", 1, 6),
        mirrors=[("exodus", 19, 6)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Kings and priests — Sinai's commission spoken again at Patmos",
        anchor_refs=["Exodus 19:5-6", "Revelation 1:5-6", "Revelation 5:10"],
        body=[
            Q("revelation", 1, 5, 6),
            Q("exodus", 19, 5, 6),
            Q("revelation", 5, 10),
            P("Kings and priests is not Patmos language first. It is Sinai language — ye shall be unto me a kingdom of priests, and an holy nation, words Moses was told to speak to the children of Yashar'el (Israel). Revelation opens by speaking the same commission over the washed and loved, and the song before the throne finishes the sentence the inherited reading leaves off: and we shall reign on the earth."),
            P("The office never changed hands. The kingdom of priests promised at the mountain is the kingdom the book of Revelation crowns — the gathered family, in the priestly calling it was formed for, reigning with the Messiah (Christ) on the earth."),
        ],
    ),

    dict(
        mark=("revelation", 7, 4),
        mirrors=[("ezekiel", 9, 4), ("isaiah", 49, 6)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Sealed of all the tribes of the children of Yashar'el (Israel)",
        anchor_refs=["Ezekiel 9:4", "Isaiah 49:6", "Revelation 7:4"],
        body=[
            Q("revelation", 7, 4),
            Q("ezekiel", 9, 4),
            Q("isaiah", 49, 6),
            P("Of all the tribes of the children of Yashar'el (Israel) — and then the roll is called, tribe by named tribe, twelve times over. The seal on the forehead is Ezekiel's mark, set on those who sigh and cry over the abominations before the judgment falls. And the counting of tribes at the end of the age is Isaiah's servant-assignment kept: to raise up the tribes of Jacob, and to restore the preserved of Yashar'el (Israel)."),
            P("The inherited reading hurries the number into a symbol for something else. The text spells the tribes out one by one precisely so they cannot be spiritualized away. At the end of the book, the tribes are still tribes — sealed, counted, and known by name."),
        ],
    ),

    dict(
        mark=("revelation", 11, 15),
        mirrors=[("daniel", 2, 44), ("zechariah", 14, 9)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The kingdoms of this world are become — the stone the prophets saw",
        anchor_refs=["Daniel 2:44", "Zechariah 14:9", "Revelation 11:15"],
        body=[
            Q("revelation", 11, 15),
            Q("daniel", 2, 44),
            Q("zechariah", 14, 9),
            P("The seventh trumpet announces nothing the prophets had not already announced. Daniel saw the Elohim (God) of heaven set up a kingdom which shall never be destroyed, breaking in pieces all the kingdoms of men. Zechariah saw the day when Yahuah (God) shall be king over all the earth — one Yahuah (God), and his name one."),
            P("The great voices in heaven are quoting their own scriptures. The kingdom proclaimed through the whole good news is this kingdom — declared from the beginning, standing for ever, and his reign for ever and ever."),
        ],
    ),

    dict(
        mark=("revelation", 12, 1),
        mirrors=[("genesis", 37, 9), ("genesis", 37, 10)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Sun, moon, and twelve stars — Joseph's dream stands behind the sign",
        anchor_refs=["Genesis 37:9-10", "Revelation 12:1-5"],
        body=[
            Q("revelation", 12, 1, 2),
            Q("genesis", 37, 9, 10),
            Q("revelation", 12, 5),
            P("Only in one other place in scripture do sun, moon, and stars stand together as a family — Joseph's second dream, and Jacob himself interprets it on the spot: the sun is the father, the moon the mother, the stars the brothers. The constellation is the household of Yashar'el (Israel). The woman crowned with twelve stars is that household — the covenant family in travail, bringing forth the man child who was to rule all nations with a rod of iron."),
            P("The inherited reading reaches past her for other identities and loses the dream standing right behind the sign. The kingdom comes out of the family the patriarchs dreamed; the king is born of the woman the stars have always named."),
        ],
    ),

    dict(
        mark=("revelation", 14, 4),
        mirrors=[("jeremiah", 2, 3)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The firstfruits unto Elohim (God) — the title Yashar'el (Israel) carried from the start",
        anchor_refs=["Jeremiah 2:3", "Revelation 14:3-4"],
        body=[
            Q("revelation", 14, 3, 4),
            Q("jeremiah", 2, 3),
            P("Firstfruits is not a new honorific minted for the 144,000. It is the name Yahuah (God) gave Yashar'el (Israel) at the very start of Jeremiah's prophecy: Yashar'el (Israel) was holiness unto Yahuah (God), and the firstfruits of his increase. The company redeemed from the earth, sealed of all the tribes, carries the nation's own oldest title."),
            P("A firstfruits implies a harvest still standing in the field — the first sheaf of an increase being gathered in. The redeemed who follow the Lamb are the front of the homecoming, bearing the name the family was given before it was scattered."),
        ],
    ),

    dict(
        mark=("revelation", 15, 3),
        mirrors=[("exodus", 15, 1), ("isaiah", 11, 11)],
        strand="good_news",
        strand_label="The good news",
        card_title="They sing the song of Moses — the second exodus has a sea and a shore",
        anchor_refs=["Exodus 15:1-2", "Isaiah 11:11", "Revelation 15:2-3"],
        body=[
            Q("revelation", 15, 2, 3),
            Q("exodus", 15, 1, 2),
            Q("isaiah", 11, 11),
            P("On the far shore of the glass sea, the victors sing the song of Moses — the song the children of Yashar'el (Israel) sang on the far shore of the Red Sea, when the horse and his rider were thrown into it. The end of the book is staged as an exodus because the end was always going to be one: Isaiah promised that Yahuah (God) would set his hand again the second time to recover the remnant of his people from all the lands of their scattering."),
            P("The good news has the shape of the first deliverance because it is the second one. Same Deliverer, same family, same song — sung this time beside a sea of glass."),
        ],
    ),

    dict(
        mark=("revelation", 18, 4),
        mirrors=[("jeremiah", 51, 45), ("isaiah", 48, 20)],
        strand="good_news",
        strand_label="The good news",
        card_title="Come out of her, my people — Jeremiah's Babylon cry re-sounded",
        anchor_refs=["Jeremiah 51:45", "Isaiah 48:20", "Revelation 18:4"],
        body=[
            Q("revelation", 18, 4),
            Q("jeremiah", 51, 45),
            Q("isaiah", 48, 20),
            P("The voice from heaven over end-time Babylon speaks a sentence Jeremiah had already written over the first Babylon: My people, go ye out of the midst of her. Sentence for sentence, the same summons — and my people inside Babylon means the scattered are in there, known and named, waiting for the call."),
            P("Isaiah tells what the going-out sounds like: a voice of singing, declared to the end of the earth — Yahuah (God) hath redeemed his servant Jacob. The exodus out of Babylon is the good news in motion: the captives called by name, walking out, and the redemption of Ya'aqov (Jacob) announced as far as the earth reaches."),
        ],
    ),

    dict(
        mark=("revelation", 19, 9),
        mirrors=[("isaiah", 54, 6), ("isaiah", 54, 7), ("hosea", 2, 16)],
        strand="good_news",
        strand_label="The good news",
        card_title="The marriage supper of the Lamb — the forsaken wife gathered home",
        anchor_refs=["Isaiah 54:6-7", "Hosea 2:16", "Revelation 19:7-9"],
        body=[
            Q("revelation", 19, 7, 9),
            Q("isaiah", 54, 6, 7),
            Q("hosea", 2, 16),
            P("The wife at the marriage of the Lamb is not a bride from nowhere. The prophets know her history: a woman forsaken and grieved in spirit, a wife of youth who was refused — forsaken a small moment, and gathered with great mercies. The gathering and the marriage are the same mercy; the supper is the homecoming feast."),
            P("Hosea heard the day named: thou shalt call me Ishi — my husband — and call me no more Baali. The cast-off wife restored to her husband is the oldest love story in the prophets, and Revelation 19 is its wedding day."),
        ],
    ),

    dict(
        mark=("revelation", 21, 3),
        mirrors=[("ezekiel", 37, 27), ("leviticus", 26, 11)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The tabernacle of Elohim (God) is with men — the covenant sentence comes home",
        anchor_refs=["Leviticus 26:11-12", "Ezekiel 37:27", "Revelation 21:3"],
        body=[
            Q("revelation", 21, 3),
            Q("leviticus", 26, 11, 12),
            Q("ezekiel", 37, 27),
            P("The great voice out of heaven at the descent of the city is quoting — first the Torah, then the prophet. Leviticus speaks it among the statutes: I will set my tabernacle among you, and I will walk among you, and will be your Elohim (God), and ye shall be my people. Ezekiel carries it into the oracle of the restored houses: my tabernacle also shall be with them; yea, I will be their Elohim (God), and they shall be my people."),
            P("One sentence, three witnesses, no revision. The destination of the whole book — the whole canon — is the covenant sentence finally spoken face to face, in the kingdom where he dwells with his people."),
        ],
    ),

    dict(
        mark=("revelation", 21, 4),
        mirrors=[("isaiah", 25, 8), ("isaiah", 35, 10)],
        strand="good_news",
        strand_label="The good news",
        card_title="Wipe away all tears — death swallowed, and the ransomed come home singing",
        anchor_refs=["Isaiah 25:8", "Isaiah 35:10", "Revelation 21:4"],
        body=[
            Q("revelation", 21, 4),
            Q("isaiah", 25, 8),
            Q("isaiah", 35, 10),
            P("Every clause was Isaiah's first. He will swallow up death in victory; he will wipe away tears from off all faces; the rebuke of his people taken away from off all the earth. Revelation 21:4 is that oracle kept, clause by clause."),
            P("And Isaiah shows whose faces the tears are on: the ransomed of Yahuah (God) shall return, and come to Zion with songs — and sorrow and sighing shall flee away. The wiping of tears is the last act of the return. The good news ends where the scattering ends: home, with everlasting joy upon their heads."),
        ],
    ),

    dict(
        mark=("revelation", 21, 12),
        mirrors=[("ezekiel", 48, 31)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Twelve gates, twelve tribes — every door into the city is tribal",
        anchor_refs=["Ezekiel 48:31", "Revelation 21:12"],
        body=[
            Q("revelation", 21, 12),
            Q("ezekiel", 48, 31),
            P("The city's wall has twelve gates, and the names written on them are the names of the twelve tribes of the children of Yashar'el (Israel). Ezekiel drew the same architecture at the close of his book — the gates of the city after the names of the tribes, gate by gate. The two visions agree to the doorposts: every entrance into the city carries a tribal name."),
            P("The inherited reading pictures itself entering a city whose doors it has never read. There is no thirteenth gate. The gates are the gathering written in stone — each tribe called home through a door that bears its name."),
        ],
    ),

    dict(
        mark=("revelation", 22, 2),
        mirrors=[("ezekiel", 47, 12)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The tree by the river — Ezekiel's leaves of medicine on Revelation's last page",
        anchor_refs=["Ezekiel 47:12", "Revelation 22:2"],
        body=[
            Q("revelation", 22, 2),
            Q("ezekiel", 47, 12),
            P("The last page of the canon is Ezekiel's vision grown to full height: the river issuing from the sanctuary, trees on this side and on that side, new fruit every month because the waters come from the holy place, fruit for meat and the leaf for medicine. Revelation adds only the count — twelve manner of fruits — and names what the medicine is for: the healing of the nations."),
            P("This is the kingdom's final arrangement, the one the prophets held steady: the gathered family planted at the river of Elohim (God), bearing fruit in its months, and the nations left upon the earth receiving healing from the leaves — ministered to, month by month, from the city of the King."),
        ],
    ),
]

# ===== SWEEP: THE EPISTLES (ROMANS - JUDE) =====
CARDS += [

    dict(
        mark=("romans", 2, 29),
        mirrors=[("deuteronomy", 30, 6), ("deuteronomy", 30, 3)],
        strand="teaching",
        strand_label="The teaching",
        card_title="Circumcision of the heart — Moses promised it to the gathered",
        anchor_refs=["Deuteronomy 30:3-6", "Romans 2:28-29", "Colossians 2:11"],
        body=[
            Q("romans", 2, 28, 29),
            Q("colossians", 2, 11),
            Q("deuteronomy", 30, 3),
            Q("deuteronomy", 30, 6),
            P("The inherited reading hears Romans 2:29 as Paul trading an outward Torah for an inward religion. But circumcision of the heart is the Torah's own promise, and Moses attaches it to the gathering: scattered among all nations, then gathered from wherever they were driven, and then the heart circumcised to love Yahuah (God). Paul is not writing against the Torah. He is writing from it — naming the very work Moses said would be done in the returned."),
        ],
    ),
    dict(
        mark=("romans", 8, 4),
        mirrors=[("ezekiel", 36, 27), ("ezekiel", 36, 26), ("ezekiel", 36, 24)],
        strand="grace",
        strand_label="Grace",
        card_title="The Spirit causes the walking — Ezekiel's sentence inside Paul's",
        anchor_refs=["Ezekiel 36:24-27", "Romans 8:3-4"],
        body=[
            Q("romans", 8, 3, 4),
            Q("ezekiel", 36, 24),
            Q("ezekiel", 36, 26, 27),
            P("The righteousness of the Torah fulfilled in those who walk after the Spirit is Ezekiel's sentence spoken again: I will put my Spirit within you, and cause you to walk in my statutes. And Ezekiel's promise sits inside a gathering oracle — the new heart and the Spirit are given to the ones Yahuah (God) takes from among the heathen and gathers out of all countries. The Spirit does not lead away from the statutes. The Spirit is how the statutes finally get walked."),
        ],
    ),
    dict(
        mark=("romans", 9, 25),
        mirrors=[("hosea", 1, 10), ("hosea", 1, 9)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Not my people, my people — Paul names his source: Hosea",
        anchor_refs=["Hosea 1:9-10", "Romans 9:25-26"],
        body=[
            Q("romans", 9, 25, 26),
            Q("hosea", 1, 9, 10),
            P("Paul says it himself: as he saith also in Osee. Lo-Ammi — not my people — was a name laid on the northern house of Yashar'el (Israel) when Yahuah (God) sent her away, and the reversal was promised to that same house, in the same place where the name was spoken. The inherited reading hands these verses to the nations at large, as though a new people were being created by them. What it misses is that Paul quotes a prophet who named his addressee. The word does not conjure a people from nowhere; it calls a divorced people by their old name again."),
        ],
    ),
    dict(
        mark=("romans", 11, 26),
        mirrors=[("isaiah", 59, 20), ("isaiah", 59, 21)],
        strand="gathering",
        strand_label="The gathering",
        card_title="All Yashar'el (Israel) shall be saved — as it is written where?",
        anchor_refs=["Isaiah 59:20-21", "Romans 11:26-27"],
        body=[
            Q("romans", 11, 26, 27),
            Q("isaiah", 59, 20, 21),
            P("Paul's as it is written is Isaiah 59. The Redeemer comes to Zion, and unto them that turn from transgression in Jacob — the saving of all Yashar'el (Israel) is a turning home, and the covenant Isaiah names puts the Spirit of Yahuah (God) and his words in the mouth of the seed, and the seed's seed, from henceforth and for ever. A people named Jacob, turning from transgression, carrying the words through their generations — that is the sentence Paul is standing on."),
        ],
    ),
    dict(
        mark=("romans", 15, 10),
        mirrors=[("deuteronomy", 32, 43), ("isaiah", 11, 10), ("isaiah", 11, 11)],
        strand="good_news",
        strand_label="The good news",
        card_title="Rejoice, ye nations, with his people — the Song of Moses in Paul's mouth",
        anchor_refs=["Deuteronomy 32:43", "Isaiah 11:10-11", "Romans 15:9-12"],
        body=[
            Q("romans", 15, 9, 12),
            Q("deuteronomy", 32, 43),
            Q("isaiah", 11, 10, 11),
            P("Paul stacks the Tanakh's own sentences. Rejoice, ye Gentiles, with his people is the Song of Moses — and the song keeps the nations and his people distinct even inside the shared rejoicing. And the root of Jesse Paul quotes stands one breath before Isaiah's next line: Yahuah (God) sets his hand again the second time to recover the remnant of his people. The hope Paul announces to readers living among the nations is the hope the prophets fastened to that ensign — the remnant recovered, the second time."),
        ],
    ),
    dict(
        mark=("1-corinthians", 15, 20),
        mirrors=[("leviticus", 23, 10), ("leviticus", 23, 11)],
        strand="teaching",
        strand_label="The teaching",
        card_title="Firstfruits — the wave sheaf, accepted for the harvest still standing",
        anchor_refs=["Leviticus 23:10-11", "1 Corinthians 15:20-23"],
        body=[
            Q("1-corinthians", 15, 20),
            Q("1-corinthians", 15, 23),
            Q("leviticus", 23, 10, 11),
            P("Firstfruits is not a figure Paul coined; it is an appointed feast. The first sheaf of the harvest is waved before Yahuah (God), to be accepted for you — accepted on behalf of the whole harvest still standing in the field. Messiah (Christ) risen as the firstfruits is the sheaf lifted; they that are Messiah's (Christ's) at his coming are the harvest the sheaf was accepted for. The resurrection keeps the order of the Father's calendar — every man in his own order, every step appointed in Leviticus."),
        ],
    ),
    dict(
        mark=("2-corinthians", 6, 17),
        mirrors=[("leviticus", 26, 12), ("leviticus", 26, 11), ("isaiah", 52, 11), ("isaiah", 52, 12)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Come out from among them — Sinai's dwelling promise, Babylon's departure call",
        anchor_refs=["Leviticus 26:11-12", "Isaiah 52:11-12", "2 Corinthians 6:16-18"],
        body=[
            Q("2-corinthians", 6, 16, 18),
            Q("leviticus", 26, 11, 12),
            Q("isaiah", 52, 11, 12),
            P("Paul writes as Elohim (God) hath said — and what Elohim (God) said is Leviticus 26, the tabernacle-among-you promise spoken to Yashar'el (Israel) at Sinai. The come out from among them is Isaiah 52, the departure call to the captives, with Yahuah (God) himself going before the ones who leave. Paul lays the captivity's exit and the covenant's dwelling side by side and addresses both to his readers — the scattered being called out of the lands that held them, back to the promise that was theirs from the mountain: I will be their Elohim (God), and they shall be my people."),
        ],
    ),
    dict(
        mark=("galatians", 3, 8),
        mirrors=[("genesis", 22, 18), ("genesis", 28, 14)],
        strand="good_news",
        strand_label="The good news",
        card_title="The gospel preached unto Abraham — Paul says the good news is a Genesis sentence",
        anchor_refs=["Genesis 22:18", "Genesis 28:14", "Galatians 3:8"],
        body=[
            Q("galatians", 3, 8),
            Q("genesis", 22, 18),
            Q("genesis", 28, 14),
            P("Paul names the gospel's first preaching, and it is not in his letters — it is in Genesis. In thy seed shall all the nations of the earth be blessed, spoken to a man whose seed would be as the dust of the earth and spread abroad to the west, the east, the north, and the south. The seed sown abroad through all families of the earth is the seed the good news goes out to find. There is nothing new in the New Testament; Paul says so himself — the gospel was preached before, from the beginning."),
        ],
    ),
    dict(
        mark=("ephesians", 2, 8),
        mirrors=[("exodus", 34, 6), ("exodus", 34, 7)],
        strand="grace",
        strand_label="Grace",
        card_title="By grace through faith — the name Yahuah (God) proclaimed of himself at Sinai",
        anchor_refs=["Exodus 34:6-7", "Ephesians 2:4-10"],
        body=[
            Q("ephesians", 2, 4, 5),
            Q("ephesians", 2, 8, 10),
            Q("exodus", 34, 6, 7),
            P("Grace did not enter the canon at Ephesians. Merciful and gracious is the name Yahuah (God) proclaimed of his own glory at Sinai — and he proclaimed it while renewing the covenant his people had just broken, with the second tablets in Moses' hand. Grace is the means by which the broken are brought back to him and to his ways. That is why Paul's sentence does not stop at the gift but runs on to its purpose: created unto good works, which Elohim (God) hath before ordained that we should walk in them. The inherited reading puts a period after the gift; Paul wrote a walk after it."),
        ],
    ),
    dict(
        mark=("ephesians", 2, 13),
        mirrors=[("isaiah", 57, 19), ("daniel", 9, 7)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Far off, made nigh — the dispersion's own address",
        anchor_refs=["Daniel 9:7", "Isaiah 57:19", "Ephesians 2:12-13", "Ephesians 2:17"],
        body=[
            Q("ephesians", 2, 12, 13),
            Q("ephesians", 2, 17),
            Q("daniel", 9, 7),
            Q("isaiah", 57, 19),
            P("Far off is not a poetic distance; it is the dispersion's technical address in the prophets. Daniel confesses it for all Yashar'el (Israel) — near, and far off, through all the countries whither thou hast driven them. Isaiah promises peace to both halves of that driven people, the far off and the near. The strangers of Ephesians 2 are strangers from the covenants of promise, aliens from the commonwealth of Yashar'el (Israel) — and what they were alienated from is exactly what the blood brings them nigh to. The return is to the commonwealth, not to a substitute for it."),
        ],
    ),
    dict(
        mark=("1-thessalonians", 4, 16),
        mirrors=[("isaiah", 27, 13), ("isaiah", 11, 12)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The trump of Elohim (God) — in the prophets, the trumpet gathers",
        anchor_refs=["Isaiah 27:13", "Isaiah 11:12", "1 Thessalonians 4:16-17", "2 Thessalonians 2:1"],
        body=[
            Q("1-thessalonians", 4, 16, 17),
            Q("2-thessalonians", 2, 1),
            Q("isaiah", 27, 13),
            Q("isaiah", 11, 12),
            P("Paul names the event himself in the next letter: our gathering together unto him. And in the prophets the great trumpet has one work — it gathers. At its blast the ones ready to perish in Assyria and the outcasts in Egypt come home to worship; the ensign assembles the outcasts of Yashar'el (Israel) and the dispersed of Yahudah (Judah) from the four corners of the earth. The catching up is not an escape from the story. It is the story — the gathering the prophets promised, signaled the way they said it would be signaled."),
        ],
    ),
    dict(
        mark=("titus", 2, 14),
        mirrors=[("psalms", 130, 8), ("psalms", 130, 7), ("deuteronomy", 14, 2)],
        strand="good_news",
        strand_label="The good news",
        card_title="Redeem us from all iniquity — Psalm 130, word for word",
        anchor_refs=["Psalm 130:7-8", "Deuteronomy 14:2", "Titus 2:14"],
        body=[
            Q("titus", 2, 14),
            Q("psalms", 130, 7, 8),
            Q("deuteronomy", 14, 2),
            P("Titus 2:14 is two Tanakh sentences welded together. He shall redeem Yashar'el (Israel) from all his iniquities is the psalm; a peculiar people is Deuteronomy's covenant name for the people Yahuah (God) chose unto himself. The inherited reading hears a generic church in this verse. The words themselves carry the redemption of Yashar'el (Israel) and the covenant people restored to their own name."),
        ],
    ),
    dict(
        mark=("hebrews", 4, 9),
        mirrors=[("genesis", 2, 2), ("genesis", 2, 3)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="There remaineth a rest — the letter anchors it to the seventh day",
        anchor_refs=["Genesis 2:2-3", "Hebrews 4:4", "Hebrews 4:9-10"],
        body=[
            Q("hebrews", 4, 4),
            Q("hebrews", 4, 9, 10),
            Q("genesis", 2, 2, 3),
            P("The letter makes its own argument plainly: the rest that remains to the people of Elohim (God) is grounded in the seventh day of creation — the day Elohim (God) blessed and sanctified. The word at Hebrews 4:9 is sabbatismos, a keeping of Sabbath. The inherited reading spiritualizes the rest into a distant heaven and walks past the day itself; the letter quotes Genesis 2 and says it remaineth. What was blessed at the foundation of the world was never unblessed."),
        ],
    ),
    dict(
        mark=("hebrews", 8, 8),
        mirrors=[("jeremiah", 31, 8), ("jeremiah", 31, 9)],
        strand="grace",
        strand_label="Grace",
        card_title="The new covenant names its parties — the house of Yashar'el (Israel) and the house of Yahudah (Judah)",
        anchor_refs=["Hebrews 8:8-12", "Jeremiah 31:8-9"],
        body=[
            Q("hebrews", 8, 8, 12),
            Q("jeremiah", 31, 8, 9),
            P("This is the longest Tanakh quotation in the New Testament, and the inherited reading reads past its first line. The covenant is cut with the house of Yashar'el (Israel) and with the house of Yahudah (Judah) — the two houses the prophets watched scattered. The same chapter of Jeremiah says who is coming home to that covenant: a great company gathered from the coasts of the earth, led weeping by the rivers of waters, for I am a father to Yashar'el (Israel), and Ephraim is my firstborn. The mercy clause — I will be merciful to their unrighteousness — is the grace of this covenant: the laws of Yahuah (God) put into the mind and written on the heart of a gathered people. Not a new people; a new heart for the named ones."),
        ],
    ),
    dict(
        mark=("hebrews", 13, 20),
        mirrors=[("zechariah", 9, 11), ("isaiah", 63, 11)],
        strand="good_news",
        strand_label="The good news",
        card_title="The blood of the covenant brings the shepherd up — and the prisoners out",
        anchor_refs=["Zechariah 9:11", "Isaiah 63:11", "Hebrews 13:20"],
        body=[
            Q("hebrews", 13, 20),
            Q("isaiah", 63, 11),
            Q("zechariah", 9, 11),
            P("Both halves of this blessing are the prophets' sentences. Isaiah remembers the first bringing-up — out of the sea, with the shepherd of his flock. Zechariah names what covenant blood does: it sends the prisoners out of the pit wherein is no water. Hebrews blesses the Elohim (God) of peace who brought the great shepherd of the sheep up from the dead through the blood of the everlasting covenant — the exodus pattern repeating. The shepherd is brought up so the flock can be brought out."),
        ],
    ),
    dict(
        mark=("james", 1, 1),
        mirrors=[("deuteronomy", 28, 64), ("hosea", 8, 8)],
        strand="gathering",
        strand_label="The gathering",
        card_title="To the twelve tribes which are scattered abroad — the letter's address label",
        anchor_refs=["Deuteronomy 28:64", "Hosea 8:8", "James 1:1"],
        body=[
            Q("james", 1, 1),
            Q("deuteronomy", 28, 64),
            Q("hosea", 8, 8),
            P("The first line of the letter is the gathering's address label, and the inherited reading reads past it. James writes to the twelve tribes which are scattered abroad — not to a church, not to the nations at large, but to the people Moses said would be scattered among all people from the one end of the earth even unto the other, the house Hosea watched swallowed up among the Gentiles. The letter knows exactly where its readers are, and why they are there."),
        ],
    ),
    dict(
        mark=("james", 2, 5),
        mirrors=[("daniel", 7, 27), ("deuteronomy", 7, 9)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Heirs of the kingdom which he hath promised — promised where, and to whom?",
        anchor_refs=["Daniel 7:27", "Deuteronomy 7:9", "James 2:5"],
        body=[
            Q("james", 2, 5),
            Q("daniel", 7, 27),
            Q("deuteronomy", 7, 9),
            P("James says the kingdom was promised — which sends the reader back to the promise. Daniel saw it given: the kingdom and dominion under the whole heaven, to the people of the saints of El Elyon (most High). And them that love him is the Torah's own covenant formula — them that love him and keep his commandments. The kingdom of James 2:5 is not a new offer to a new audience. It is the promise Daniel recorded, inherited by the people James addressed in his first line: the twelve tribes scattered abroad."),
        ],
    ),
    dict(
        mark=("1-peter", 1, 1),
        mirrors=[("jeremiah", 31, 10)],
        strand="gathering",
        strand_label="The gathering",
        card_title="To the strangers scattered — and what Jeremiah told the nations about them",
        anchor_refs=["Jeremiah 31:10", "1 Peter 1:1-2"],
        body=[
            Q("1-peter", 1, 1, 2),
            Q("jeremiah", 31, 10),
            P("Peter's address is the dispersion — the strangers scattered through Pontus, Galatia, Cappadocia, Asia, and Bithynia. Jeremiah had already told the nations and the isles afar off what to expect concerning these scattered ones: He that scattered Yashar'el (Israel) will gather him, and keep him, as a shepherd doth his flock. And Peter's next words hold the order steady — elect according to the foreknowledge of Elohim (God) the Father. The scattered were known before they were called. The call reveals what was already true; it does not create it."),
        ],
    ),
    dict(
        mark=("1-peter", 1, 18),
        mirrors=[("jeremiah", 16, 19), ("isaiah", 52, 3)],
        strand="teaching",
        strand_label="The teaching",
        card_title="Redeemed from the tradition of your fathers — Jeremiah heard the confession coming",
        anchor_refs=["Jeremiah 16:19", "Isaiah 52:3", "1 Peter 1:18-19"],
        body=[
            Q("1-peter", 1, 18, 19),
            Q("jeremiah", 16, 19),
            Q("isaiah", 52, 3),
            P("Peter names what his readers are redeemed from: the vain way of life received by tradition from your fathers. Jeremiah heard that very confession in advance, from those coming to Yahuah (God) out of the ends of the earth: Surely our fathers have inherited lies. And the redemption's terms are Isaiah's — sold for nought, redeemed without money — not a price paid into the system that held them, but the precious blood of a lamb without blemish. The inherited thing is what gets left. The covenant is what gets returned to."),
        ],
    ),
    dict(
        mark=("1-peter", 2, 9),
        mirrors=[("exodus", 19, 5), ("exodus", 19, 6)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="A royal priesthood, an holy nation — Sinai's own words to the scattered",
        anchor_refs=["Exodus 19:5-6", "1 Peter 2:9", "1 Peter 1:1"],
        body=[
            Q("1-peter", 2, 9),
            Q("exodus", 19, 5, 6),
            P("Peter's titles are Exodus 19 nearly word for word — peculiar treasure, kingdom of priests, holy nation — the words Yahuah (God) spoke to the children of Yashar'el (Israel) at the mountain. Peter re-speaks them to the strangers scattered of his first line. The inherited reading hears a church inheriting another people's titles; the letter shows Sinai's own commission returning to Sinai's own people, in the lands where they were scattered. And the source carries its condition uncut: if ye will obey my voice indeed, and keep my covenant."),
        ],
    ),
    dict(
        mark=("1-peter", 2, 10),
        mirrors=[("hosea", 2, 23), ("hosea", 1, 6)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Not a people, no mercy — both of Hosea's children, reversed in one sentence",
        anchor_refs=["Hosea 1:6", "Hosea 2:23", "1 Peter 2:10"],
        body=[
            Q("1-peter", 2, 10),
            Q("hosea", 1, 6),
            Q("hosea", 2, 23),
            P("Peter's one sentence reverses both of Hosea's named children. Lo-Ruhamah — not having obtained mercy — and Lo-Ammi — not my people — were names laid on the house of Yashar'el (Israel) in her divorce. And Hosea's reversal names its own mechanism: I will sow her unto me in the earth. The scattering was a sowing. Peter writes to the strangers scattered and tells them the names have been turned — mercy obtained, a people again. These verses were never about a people from nowhere. They are about this people, sown into the earth, and now claimed."),
        ],
    ),
    dict(
        mark=("2-peter", 3, 8),
        mirrors=[("psalms", 90, 4), ("hosea", 6, 2)],
        strand="teaching",
        strand_label="The teaching",
        card_title="A day as a thousand years — Moses' psalm, Hosea's two days",
        anchor_refs=["Psalm 90:4", "Hosea 6:2", "2 Peter 3:8"],
        body=[
            Q("2-peter", 3, 8),
            Q("psalms", 90, 4),
            Q("hosea", 6, 2),
            P("Peter is not coining a measure; he is repeating one. The thousand years as a day is the prayer of Moses in Psalm 90. And Hosea gives the torn house its timetable in the same register: after two days will he revive us: in the third day he will raise us up, and we shall live in his sight. Peter writes the measure to answer the scoffers who call the promise slow. The promise keeps the Father's clock — declared from the beginning — and the reviving of the torn house is on it."),
        ],
    ),
]


# ===== EXHAUSTIVE WAVE 2: REDEMPTION =====
CARDS += [


    # ------------------------------------------------------------------
    # 1. The Benedictus opens with the addressee
    dict(
        mark=("luke", 1, 68),
        mirrors=[("psalms", 111, 9)],
        strand="good_news",
        strand_label="The good news",
        card_title="Redemption Has an Addressee",
        anchor_refs=["Psalm 111:9", "Luke 1:68"],
        body=[
            Q("luke", 1, 68),
            Q("psalms", 111, 9),
            P("Zachariah's song is the first redemption sentence of the new testament, and it arrives with its addressee already named: Yahuah (God) has visited and redeemed his people — the Elohim (God) of Yashar'el (Israel) acting for Yashar'el (Israel). The psalm he is singing from says the same thing in the same breath: redemption is sent unto his people, and the covenant is commanded for ever — one verse, one act. The inherited reading widens the addressee until it disappears; the song never does."),
        ],
    ),

    # ------------------------------------------------------------------
    # 2. Anna of Asher — a daughter of the scattered north
    dict(
        mark=("luke", 2, 38),
        mirrors=[("isaiah", 52, 9)],
        strand="good_news",
        strand_label="The good news",
        card_title="A Daughter of Asher, Looking for Redemption",
        anchor_refs=["Isaiah 52:9", "Luke 2:38"],
        body=[
            Q("luke", 2, 36),
            Q("luke", 2, 38),
            Q("isaiah", 52, 9),
            P("Luke names Anna's tribe on purpose: Asher, a tribe of the scattered northern house. A daughter of the house that was carried away stands in the temple and speaks of the child to all them that looked for redemption in Jerusalem — the redemption Isaiah promised when he told the waste places of Jerusalem to sing, for Yahuah (God) hath redeemed Jerusalem. The ones waiting knew exactly what they were waiting for, and Luke records it without correction."),
        ],
    ),

    # ------------------------------------------------------------------
    # 3. Emmaus — the disciples' redemption was Israel's
    dict(
        mark=("luke", 24, 21),
        mirrors=[("isaiah", 63, 4)],
        strand="good_news",
        strand_label="The good news",
        card_title="He Never Corrects the What",
        anchor_refs=["Isaiah 63:4", "Luke 24:21"],
        body=[
            Q("luke", 24, 21),
            Q("isaiah", 63, 4),
            Q("luke", 24, 26),
            P("On the road to Emmaus the disciples name what they had hoped for: that he should have redeemed Yashar'el (Israel). Yahusha (Jesus) calls them slow of heart — but about the suffering and the timing, never the object. He never corrects the what; the redemption of Yashar'el (Israel) is exactly what the prophets carried — the day of vengeance and the year of the redeemed held in one heart. The inherited reading quietly trades the disciples' hope for a different one; the risen King simply opened the scriptures that held it."),
        ],
    ),

    # ------------------------------------------------------------------
    # 4. Redemption draws nigh = the return road
    dict(
        mark=("luke", 21, 28),
        mirrors=[("isaiah", 51, 11)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Redemption Is the Return Road",
        anchor_refs=["Isaiah 51:11", "Luke 21:28"],
        body=[
            Q("luke", 21, 28),
            Q("isaiah", 51, 11),
            P("When Yahusha (Jesus) tells his hearers to lift up their heads because redemption draws near, the word is already loaded with Isaiah's freight: the redeemed of Yahuah (God) return. Redemption in the prophets is not an abstraction credited to an account; it is a road walked home — to Zion, with singing, sorrow and mourning fleeing away. What draws nigh at the end of the age is the gathering of the scattered house."),
        ],
    ),

    # ------------------------------------------------------------------
    # 5. The strong man bound = Jacob ransomed from the stronger
    dict(
        mark=("matthew", 12, 29),
        mirrors=[("jeremiah", 31, 11)],
        strand="good_news",
        strand_label="The good news",
        card_title="Stronger Than He",
        anchor_refs=["Jeremiah 31:11", "Matthew 12:29"],
        body=[
            Q("matthew", 12, 29),
            Q("jeremiah", 31, 11),
            Q("jeremiah", 31, 10),
            P("Jeremiah says Jacob was ransomed from the hand of him that was stronger than he — a captor too strong for the captive to escape. Yahusha (Jesus) describes his own work in the same picture: bind the strong man first, then spoil his house. The goods carried out of that house are the captive people, and the verse before Jeremiah's ransom line says who and where: he that scattered Yashar'el (Israel) will gather him, as a shepherd doth his flock. The binding of the strong man is the ransom of Jacob in motion."),
        ],
    ),

    # ------------------------------------------------------------------
    # 6. Paul preaches the exodus redemption as the type
    dict(
        mark=("acts", 13, 17),
        mirrors=[("exodus", 6, 6), ("exodus", 15, 13)],
        strand="good_news",
        strand_label="The good news",
        card_title="With a Stretched Out Arm",
        anchor_refs=["Exodus 6:6", "Exodus 15:13", "Acts 13:17"],
        body=[
            Q("acts", 13, 17),
            Q("exodus", 6, 6),
            Q("exodus", 6, 7),
            Q("exodus", 15, 13),
            P("When Paul stands up in the synagogue at Antioch to preach the good news, he begins where redemption begins: the Elohim (God) of this people of Yashar'el (Israel), and the high arm that brought them out. The exodus is the type of all redemption — I will redeem you with a stretched out arm; I will take you to me for a people — and the redeemed are then led, guided in strength, to the holy habitation. Brought out, taken as a people, led home: that is the shape every later redemption sentence carries."),
        ],
    ),

    # ------------------------------------------------------------------
    # 7. Redeemed OUT of every nation because scattered INTO every nation
    dict(
        mark=("revelation", 5, 9),
        mirrors=[("psalms", 107, 2)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Redeemed Out of Every Nation",
        anchor_refs=["Psalm 107:2", "Revelation 5:9"],
        body=[
            Q("revelation", 5, 9),
            Q("psalms", 107, 2),
            Q("psalms", 107, 3),
            Q("deuteronomy", 28, 64),
            Q("revelation", 5, 10),
            P("The inherited reading hears the song of the Lamb as a body assembled from all humanity. The psalm it echoes has an older address: the redeemed of Yahuah (God), redeemed from the hand of the enemy, gathered out of the lands from all four directions. Why must the redeemed come out of every kindred, tongue, people, and nation? Because that is precisely where the covenant people was scattered — from the one end of the earth even unto the other. The redemption out of all nations answers the scattering into all nations, and the redeemed are made kings and priests to reign on the earth — the calling Yashar'el (Israel) carried from Sinai."),
        ],
    ),

    # ------------------------------------------------------------------
    # 8. The redeemed are a named, numbered, tribal company
    dict(
        mark=("revelation", 14, 3),
        mirrors=[("isaiah", 62, 12)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The Redeemed of Yahuah (God), Numbered by Tribe",
        anchor_refs=["Isaiah 62:12", "Revelation 14:3"],
        body=[
            Q("revelation", 14, 3),
            Q("revelation", 7, 4),
            Q("isaiah", 62, 12),
            P("The company that learns the new song is not anonymous: they are redeemed from the earth, and Revelation has already counted them — sealed out of all the tribes of the children of Yashar'el (Israel). Isaiah said the redeemed would be called by name: The holy people, The redeemed of Yahuah (God). Redemption in scripture produces a named, tribal, covenant company — Sought out, A city not forsaken."),
        ],
    ),

    # ------------------------------------------------------------------
    # 9. Galatians 3:13 — the curse-sentence, never the Torah
    dict(
        mark=("galatians", 3, 13),
        mirrors=[("deuteronomy", 21, 23), ("deuteronomy", 28, 15)],
        strand="grace",
        strand_label="The grace",
        card_title="The Curse of the Law Is Not the Law",
        anchor_refs=["Deuteronomy 21:23", "Deuteronomy 28:15", "Galatians 3:13"],
        body=[
            Q("galatians", 3, 13),
            Q("deuteronomy", 21, 23),
            Q("deuteronomy", 28, 15),
            P("The curse of the law is the curse the law pronounces, not the law itself. Deuteronomy 28 lists what falls on covenant-breaking — the curses that end in scattering among the nations — and Deuteronomy 21 names the curse resting on a man hanged on a tree. Messiah (Christ) took the hanged man's curse to open a door home through the exile-curse for the scattered seed who had walked into it."),
            P("Read it the other way — as redemption from the Torah — and the sentence collapses: the same Torah that pronounces the curse pronounces the blessing, and a redemption from the Father's instruction would be a redemption from the inheritance itself. He redeemed his people from the sentence, to return them to the way."),
        ],
    ),

    # ------------------------------------------------------------------
    # 10. Galatians 4:5 — redeemed unto the firstborn's sonship
    dict(
        mark=("galatians", 4, 5),
        mirrors=[("exodus", 4, 22)],
        strand="grace",
        strand_label="The grace",
        card_title="The Adoption Is the Firstborn Coming Home",
        anchor_refs=["Exodus 4:22", "Galatians 4:4-5"],
        body=[
            Q("galatians", 4, 4),
            Q("galatians", 4, 5),
            Q("exodus", 4, 22),
            Q("hosea", 1, 10),
            P("To redeem them that were under the law is to redeem them that were under the law's exile-sentence — the scattered house living out the curse of Deuteronomy 28 among the nations. And the goal of the redemption is named: the adoption of sons. Sonship is not a new standing invented for strangers; it is the oldest title Yashar'el (Israel) carries — my son, even my firstborn. Hosea promised that in the very place they were called Not-my-people, they would be called sons of the living Elohim (God). The adoption is the firstborn coming home to a standing he lost."),
        ],
    ),

    # ------------------------------------------------------------------
    # 11. Forgiveness and return are one motion
    dict(
        mark=("ephesians", 1, 7),
        mirrors=[("isaiah", 44, 22)],
        strand="grace",
        strand_label="The grace",
        card_title="Blotted Out as a Thick Cloud",
        anchor_refs=["Isaiah 44:22", "Ephesians 1:7"],
        body=[
            Q("ephesians", 1, 7),
            Q("isaiah", 44, 22),
            P("Redemption through his blood is defined in the same breath as the forgiveness of sins — and Isaiah had already joined those two and added the third piece the inherited reading drops: return unto me. The blotting out of transgressions is what clears the road home; redemption and return are one motion. The voice in Isaiah 44 is speaking to Jacob — to the people whose transgressions drove the scattering — and the forgiveness is the means of their gathering."),
        ],
    ),

    # ------------------------------------------------------------------
    # 12. The purchased possession = the segullah awaiting its claiming day
    dict(
        mark=("ephesians", 1, 14),
        mirrors=[("malachi", 3, 17)],
        strand="grace",
        strand_label="The grace",
        card_title="The Purchased Possession",
        anchor_refs=["Malachi 3:17", "Ephesians 1:14"],
        body=[
            Q("ephesians", 1, 14),
            Q("malachi", 3, 17),
            P("The Spirit is the earnest — the pledge in hand — until the redemption of the purchased possession. The phrase is not abstract; the purchased people were named at Sinai:"),
            Q("exodus", 19, 5),
            P("Malachi names the day the purchase is claimed: they shall be mine, in that day when I make up my jewels — spared as a man spareth his own son that serveth him. The sealed are held in earnest until the owning day."),
        ],
    ),

    # ------------------------------------------------------------------
    # 13. Hebrews 9:15 — the covenant parties of the redemption
    dict(
        mark=("hebrews", 9, 15),
        mirrors=[("jeremiah", 31, 32)],
        strand="grace",
        strand_label="The grace",
        card_title="The Transgressions Under the First Covenant",
        anchor_refs=["Jeremiah 31:32", "Hebrews 9:15"],
        body=[
            Q("hebrews", 9, 15),
            Q("hebrews", 9, 12),
            Q("jeremiah", 31, 31),
            Q("jeremiah", 31, 32),
            P("Hebrews defines the new covenant's redemption with a precision the inherited reading reads past: it is for the transgressions that were under the first covenant. Who transgressed under the first covenant? The parties who stood in it — the houses who broke it, though he was an husband unto them. Jeremiah names the same parties for the new covenant: the house of Yashar'el (Israel) and the house of Yahudah (Judah). The eternal redemption is addressed to the covenant-breakers of Sinai, that they which are called might receive the promise of eternal inheritance."),
        ],
    ),

    # ------------------------------------------------------------------
    # 14. The ransom for many = Isaiah's "my people"
    dict(
        mark=("matthew", 20, 28),
        mirrors=[("isaiah", 53, 8)],
        strand="good_news",
        strand_label="The good news",
        card_title="A Ransom for Many — Isaiah's Many",
        anchor_refs=["Isaiah 53:8", "Matthew 20:28"],
        body=[
            Q("matthew", 20, 28),
            Q("isaiah", 53, 8),
            Q("isaiah", 53, 6),
            P("When the Son of Adam gives his life a ransom for many, the many is Isaiah's many: for the transgression of my people was he stricken. The prophet speaks from inside the flock — all we like sheep have gone astray — and the stricken one carries the iniquity of the us who strayed. The ransom saying is Isaiah 53 spoken in the first person, and its beneficiaries are the straying sheep of the covenant people the prophet was numbered among."),
        ],
    ),

    # ------------------------------------------------------------------
    # 15. The congregation purchased of old
    dict(
        mark=("acts", 20, 28),
        mirrors=[("psalms", 74, 2)],
        strand="good_news",
        strand_label="The good news",
        card_title="Purchased of Old",
        anchor_refs=["Psalm 74:2", "Acts 20:28"],
        body=[
            Q("acts", 20, 28),
            Q("psalms", 74, 2),
            P("The English word church hides what Paul said at Miletus: the assembly, the congregation of Elohim (God) — the same congregation the psalms had been praying over by that name for centuries. Remember thy congregation, which thou hast purchased of old, Asaph prays — purchased, redeemed, the rod of thine inheritance. The congregation purchased with his own blood is not a new body founded at Pentecost; it is the congregation purchased of old, bought back at the price the Redeemer himself set."),
        ],
    ),

    # ------------------------------------------------------------------
    # 16. OT-primary: both houses named in the redemption
    dict(
        mark=("psalms", 77, 15),
        mirrors=[("zechariah", 10, 6)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The Sons of Jacob and Joseph",
        anchor_refs=["Psalm 77:15", "Zechariah 10:6", "John 10:16"],
        body=[
            Q("psalms", 77, 15),
            Q("zechariah", 10, 6),
            Q("john", 10, 16),
            P("Asaph names redemption's addressee with both houses spelled out: thy people, the sons of Jacob and Joseph — the whole family, the south and the scattered north together. Zechariah carries the same double address forward: the house of Yahudah (Judah) strengthened, the house of Joseph saved, as though I had not cast them off. And the Shepherd's other sheep, not of this fold, are that same house of Joseph — one flock under one shepherd is two houses redeemed together."),
        ],
    ),

    # ------------------------------------------------------------------
    # 17. The whistle goes out to sheep already redeemed
    dict(
        mark=("john", 10, 27),
        mirrors=[("zechariah", 10, 8)],
        strand="gathering",
        strand_label="The gathering",
        card_title="He Whistles for the Redeemed",
        anchor_refs=["Zechariah 10:8", "John 10:27"],
        body=[
            Q("john", 10, 27),
            Q("zechariah", 10, 8),
            P("Zechariah's order is the whole diagnostic: I will hiss for them, and gather them — for I have redeemed them. The redemption stands before the gathering; the shepherd's whistle goes out to sheep who are already his. That is why his sheep hear his voice: the hearing does not make them sheep, it reveals them. The call gathers what the redemption already claimed."),
        ],
    ),

    # ------------------------------------------------------------------
    # 18. The strong Redeemer pleads the cause of both houses
    dict(
        mark=("luke", 18, 7),
        mirrors=[("jeremiah", 50, 33), ("jeremiah", 50, 34)],
        strand="good_news",
        strand_label="The good news",
        card_title="Their Redeemer Is Strong",
        anchor_refs=["Jeremiah 50:33-34", "Luke 18:7"],
        body=[
            Q("jeremiah", 50, 33),
            Q("jeremiah", 50, 34),
            Q("luke", 18, 7),
            Q("luke", 18, 8),
            P("Jeremiah shows redemption as a courtroom: the children of Yashar'el (Israel) and the children of Yahudah (Judah) oppressed together, held fast by captors who refuse to let them go — and a Redeemer who is strong, who shall throughly plead their cause. Yahusha's (Jesus) parable of the widow argues the same case: shall not Elohim (God) avenge his own elect, which cry day and night unto him? The elect crying for vindication are the two oppressed houses, and the answer is Jeremiah's: their kinsman has taken the case, and he does not lose."),
        ],
    ),

    # ------------------------------------------------------------------
    # 19. From the hand of the enemy — sea, Babylon, Benedictus
    dict(
        mark=("luke", 1, 71),
        mirrors=[("micah", 4, 10), ("psalms", 106, 10)],
        strand="good_news",
        strand_label="The good news",
        card_title="From the Hand of the Enemy",
        anchor_refs=["Psalm 106:10", "Micah 4:10", "Luke 1:71"],
        body=[
            Q("luke", 1, 71),
            Q("psalms", 106, 10),
            Q("micah", 4, 10),
            P("Zachariah's song keeps quoting the redemption fabric: saved from our enemies, and from the hand of all that hate us. The psalmist used the same words for the sea: redeemed them from the hand of the enemy. Micah promised the same redemption for the exile: there shalt thou be delivered; there Yahuah (God) shall redeem thee from the hand of thine enemies — spoken into Babylon by name. Redemption from the enemy's hand is one story told at the sea, in Babylon, and in the Benedictus — the same people, the same Redeemer."),
        ],
    ),

    # ------------------------------------------------------------------
    # 20. The redemption of the body — Job's hope
    dict(
        mark=("romans", 8, 23),
        mirrors=[("job", 19, 25), ("job", 19, 26)],
        strand="good_news",
        strand_label="The good news",
        card_title="The Redemption of Our Body",
        anchor_refs=["Job 19:25-26", "Romans 8:23"],
        body=[
            Q("romans", 8, 23),
            Q("job", 19, 25),
            Q("job", 19, 26),
            Q("psalms", 49, 15),
            Q("hosea", 13, 14),
            P("Redemption does not stop at the heart; it reaches the dust. Job knew it long before Sinai: my redeemer liveth — and in my flesh shall I see Elohim (God). The psalmist said the soul would be redeemed from the power of the grave; Hosea heard Yahuah (God) promise to ransom his people from the grave itself. The groaning Paul names — waiting for the adoption, the redemption of our body — is the oldest hope in the book: the kinsman who buys back even what the grave holds."),
        ],
    ),

    # ------------------------------------------------------------------
    # 21. Husband and Redeemer in one breath
    dict(
        mark=("ephesians", 5, 25),
        mirrors=[("isaiah", 54, 5), ("isaiah", 54, 8)],
        strand="good_news",
        strand_label="The good news",
        card_title="Husband and Redeemer in One Breath",
        anchor_refs=["Isaiah 54:5", "Isaiah 54:8", "Ephesians 5:25"],
        body=[
            Q("ephesians", 5, 25),
            Q("isaiah", 54, 5),
            Q("isaiah", 54, 6),
            Q("isaiah", 54, 8),
            P("Isaiah holds the two offices in one verse: thy Maker is thine husband, and thy Redeemer the Holy One of Yashar'el (Israel). The one redeeming is the husband; the one being redeemed is the wife — the wife of youth, refused for a moment, called again with everlasting kindness. So when Paul says Messiah (Christ) loved the assembly and gave himself for it, the giving is a husband's redemption price for the covenant wife of the prophets — not the courting of a new bride, but the buying back of the forsaken one."),
        ],
    ),

    # ------------------------------------------------------------------
    # 22. The shepherd's shoulders = carried all the days of old
    dict(
        mark=("luke", 15, 5),
        mirrors=[("isaiah", 63, 9)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Carried All the Days of Old",
        anchor_refs=["Isaiah 63:9", "Luke 15:5"],
        body=[
            Q("luke", 15, 5),
            Q("luke", 15, 6),
            Q("isaiah", 63, 9),
            Q("jeremiah", 50, 6),
            P("The shepherd who lays the found sheep on his shoulders is doing what Isaiah says the Redeemer has always done: in his love and in his pity he redeemed them; and he bare them, and carried them all the days of old. And the lost sheep has a name in the prophets: my people hath been lost sheep, turned away by their own shepherds. The parable is not a new tenderness; it is the days of old resumed — the carrying arms of the ancient Redeemer under the scattered flock."),
        ],
    ),

    # ------------------------------------------------------------------
    # 23. The prayer of the redeemed children — kingdom strand
    dict(
        mark=("matthew", 6, 9),
        mirrors=[("isaiah", 63, 16)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Our Father, Our Redeemer",
        anchor_refs=["Isaiah 63:16", "Matthew 6:9-10"],
        body=[
            Q("matthew", 6, 9),
            Q("matthew", 6, 10),
            Q("isaiah", 63, 16),
            P("The prayer's opening words are Isaiah's redemption confession: thou, O Yahuah (God), art our father, our redeemer; thy name is from everlasting. Isaiah's our is the scattered children whom even Abraham would not recognize — unrecognizable after the exile, yet still his. When Yahusha (Jesus) teaches his disciples to pray Our Father, and then Thy kingdom come, the prayer is the redeemed family asking the Father-Redeemer for the kingdom that gathers them home."),
        ],
    ),

    # ------------------------------------------------------------------
    # 24. Called by name because already owned
    dict(
        mark=("john", 10, 3),
        mirrors=[("isaiah", 43, 1)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Called by Name Because Already His",
        anchor_refs=["Isaiah 43:1", "John 10:3"],
        body=[
            Q("john", 10, 3),
            Q("isaiah", 43, 1),
            P("Isaiah gives redemption's grammar: I have redeemed thee, I have called thee by thy name; thou art mine. The ownership stands first; the by-name call is its evidence. The shepherd at the sheepfold keeps the same order — he calleth his own sheep by name, and leadeth them out. His own, then named, then led out: the redemption precedes the calling, and the calling leads the redeemed out toward home."),
        ],
    ),

    # ------------------------------------------------------------------
    # 25. Heaven's joy is redemption-of-Jacob joy
    dict(
        mark=("luke", 15, 7),
        mirrors=[("isaiah", 44, 23)],
        strand="good_news",
        strand_label="The good news",
        card_title="Why the Heavens Sing",
        anchor_refs=["Isaiah 44:23", "Luke 15:7"],
        body=[
            Q("luke", 15, 7),
            Q("isaiah", 44, 23),
            P("Joy in heaven over one sinner that repenteth is not a new note. Isaiah heard the heavens commanded to sing for one reason: for Yahuah (God) hath redeemed Jacob. Heaven's song in scripture is redemption-of-Jacob song, and every returning one of the scattered seed is one more measure of it. The repenting one is not earning heaven's joy — he is the reason it was written."),
        ],
    ),

    # ------------------------------------------------------------------
    # 26. The Redeemer's other office: teaching the way — teaching strand
    dict(
        mark=("matthew", 11, 29),
        mirrors=[("isaiah", 48, 17)],
        strand="teaching",
        strand_label="The teaching",
        card_title="The Redeemer Is the Teacher",
        anchor_refs=["Isaiah 48:17", "Matthew 11:29"],
        body=[
            Q("matthew", 11, 29),
            Q("isaiah", 48, 17),
            Q("jeremiah", 6, 16),
            P("Isaiah names the Redeemer's other office: thy Redeemer, the Holy One of Yashar'el (Israel), which teacheth thee to profit, which leadeth thee by the way that thou shouldest go. Redemption and instruction are one office — the one who buys back also leads back into the way. So the invitation learn of me, and ye shall find rest unto your souls is the Redeemer-Teacher speaking, and the rest he promises is the rest Jeremiah attached to the old paths. The redeemed are not led out of the way; they are led back onto it."),
        ],
    ),

    # ------------------------------------------------------------------
    # 27. Redemption's motive: the sworn oath to the fathers
    dict(
        mark=("luke", 1, 72),
        mirrors=[("deuteronomy", 7, 8)],
        strand="good_news",
        strand_label="The good news",
        card_title="Redeemed Because of the Oath",
        anchor_refs=["Deuteronomy 7:8", "Luke 1:72"],
        body=[
            Q("luke", 1, 72),
            Q("deuteronomy", 7, 8),
            P("Why does Yahuah (God) redeem? Deuteronomy answers before the question is asked: because he loved you, and because he would keep the oath which he had sworn unto your fathers. Redemption flows from covenant memory — a sworn oath to named fathers, not a general benevolence toward humanity. Zachariah sings the same cause for the new redemption: to perform the mercy promised to our fathers, and to remember his holy covenant. The Redeemer acts because he swore."),
        ],
    ),

    # ------------------------------------------------------------------
    # 28. A people for his name — redeemed long ago, found in the nations
    dict(
        mark=("acts", 15, 14),
        mirrors=[("2-samuel", 7, 23)],
        strand="gathering",
        strand_label="The gathering",
        card_title="A People for His Name",
        anchor_refs=["2 Samuel 7:23", "Acts 15:14"],
        body=[
            Q("acts", 15, 14),
            Q("2-samuel", 7, 23),
            Q("acts", 15, 16),
            P("David prayed it as a question with one answer: what one nation is like thy people, even like Yashar'el (Israel), whom Elohim (God) went to redeem for a people to himself, and to make him a name? When James sums up the council at Jerusalem, he uses the same words — Elohim (God) is taking out of the nations a people for his name — and he proves it from the prophets with the fallen tabernacle of David rebuilt. The people being taken out of the nations is the people redeemed for his name long ago, found where the scattering left them."),
        ],
    ),

    # ------------------------------------------------------------------
    # 29. Scripture's first "redeemed" sits inside Ephraim's blessing
    dict(
        mark=("romans", 11, 25),
        mirrors=[("genesis", 48, 16), ("genesis", 48, 19)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The First Redeeming and the Fulness of the Nations",
        anchor_refs=["Genesis 48:16", "Genesis 48:19", "Romans 11:25"],
        body=[
            Q("genesis", 48, 16),
            Q("genesis", 48, 19),
            Q("romans", 11, 25),
            Q("romans", 11, 26),
            P("The first time scripture says redeemed, Jacob is speaking, and his hands are on Joseph's sons: bless the lads — let my name be named on them, and let them grow into a multitude in the midst of the earth. The blessing's destination is named a moment later: Ephraim's seed shall become a multitude of nations. Paul's mystery turns on that very phrase — blindness in part, until the fulness of the nations be come in: until Ephraim's promised multitude, grown wild among the peoples, comes home. And so all Yashar'el (Israel) shall be saved: the first redeeming word in the book and the final gathering are one blessing."),
        ],
    ),

    # ------------------------------------------------------------------
    # 30. The Way of holiness has walkers: the redeemed — teaching strand
    dict(
        mark=("acts", 24, 14),
        mirrors=[("isaiah", 35, 8), ("isaiah", 35, 9)],
        strand="teaching",
        strand_label="The teaching",
        card_title="The Way of Holiness Has Walkers",
        anchor_refs=["Isaiah 35:8-9", "Acts 24:14"],
        body=[
            Q("acts", 24, 14),
            Q("isaiah", 35, 8),
            Q("isaiah", 35, 9),
            Q("isaiah", 35, 10),
            P("Before believers were called anything else, they were called the Way — and Paul confesses the name without surrendering it: after the way which they call heresy, so worship I the Elohim (God) of my fathers, believing all things which are written in the law and in the prophets. Isaiah built that road: an highway called The way of holiness, and its walkers are named — the redeemed shall walk there, the ransomed of Yahuah (God) returning to Zion with songs. The Way was never a new religion; it is the return road of the redeemed, paved through the prophets, walked home in everything written."),
        ],
    ),
]

# ===== EXHAUSTIVE WAVE 2: THE TWO HOUSES MADE ONE =====
CARDS += [

    # ================= THE REGISTER: EZEKIEL'S TWO STICKS =================
    dict(
        mark=("ezekiel", 37, 19),
        mirrors=[("ezekiel", 37, 20)],
        strand="gathering",
        strand_label="The gathering",
        card_title="One stick in mine hand — whose hand does the joining?",
        anchor_refs=["Ezekiel 37:16-20", "Hosea 1:11"],
        body=[
            Q("ezekiel", 37, 16, 17),
            Q("ezekiel", 37, 19, 20),
            Q("hosea", 1, 11),
            P(
                "Two sticks, two names: Yahudah (Judah) with his companions, "
                "and Joseph — the stick of Ephraim — with all the house of "
                "Yashar'el (Israel) his companions. The joining happens *in "
                "mine hand* — not in a council's, not in a movement's. Hosea "
                "saw the same day: the children of Yahudah (Judah) and the "
                "children of Yashar'el (Israel) gathered together under one "
                "head. Two named bloodline houses, one stick. Every *one* "
                "spoken over the people afterward has this promise as its "
                "source."
            ),
        ],
    ),
    dict(
        mark=("ezekiel", 37, 24),
        mirrors=[("ezekiel", 37, 25), ("ezekiel", 37, 26)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="One king, one shepherd — and the one nation walks in his statutes",
        anchor_refs=["Ezekiel 37:24-26", "John 10:16"],
        body=[
            Q("ezekiel", 37, 24),
            Q("ezekiel", 37, 25, 26),
            Q("john", 10, 16),
            P(
                "The reunited houses get one king — David — and one "
                "shepherd, and the very same verse says the one nation "
                "*shall walk in my judgments, and observe my statutes.* The "
                "two-made-one does not retire the Torah; it restores the "
                "walkers. When Yahusha (Jesus) says *one fold, and one "
                "shepherd,* the other sheep he must bring are the other "
                "stick — the scattered house — and the fold is this covenant "
                "of peace, the sanctuary set in the midst of them for "
                "evermore."
            ),
        ],
    ),
    # ================= THE FEUD ENDED =================
    dict(
        mark=("isaiah", 11, 13),
        mirrors=[("isaiah", 9, 21)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The envy of Ephraim shall depart — the oldest feud in the family",
        anchor_refs=["Isaiah 9:21", "Isaiah 11:12-13"],
        body=[
            Q("isaiah", 9, 21),
            Q("isaiah", 11, 12),
            Q("isaiah", 11, 13),
            P(
                "Isaiah names the feud before he names its funeral: Ephraim "
                "against Manasseh, and together against Yahudah (Judah). "
                "Then the ensign goes up, the outcasts of Yashar'el (Israel) "
                "and the dispersed of Yahudah (Judah) come from the four "
                "corners — and the next verse buries the quarrel itself. "
                "Ephraim shall not envy; Yahudah (Judah) shall not vex. The "
                "gathering is not two processions arriving to resume an "
                "argument. It is one family coming home cured of the thing "
                "that split it."
            ),
        ],
    ),
    dict(
        mark=("zechariah", 11, 14),
        mirrors=[("zechariah", 11, 7)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The staff called Bands — a brotherhood real enough to break",
        anchor_refs=["Zechariah 11:7", "Zechariah 11:14", "Ezekiel 37:17"],
        body=[
            Q("zechariah", 11, 7),
            Q("zechariah", 11, 14),
            Q("ezekiel", 37, 17),
            P(
                "The shepherd carries two staves, and when he is rejected he "
                "cuts the one called Bands — *that I might break the "
                "brotherhood between Yahudah (Judah) and Yashar'el "
                "(Israel).* Scripture does not break what does not exist. "
                "The brotherhood of the two houses is real enough to be "
                "named, real enough to be severed — and Ezekiel holds the "
                "counterpart: two sticks joined one to another, one in his "
                "hand. A staff broken in one prophet and rejoined in "
                "another is not a metaphor about institutions. It is the "
                "two houses."
            ),
        ],
    ),
    # ================= JEREMIAH'S SWEEP =================
    dict(
        mark=("jeremiah", 3, 18),
        mirrors=[("jeremiah", 3, 14)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Together out of the land of the north — one return, not two",
        anchor_refs=["Jeremiah 3:14", "Jeremiah 3:18"],
        body=[
            Q("jeremiah", 3, 14),
            Q("jeremiah", 3, 18),
            P(
                "The chapter that records the divorce of the northern house "
                "is the chapter that calls her back — *turn, O backsliding "
                "children... for I am married unto you.* And the return is "
                "not staggered: the house of Yahudah (Judah) shall walk "
                "*with* the house of Yashar'el (Israel), and they shall come "
                "*together* out of the land of the north. One road, two "
                "houses, one inheritance given to the fathers. Any reading "
                "with only one house on that road has lost half the "
                "travellers."
            ),
        ],
    ),
    dict(
        mark=("jeremiah", 23, 5),
        mirrors=[("jeremiah", 23, 6)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="In his days Yahudah (Judah) saved, Yashar'el (Israel) dwelling safely — one Branch, two houses",
        anchor_refs=["Jeremiah 23:5-6", "Luke 1:32-33"],
        body=[
            Q("jeremiah", 23, 5, 6),
            Q("luke", 1, 32, 33),
            P(
                "The Branch raised unto David reigns over a kingdom with two "
                "named beneficiaries: *Yahudah (Judah) shall be saved, and "
                "Yashar'el (Israel) shall dwell safely.* Both houses, one "
                "King. When the angel promises Miriam's son the throne of "
                "his father David and a reign over the house of Jacob for "
                "ever, that is this prophecy — Jacob undivided, both houses "
                "under the King whose name is Yahuah Tsidkenu (THE LORD OUR "
                "RIGHTEOUSNESS)."
            ),
        ],
    ),
    dict(
        mark=("jeremiah", 30, 3),
        mirrors=[("jeremiah", 30, 4)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The book of consolation is addressed to both houses by name",
        anchor_refs=["Jeremiah 30:3-4"],
        body=[
            Q("jeremiah", 30, 3),
            Q("jeremiah", 30, 4),
            P(
                "Before the consolation chapters say a single word of "
                "comfort, the address line is written: *concerning "
                "Yashar'el (Israel) and concerning Yahudah (Judah).* The "
                "captivity brought again is the captivity of *both* — one "
                "return to one land given to the fathers. Read Jeremiah 30 "
                "and 31 with one house in view and you are reading someone "
                "else's mail with half the envelope torn off."
            ),
        ],
    ),
    dict(
        mark=("jeremiah", 31, 1),
        mirrors=[("jeremiah", 31, 2)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The Elohim (God) of ALL the families of Yashar'el (Israel) — not of one house only",
        anchor_refs=["Jeremiah 31:1-2", "Jeremiah 31:9"],
        body=[
            Q("jeremiah", 31, 1),
            Q("jeremiah", 31, 2),
            Q("jeremiah", 31, 9),
            P(
                "*All the families* — the word is deliberate. Not the family "
                "that kept its name through exile, but every family, "
                "including the ones that lost theirs. The people left of "
                "the sword find grace in the wilderness, and the Father "
                "names the firstborn of the homecoming: *Ephraim is my "
                "firstborn.* The head of the scattered northern house is "
                "named first in the family register of the return."
            ),
        ],
    ),
    dict(
        mark=("jeremiah", 31, 6),
        mirrors=[("jeremiah", 31, 5)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Watchmen upon mount Ephraim cry: Arise, let us go up to Zion",
        anchor_refs=["Jeremiah 31:5-6"],
        body=[
            Q("jeremiah", 31, 5),
            Q("jeremiah", 31, 6),
            P(
                "Mount Ephraim is the hill country of the northern house — "
                "the very territory Assyria emptied. The promise plants "
                "vines on the mountains of Samaria again, and then sets "
                "watchmen on Ephraim's own heights crying *Arise ye, and "
                "let us go up to Zion.* The call back to Zion does not come "
                "from Zion. It rises from the north's own watchtowers — the "
                "scattered house waking first and calling the pilgrimage "
                "home to Yahuah Eloheinu (the LORD our God)."
            ),
        ],
    ),
    dict(
        mark=("jeremiah", 31, 27),
        mirrors=[("jeremiah", 31, 28)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Sown together — the new covenant keeps both addressees",
        anchor_refs=["Jeremiah 31:27-28", "Hebrews 8:8"],
        body=[
            Q("jeremiah", 31, 27),
            Q("jeremiah", 31, 28),
            Q("hebrews", 8, 8),
            P(
                "Four verses before the new covenant is announced, its two "
                "addressees are sown side by side: the house of Yashar'el "
                "(Israel) and the house of Yahudah (Judah). And when the "
                "letter to the Hebrews quotes the covenant, it keeps the "
                "address line intact — both houses, named. A covenant made "
                "with two named bloodline houses cannot be re-addressed to "
                "an institution without calling the one who named them a "
                "liar. The same watching that plucked up now builds and "
                "plants — both."
            ),
        ],
    ),
    dict(
        mark=("jeremiah", 33, 14),
        mirrors=[("jeremiah", 33, 15), ("jeremiah", 33, 16)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="That good thing — promised to the house of Yashar'el (Israel) AND the house of Yahudah (Judah)",
        anchor_refs=["Jeremiah 33:14-16"],
        body=[
            Q("jeremiah", 33, 14),
            Q("jeremiah", 33, 15, 16),
            P(
                "*That good thing which I have promised* has two named "
                "recipients — the house of Yashar'el (Israel) and the house "
                "of Yahudah (Judah) — and one delivery mechanism: the "
                "Branch of righteousness growing up unto David. The good "
                "thing is not a sentiment; it is the Branch-King executing "
                "judgment and righteousness in the land, with both houses "
                "standing in the will. Strike either name from the promise "
                "and the promise is no longer the one Yahuah (God) made."
            ),
        ],
    ),
    dict(
        mark=("jeremiah", 33, 24),
        mirrors=[("jeremiah", 33, 25), ("jeremiah", 33, 26)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The two families which Yahuah (God) hath chosen — and those who despise them",
        anchor_refs=["Jeremiah 33:24-26"],
        body=[
            Q("jeremiah", 33, 24),
            Q("jeremiah", 33, 25, 26),
            P(
                "Here the structure itself is named: *the two families "
                "which Yahuah (God) hath chosen.* Two — and already in "
                "Jeremiah's day there were voices saying he had cast them "
                "off, despising the people as though no nation remained. "
                "The Father's answer stakes the two families on the "
                "ordinances of day and night: break those, and only then "
                "is the seed of Jacob cast away. Every system that erases "
                "the second family — that knows only one house and "
                "everybody else — is the old despising with new vocabulary. "
                "The people inside it inherited it. The promise outlasts it."
            ),
        ],
    ),
    dict(
        mark=("jeremiah", 50, 4),
        mirrors=[("jeremiah", 50, 5), ("jeremiah", 50, 20)],
        strand="gathering",
        strand_label="The gathering",
        card_title="They and the children of Yahudah (Judah) together, going and weeping",
        anchor_refs=["Jeremiah 50:4-5", "Jeremiah 50:20"],
        body=[
            Q("jeremiah", 50, 4),
            Q("jeremiah", 50, 5),
            Q("jeremiah", 50, 20),
            P(
                "In the oracle of Babylon's fall, the two houses appear on "
                "one road: the children of Yashar'el (Israel), *they and "
                "the children of Yahudah (Judah) together,* weeping, asking "
                "the way to Zion, asking to be joined to Yahuah (God) in a "
                "perpetual covenant. And the pardon at the end is likewise "
                "double: the iniquity of Yashar'el (Israel) sought and not "
                "found, the sins of Yahudah (Judah) and they shall not be "
                "found. Two houses searched, two houses cleared, one "
                "covenant that shall not be forgotten."
            ),
        ],
    ),
    # ================= ZECHARIAH'S SWEEP =================
    dict(
        mark=("zechariah", 8, 13),
        mirrors=[("zechariah", 8, 7), ("zechariah", 8, 8)],
        strand="gathering",
        strand_label="The gathering",
        card_title="O house of Yahudah (Judah), and house of Yashar'el (Israel) — from curse to blessing, both",
        anchor_refs=["Zechariah 8:7-8", "Zechariah 8:13"],
        body=[
            Q("zechariah", 8, 7),
            Q("zechariah", 8, 8),
            Q("zechariah", 8, 13),
            P(
                "The salvation comes from the east country *and from the "
                "west country* — both directions of the scattering — and "
                "the address has both names on it: *O house of Yahudah "
                "(Judah), and house of Yashar'el (Israel).* As ye were a "
                "curse among the heathen — the Deuteronomy 28 exile "
                "judgment that fell on both houses — so will I save you, "
                "and ye shall be a blessing. The reversal is exactly as "
                "wide as the curse was. Two houses went out under it; two "
                "houses come home through it."
            ),
        ],
    ),
    dict(
        mark=("zechariah", 9, 13),
        mirrors=[("zechariah", 9, 12)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Yahudah (Judah) the bow, Ephraim the arrow — one weapon in his hand",
        anchor_refs=["Zechariah 9:12-13"],
        body=[
            Q("zechariah", 9, 12),
            Q("zechariah", 9, 13),
            P(
                "The prisoners of hope are called to the stronghold, and "
                "then the weapon is assembled: *when I have bent Yahudah "
                "(Judah) for me, filled the bow with Ephraim.* A bow "
                "without an arrow threatens no one; an arrow without a bow "
                "lies on the ground. The two houses are made one weapon, "
                "and the hand that draws it is his. The kingdom does not "
                "fight with half the family — it cannot. The bow and the "
                "arrow were designed for each other before either knew it."
            ),
        ],
    ),
    dict(
        mark=("zechariah", 10, 6),
        mirrors=[("zechariah", 10, 7)],
        strand="gathering",
        strand_label="The gathering",
        card_title="As though I had not cast them off — the house of Joseph saved",
        anchor_refs=["Zechariah 10:6-7"],
        body=[
            Q("zechariah", 10, 6),
            Q("zechariah", 10, 7),
            P(
                "Both houses, both verbs: *I will strengthen the house of "
                "Yahudah (Judah), and I will save the house of Joseph.* And "
                "then the sentence that undoes seven centuries: *they shall "
                "be as though I had not cast them off.* The casting-off was "
                "real — the divorce, the scattering, the lost name. The "
                "mercy is just as real, and it lands on the house that had "
                "the furthest to come back. Ephraim like a mighty man, the "
                "children seeing it and glad — the generation that watches "
                "the return their fathers only sang about."
            ),
        ],
    ),
    # ================= THE TWELVE PROPHETS' WITNESSES =================
    dict(
        mark=("hosea", 3, 5),
        mirrors=[("hosea", 3, 4)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Many days without a king — afterward, David their king",
        anchor_refs=["Hosea 3:4-5"],
        body=[
            Q("hosea", 3, 4),
            Q("hosea", 3, 5),
            P(
                "Hosea's prophecy is a clock: the children of Yashar'el "
                "(Israel) abide *many days* without king, prince, or "
                "sacrifice — the long blank centuries of the northern "
                "house's scattering. Then *afterward*: they return, and "
                "they seek Yahuah (God) their Elohim (God), *and David "
                "their king.* The scattered house does not come home to a "
                "vacant throne. It comes home to the one king of the one "
                "stick — the David of Ezekiel's promise — in the latter "
                "days. The return and the kingdom are one event."
            ),
        ],
    ),
    dict(
        mark=("amos", 9, 14),
        mirrors=[("amos", 9, 15)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Planted, and no more pulled up — the tabernacle of David rebuilt",
        anchor_refs=["Amos 9:11", "Amos 9:14-15", "Acts 15:16"],
        body=[
            Q("amos", 9, 11),
            Q("amos", 9, 14, 15),
            Q("acts", 15, 16),
            P(
                "The tabernacle of David that fell is the kingdom David "
                "ruled — the one roof both houses lived under before the "
                "split. Amos promises it raised, its breaches closed, and "
                "the captivity of the people planted in their own land "
                "never to be pulled up again. When the apostles weigh what "
                "Yahuah (God) is doing in their own day, this is the verse "
                "they reach for. The work in front of them is not a new "
                "structure — it is the old house of two houses, being "
                "rebuilt as in the days of old."
            ),
        ],
    ),
    dict(
        mark=("obadiah", 1, 18),
        mirrors=[("obadiah", 1, 17), ("obadiah", 1, 21)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The house of Jacob a fire, the house of Joseph a flame — one blaze",
        anchor_refs=["Obadiah 1:17-18", "Obadiah 1:21"],
        body=[
            Q("obadiah", 1, 17),
            Q("obadiah", 1, 18),
            Q("obadiah", 1, 21),
            P(
                "In the day of deliverance on mount Zion, two houses act as "
                "one fire: *the house of Jacob shall be a fire, and the "
                "house of Joseph a flame.* Obadiah, the shortest book in "
                "the Tanakh, still has room for both houses by name — fire "
                "and flame, one blaze, in the day when *the kingdom shall "
                "be Yahuah's (the LORD's).* The house of Joseph is not a "
                "memory by the time the kingdom comes. It is half the fire."
            ),
        ],
    ),
    dict(
        mark=("matthew", 2, 6),
        mirrors=[("micah", 5, 2), ("micah", 5, 3)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The scribes stopped quoting one verse too soon",
        anchor_refs=["Micah 5:2-3", "Matthew 2:6"],
        body=[
            Q("matthew", 2, 6),
            Q("micah", 5, 2),
            Q("micah", 5, 3),
            P(
                "Herod's scribes quote Micah's Bethlehem verse and stop. "
                "The prophecy does not stop. The very next line tells what "
                "the ruler born in Bethlehem is for: *then the remnant of "
                "his brethren shall return unto the children of Yashar'el "
                "(Israel).* The Governor who shall rule the people is the "
                "one under whom the scattered remnant comes back to the "
                "family. The birth announcement and the reunion "
                "announcement are one prophecy — the scribes read the "
                "first half to a king who wanted the child dead, and the "
                "second half kept walking."
            ),
        ],
    ),
    # ================= THE TORAH'S FOUNDATIONS =================
    dict(
        mark=("genesis", 49, 10),
        mirrors=[("genesis", 49, 8)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The sceptre with Yahudah (Judah) — and unto him the gathering of the people",
        anchor_refs=["Genesis 49:8-10"],
        body=[
            Q("genesis", 49, 8),
            Q("genesis", 49, 10),
            P(
                "Jacob's blessing splits the inheritance the way the "
                "history will: the sceptre stays with Yahudah (Judah) — *thy "
                "father's children shall bow down before thee* — until "
                "Shiloh come, *and unto him shall the gathering of the "
                "people be.* The king comes through one house; the "
                "gathering he draws is all the houses. The brothers bowing "
                "to Yahudah (Judah) in the blessing are the same brothers "
                "the prophets later put on the road home. Sceptre and "
                "gathering are one sentence — the kingdom and the reunion "
                "were never two subjects."
            ),
        ],
    ),
    dict(
        mark=("1-chronicles", 5, 2),
        mirrors=[("1-chronicles", 5, 1)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The ruler from Yahudah (Judah), the birthright with Joseph — neither holds it all",
        anchor_refs=["1 Chronicles 5:1-2"],
        body=[
            Q("1-chronicles", 5, 1),
            Q("1-chronicles", 5, 2),
            P(
                "The chronicler states the architecture in one parenthesis: "
                "*Yahudah (Judah) prevailed above his brethren, and of him "
                "came the chief ruler; but the birthright was Joseph's.* "
                "The crown in one house, the firstborn's double portion in "
                "the other. Neither house carries the whole inheritance "
                "alone — by design. A kingdom with the ruler but not the "
                "birthright is half a kingdom; so is the reverse. The "
                "inheritance is whole only when the sceptre of Yahudah "
                "(Judah) and the birthright of Joseph stand under one head "
                "— which is exactly what the prophets promise."
            ),
        ],
    ),
    # ================= THE HISTORY'S WITNESSES =================
    dict(
        mark=("2-samuel", 5, 1),
        mirrors=[("2-samuel", 2, 4), ("2-samuel", 5, 3)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="David crowned twice — first by Yahudah (Judah), then by all the tribes",
        anchor_refs=["2 Samuel 2:4", "2 Samuel 5:1-3"],
        body=[
            Q("2-samuel", 2, 4),
            Q("2-samuel", 5, 1),
            Q("2-samuel", 5, 3),
            P(
                "David's kingship arrives in two stages. First the men of "
                "Yahudah (Judah) anoint him over their own house alone — "
                "and for years the rest of the tribes hold back. Then all "
                "the tribes of Yashar'el (Israel) come to Hebron: *behold, "
                "we are thy bone and thy flesh* — and anoint him king over "
                "everything. The first David's two coronations are the "
                "pattern written into the kingdom itself: received first "
                "within Yahudah (Judah), and still awaiting the day the "
                "rest of the family arrives saying *bone and flesh.* The "
                "prophets put that second Hebron in the latter days:"
            ),
            Q("hosea", 3, 5),
            P(
                "Afterward — the children of Yashar'el (Israel) return, and "
                "David their king, in the latter days. The second crowning "
                "stands written."
            ),
        ],
    ),
    dict(
        mark=("1-kings", 11, 39),
        mirrors=[("1-kings", 12, 24)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="This thing is from me — and not for ever",
        anchor_refs=["1 Kings 11:39", "1 Kings 12:24"],
        body=[
            Q("1-kings", 11, 39),
            Q("1-kings", 12, 24),
            P(
                "The split of the kingdom was not an accident Yahuah (God) "
                "salvaged. He decreed it — *this thing is from me* — and he "
                "bounded it in the same breath: *I will for this afflict "
                "the seed of David, but not for ever.* Two houses exist by "
                "his word, and by his word the division has an expiry. "
                "Every two-sticks promise, every together-out-of-the-north, "
                "every one-king oracle is the *not for ever* coming due. A "
                "division he authored, he can end — and said he would."
            ),
        ],
    ),
    dict(
        mark=("2-chronicles", 30, 1),
        mirrors=[("2-chronicles", 30, 6), ("2-chronicles", 30, 11)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Letters to Ephraim and Manasseh — the call home is older than the gospels",
        anchor_refs=["2 Chronicles 30:1", "2 Chronicles 30:6-11"],
        body=[
            Q("2-chronicles", 30, 1),
            Q("2-chronicles", 30, 6),
            Q("2-chronicles", 30, 10),
            Q("2-chronicles", 30, 11),
            P(
                "After Assyria emptied the north, Hezekiah did not write "
                "the northern house off. He wrote it letters — to Ephraim "
                "and Manasseh by name — *come to the house of Yahuah (the "
                "LORD) at Jerusalem, keep the passover... and he will "
                "return to the remnant of you.* The posts went city to "
                "city through Ephraim's country; most laughed them to "
                "scorn; some humbled themselves and came. A proclamation "
                "carried into the scattered house, mocked by many, heard "
                "by a remnant who rise and come home — the Tanakh ran the "
                "whole pattern as history before the prophets finished "
                "writing it as promise."
            ),
        ],
    ),
    # ================= THE NEW TESTAMENT LANDINGS =================
    dict(
        mark=("luke", 2, 34),
        mirrors=[("isaiah", 8, 14)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The fall and rising again of many in Yashar'el (Israel) — a stone for both houses",
        anchor_refs=["Isaiah 8:14", "Luke 2:34"],
        body=[
            Q("luke", 2, 34),
            Q("isaiah", 8, 14),
            P(
                "Simeon holds the child and names him a fall and a rising "
                "again *of many in Yashar'el (Israel)* — and Isaiah had "
                "already counted the houses at that stone: a sanctuary, "
                "but a stone of stumbling *to both the houses of Yashar'el "
                "(Israel).* Both. The verse remembers what the inherited "
                "reading forgets — that there were two houses to stumble. "
                "And a stone that both houses strike is a stone both "
                "houses rise from: the fall and the rising are counted in "
                "the same families."
            ),
        ],
    ),
    dict(
        mark=("john", 17, 21),
        mirrors=[("john", 17, 11)],
        strand="gathering",
        strand_label="The gathering",
        card_title="That they may be one — the prayer prays the two sticks",
        anchor_refs=["John 17:11", "John 17:21-23", "Ezekiel 37:19"],
        body=[
            Q("john", 17, 11),
            Q("john", 17, 21),
            Q("john", 17, 22, 23),
            Q("ezekiel", 37, 19),
            Q("john", 11, 52),
            P(
                "The night before the tree, the high-priestly prayer asks "
                "one thing over the people again and again: *that they may "
                "be one.* The inherited reading flattens it to a wish for "
                "institutional harmony. But John has already told us what "
                "the death gathers: *the children of Elohim (God) that "
                "were scattered abroad,* gathered together *in one.* The "
                "prayer is Ezekiel's promise praying — the stick of Joseph "
                "put with the stick of Yahudah (Judah), *one in mine "
                "hand.* He is not asking for committees to agree. He is "
                "asking the Father for the two houses, made one."
            ),
        ],
    ),
    dict(
        mark=("ephesians", 2, 14),
        mirrors=[("micah", 5, 5)],
        strand="gathering",
        strand_label="The gathering",
        card_title="He is our peace, who hath made both one — which both?",
        anchor_refs=["Micah 5:5", "Isaiah 57:19", "Ephesians 2:14-17", "Ezekiel 37:22"],
        body=[
            Q("ephesians", 2, 14, 16),
            Q("ephesians", 2, 17),
            Q("isaiah", 57, 19),
            Q("micah", 5, 5),
            Q("ezekiel", 37, 22),
            P(
                "*Both* — the letter assumes its readers know which two. "
                "Its vocabulary is the prophets': *far off and nigh* is "
                "Isaiah's double peace — the house scattered far and the "
                "house kept near. *He is our peace* is Micah's *this man "
                "shall be the peace,* spoken against Assyria, the very "
                "empire that carried the northern house away. And the "
                "two-made-one lands where Ezekiel put it: *no more two "
                "nations.* The enmity slain in his flesh is the old "
                "vexing between the houses and the wall of man-made "
                "decrees that kept the far-off at a distance — not the "
                "Father's Torah, for the same one-stick promise says the "
                "reunited nation walks in his statutes. Two bloodline "
                "houses, one new man, one body, one peace."
            ),
        ],
    ),
    dict(
        mark=("matthew", 19, 28),
        mirrors=[("genesis", 49, 28), ("ezekiel", 47, 13)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Twelve thrones require twelve tribes",
        anchor_refs=["Genesis 49:28", "Ezekiel 47:13", "Matthew 19:28", "James 1:1"],
        body=[
            Q("matthew", 19, 28),
            Q("genesis", 49, 28),
            Q("ezekiel", 47, 13),
            Q("james", 1, 1),
            P(
                "In the regeneration, twelve thrones judge *the twelve "
                "tribes of Yashar'el (Israel)* — the same twelve Jacob "
                "blessed, the same twelve Ezekiel's restored land is "
                "surveyed for, with Joseph given two portions so the "
                "arithmetic of the two houses still shows in the map. And "
                "James addresses his letter to those very tribes, "
                "*scattered abroad* — present tense, alive, findable by "
                "mail. The kingdom's government is not sized for an "
                "institution. It is sized for a family of twelve tribes in "
                "two houses, gathered and judged and planted, every throne "
                "matched to a tribe that still exists."
            ),
        ],
    ),
]

# ===== EXHAUSTIVE WAVE 2: THE SECOND EXODUS =====
CARDS += [


    # ------------------------------------------------------------------
    # FLAGSHIP — Ezekiel 20: the wilderness of the people and the fan
    # ------------------------------------------------------------------
    dict(
        mark=("matthew", 3, 12),
        mirrors=[("ezekiel", 20, 35), ("ezekiel", 20, 37)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The fan in his hand is the wilderness of the people",
        anchor_refs=["Ezekiel 20:33-38", "Matthew 3:12"],
        body=[
            Q("ezekiel", 20, 34, 36),
            Q("ezekiel", 20, 37, 38),
            Q("matthew", 3, 12),
            P("Ezekiel states the second exodus as a second exodus: the mighty hand and stretched out arm that broke Egypt will bring the scattered house of Yashar'el (Israel) out of the countries — and then into a second wilderness, the wilderness of the people, to be pleaded with face to face, *like as* the fathers were pleaded with in the wilderness of the land of Egypt. The gathering is not the end of the sorting. The rod passes over the gathered flock, and the rebels are purged out from among the returning people themselves — they came out of the countries, and they do not enter the land. When John stands at the Jordan and says the fan is in his hand and the floor will be throughly purged, he is announcing Ezekiel's threshing floor: wheat and chaff standing inside the same gathered people, divided at the rod. And the rod's destination is the bond of the covenant — the covenant is what the gathered are brought into, never the thing they are saved out of."),
        ],
    ),

    dict(
        mark=("matthew", 25, 32),
        mirrors=[("ezekiel", 20, 38), ("ezekiel", 34, 17)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Cattle and cattle: the King divides his own flock",
        anchor_refs=["Ezekiel 34:17", "Ezekiel 20:38", "Matthew 25:31-33"],
        body=[
            Q("matthew", 25, 31, 33),
            Q("ezekiel", 34, 17),
            Q("ezekiel", 34, 6),
            Q("ezekiel", 20, 38),
            P("The dividing scene of Matthew 25 is drawn whole from Ezekiel. The flock addressed in Ezekiel 34 — *as for you, O my flock* — is the scattered house of Yashar'el (Israel), whose sheep wandered upon all the face of the earth; the nations are where the flock was lost, and the gathering out of all nations is how the flock comes before the throne. The judgment between sheep and goats is the judgment between cattle and cattle of that one flock — the rod-passing of Ezekiel 20, where the purged-out rebels are purged from among the gathered, not from somewhere outside. The Son of Adam dividing at his right hand and his left is the Shepherd-King executing the sentence the prophets wrote for his own returning house."),
        ],
    ),

    # ------------------------------------------------------------------
    # The shub-shevut (turn-the-captivity) formula
    # ------------------------------------------------------------------
    dict(
        mark=("psalms", 14, 7),
        mirrors=[("psalms", 53, 6)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Twice written: oh that the salvation were come out of Zion",
        anchor_refs=["Psalm 14:7", "Psalm 53:6"],
        body=[
            Q("psalms", 14, 7),
            Q("psalms", 53, 6),
            Q("romans", 11, 26),
            P("The canon carries this cry twice, nearly verbatim — only the divine name shifts between Psalm 14 and Psalm 53 — a double witness in the mouth of David: salvation out of Zion, defined as Yahuah (God) bringing back the captivity of his people. That is what salvation means in the psalter's own grammar — Jacob rejoicing because the captives are turned home. Paul closes Romans 11 by quoting the same Zion-oracle: the Deliverer comes out of Zion, and all Yashar'el (Israel) is saved. The salvation the apostles preached is the one the psalm sighed for twice."),
        ],
    ),

    dict(
        mark=("psalms", 126, 4),
        mirrors=[("joel", 3, 1)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Turn again our captivity as the streams in the south",
        anchor_refs=["Psalm 126:1-6", "Joel 3:1"],
        body=[
            Q("psalms", 126, 1, 4),
            Q("psalms", 126, 5, 6),
            Q("joel", 3, 1),
            P("The psalm remembers a turning of captivity so good it felt like dreaming — and then, with that memory still in its mouth, prays for the turning still outstanding: *turn again our captivity, O Yahuah (God), as the streams in the south.* The return from Babylon was a taste, not the settlement. Joel sets the full turning in *those days, and in that time* — the day of Yahuah (God) — and the psalm's closing lines give the gathering its harvest shape: the sower going forth weeping, coming again with rejoicing, bringing his sheaves with him. The sheaves carried home are the captives carried home."),
        ],
    ),

    dict(
        mark=("jeremiah", 29, 14),
        mirrors=[("deuteronomy", 30, 5)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The captivity clause, mailed to the captives",
        anchor_refs=["Deuteronomy 30:3-5", "Jeremiah 29:13-14"],
        body=[
            Q("deuteronomy", 30, 3),
            Q("deuteronomy", 30, 5),
            Q("jeremiah", 29, 13, 14),
            P("Moses wrote the clause before the scattering ever happened: when the curse has run its course among all the nations, Yahuah (God) will turn the captivity and gather the scattered from every place he drove them, back into the land the fathers possessed. Jeremiah's letter to the exiles is that clause invoked by name — *I will turn away your captivity, and I will gather you from all the nations.* The promise is not a new mercy improvised after the disaster; it is the covenant's own return provision, written into the Torah from the beginning, addressed to the seed who would one day read it from inside the lands of their captivity."),
        ],
    ),

    dict(
        mark=("jeremiah", 30, 10),
        mirrors=[("amos", 9, 9)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Sifted among all nations, and not one grain falls",
        anchor_refs=["Amos 9:8-9", "Jeremiah 30:10-11"],
        body=[
            Q("jeremiah", 30, 10),
            Q("jeremiah", 30, 11),
            Q("amos", 9, 9),
            P("Two oaths interlock here. Jeremiah: though Yahuah (God) make a full end of all the nations where Jacob was scattered, he will not make a full end of Jacob — the seed is saved *from afar, from the land of their captivity.* Amos: the house of Yashar'el (Israel) is sifted among all nations as corn is sifted in a sieve — a violent, thorough shaking — yet not the least grain falls upon the earth. The scattering itself is the sieve in his hand. The nations that held the captives pass away; the grain they held does not. Correction in measure, and then the return."),
        ],
    ),

    dict(
        mark=("luke", 14, 21),
        mirrors=[("zephaniah", 3, 19), ("micah", 4, 6)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The halt and the driven-out are brought to the supper",
        anchor_refs=["Zephaniah 3:19-20", "Micah 4:6", "Luke 14:21-23"],
        body=[
            Q("zephaniah", 3, 19),
            Q("zephaniah", 3, 20),
            Q("micah", 4, 6),
            Q("luke", 14, 21, 23),
            P("The master's guest list in the parable is quoted off the prophets' gathering lists. Zephaniah: *I will save her that halteth, and gather her that was driven out... when I turn back your captivity before your eyes.* Micah, the second witness, in the same words. So when the first-bidden — the comfortable, the landed, the already-seated — excuse themselves, the servant is sent to the streets, the lanes, the highways and the hedges, for the poor, the maimed, the halt, and the blind: the prophets' own roll-call of the afflicted — the halt by name, and the driven-out of the house with her. *Compel them to come in, that my house may be filled* is the turning of the captivity told as a supper."),
        ],
    ),

    dict(
        mark=("john", 6, 39),
        mirrors=[("ezekiel", 39, 28)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Left none of them any more there; I should lose nothing",
        anchor_refs=["Ezekiel 39:25-28", "John 6:39"],
        body=[
            Q("ezekiel", 39, 25),
            Q("ezekiel", 39, 28),
            Q("john", 6, 39),
            P("The bringing-again of the captivity of Jacob ends with an accounting: gathered unto their own land, *and have left none of them any more there.* None. The ledger of the scattering closes with no remainder among the heathen. Yahusha (Jesus) states the Father's will in the same arithmetic — of all which the Father has given him, he loses nothing, but raises it up at the last day. The Shepherd's count and the prophet's count are one count: every grain through the sieve, every sheep out of every land, none left, nothing lost."),
        ],
    ),

    # ------------------------------------------------------------------
    # North country / from all lands — the Egypt-eclipsing oath
    # ------------------------------------------------------------------
    dict(
        mark=("jeremiah", 23, 7),
        mirrors=[("isaiah", 43, 19)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The oath that retires Egypt",
        anchor_refs=["Jeremiah 23:3, 7-8", "Isaiah 43:18-19"],
        body=[
            Q("jeremiah", 23, 3),
            Q("jeremiah", 23, 7),
            Q("jeremiah", 23, 8),
            Q("isaiah", 43, 18, 19),
            P("Yashar'el (Israel) swore by the exodus — *Yahuah (God) liveth, which brought up the children of Yashar'el (Israel) out of the land of Egypt* — and Yahuah (God) himself announces the day that oath is retired and replaced. The new oath swears by a greater bringing-out: the seed of the house led home out of the north country and from all countries. Isaiah carries the same decree: remember not the former things — the Egypt things — for a new thing springs forth, a way in the wilderness, rivers in the desert. The second exodus is not a metaphor borrowed from the first; it is the event the first one existed to prefigure, and it is the one the people will swear by forever."),
        ],
    ),

    dict(
        mark=("hosea", 11, 11),
        mirrors=[("isaiah", 60, 8)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Doves to their windows: the flight home from Egypt and Assyria",
        anchor_refs=["Hosea 11:10-11", "Isaiah 60:8"],
        body=[
            Q("hosea", 11, 10),
            Q("hosea", 11, 11),
            Q("isaiah", 60, 8),
            P("The lion roars and the children come trembling home — *as a bird out of Egypt, and as a dove out of the land of Assyria.* Egypt and Assyria, the two captivities, the first exodus and the second, named in one breath as the two points the flight home departs from. Isaiah watches the same sky and asks the question the gathering forces out of every onlooker: *who are these that fly as a cloud, and as the doves to their windows?* They are the scattered children of the house, and the windows are their own — *I will place them in their houses, saith Yahuah (God).*"),
        ],
    ),

    dict(
        mark=("matthew", 2, 15),
        mirrors=[("hosea", 11, 1)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Out of Egypt: the exodus walks in his feet",
        anchor_refs=["Hosea 11:1", "Matthew 2:14-15"],
        body=[
            Q("matthew", 2, 14, 15),
            Q("hosea", 11, 1),
            P("Hosea 11:1 is not, on its face, a prediction — it is the memory of the first exodus: Yashar'el (Israel) the child, loved, called out of Egypt. Matthew says that line was *fulfilled* when the young child was carried down into Egypt and called out again. That is the canon teaching us how it reads itself: the nation's road is the Messiah's (Christ's) road; the head walks the path the body walked and the path the body will walk again. He goes down into the place of bondage and is called out of it in his own flesh — the pattern of the second exodus carried first in the King's own feet, before he leads the house of Yashar'el (Israel) along it."),
        ],
    ),

    dict(
        mark=("mark", 13, 27),
        mirrors=[("isaiah", 43, 6)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Give up, north: the four winds obey the gathering",
        anchor_refs=["Isaiah 43:6-7", "Mark 13:27"],
        body=[
            Q("isaiah", 43, 6, 7),
            Q("mark", 13, 27),
            P("Isaiah hears the command issued to the compass itself: north, *give up*; south, *keep not back* — bring my sons from far and my daughters from the ends of the earth, every one called by my name, created for my glory. When Yahusha (Jesus) describes the Son of Adam sending his angels to gather his elect from the four winds, from the uttermost part of the earth, he is describing that command being executed. The elect of Mark 13 are the sons and daughters of Isaiah 43 — the seed called by his name, surrendered up by the north country and every land that held them. The angels are the escort of the second exodus."),
        ],
    ),

    dict(
        mark=("2-corinthians", 6, 2),
        mirrors=[("isaiah", 49, 8), ("isaiah", 49, 12)],
        strand="good_news",
        strand_label="The good news",
        card_title="Now is the day: Paul dates the return oracle",
        anchor_refs=["Isaiah 49:8-12", "2 Corinthians 6:2"],
        body=[
            Q("isaiah", 49, 8),
            Q("isaiah", 49, 9),
            Q("isaiah", 49, 12),
            Q("2-corinthians", 6, 2),
            P("The oracle Paul quotes is the covenant-of-the-people oracle — the one where the preserved servant says to the prisoners *go forth,* where highways are raised, where *these shall come from far, and, lo, these from the north and from the west.* It is a return-from-captivity text from its first line to its last. Paul lifts its opening sentence and stamps the date on it: *behold, now is the accepted time; behold, now is the day of salvation.* The day he announces is not a new religious era; it is the acceptable time of Isaiah 49 — the prisoners' release and the long walk home from the north and the west, declared open."),
        ],
    ),

    dict(
        mark=("isaiah", 60, 4),
        mirrors=[("isaiah", 49, 22)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Thy sons from far, carried home in arms",
        anchor_refs=["Isaiah 49:22", "Isaiah 60:4, 9"],
        body=[
            Q("isaiah", 60, 4),
            Q("isaiah", 60, 9),
            Q("isaiah", 49, 22),
            P("Watch who is carried and who carries. The sons and daughters coming from far are the scattered seed of Yashar'el (Israel); the nations and the ships are the transport. The standard is lifted to the peoples and they bring thy sons in their arms; the isles wait, and the ships of Tarshish go *first,* freighted with the sons from far. The nations are honored in this picture as the carriers of the returning house — the distinction between the seed coming home and the peoples who ferry them stands unblurred through the whole return."),
        ],
    ),

    dict(
        mark=("micah", 7, 15),
        mirrors=[("exodus", 34, 10)],
        strand="gathering",
        strand_label="The gathering",
        card_title="According to the days of Egypt: marvels promised twice",
        anchor_refs=["Exodus 34:10", "Micah 7:12-15"],
        body=[
            Q("micah", 7, 12),
            Q("micah", 7, 14),
            Q("micah", 7, 15),
            Q("exodus", 34, 10),
            P("At Sinai the covenant came with a promise of marvels such as had not been done in all the earth. Micah hears the same voice promise a second installment, and measure it against the first by name: *according to the days of thy coming out of the land of Egypt will I shew unto him marvellous things.* The setting is the regathering — he shall come even to thee from Assyria and from the fortified cities, the flock of the heritage fed with the rod as in the days of old. The second exodus is promised in the vocabulary of the first, marvel for marvel, and the flock that dwelt solitarily in the wood is walked home through it."),
        ],
    ),

    dict(
        mark=("zechariah", 8, 7),
        mirrors=[("psalms", 107, 2)],
        strand="gathering",
        strand_label="The gathering",
        card_title="From the east country and from the west country",
        anchor_refs=["Psalm 107:2-3", "Zechariah 8:7-8"],
        body=[
            Q("zechariah", 8, 7),
            Q("zechariah", 8, 8),
            Q("psalms", 107, 2),
            Q("psalms", 107, 3),
            Q("luke", 13, 29),
            P("Zechariah's oath names the compass; the psalm names the redeemed walking in from its four points; and Yahusha (Jesus) seats the same procession at the table of the kingdom — they shall come from the east and the west and the north and the south, and sit down. The destination of the east-and-west salvage is covenant in full: *they shall be my people, and I will be their Elohim (God), in truth and in righteousness.* Let the redeemed of Yahuah (God) say so — the saying-so is the testimony of the gathered, told from every direction they were brought home from."),
        ],
    ),

    dict(
        mark=("isaiah", 51, 11),
        mirrors=[("exodus", 15, 13)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The sea-road and the singing return",
        anchor_refs=["Exodus 15:13", "Isaiah 51:10-11"],
        body=[
            Q("isaiah", 51, 10),
            Q("isaiah", 51, 11),
            Q("exodus", 15, 13),
            P("Isaiah wakes the arm of Yahuah (God) by reminding it of its own resume: art thou not the arm that dried the sea, that made the depths a road for the ransomed to pass over? And then the *therefore* — because that arm did that, *the redeemed of Yahuah (God) shall return, and come with singing unto Zion.* The sea-crossing is fused directly to the future return; the first exodus is cited as the legal precedent for the second. The song of Moses at the shore — *thou in thy mercy hast led forth the people which thou hast redeemed* — becomes the song of the returning, with everlasting joy upon their heads and sorrow fleeing away."),
        ],
    ),

    dict(
        mark=("matthew", 3, 3),
        mirrors=[("isaiah", 40, 3), ("isaiah", 40, 9)],
        strand="good_news",
        strand_label="The good news",
        card_title="The voice in the wilderness builds the return highway",
        anchor_refs=["Isaiah 40:1-9", "Matthew 3:3"],
        body=[
            Q("isaiah", 40, 1, 2),
            Q("isaiah", 40, 3),
            Q("isaiah", 40, 9),
            Q("matthew", 3, 3),
            P("The oracle the gospels open with is the return-from-exile oracle. Isaiah 40 begins with comfort spoken to a punished people — her warfare accomplished, her iniquity pardoned — and the voice in the wilderness is a road crew: prepare the way, raise a highway in the desert, because the captives are coming home and the glory of Yahuah (God) is coming with them. *O Zion, that bringest good tidings* — the good tidings are that announcement. When Matthew identifies John as that voice, he is telling the reader what the whole story is: the warfare is ending, the highway is being graded, and the second bringing-out has its herald standing in the wilderness where the road begins."),
        ],
    ),

    dict(
        mark=("matthew", 9, 36),
        mirrors=[("ezekiel", 34, 5), ("numbers", 27, 17)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Scattered as sheep having no shepherd — and the harvest is the gathering",
        anchor_refs=["Numbers 27:17", "Ezekiel 34:5", "Matthew 9:36-38"],
        body=[
            Q("matthew", 9, 36),
            Q("numbers", 27, 17),
            Q("ezekiel", 34, 5),
            Q("matthew", 9, 37, 38),
            P("*Scattered abroad, as sheep having no shepherd* is not a loose figure of speech — it is a diagnosis with a paper trail. Moses prayed for a man to lead the congregation out and bring them in, *that the congregation of Yahuah (God) be not as sheep which have no shepherd.* Ezekiel indicts the failed shepherds with the result: *they were scattered, because there is no shepherd.* When Yahusha (Jesus) looks at the multitudes and sees that exact condition, the next words out of his mouth are harvest words — the harvest is plenteous, pray for labourers. The harvest he means is the in-bringing of that scattered flock. Compassion on the shepherdless and the call for reapers are one sentence."),
        ],
    ),

    # ------------------------------------------------------------------
    # John 4 — Samaria, the well, the white fields
    # ------------------------------------------------------------------
    dict(
        mark=("john", 4, 35),
        mirrors=[("amos", 9, 13)],
        strand="gathering",
        strand_label="The gathering",
        card_title="White fields in Samaria: the sowing comes up",
        anchor_refs=["Amos 9:13-14", "Hosea 2:23", "John 4:35"],
        body=[
            Q("john", 4, 35),
            Q("john", 4, 36),
            Q("amos", 9, 13),
            Q("amos", 9, 14),
            Q("hosea", 2, 23),
            P("He says it standing in Samaria — the old heartland of the northern house — at Jacob's own well. The prophets had spoken over that very ground: *I will sow her unto me in the earth,* Yahuah (God) said of the scattered house, and Amos saw a day when the plowman overtakes the reaper, sowing and harvest pressed so close they touch, in the same breath as *I will bring again the captivity of my people of Yashar'el (Israel).* Lift up your eyes, he tells the disciples — the fields are white *already.* The seed sown into that earth in the scattering is standing ripe in front of them, and the reaping he calls them into is the gathering the prophets promised, with sower and reaper rejoicing together."),
        ],
    ),

    dict(
        mark=("john", 4, 22),
        mirrors=[("hosea", 4, 6)],
        strand="teaching",
        strand_label="The teaching",
        card_title="Ye worship ye know not what: the lost knowledge of the north country",
        anchor_refs=["Hosea 4:6", "2 Kings 17:6", "John 4:4-23"],
        body=[
            Q("john", 4, 4),
            Q("john", 4, 5),
            Q("2-kings", 17, 6),
            Q("john", 4, 22),
            Q("hosea", 4, 6),
            Q("john", 4, 23),
            P("He *must needs* go through Samaria — through the territory that was the northern kingdom's home ground before Assyria emptied it — and he sits down on the well Jacob dug, on the parcel Jacob gave to Joseph. The geography is the sermon. To the woman he names the condition that hangs over that ground: *ye worship ye know not what.* That is Hosea's verdict on the northern house in its own words — destroyed for lack of knowledge, the Torah of Elohim (God) forgotten. Worship without knowledge is what the scattering left behind on that soil. And into that condition he speaks the turning: the hour cometh, *and now is,* when true worshippers worship the Father in spirit and in truth — the knowledge coming back to the place that lost it."),
        ],
    ),

    # ------------------------------------------------------------------
    # Kingdom and grace strands
    # ------------------------------------------------------------------
    dict(
        mark=("matthew", 12, 29),
        mirrors=[("jeremiah", 31, 11)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Bind the strong man: Jacob ransomed from the stronger",
        anchor_refs=["Jeremiah 31:11-12", "Matthew 12:28-29"],
        body=[
            Q("matthew", 12, 28, 29),
            Q("jeremiah", 31, 11),
            Q("jeremiah", 31, 12),
            P("Jeremiah names the captor precisely: Jacob was held by *him that was stronger than he,* and Yahuah (God) ransomed him out of that hand. Yahusha (Jesus) announces the kingdom's arrival in the same picture — no one spoils the strong man's house without first binding the strong man. The casting out of devils by the Spirit of Elohim (God) is the binding; the spoiling of the house is the ransom raid; and the goods carried out of the strong man's house are the captive seed of Jacob. The kingdom come is the captivity broken — and the freed walk straight into Jeremiah's next verse, singing in the height of Zion, flowing together to the goodness of Yahuah (God)."),
        ],
    ),

    dict(
        mark=("luke", 15, 18),
        mirrors=[("jeremiah", 50, 4), ("jeremiah", 50, 5)],
        strand="grace",
        strand_label="The grace",
        card_title="I will arise and go: the way to Zion asked with weeping",
        anchor_refs=["Jeremiah 50:4-5", "Luke 15:17-20"],
        body=[
            Q("luke", 15, 17, 19),
            Q("jeremiah", 50, 4),
            Q("jeremiah", 50, 5),
            Q("luke", 15, 20),
            P("The younger son's road is mapped in Jeremiah before the parable tells it: the children of Yashar'el (Israel) coming *going and weeping,* asking the way to Zion with their faces set toward it. The far country, the wasted inheritance, the famine, the unclean herd — that is the scattering told as one household's story. And mark where the weeping road leads in the prophet's telling: *Come, and let us join ourselves to Yahuah (God) in a perpetual covenant that shall not be forgotten.* The father running to meet the returning son is the grace; the perpetual covenant is the address the road home arrives at. Grace carries the returning into the bond — it never carries them away from it."),
        ],
    ),

    dict(
        mark=("hosea", 2, 14),
        mirrors=[("jeremiah", 2, 2)],
        strand="grace",
        strand_label="The grace",
        card_title="Allured into the wilderness: courted as in the day of Egypt",
        anchor_refs=["Jeremiah 2:2", "Hosea 2:14-16"],
        body=[
            Q("hosea", 2, 14),
            Q("hosea", 2, 15),
            Q("jeremiah", 2, 2),
            Q("hosea", 2, 16),
            P("The second wilderness is a courtship. Yahuah (God) remembers the first one that way — the kindness of her youth, the love of her espousals, when she went after him in a land not sown — and Hosea promises he will do it again: allure her, bring her into the wilderness, speak comfortably to her, and she shall sing there *as in the day when she came up out of the land of Egypt.* The exodus named as the pattern, the wilderness as the meeting place, the valley of trouble turned into a door of hope. Grace is the alluring — and the destination of the alluring is the marriage itself: *thou shalt call me Ishi.* He draws her out in order to bind her to himself, never to release her from his ways."),
        ],
    ),

    dict(
        mark=("romans", 10, 8),
        mirrors=[("deuteronomy", 30, 2)],
        strand="good_news",
        strand_label="The good news",
        card_title="The word nigh thee lives in the captivity-return chapter",
        anchor_refs=["Deuteronomy 30:2-3, 14", "Romans 10:8"],
        body=[
            Q("deuteronomy", 30, 2),
            Q("deuteronomy", 30, 3),
            Q("deuteronomy", 30, 14),
            Q("romans", 10, 8),
            P("When Paul says *the word is nigh thee, even in thy mouth, and in thy heart,* he is quoting Deuteronomy 30 — and Deuteronomy 30 is the captivity chapter. Its subject from the first verse is the scattered among all nations returning to Yahuah (God) with all the heart, and Yahuah (God) turning the captivity and gathering them. The word that is nigh sits inside that return, two verses from the turning of the captivity, given *that thou mayest do it.* Paul did not lift a slogan out of the Torah and repurpose it for a new religion; he preached the return clause to the scattered seed it was written for. The word of faith is the homecoming word."),
        ],
    ),

    dict(
        mark=("isaiah", 11, 16),
        mirrors=[("isaiah", 35, 8)],
        strand="gathering",
        strand_label="The gathering",
        card_title="A highway like as the day he came up out of Egypt",
        anchor_refs=["Isaiah 11:11-16", "Isaiah 35:8"],
        body=[
            Q("isaiah", 11, 11),
            Q("isaiah", 11, 16),
            Q("isaiah", 35, 8),
            Q("isaiah", 35, 10),
            P("The canon says *the second time* in those words: his hand set again, the second time, to recover the remnant of his people. And the road built for that recovery is measured against the first one by name — a highway from Assyria for the remnant, *like as it was to Yashar'el (Israel) in the day that he came up out of the land of Egypt.* Isaiah 35 paves the same road and names it: the way of holiness, where even the wayfaring fool does not err, and the ransomed of Yahuah (God) come home on it to Zion with songs. One highway, surveyed twice in Isaiah, running from the lands of the scattering to the everlasting joy."),
        ],
    ),

    dict(
        mark=("john", 10, 4),
        mirrors=[("micah", 2, 13), ("zechariah", 10, 8)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The Breaker goes out before them",
        anchor_refs=["Micah 2:12-13", "Zechariah 10:8-10", "John 10:3-4"],
        body=[
            Q("micah", 2, 12),
            Q("micah", 2, 13),
            Q("zechariah", 10, 8),
            Q("zechariah", 10, 10),
            Q("john", 10, 3),
            Q("john", 10, 4),
            P("Micah's gathering ends with a break-out: the flock assembled in the fold, and then the Breaker coming up *before them* — the gate broken, the flock passing out through it, their King passing before them, Yahuah (God) at the head. Zechariah hears the shepherd's signal that starts the movement — *I will hiss for them, and gather them; for I have redeemed them* — and names the route: out of Egypt, out of Assyria, the two captivities again. John 10 is that oracle walking: the sheep hear his voice, he calls his own by name, he *leadeth them out,* and he goes before them. The Good Shepherd's motion is exodus motion — out through the broken gate, the King at the head of the flock."),
        ],
    ),

    dict(
        mark=("luke", 1, 33),
        mirrors=[("micah", 4, 7)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="He shall reign over the house of Jacob — the gathered remnant",
        anchor_refs=["Micah 4:7", "Luke 1:32-33"],
        body=[
            Q("luke", 1, 32, 33),
            Q("micah", 4, 7),
            P("The angel does not say he shall reign over an institution, a movement, or the world in the abstract. He shall reign *over the house of Jacob* for ever — and Micah has already told us who that house is at the hour the reign begins: her that halted made a remnant, her that was cast far off made a strong nation, and Yahuah (God) reigning over *them* in mount Zion from henceforth, even for ever. The throne of David announced to Miryam is the throne of Micah 4 — set over the gathered, the once-driven-out brought home and constituted a kingdom. The kingdom's subjects are the regathered house; the everlasting reign and the finished gathering are one promise."),
        ],
    ),

    dict(
        mark=("matthew", 18, 12),
        mirrors=[("isaiah", 27, 12)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Gathered one by one: the ninety and nine and the one",
        anchor_refs=["Isaiah 27:12-13", "Matthew 18:12-14"],
        body=[
            Q("isaiah", 27, 12),
            Q("isaiah", 27, 13),
            Q("matthew", 18, 12),
            Q("matthew", 18, 13, 14),
            P("The great trumpet gathers nations' worth of outcasts — and Isaiah says the harvest is threshed out *one by one, O ye children of Yashar'el (Israel).* Not in bulk, not by census: each grain beaten off the branch by hand. The parable of the hundred sheep is that one-by-one gathering told from inside the Shepherd's heart — the ninety and nine left on the mountains while he seeks the single strayed one, and more joy over the one found than over all who never wandered. *It is not the will of your Father which is in heaven, that one of these little ones should perish* — the same arithmetic as Isaiah's threshing: the gathering is total because it is singular, one by one until none is left out."),
        ],
    ),

    dict(
        mark=("romans", 10, 15),
        mirrors=[("nahum", 1, 15), ("isaiah", 52, 8)],
        strand="good_news",
        strand_label="The good news",
        card_title="Beautiful feet announce the bringing-again of Zion",
        anchor_refs=["Isaiah 52:7-8", "Nahum 1:15", "Romans 10:15"],
        body=[
            Q("isaiah", 52, 7),
            Q("isaiah", 52, 8),
            Q("nahum", 1, 15),
            Q("romans", 10, 15),
            P("What news makes the feet beautiful? Read the next line of the oracle Paul quotes: the watchmen sing together *when Yahuah (God) shall bring again Zion.* The good tidings of Isaiah 52 are return tidings — thy Elohim (God) reigneth, the captivity turning, the watchmen seeing it eye to eye. Nahum is the second witness on the same mountains, with the same feet, telling Yahudah (Judah) to keep her solemn feasts because the wicked is cut off. When Paul asks how they shall preach except they be sent, this is the dispatch he cites: the preachers of the gospel of peace are the runners of the bringing-again, carrying word ahead of the returning King and the returning house."),
        ],
    ),
]

# ===== EXHAUSTIVE WAVE 2: NT GAP WALK =====
CARDS += [

    # ================= MATTHEW =================
    dict(
        mark=("matthew", 4, 14),
        mirrors=[("isaiah", 9, 1), ("isaiah", 9, 2)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The ministry opens in Zebulun and Naphtali — the first lands the scattering emptied",
        anchor_refs=["Isaiah 9:1-2", "2 Kings 15:29", "Matthew 4:13-16"],
        body=[
            Q("matthew", 4, 13, 16),
            Q("isaiah", 9, 1, 2),
            Q("2-kings", 15, 29),
            P(
                "Zebulun and Naphtali are not scenery. They are tribal "
                "allotments of the northern house — and the record shows they "
                "were the first lands Assyria emptied, carried captive before "
                "the rest. Isaiah looked at that darkness and promised that "
                "the very people who sat in it would see a great light. So "
                "when the ministry of Yahusha (Jesus) opens, it opens *there* "
                "— not in Jerusalem, but in *Galilee of the nations,* the "
                "homeland of the first-scattered. The light rises first where "
                "the darkness fell first. The geography is the announcement: "
                "the work that begins in the scattered house's own territory "
                "is the work of bringing the scattered house home."
            ),
        ],
    ),
    dict(
        mark=("matthew", 9, 36),
        mirrors=[("ezekiel", 34, 5), ("numbers", 27, 17)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Scattered abroad, as sheep having no shepherd — the diagnosis is Ezekiel's, word for word",
        anchor_refs=["Ezekiel 34:5", "Numbers 27:17", "Matthew 9:36-38"],
        body=[
            Q("matthew", 9, 36, 38),
            Q("ezekiel", 34, 5),
            Q("numbers", 27, 17),
            P(
                "What moves him to compassion is not vague need — it is a "
                "condition the prophets had already named in these exact "
                "words. *Scattered, because there is no shepherd* is "
                "Ezekiel's indictment of the shepherds who fed themselves "
                "while the flock was strewn across the earth. And the cure "
                "had been asked for since Moses, who prayed for a man over "
                "the congregation *that the congregation of Yahuah (LORD) be "
                "not as sheep which have no shepherd* — a prayer first "
                "answered in a man named Yahusha (Joshua). Now the harvest "
                "idiom takes over: the scattered flock is a standing crop, "
                "and the prayer he commands is for labourers to be sent into "
                "it. The sending is the gathering begun."
            ),
        ],
    ),
    dict(
        mark=("matthew", 12, 18),
        mirrors=[
            ("isaiah", 42, 1),
            ("isaiah", 42, 2),
            ("isaiah", 42, 3),
            ("isaiah", 42, 4),
        ],
        strand="teaching",
        strand_label="The teaching",
        card_title="The isles shall wait for his Torah — the servant's mission field is the map of the scattering",
        anchor_refs=["Isaiah 42:1-4", "Jeremiah 31:10", "Matthew 12:18-21"],
        body=[
            Q("matthew", 12, 18, 21),
            Q("isaiah", 42, 1, 4),
            Q("jeremiah", 31, 10),
            P(
                "Matthew quotes the servant song almost whole, and the song "
                "ends on an address: *the isles shall wait for his law.* The "
                "isles afar off are not decoration — they are where Jeremiah "
                "commands the gathering to be announced: *He that scattered "
                "Yashar'el (Israel) will gather him.* The servant's judgment "
                "and his Torah travel out to the nations and the isles "
                "because that is where the flock was strewn. And the manner "
                "matches the mission: a bruised reed he will not break, a "
                "smoking flax he will not quench — the broken and "
                "barely-burning are handled as what they are, the wounded of "
                "the scattering, gathered gently, not finished off."
            ),
        ],
    ),
    dict(
        mark=("matthew", 13, 44),
        mirrors=[("psalms", 135, 4)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Treasure hid in a field — the segullah hidden in the world, and the man who buys the whole field",
        anchor_refs=["Exodus 19:5", "Psalm 135:4", "Matthew 13:44"],
        body=[
            Q("matthew", 13, 44),
            Q("exodus", 19, 5),
            Q("psalms", 135, 4),
            Q("matthew", 13, 38),
            P(
                "*Peculiar treasure* is covenant vocabulary — the segullah, "
                "the treasured possession Yahuah (God) named at Sinai and the "
                "psalm names again: *Yashar'el (Israel) for his peculiar "
                "treasure.* The parable puts that treasure where the prophets "
                "left it: hidden in a field — and the chapter itself defines "
                "the field as the world. The treasure of the kingdom is not "
                "on display in an institution; it lies buried in the world, "
                "unrecognized, indistinguishable from the soil around it. "
                "And the man who finds it does not dig out a coin and leave "
                "— for joy he sells all that he has and buys the whole "
                "field. The purchase price covers the world, because that is "
                "where the treasure is scattered."
            ),
        ],
    ),
    dict(
        mark=("matthew", 13, 47),
        mirrors=[("ezekiel", 47, 9), ("ezekiel", 47, 10)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The kingdom is like a net cast into the sea — the fishers' work, fabric and all",
        anchor_refs=["Jeremiah 16:16", "Ezekiel 47:9-10", "Matthew 13:47-48"],
        body=[
            Q("matthew", 13, 47, 48),
            Q("jeremiah", 16, 16),
            Q("ezekiel", 47, 9, 10),
            P(
                "The net is not a fresh metaphor — it is the working tool of "
                "the fishers Yahuah (LORD) said he would send for the "
                "scattered, to fish them out of every hiding place. The "
                "kingdom-net is cast into the sea and *gathered of every "
                "kind,* and Ezekiel's river-vision had already shown where "
                "that language ends: fishers standing with nets spread, "
                "their catch *according to their kinds, as the fish of the "
                "great sea, exceeding many.* The net gathers; then comes the "
                "sorting on the shore — the good into vessels, the bad cast "
                "away. The gathering is broad because the catch is hidden in "
                "the sea; the sorting belongs to the end, and to hands that "
                "are not ours."
            ),
        ],
    ),
    dict(
        mark=("matthew", 18, 12),
        mirrors=[("ezekiel", 34, 12)],
        strand="gathering",
        strand_label="The gathering",
        card_title="He goes into the mountains after the one gone astray — Ezekiel said the sheep were on the mountains",
        anchor_refs=["Ezekiel 34:6", "Ezekiel 34:12", "Matthew 18:12-14"],
        body=[
            Q("matthew", 18, 12, 14),
            Q("ezekiel", 34, 6),
            Q("ezekiel", 34, 12),
            P(
                "Notice where the shepherd goes: *into the mountains.* That "
                "is not a storyteller's flourish — it is Ezekiel's map. *My "
                "sheep wandered through all the mountains, and upon every "
                "high hill* — and the promise answered it point for point: "
                "*as a shepherd seeketh out his flock... so will I seek out "
                "my sheep, and will deliver them out of all places where "
                "they have been scattered in the cloudy and dark day.* The "
                "parable is that promise told small — one stray standing for "
                "the strewn flock, the Father's will spoken plainly at the "
                "end: not one of these little ones should perish. The "
                "seeking-out Ezekiel put in Yahuah (God)'s own mouth is the "
                "work walking in Galilee."
            ),
        ],
    ),
    dict(
        mark=("matthew", 19, 28),
        mirrors=[("isaiah", 1, 26)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Twelve thrones for twelve tribes — the judges restored as at the first",
        anchor_refs=["Psalm 122:4-5", "Isaiah 1:26", "Matthew 19:28"],
        body=[
            Q("matthew", 19, 28),
            Q("psalms", 122, 4, 5),
            Q("isaiah", 1, 26),
            P(
                "*In the regeneration* — and the shape of the regenerated "
                "kingdom is tribal. Twelve thrones, judging the twelve "
                "tribes of Yashar'el (Israel): not a remembered number, a "
                "working one. The psalm had set thrones of judgment where "
                "the tribes go up; Isaiah promised the restoration in so "
                "many words — *I will restore thy judges as at the first.* "
                "Restore, not replace. A kingdom whose seats of judgment are "
                "counted out by tribe is a kingdom that requires the tribes "
                "— all twelve, gathered and standing before the thrones. The "
                "Son of Adam on the throne of his glory presides over the "
                "very assembly the prophets said would be brought home."
            ),
        ],
    ),
    dict(
        mark=("matthew", 23, 37),
        mirrors=[
            ("psalms", 118, 26),
            ("deuteronomy", 32, 11),
            ("deuteronomy", 32, 12),
        ],
        strand="gathering",
        strand_label="The gathering",
        card_title="As a hen gathereth her chickens under her wings — the gathering refused has an until",
        anchor_refs=["Deuteronomy 32:11-12", "Psalm 118:26", "Matthew 23:37-39"],
        body=[
            Q("matthew", 23, 37, 39),
            Q("deuteronomy", 32, 11, 12),
            Q("psalms", 118, 26),
            P(
                "*How often would I have gathered* — the word is the "
                "prophets' word, and the wings are the wings of Moses' song: "
                "Yahuah (LORD) carrying Yashar'el (Israel) as an eagle bears "
                "her young. The grief over Jerusalem is the grief of the one "
                "who has been spreading those wings all along and watching "
                "the children scatter from under them. But read the sentence "
                "to its end. The refusal does not cancel the gathering; it "
                "sets a condition with an expiry: *till ye shall say, "
                "Blessed is he that cometh in the name of Yahuah (Lord)* — "
                "the pilgrim blessing of the psalm, waiting in the mouth of "
                "the city. The house is left desolate *until.* The until is "
                "the promise."
            ),
        ],
    ),
    # ================= MARK =================
    dict(
        mark=("mark", 13, 27),
        mirrors=[("zechariah", 2, 6)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Gathered from the four winds — because the four winds is where he spread them",
        anchor_refs=["Zechariah 2:6", "Deuteronomy 30:4", "Mark 13:27"],
        body=[
            Q("mark", 13, 27),
            Q("zechariah", 2, 6),
            Q("deuteronomy", 30, 4),
            P(
                "*From the four winds* answers a sentence already on record: "
                "*I have spread you abroad as the four winds of the heaven, "
                "saith Yahuah (LORD).* The elect being gathered are the ones "
                "who were spread — the same wind-language, scattering and "
                "gathering, one verb answering the other. And the reach of "
                "the gathering, *from the uttermost part of the earth to the "
                "uttermost part of heaven,* is the reach Moses wrote into "
                "the covenant itself: driven out unto the outmost parts of "
                "heaven, *from thence* will he gather thee, from thence will "
                "he fetch thee. The angels sent at the end are executing the "
                "oldest clause in the book."
            ),
        ],
    ),
    # ================= LUKE =================
    dict(
        mark=("luke", 2, 25),
        mirrors=[("isaiah", 40, 1), ("isaiah", 40, 2)],
        strand="good_news",
        strand_label="The good news",
        card_title="Waiting for the consolation of Yashar'el (Israel) — the comfort Isaiah was commanded to speak",
        anchor_refs=["Isaiah 40:1-2", "Luke 2:25"],
        body=[
            Q("luke", 2, 25),
            Q("isaiah", 40, 1, 2),
            P(
                "Simeon's hope has a name, and the name is a quotation. *The "
                "consolation of Yashar'el (Israel)* is the comfort Isaiah "
                "was commanded to cry — *Comfort ye, comfort ye my people* — "
                "the announcement to a punished, exiled, double-paid people "
                "that the warfare is accomplished. That is what a just and "
                "devout man in Jerusalem was waiting for: not a private "
                "blessing, not a new religion, but the consolation promised "
                "to a specific people at the end of a specific sentence of "
                "judgment. The Ruach HaKodesh (Holy Spirit) rested on a man "
                "whose whole expectation was the prophets' expectation — and "
                "led him to the child in whom the comfort had arrived."
            ),
        ],
    ),
    dict(
        mark=("luke", 4, 26),
        mirrors=[("1-kings", 17, 9), ("2-kings", 5, 14)],
        strand="teaching",
        strand_label="The teaching",
        card_title="Elijah sent to Sidon, Elisha to a Syrian — the commission that runs outside the land",
        anchor_refs=["1 Kings 17:9", "2 Kings 5:14", "Luke 4:25-27"],
        body=[
            Q("luke", 4, 25, 27),
            Q("1-kings", 17, 9),
            Q("2-kings", 5, 14),
            P(
                "Rejected in his own town, Yahusha (Jesus) reaches for a "
                "precedent — and the precedent is geographic. In the days "
                "when Yashar'el (Israel) was deep in covenant-breaking, the "
                "prophet's commission ran *outside the land*: Elijah "
                "sustained at Zarephath of Sidon, Elisha's cleansing "
                "received by Naaman the Syrian. Each was an individual "
                "mercy, given where it was given — Naaman went home to "
                "Syria clean, not absorbed into the covenant people. The "
                "pattern Yahusha (Jesus) is naming is the sending: when the "
                "house will not hear, the word goes out beyond its borders "
                "and is received there. The crowd raged, because the "
                "precedent put the mercy past the boundary they were "
                "standing inside."
            ),
        ],
    ),
    dict(
        mark=("luke", 19, 9),
        mirrors=[("ezekiel", 34, 11)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Forsomuch as he also is a son of Abraham — the seeking finds what was already true",
        anchor_refs=["Ezekiel 34:11", "Ezekiel 34:16", "Luke 19:9-10"],
        body=[
            Q("luke", 19, 9, 10),
            Q("ezekiel", 34, 11),
            Q("ezekiel", 34, 16),
            P(
                "Watch the order of the sentence. Salvation comes to the "
                "house of Zacchaeus *forsomuch as he also is a son of "
                "Abraham* — because he is, not so that he might become. The "
                "religious system of his day had written the publican out; "
                "the seeking Shepherd reads the register and finds him still "
                "on it. That is Ezekiel's promise working: *Behold, I, even "
                "I, will both search my sheep, and seek them out... I will "
                "seek that which was lost, and bring again that which was "
                "driven away.* The lost thing sought is a sheep of the "
                "flock before the seeking begins — the finding does not "
                "make him one; it reveals him as one. The Son of Adam came "
                "to seek and to save what was lost, and what was lost was "
                "*his.*"
            ),
        ],
    ),
    dict(
        mark=("luke", 22, 31),
        mirrors=[("amos", 9, 9)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Sift you as wheat — Amos's sieve, in which not the least grain falls",
        anchor_refs=["Amos 9:9", "Luke 22:31-32"],
        body=[
            Q("luke", 22, 31, 32),
            Q("amos", 9, 9),
            P(
                "*Sift you as wheat* is not a loose figure — the sieve is "
                "already in the prophets, and it is the scattering itself: "
                "*I will sift the house of Yashar'el (Israel) among all "
                "nations, like as corn is sifted in a sieve, yet shall not "
                "the least grain fall upon the earth.* The adversary asks "
                "for the sifting hoping the grain will be lost in the "
                "shaking. The promise of the sieve is that it will not be: "
                "the shaking among all nations is violent, but not one "
                "kernel of the true grain hits the ground. And the "
                "intercession — *I have prayed for thee, that thy faith "
                "fail not* — is the promise applied to one man's night, "
                "with the homecoming already assumed: *when thou art "
                "converted,* when you have turned back, strengthen your "
                "brothers."
            ),
        ],
    ),
    # ================= JOHN =================
    dict(
        mark=("john", 1, 51),
        mirrors=[("genesis", 28, 12), ("genesis", 28, 13), ("genesis", 28, 15)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Angels ascending and descending — Jacob's ladder carries Jacob's oath: I will bring thee again",
        anchor_refs=["Genesis 28:12-15", "John 1:47-51"],
        body=[
            Q("john", 1, 47, 51),
            Q("genesis", 28, 12, 15),
            P(
                "To *an Yashar'elite (Israelite) indeed,* Yahusha (Jesus) "
                "gives an Yashar'elite (Israelite) promise: Jacob's ladder, "
                "with the Son of Adam standing where the ladder stood. But "
                "the ladder was never a bare vision — it came wrapped in an "
                "oath. The seed would spread abroad to the west, the east, "
                "the north, and the south; *and* — the clause the inherited "
                "reading forgets — *I will bring thee again into this land; "
                "for I will not leave thee, until I have done that which I "
                "have spoken to thee of.* Scattering and homecoming, sworn "
                "in one breath at Bethel. When Nathanael is told he will "
                "see heaven opened over the Son of Adam, he is being told "
                "the Bethel covenant — spreading abroad and bringing again "
                "— has reached its working day."
            ),
        ],
    ),
    dict(
        mark=("john", 4, 35),
        mirrors=[("amos", 9, 13), ("amos", 9, 14)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Fields white to harvest — said in Samaria, on the ground Jacob gave to Joseph",
        anchor_refs=["Amos 9:13-14", "John 4:4-5", "John 4:35"],
        body=[
            Q("john", 4, 4, 5),
            Q("john", 4, 35),
            Q("amos", 9, 13, 14),
            P(
                "The evangelist sets the scene with surveyor's precision: "
                "Samaria — the old capital territory of the northern house "
                "— at a city *near to the parcel of ground that Jacob gave "
                "to his son Joseph.* On Joseph's own ground, Yahusha "
                "(Jesus) says the fields are white *already*: the harvest "
                "is not four months off, it is standing ripe now. Amos had "
                "promised the northern house a harvest so heavy the "
                "plowman overtakes the reaper — and the next verse says "
                "what the harvest is: *I will bring again the captivity of "
                "my people of Yashar'el (Israel).* The harvest idiom is the "
                "gathering idiom. Where does it ripen first in the record? "
                "In Joseph's field."
            ),
        ],
    ),
    dict(
        mark=("john", 7, 35),
        mirrors=[("zephaniah", 3, 10)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Will he go unto the dispersed? — the crowd asks the question that is the answer",
        anchor_refs=["Zephaniah 3:10", "Isaiah 11:12", "John 7:35"],
        body=[
            Q("john", 7, 35),
            Q("zephaniah", 3, 10),
            Q("isaiah", 11, 12),
            P(
                "When Yahusha (Jesus) says he is going where they cannot "
                "come, the rulers reach — half in mockery — for the only "
                "destination they can think of: *will he go unto the "
                "dispersed among the Gentiles?* The evangelist lets the "
                "question stand, because the question is the answer. The "
                "dispersed are a known address in the prophets: *the "
                "daughter of my dispersed* bringing offering from beyond "
                "the rivers of Ethiopia; the outcasts of Yashar'el "
                "(Israel) and the dispersed of Yahudah (Judah) assembled "
                "from the four corners of the earth under one ensign. The "
                "crowd names the mission field it cannot imagine him "
                "wanting — and names it exactly."
            ),
        ],
    ),
    dict(
        mark=("john", 21, 11),
        mirrors=[("john", 6, 39)],
        strand="gathering",
        strand_label="The gathering",
        card_title="A multitude of great fishes, and the net not broken — the fishers' last lesson",
        anchor_refs=["Matthew 4:19", "John 6:39", "John 21:6-11"],
        body=[
            Q("matthew", 4, 19),
            Q("john", 21, 6),
            Q("john", 21, 11),
            Q("john", 6, 39),
            P(
                "The first call made them fishers of men; the risen "
                "Messiah (Christ)'s last sign is given to them as fishers. "
                "All night, nothing — then the word, the cast, and a "
                "multitude of great fishes so heavy they cannot draw it. "
                "And the detail the eyewitness insists on: *for all there "
                "were so many, yet was not the net broken.* That is the "
                "character of this gathering. The Father's will, already "
                "stated, is *that of all which he hath given me I should "
                "lose nothing* — a net full past reckoning that does not "
                "tear, a catch hauled to shore whole. The fishers sent for "
                "the scattered are sent with that net: the gathering that "
                "holds everything given into it."
            ),
        ],
    ),
    # ================= ACTS =================
    dict(
        mark=("acts", 5, 31),
        mirrors=[("hosea", 14, 1), ("hosea", 14, 2)],
        strand="grace",
        strand_label="The grace",
        card_title="To give repentance to Yashar'el (Israel) — the return Hosea pleaded for, handed over as a gift",
        anchor_refs=["Hosea 14:1-2", "Acts 5:31"],
        body=[
            Q("acts", 5, 31),
            Q("hosea", 14, 1, 2),
            P(
                "Hosea stood at the end of his scroll pleading with the "
                "fallen house: *O Yashar'el (Israel), return unto Yahuah "
                "Elohayka (the LORD thy God)... Take with you words, and "
                "turn.* The plea assumes what the exile proved — that the "
                "fallen do not simply produce the turning out of "
                "themselves. Now hear the apostles: Elohim (God) exalted "
                "him *a Prince and a Saviour, for to give repentance to "
                "Yashar'el (Israel), and forgiveness of sins.* To *give* "
                "repentance. The return is not the price of admission the "
                "scattered must scrape together; it is the first gift the "
                "exalted Prince hands down. Grace is not the opposite of "
                "the turning — grace is what carries the turning to a "
                "people who could not turn themselves."
            ),
        ],
    ),
    dict(
        mark=("acts", 13, 47),
        mirrors=[("isaiah", 49, 12)],
        strand="good_news",
        strand_label="The good news",
        card_title="A light of the nations — Paul claims the verse that begins with raising the tribes of Jacob",
        anchor_refs=["Isaiah 49:6", "Isaiah 49:12", "Acts 13:47"],
        body=[
            Q("acts", 13, 47),
            Q("isaiah", 49, 6),
            Q("isaiah", 49, 12),
            P(
                "Paul names his commission with a quotation, and the "
                "quotation has a first half he expects his hearers to "
                "know. The servant's verse does not begin at *light of the "
                "Gentiles* — it begins, *to raise up the tribes of Jacob, "
                "and to restore the preserved of Yashar'el (Israel).* The "
                "light that goes out to the nations and the raising of the "
                "tribes are one assignment, not two; the light travels to "
                "the ends of the earth because the ends of the earth is "
                "where the preserved are kept. Isaiah even sketches the "
                "return route: *these shall come from far... from the "
                "north and from the west... from the land of Sinim.* The "
                "mission Paul is defending is the prophetic gathering, "
                "carried to its field."
            ),
        ],
    ),
    # ================= EPISTLES =================
    dict(
        mark=("romans", 8, 19),
        mirrors=[("deuteronomy", 14, 1)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The manifestation of the sons of Elohim (God) — sons unveiled, not sons manufactured",
        anchor_refs=["Deuteronomy 14:1", "Hosea 1:10", "Romans 8:19-23"],
        body=[
            Q("romans", 8, 19),
            Q("romans", 8, 23),
            Q("deuteronomy", 14, 1),
            Q("hosea", 1, 10),
            P(
                "*Manifestation* is an unveiling word — the showing of "
                "something that exists and is hidden. Creation is not "
                "waiting for sons to be invented; it is waiting for sons "
                "already in the world to be *revealed,* because for long "
                "ages the sons have been indistinguishable from the "
                "nations they were scattered into. Moses named them at the "
                "start: *Ye are the children of Yahuah Elohaychem (the "
                "LORD your God).* Hosea promised the hidden years would "
                "end on a sentence: in the place where it was said *ye are "
                "not my people,* there they would be called *the sons of "
                "the living Elohim (God).* The adoption Paul waits for is "
                "the placing of those sons back into their own "
                "inheritance — the unveiling the whole creation groans "
                "toward."
            ),
        ],
    ),
    dict(
        mark=("romans", 9, 27),
        mirrors=[("isaiah", 10, 22)],
        strand="gathering",
        strand_label="The gathering",
        card_title="A remnant shall be saved — Paul reads Isaiah's 'shall return' and says 'saved'",
        anchor_refs=["Isaiah 10:22", "Romans 9:27"],
        body=[
            Q("romans", 9, 27),
            Q("isaiah", 10, 22),
            P(
                "Set the two sentences side by side and watch one word. "
                "Isaiah: though thy people Yashar'el (Israel) be as the "
                "sand of the sea, *a remnant of them shall return.* Paul, "
                "quoting him: *a remnant shall be saved.* Paul is not "
                "miscopying — he is translating, and the translation is "
                "the whole doctrine. In the prophets' grammar, to be saved "
                "*is* to return: salvation for a scattered people is the "
                "homecoming, and the remnant is the company that makes the "
                "journey. The sand-of-the-sea multitude is the scattered "
                "house grown numberless in its dispersion; out of that "
                "multitude, the returning remnant is the saved. Paul "
                "crying Isaiah over Yashar'el (Israel) is the gathering "
                "preached in one verse."
            ),
        ],
    ),
    dict(
        mark=("1-corinthians", 10, 1),
        mirrors=[("exodus", 13, 21)],
        strand="teaching",
        strand_label="The teaching",
        card_title="All our fathers were under the cloud — Paul hands the Corinthians their family history",
        anchor_refs=["Exodus 13:21", "1 Corinthians 10:1-4"],
        body=[
            Q("1-corinthians", 10, 1),
            Q("1-corinthians", 10, 4),
            Q("exodus", 13, 21),
            P(
                "Read the possessive. Writing to an assembly in Greece — "
                "people the inherited reading calls Gentile converts with "
                "no stake in Sinai — Paul says *our fathers,* and says "
                "*all*: all under the cloud, all through the sea, all fed "
                "and watered from the Rock, and *that Rock was Messiah "
                "(Christ).* He does not say *the* fathers, or *Israel's* "
                "fathers, as a stranger would. He hands the Corinthians "
                "the Exodus as their own family history, without a "
                "footnote, because that is who he understood his hearers "
                "to be: seed of the scattered house, living among the "
                "nations, being taught the story of their own fathers — "
                "and warned by it, as sons are warned by a father's "
                "record."
            ),
        ],
    ),
    dict(
        mark=("galatians", 3, 13),
        mirrors=[("deuteronomy", 21, 23), ("deuteronomy", 30, 1)],
        strand="grace",
        strand_label="The grace",
        card_title="Redeemed from the curse of the law — the curse is the exile sentence, not the Torah",
        anchor_refs=[
            "Deuteronomy 21:23",
            "Deuteronomy 28:64",
            "Deuteronomy 30:1",
            "Galatians 3:13-14",
        ],
        body=[
            Q("galatians", 3, 13, 14),
            Q("deuteronomy", 21, 23),
            Q("deuteronomy", 28, 64),
            Q("deuteronomy", 30, 1),
            P(
                "What is *the curse of the law*? Not the Torah — the Torah "
                "pronounces the curse and is not the curse. The curse is "
                "the sentence written into the covenant for breaking it: "
                "*Yahuah (LORD) shall scatter thee among all people, from "
                "the one end of the earth even unto the other.* That is "
                "the judgment the scattered house was living under. "
                "Messiah (Christ) was made a curse — hanged on the tree, "
                "bearing the accursed death the Torah itself names — to "
                "open the way home through that sentence, *that the "
                "blessing of Abraham might come on the Gentiles,* on the "
                "seed dwelling out among the nations where the curse had "
                "driven them. And the covenant had always said where the "
                "curse-road turns: when you call it to mind *among all the "
                "nations, whither Yahuah Elohayka (the LORD thy God) hath "
                "driven thee* — and return. Redeemed from the exile, back "
                "to the covenant. Never from the covenant itself."
            ),
        ],
    ),
    dict(
        mark=("galatians", 4, 27),
        mirrors=[("isaiah", 54, 1)],
        strand="good_news",
        strand_label="The good news",
        card_title="The desolate hath many more children — Isaiah's song to the cast-off wife",
        anchor_refs=["Isaiah 54:1", "Isaiah 54:6-7", "Galatians 4:27"],
        body=[
            Q("galatians", 4, 27),
            Q("isaiah", 54, 1),
            Q("isaiah", 54, 6, 7),
            P(
                "Paul seals his argument with a song, and the song has an "
                "addressee. Isaiah 54 is sung to the forsaken wife — the "
                "woman called *as a woman forsaken and grieved in spirit... "
                "when thou wast refused* — the house put away, whom Yahuah "
                "(LORD) promises to gather with great mercies after the "
                "small moment of abandonment. Her barrenness was the "
                "scattering: cut off, desolate, bearing no children inside "
                "the covenant. And the promise is arithmetic: *more are "
                "the children of the desolate than the children of the "
                "married wife.* The cast-off house, multiplied in her "
                "exile beyond counting, comes home with more children than "
                "the house that stayed. Paul cites her song to the "
                "Galatians because they are her children — the desolate "
                "woman's many, being born back."
            ),
        ],
    ),
    dict(
        mark=("ephesians", 1, 10),
        mirrors=[("ezekiel", 37, 19)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Gather together in one all things in Messiah (Christ) — the one in his hand",
        anchor_refs=["Ezekiel 37:19", "John 11:52", "Ephesians 1:10"],
        body=[
            Q("ephesians", 1, 10),
            Q("ezekiel", 37, 19),
            Q("john", 11, 52),
            P(
                "*Gather together in one* — the phrase has a pedigree. "
                "Ezekiel's two sticks, Joseph's and Yahudah (Judah)'s, are "
                "joined so that *they shall be one in mine hand*: the two "
                "scattered houses made one nation again, held in a single "
                "grip. John had already used the same gathering-in-one "
                "language for the death of Yahusha (Jesus): *that also he "
                "should gather together in one the children of Elohim "
                "(God) that were scattered abroad.* So when Paul names the "
                "purpose of the fulness of times — to gather together in "
                "one all things in Messiah (Christ) — he is naming the "
                "stick-joining as the axis of the whole administration of "
                "the age. The dispensation of the fulness of times is the "
                "gathering, and the one it gathers into is *him.*"
            ),
        ],
    ),
    dict(
        mark=("ephesians", 2, 12),
        mirrors=[("ezekiel", 11, 16)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Far off among the heathen — the exile's word, and the little sanctuary in the countries",
        anchor_refs=["Ezekiel 11:16", "Isaiah 57:19", "Ephesians 2:12-13"],
        body=[
            Q("ephesians", 2, 12),
            Q("ephesians", 2, 13),
            Q("ezekiel", 11, 16),
            Q("isaiah", 57, 19),
            P(
                "*Far off* is not a spatial pleasantry — it is the "
                "prophets' technical word for the scattered. *Although I "
                "have cast them far off among the heathen, and although I "
                "have scattered them among the countries* — Ezekiel's "
                "far-off are the exiled of Yashar'el (Israel), to whom "
                "Yahuah (God) promises to be a little sanctuary in the "
                "very countries of their scattering. Isaiah's peace is "
                "spoken to the same two parties Paul addresses: *to him "
                "that is far off, and to him that is near.* Aliens from "
                "the commonwealth of Yashar'el (Israel), strangers from "
                "the covenants of promise — estranged from what was "
                "theirs, not foreign to it. The far-off are the cast-off; "
                "being *made nigh by the blood of Messiah (Christ)* is the "
                "homecoming of the cast-off, by the door the covenant "
                "opened."
            ),
        ],
    ),
    dict(
        mark=("colossians", 1, 13),
        mirrors=[("daniel", 7, 18)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Translated into the kingdom of his dear Son — Daniel's transfer of the kingdom",
        anchor_refs=["Daniel 7:18", "Daniel 7:27", "Colossians 1:13"],
        body=[
            Q("colossians", 1, 13),
            Q("daniel", 7, 18),
            Q("daniel", 7, 27),
            P(
                "*Translated* is a transfer word — subjects moved from one "
                "dominion into another. Daniel saw the transfer from the "
                "throne side: the kingdom taken from the beasts and given, "
                "*the saints of the El Elyon (most High) shall take the "
                "kingdom, and possess the kingdom for ever,* the greatness "
                "of the kingdom under the whole heaven given to the people "
                "of the saints. Paul writes from inside the same transfer, "
                "in the present tense of those already delivered from the "
                "power of darkness and moved into the dominion of the dear "
                "Son. The kingdom is not an idea the believer subscribes "
                "to — it is the dominion Daniel watched change hands, and "
                "the deliverance is the changing of whose subjects the "
                "delivered are."
            ),
        ],
    ),
    dict(
        mark=("hebrews", 11, 13),
        mirrors=[("genesis", 47, 9), ("psalms", 39, 12)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Strangers and pilgrims seeking a country — the fathers' confession, and the fathers' wait",
        anchor_refs=["Genesis 47:9", "Psalm 39:12", "Hebrews 11:13-16", "Hebrews 11:39-40"],
        body=[
            Q("hebrews", 11, 13, 16),
            Q("genesis", 47, 9),
            Q("psalms", 39, 12),
            Q("hebrews", 11, 39, 40),
            P(
                "*Strangers and pilgrims* is not the writer's coinage — it "
                "is the fathers' own confession, on record. Jacob before "
                "Pharaoh: *the days of the years of my pilgrimage.* David "
                "before Yahuah (LORD): *I am a stranger with thee, and a "
                "sojourner, as all my fathers were.* The whole family line "
                "has always known itself to be en route — embracing the "
                "promises afar off, seeking the country Elohim (God) "
                "prepared, refusing to count any present address as home. "
                "And the closing word binds the generations into one "
                "arrival: the fathers received not the promise, *that they "
                "without us should not be made perfect.* The sleeping "
                "fathers and the scattered children are perfected "
                "*together* — one promise, one country, one homecoming "
                "that no generation enters alone."
            ),
        ],
    ),
    dict(
        mark=("1-peter", 2, 25),
        mirrors=[("isaiah", 53, 6)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Ye were as sheep going astray, but are now returned — the dispersion's own verb",
        anchor_refs=["Isaiah 53:6", "1 Peter 1:1", "1 Peter 2:25"],
        body=[
            Q("1-peter", 2, 25),
            Q("isaiah", 53, 6),
            Q("1-peter", 1, 1),
            P(
                "The letter is addressed to *the strangers scattered* — "
                "the dispersion of Pontus, Galatia, Cappadocia, Asia, and "
                "Bithynia. To them Peter writes the straying-sheep "
                "confession of Isaiah 53 — *all we like sheep have gone "
                "astray* — and then closes it with the prophets' own "
                "homecoming verb: *but are now RETURNED unto the "
                "Shepherd and Bishop of your souls.* Not recruited. Not "
                "adopted in from outside. Returned — the word that only "
                "fits something coming back to where it belonged. The "
                "scattered strangers who hear the Shepherd's voice and "
                "turn are sheep of his flock coming home; the laid-on-him "
                "iniquity of Isaiah 53 is what opened the road they are "
                "returning on."
            ),
        ],
    ),
    # ================= REVELATION =================
    dict(
        mark=("revelation", 20, 6),
        mirrors=[("isaiah", 61, 6)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Priests of Elohim (God), reigning with him — the kingdom of priests, kept on schedule",
        anchor_refs=["Exodus 19:6", "Isaiah 61:6", "Revelation 20:6"],
        body=[
            Q("revelation", 20, 6),
            Q("exodus", 19, 6),
            Q("isaiah", 61, 6),
            P(
                "The office named at the first resurrection is the office "
                "named at Sinai: *ye shall be unto me a kingdom of "
                "priests.* Isaiah carried it forward to the restored — *ye "
                "shall be named the Priests of Yahuah (LORD): men shall "
                "call you the Ministers of our Elohim (God)* — a gathered "
                "people serving as priesthood, with the nations around "
                "them. Revelation shows the appointment kept: *priests of "
                "Elohim (God) and of Messiah (Christ),* reigning with him. "
                "The priestly calling given to Yashar'el (Israel) at the "
                "mountain was never revoked and never reassigned; it waits "
                "through the whole scattering for the company that comes "
                "through gathered, sifted, and raised — and then it is "
                "worn, in the reign, as it was spoken."
            ),
        ],
    ),
]

# ===== EXHAUSTIVE WAVE 3: THE SEED =====
CARDS += [


    # ── 1. The seed war — Genesis 3:15 to Revelation 12:17 ──────────────────
    dict(
        mark=("genesis", 3, 15),
        mirrors=[("revelation", 12, 17)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="The seed war — from the garden to the remnant of her seed",
        anchor_refs=["Genesis 3:15", "Revelation 12:17"],
        body=[
            Q("genesis", 3, 15),
            Q("revelation", 12, 17),
            P("The first promise in the canon is a war between two seeds — the serpent's and the woman's — and the canon's last book finds the same war still running. The dragon is wroth with the woman and makes war with the remnant of her seed, and the remnant is identified by two marks: they keep the commandments of Elohim (God), and they hold the testimony of Yahusha HaMashiach (Jesus Christ)."),
            P("The seed is a line, hunted from the garden gate to the end of the age. The head-bruising promised at the beginning and the remnant standing at the end are one story: the seed survives the war."),
        ],
    ),

    # ── 2. Genesis 12:7 — the first 'thy seed' spoken to Abram ──────────────
    dict(
        mark=("genesis", 12, 7),
        mirrors=[("genesis", 24, 7), ("joshua", 24, 3), ("nehemiah", 9, 8)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Unto thy seed will I give this land — the first seed-promise to Abram",
        anchor_refs=["Genesis 12:7", "Genesis 24:7", "Nehemiah 9:8"],
        body=[
            Q("genesis", 12, 7),
            Q("genesis", 24, 7),
            Q("joshua", 24, 3),
            Q("nehemiah", 9, 8),
            P("The first time the words thy seed are spoken to Abram, they come with a deed of land attached. Abraham stakes his son's marriage on that word; Joshua recites it to the tribes as performed history; the Levites of Nehemiah's day confess it back to Yahuah (God) as a word already kept. The land was given to a seed — a bloodline with a name and a grant — not to a category anyone can enter by claiming it."),
        ],
    ),

    # ── 3. Genesis 13:15-16 — the land for ever, the seed as dust ────────────
    dict(
        mark=("genesis", 13, 15),
        mirrors=[("genesis", 13, 16)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="To thy seed for ever — the land deeded and the dust uncounted",
        anchor_refs=["Genesis 13:15-16"],
        body=[
            Q("genesis", 13, 15, 16),
            P("Two words carry this promise past every theology that retires it: for ever. The grant to the seed has no expiration clause, and the seed itself is measured against the dust — a count no census can take. A seed scattered beyond human numbering is built into the promise from the start, and a seed beyond numbering is a seed Yahuah (God) never lost count of."),
        ],
    ),

    # ── 4. Genesis 15 — stars, the four hundred years, the river-to-river deed
    dict(
        mark=("genesis", 15, 5),
        mirrors=[("genesis", 15, 13), ("genesis", 15, 18)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="So shall thy seed be — the stars, the four hundred years, and the covenant cut",
        anchor_refs=["Genesis 15:5-18", "Acts 7:5-6", "Genesis 46:6-7"],
        body=[
            Q("genesis", 15, 5),
            Q("genesis", 15, 13),
            Q("genesis", 15, 18),
            Q("acts", 7, 5, 6),
            Q("genesis", 46, 6, 7),
            P("The covenant of the pieces names the seed's whole itinerary before Abram has a single child: stars for number, a strange land and four hundred years of affliction, then the grant from the river of Egypt to Euphrates. Jacob goes down to Egypt with all his seed on schedule, and Stephen stands on this exact chapter when he retells the story to the council. The promise was spoken to seed not yet born — and it kept its appointments."),
        ],
    ),

    # ── 5. Genesis 17:7-10 — the everlasting covenant with the generations ──
    dict(
        mark=("genesis", 17, 7),
        mirrors=[("genesis", 17, 8), ("genesis", 17, 9)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="An everlasting covenant — to be Elohim (God) to thee and to thy seed after thee",
        anchor_refs=["Genesis 17:7-10"],
        body=[
            Q("genesis", 17, 7, 10),
            P("The covenant is named everlasting and it is attached to generations — thy seed after thee in their generations — a bloodline running forward through time. The heart of it is not the land clause but the belonging clause: to be a Elohim (God) unto thee, and to thy seed after thee. The token of circumcision follows the covenant in verse ten; it does not create the covenant. The flesh-mark marks what the promise already made."),
        ],
    ),

    # ── 6. Genesis 21:12 — in Isaac shall thy seed be called ────────────────
    dict(
        mark=("genesis", 21, 12),
        mirrors=[("genesis", 17, 19), ("genesis", 21, 13), ("hebrews", 11, 11)],
        strand="teaching",
        strand_label="The teaching",
        card_title="In Isaac shall thy seed be called — the promise selects within the blood",
        anchor_refs=["Genesis 21:12-13", "Genesis 17:19", "Hebrews 11:11"],
        body=[
            Q("genesis", 17, 19),
            Q("genesis", 21, 12, 13),
            Q("genesis", 16, 10),
            Q("hebrews", 11, 11),
            P("Ishmael is Abraham's seed — the text says so plainly, and his own multiplication promise is real. Yet the covenant-call runs through Isaac, the son Sarah conceived by strength received through faith in him who promised. The promise never opens the line outward to those who are not Abraham's blood; it selects within the blood, son by son. Both pieces are required of the seed of promise: the bloodline, and the promise spoken over it."),
        ],
    ),

    # ── 7. Genesis 22:17 — the oath at Moriah ────────────────────────────────
    dict(
        mark=("genesis", 22, 17),
        mirrors=[("genesis", 24, 60), ("genesis", 32, 12)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Stars, sand, and the gate of his enemies — the oath sworn at Moriah",
        anchor_refs=["Genesis 22:17-18", "Genesis 32:12", "Isaiah 48:19"],
        body=[
            Q("genesis", 22, 17),
            Q("genesis", 22, 18),
            Q("genesis", 24, 60),
            Q("genesis", 32, 12),
            Q("isaiah", 48, 19),
            P("After Moriah the promise becomes an oath. Rebekah's family blesses her with its very words before she has met Isaac; Jacob, alone at the river with Esau coming, pleads the sand of the sea back to the one who said it. Generations later Isaiah laments with the same sand on his tongue — thy seed also had been as the sand — naming what a generation's rebellion forfeited. The generation lost its enjoying of the oath; the oath itself was never lost. And the nations are blessed in the seed — the blessing flows through the seed to the nations; it does not turn the nations into the seed."),
        ],
    ),

    # ── 8. Genesis 26 — the oath lands on Isaac ──────────────────────────────
    dict(
        mark=("genesis", 26, 3),
        mirrors=[("genesis", 26, 4), ("genesis", 26, 24)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="I will perform the oath — the seed-promise passes whole to Isaac",
        anchor_refs=["Genesis 26:3-4", "Genesis 26:24"],
        body=[
            Q("genesis", 26, 3, 4),
            Q("genesis", 26, 24),
            P("The promise does not have to be re-earned in each generation; it is performed into the next one. To Isaac the oath sworn to Abraham arrives intact — the countries, the stars-count, the blessing of the nations in the seed — and when fear finds him at Beer-sheba the word comes again at night: for my servant Abraham's sake. The seed inherits a sworn oath, not a probation."),
        ],
    ),

    # ── 9. Genesis 28:4 — the blessing of Abraham, spread abroad ────────────
    dict(
        mark=("genesis", 28, 4),
        mirrors=[],
        strand="gathering",
        strand_label="The gathering",
        card_title="The blessing of Abraham to Jacob — a seed spread to the four winds",
        anchor_refs=["Genesis 28:4", "Genesis 28:13-14"],
        body=[
            Q("genesis", 28, 4),
            Q("genesis", 28, 13, 14),
            P("Isaac names the inheritance the blessing of Abraham and sends it to Jacob and to his seed; at Bethel Yahuah (God) confirms it with the four compass points — thou shalt spread abroad to the west, and to the east, and to the north, and to the south. The spreading of the seed through the earth sits inside the promise itself. The scattering was never plan B, and a seed spread to the four winds is a seed the four winds must one day give back."),
        ],
    ),

    # ── 10. Genesis 35:12 / 48 — the deathbed transfer and Ephraim's nations ─
    dict(
        mark=("genesis", 35, 12),
        mirrors=[("genesis", 48, 4), ("genesis", 48, 11)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The land to thy seed after thee — and Ephraim's seed a multitude of nations",
        anchor_refs=["Genesis 35:12", "Genesis 48:4", "Genesis 48:19"],
        body=[
            Q("genesis", 35, 12),
            Q("genesis", 48, 4),
            Q("genesis", 48, 11),
            Q("genesis", 48, 19),
            P("What Jacob heard at Bethel he carries whole to his deathbed — the land, the seed after him, the possession he now names everlasting — and then, hands crossed against Joseph's protest, he sends Ephraim's seed out into a multitude of nations. That sentence is the map of the scattered house: seed planted among the nations is still seed. A multitude of nations carrying Ephraim's blood is not a multitude that replaced Yashar'el (Israel) — it is Yashar'el (Israel), waiting to be called by name."),
        ],
    ),

    # ── 11. Exodus 32:13 — Moses pleads the seed-oath at the calf ───────────
    dict(
        mark=("exodus", 32, 13),
        mirrors=[("exodus", 33, 1), ("deuteronomy", 34, 4)],
        strand="grace",
        strand_label="The grace",
        card_title="Remember Abraham, Isaac, and Yashar'el (Israel) — Moses pleads the seed-oath",
        anchor_refs=["Exodus 32:13", "Exodus 33:1", "Deuteronomy 34:4"],
        body=[
            Q("exodus", 32, 13),
            Q("exodus", 33, 1),
            Q("deuteronomy", 34, 4),
            P("At the golden calf, with the covenant freshly shattered in the camp, Moses does not plead the people's merit — there is none to plead. He pleads the oath: thou swarest by thine own self to multiply their seed and give them the land for ever. And the journey resumes on the strength of that oath alone. From Sinai to Pisgah the seed travels on a promise it had just finished breaking faith with — grace as the means of return, written into the wilderness itself."),
        ],
    ),

    # ── 12. Deuteronomy 4:37 — he chose their seed after them ───────────────
    dict(
        mark=("deuteronomy", 4, 37),
        mirrors=[("deuteronomy", 10, 15), ("deuteronomy", 1, 8), ("psalms", 105, 6), ("1-chronicles", 16, 13)],
        strand="teaching",
        strand_label="The teaching",
        card_title="Because he loved thy fathers, he chose their seed — election runs through blood",
        anchor_refs=["Deuteronomy 4:37", "Deuteronomy 10:15", "Psalm 105:6-11"],
        body=[
            Q("deuteronomy", 4, 37),
            Q("deuteronomy", 10, 15),
            Q("psalms", 105, 6),
            Q("psalms", 105, 8, 11),
            Q("numbers", 14, 24),
            P("The order of the sentence is the whole doctrine: he loved the fathers, therefore he chose their seed after them. The choosing runs through blood, from the fathers forward — a covenant remembered to a thousand generations — not through enrollment. And within the chosen seed, Caleb shows what the choosing looks like when it is walked: another spirit, a whole following, and an inheritance secured to his seed while an unbelieving generation fell in the wilderness. The promise selects within the line; it does not recruit outside it."),
        ],
    ),

    # ── 13. Deuteronomy 30:19 — life set before the seed; the song in its mouth
    dict(
        mark=("deuteronomy", 30, 19),
        mirrors=[("deuteronomy", 28, 46), ("deuteronomy", 31, 21)],
        strand="grace",
        strand_label="The grace",
        card_title="That thou and thy seed may live — the choice, the curse-sign, and the song the seed cannot forget",
        anchor_refs=["Deuteronomy 30:19", "Deuteronomy 31:21", "Isaiah 59:21"],
        body=[
            Q("deuteronomy", 30, 19),
            Q("deuteronomy", 30, 6),
            Q("deuteronomy", 28, 46),
            Q("deuteronomy", 31, 21),
            Q("isaiah", 59, 21),
            P("Moses sets life and death before the seed and tells it which to choose. When the seed chooses wrongly, the curses of the covenant sit upon it for a sign — visible on the seed for ever, so the exile itself testifies to the covenant that judged it. But two promises ride through the judgment: the song that shall not be forgotten out of the mouths of their seed, and the circumcised heart Yahuah Elohayka (the LORD thy God) himself will give the seed so it can love him and live. Isaiah hears the same covenant from the other side of the exile — my words shall not depart out of the mouth of thy seed, nor thy seed's seed, from henceforth and for ever. The seed can lose the land for a season. It cannot lose the Word planted in its mouth."),
        ],
    ),

    # ── 14. Numbers 24:7 — his seed in many waters ──────────────────────────
    dict(
        mark=("numbers", 24, 7),
        mirrors=[],
        strand="gathering",
        strand_label="The gathering",
        card_title="His seed shall be in many waters — Balaam sees the scattering from the heights",
        anchor_refs=["Numbers 24:7", "Revelation 17:15"],
        body=[
            Q("numbers", 24, 7),
            Q("revelation", 17, 15),
            P("Hired to curse, Balaam can only bless — and the blessing he speaks over Jacob's tents reaches centuries past the camp below him: his seed shall be in many waters. The canon elsewhere reads its own picture of many waters — peoples, and multitudes, and nations, and tongues. A seed poured out into many peoples, and over it a king higher than Agag and a kingdom exalted. The seed in the waters is not dissolved by them; it is waiting in them."),
        ],
    ),

    # ── 15. Numbers 25:13 / 18:19 — the priestly seed covenanted ────────────
    dict(
        mark=("numbers", 25, 13),
        mirrors=[("numbers", 18, 19)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="A covenant of salt and an everlasting priesthood — the promises to the priestly seed",
        anchor_refs=["Numbers 25:12-13", "Numbers 18:19", "Malachi 2:4-5"],
        body=[
            Q("numbers", 18, 19),
            Q("numbers", 25, 12, 13),
            Q("malachi", 2, 4, 5),
            P("The priesthood, too, is covenanted to a seed: Aaron's portion sealed with salt to him and his seed with him, and Phinehas given an everlasting priesthood to him and his seed after him. When Malachi confronts a corrupt serving generation, the appeal is back to that same covenant with Levi — life and peace given to a man who feared. The failure of a generation does not dissolve a covenant made with a seed; it summons the seed back to the covenant."),
        ],
    ),

    # ── 16. Leviticus 26:42-45 — the covenant remembered in the enemies' land
    dict(
        mark=("leviticus", 26, 42),
        mirrors=[("leviticus", 26, 44), ("leviticus", 26, 45)],
        strand="grace",
        strand_label="The grace",
        card_title="Then will I remember my covenant — the seed kept in the land of their enemies",
        anchor_refs=["Leviticus 26:40-45"],
        body=[
            Q("leviticus", 26, 40, 42),
            Q("leviticus", 26, 44, 45),
            P("Torah writes the whole exile arc in advance: the walking contrary, the enemies' land, the humbled heart — and then the remembering, name by name in reverse, Jacob, Isaac, Abraham, and the land itself. Even at the farthest point of the judgment the verdict over the seed stands: I will not cast them away, neither will I abhor them, to destroy them utterly. The covenant of the ancestors is remembered for their sakes. The way home is written into the same chapter as the scattering — grace as the means of return, in Torah's own hand."),
        ],
    ),

    # ── 17. Ezekiel 20:5 — the hand lifted up to the seed of the house of Jacob
    dict(
        mark=("ezekiel", 20, 5),
        mirrors=[("ezekiel", 20, 42)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The hand lifted up to the seed of the house of Jacob",
        anchor_refs=["Ezekiel 20:5", "Ezekiel 20:41-42"],
        body=[
            Q("ezekiel", 20, 5),
            Q("ezekiel", 20, 35),
            Q("ezekiel", 20, 37),
            Q("ezekiel", 20, 41, 42),
            P("Ezekiel's covenant lawsuit opens with an oath sworn to a seed: the hand lifted up to the seed of the house of Jacob in Egypt, before Sinai, before the rebellions. And the chapter closes with the same lifted hand bringing the seed home — out of the countries, through the wilderness of the people, under the rod, into the bond of the covenant, into the land sworn to the fathers. The gathering runs between two raisings of one hand. The seed sworn-to in Egypt is the seed pleaded-with face to face at the end."),
        ],
    ),

    # ── 18. 2 Samuel 7:12 — the covenant with David's seed ──────────────────
    dict(
        mark=("2-samuel", 7, 12),
        mirrors=[("1-chronicles", 17, 11), ("2-samuel", 22, 51), ("psalms", 18, 50)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="I will set up thy seed after thee — the covenant with the house of David",
        anchor_refs=["2 Samuel 7:12", "2 Samuel 22:51", "Luke 1:32-33"],
        body=[
            Q("2-samuel", 7, 12),
            Q("2-samuel", 22, 51),
            Q("luke", 1, 32, 33),
            P("The kingdom is promised to seed that proceeds out of David's own body — the words are that physical. David's last song holds it as mercy to his anointed, to David, and to his seed for evermore, and the announcement at Nazareth lands it without changing a term: the throne of his father David, the house of Jacob, a kingdom of which there shall be no end. The covenant that began in David's bowels ends on David's throne."),
        ],
    ),

    # ── 19. Psalm 89 — the seed-oath sworn by holiness ──────────────────────
    dict(
        mark=("psalms", 89, 4),
        mirrors=[("psalms", 89, 29), ("psalms", 89, 36)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Once have I sworn by my holiness — David's seed established for ever",
        anchor_refs=["Psalm 89:3-4", "Psalm 89:29", "Psalm 89:35-36"],
        body=[
            Q("psalms", 89, 3, 4),
            Q("psalms", 89, 29),
            Q("psalms", 89, 35, 36),
            P("Three times in one psalm the seed-word is sworn — established for ever, enduring as the days of heaven, enduring as the sun. And between the second and third comes the stake itself: once have I sworn by my holiness that I will not lie unto David. The endurance of David's seed is the collateral of Yahuah (God)'s own truthfulness. A theology in which that seed-line failed has called the oath a lie."),
        ],
    ),

    # ── 20. Jeremiah 33:22 — David's seed multiplied as the host of heaven ──
    dict(
        mark=("jeremiah", 33, 22),
        mirrors=[],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="As the host of heaven cannot be numbered — the seed of David multiplied",
        anchor_refs=["Jeremiah 33:22", "Jeremiah 33:25-26", "Jeremiah 22:30"],
        body=[
            Q("jeremiah", 22, 30),
            Q("1-kings", 11, 39),
            Q("jeremiah", 33, 22),
            Q("jeremiah", 33, 25, 26),
            P("The same prophet who writes Coniah down as childless for the throne swears, in the same book, that David's seed will be multiplied past counting and that casting off the seed of Jacob would require unmaking day and night first. The affliction of David's seed was real — and time-stamped: but not for ever. The judgment narrowed the line; it never ended it. The captivity returns, and mercy returns with it."),
        ],
    ),

    # ── 21. Romans 1:3 — the seed of David according to the flesh ───────────
    dict(
        mark=("romans", 1, 3),
        mirrors=[("john", 7, 42), ("2-timothy", 2, 8), ("acts", 13, 23)],
        strand="good_news",
        strand_label="The good news",
        card_title="Of this man's seed — the Saviour raised from David's blood",
        anchor_refs=["Romans 1:3", "Acts 13:23", "2 Timothy 2:8"],
        body=[
            Q("romans", 1, 3),
            Q("john", 7, 42),
            Q("acts", 13, 23),
            Q("2-timothy", 2, 8),
            P("The apostles never announce a Messiah (Christ) abstracted from lineage. The credential they preach is seed: made of the seed of David according to the flesh; of this man's seed hath Elohim (God) according to his promise raised unto Yashar'el (Israel) a Saviour, Yahusha (Jesus). Even the crowd in John knows the scripture's requirement — Messiah (Christ) comes of the seed of David, out of Bethlehem. Paul compresses his whole proclamation into one line to Timothy and puts the bloodline inside it: remember the seed. That is his gospel."),
        ],
    ),

    # ── 22. Isaiah 53:10 — he shall see his seed ────────────────────────────
    dict(
        mark=("isaiah", 53, 10),
        mirrors=[("psalms", 22, 23), ("psalms", 22, 30)],
        strand="good_news",
        strand_label="The good news",
        card_title="He shall see his seed — the travail of the servant and the seed that serves",
        anchor_refs=["Isaiah 53:10-11", "Psalm 22:23", "Psalm 22:30"],
        body=[
            Q("isaiah", 53, 10, 11),
            Q("psalms", 22, 23),
            Q("psalms", 22, 30),
            P("When the servant's soul is made an offering for sin, the stated yield is seed: he shall see his seed, he shall prolong his days. Psalm 22 walks the same suffering and arrives at the same place — the seed of Jacob and the seed of Yashar'el (Israel) summoned to glorify him, and a seed accounted to Yahuah (Lord) for a generation. The atonement has named beneficiaries. The travail of his soul purchases the gathering of the seed."),
        ],
    ),

    # ── 23. Psalm 102:28 — the servants' seed established ───────────────────
    dict(
        mark=("psalms", 102, 28),
        mirrors=[("psalms", 69, 36), ("psalms", 25, 13)],
        strand="kingdom",
        strand_label="The kingdom",
        card_title="Their seed shall be established before thee — the inheritance of the servants' seed",
        anchor_refs=["Psalm 102:28", "Psalm 69:35-36", "Psalm 25:13"],
        body=[
            Q("psalms", 102, 28),
            Q("psalms", 69, 35, 36),
            Q("psalms", 25, 13),
            P("Inheritance language in the Psalms is seed language. Zion is built, the cities of Yahudah (Judah) are raised, and the named heirs are the seed of his servants — continuing, established before him, dwelling in possession. The earth the meek inherit is inherited by a bloodline of servants whose seed Yahuah (God) keeps before his own face."),
        ],
    ),

    # ── 24. Jeremiah 31:36-37 — the seed indexed to the ordinances of heaven ─
    dict(
        mark=("jeremiah", 31, 36),
        mirrors=[("jeremiah", 31, 37)],
        strand="gathering",
        strand_label="The gathering",
        card_title="If heaven above can be measured — the seed of Yashar'el (Israel) shall not cease",
        anchor_refs=["Jeremiah 31:35-37"],
        body=[
            Q("jeremiah", 31, 35, 37),
            P("These verses stand directly after the new covenant promise, and they are its guarantee clause. The permanence of the seed of Yashar'el (Israel) is indexed to the sun, the moon, the stars, and the unmeasured deep — and the casting-off is made conditional on a surveyor's impossibility: measure heaven first. Note whom the oath covers — all the seed of Yashar'el (Israel) for all that they have done. The seed is kept not because it behaved, but because he swore. Any teaching in which that seed ceased and something else stands in its place has, on the text's own terms, measured heaven."),
        ],
    ),

    # ── 25. Jeremiah 46:27 — the seed scattered, the seed saved from far ────
    dict(
        mark=("jeremiah", 46, 27),
        mirrors=[("psalms", 106, 27), ("2-kings", 17, 20)],
        strand="gathering",
        strand_label="The gathering",
        card_title="Thy seed from the land of their captivity — the scattering named and answered",
        anchor_refs=["Psalm 106:27", "2 Kings 17:20", "Jeremiah 46:27"],
        body=[
            Q("psalms", 106, 27),
            Q("2-kings", 17, 20),
            Q("jeremiah", 30, 10),
            Q("jeremiah", 46, 27),
            Q("isaiah", 43, 5),
            P("The scattering is written in seed-grammar: their seed overthrown among the nations, all the seed of Yashar'el (Israel) rejected and delivered to spoilers. And the regathering answers in the same grammar — Jeremiah carries the promise twice, near word for word: I will save thee from afar, and thy seed from the land of their captivity; and Isaiah from both horizons: I will bring thy seed from the east, and gather thee from the west. What was scattered is what is gathered. The promise does not replace the overthrown seed with a different people — it goes and gets the seed."),
        ],
    ),

    # ── 26. Isaiah 41:8 — the seed of Abraham my friend, not cast away ──────
    dict(
        mark=("isaiah", 41, 8),
        mirrors=[("2-chronicles", 20, 7), ("isaiah", 45, 19), ("isaiah", 45, 25)],
        strand="grace",
        strand_label="The grace",
        card_title="The seed of Abraham my friend — taken from the ends of the earth, justified",
        anchor_refs=["Isaiah 41:8-9", "2 Chronicles 20:7", "Isaiah 45:25"],
        body=[
            Q("2-chronicles", 20, 7),
            Q("isaiah", 41, 8, 9),
            Q("isaiah", 45, 19),
            Q("isaiah", 45, 25),
            P("Jehoshaphat prays it under siege; Isaiah carries it to the ends of the earth: the seed of Abraham my friend, taken from the farthest places, chosen and not cast away. The seed was never told to seek him in vain — and the justification verse the pulpit reads as an open altar call arrives with an addressed envelope: in Yahuah (LORD) shall all the seed of Yashar'el (Israel) be justified, and shall glory. Justification is free, and it is promised by name to a seed scattered to the ends of the earth."),
        ],
    ),

    # ── 27. Isaiah 54:3 — the desolate wife's seed inherits the Gentiles ────
    dict(
        mark=("isaiah", 54, 3),
        mirrors=[],
        strand="gathering",
        strand_label="The gathering",
        card_title="Thy seed shall inherit the Gentiles — the children of the desolate wife",
        anchor_refs=["Isaiah 54:1-3"],
        body=[
            Q("isaiah", 54, 1),
            Q("isaiah", 54, 3),
            P("The barren one told to sing is the cast-off wife — the scattered house, desolate of covenant, name, and land. Her promise is seed: breaking forth on the right hand and on the left, her seed inheriting the Gentiles among whom it grew up, the desolate cities inhabited again. The children of the desolate outnumber the children of the married wife — the house that was scattered outnumbers the house that stayed. The desolate woman's children were hers all along; the song begins when she finds out."),
        ],
    ),

    # ── 28. Isaiah 61:9 / 65 / 66:22 — the seed blessed, brought forth, kept ─
    dict(
        mark=("isaiah", 61, 9),
        mirrors=[("isaiah", 65, 9), ("isaiah", 65, 23), ("isaiah", 66, 22)],
        strand="gathering",
        strand_label="The gathering",
        card_title="The seed which Yahuah (LORD) hath blessed — known among the Gentiles, kept into the new heavens",
        anchor_refs=["Isaiah 61:9", "Isaiah 65:9", "Isaiah 66:22"],
        body=[
            Q("isaiah", 61, 9),
            Q("isaiah", 44, 3),
            Q("isaiah", 65, 9),
            Q("isaiah", 65, 23),
            Q("isaiah", 66, 22),
            P("Isaiah's closing chapters trace the seed through three stations. First, recognition in the scattering: the Spirit poured upon thy seed until all that see them acknowledge them — the seed becoming visible among the Gentiles while still among them. Then extraction: a seed brought forth out of Jacob, an inheritor of the mountains. Then permanence past the present age entirely: as the new heavens and the new earth remain, so shall your seed and your name remain. The seed crosses into the new creation still being the seed, still carrying the name. The promise has no terminus at which it converts into something else."),
        ],
    ),

    # ── 29. Ezra 2:59 — the registry fails, the seed remains ────────────────
    dict(
        mark=("ezra", 2, 59),
        mirrors=[("nehemiah", 7, 61)],
        strand="gathering",
        strand_label="The gathering",
        card_title="They could not shew their father's house — the registry fails, the seed remains",
        anchor_refs=["Ezra 2:59", "Nehemiah 7:61", "2 Timothy 2:19"],
        body=[
            Q("ezra", 2, 59),
            Q("nehemiah", 7, 61),
            Q("nehemiah", 9, 2),
            Q("2-timothy", 2, 19),
            P("Already at the first return there were families who could not produce the paper — could not shew their father's house, nor their seed, whether they were of Yashar'el (Israel). One captivity of seventy years was enough to break the registry. The longer scattering broke it for the whole northern house. But the lost document never unmade the lineage it failed to record: the foundation standeth sure, having this seal, Yahuah (Lord) knoweth them that are his. The seed that cannot shew its father's house is still shown to the Father — and the gathering runs on his record, not on ours."),
        ],
    ),

    # ── 30. Luke 1:55 / Acts 3:25 — the advent lands on the seed ────────────
    dict(
        mark=("luke", 1, 55),
        mirrors=[("acts", 3, 25)],
        strand="good_news",
        strand_label="The good news",
        card_title="To Abraham and to his seed for ever — whom the advent was spoken to",
        anchor_refs=["Luke 1:54-55", "Luke 1:72-73", "Acts 3:25-26"],
        body=[
            Q("luke", 1, 54, 55),
            Q("luke", 1, 72, 73),
            Q("acts", 3, 25),
            Q("acts", 3, 26),
            P("Mary and Zacharias both hear the advent as covenant-memory: mercy in remembrance, the holy covenant remembered, the oath to Abraham performed — as he spake to our fathers, to Abraham, and to his seed for ever. Peter at Solomon's porch says it to the men of Yashar'el (Israel) without a softening clause: ye are the children of the prophets, and of the covenant — unto you first. All kindreds of the earth are blessed in the seed; the blessing flows through the seed outward. The kindreds never become the seed, and the seed is never unnamed from its own promise."),
        ],
    ),

    # ── 31. Romans 4 — heir of the world; the promise sure to all the seed ──
    dict(
        mark=("romans", 4, 13),
        mirrors=[("romans", 4, 16), ("romans", 4, 18)],
        strand="grace",
        strand_label="The grace",
        card_title="Heir of the world — the promise sure to all the seed",
        anchor_refs=["Romans 4:13-18", "Genesis 35:11", "Genesis 17:5"],
        body=[
            Q("romans", 4, 13),
            Q("romans", 4, 16),
            Q("romans", 4, 18),
            Q("genesis", 17, 5),
            Q("genesis", 35, 11),
            Q("genesis", 15, 5, 6),
            P("The promise came through the righteousness of faith — Abraham was counted righteous with the stars over his head, years before the token in his flesh — and so it stands sure to all the seed. All the seed is two-housed: the seed which is of the law, Yahudah (Judah), who kept the covenant and its documents; and the seed which shares the faith of Abraham, the scattered of Yashar'el (Israel), grown up far from the documents and holding nothing but what Abraham held that night — a promise and the one who made it. Both are his blood. Father of many nations was answered in his own loins — a nation and a company of nations — not by dissolving the seed into whoever believes. The grace is that the promise stands sure to the seed that lost everything else."),
        ],
    ),

    # ── 32. Romans 9:7-8, 29 — children of promise counted for the seed ─────
    dict(
        mark=("romans", 9, 7),
        mirrors=[("hebrews", 11, 18), ("romans", 9, 29)],
        strand="teaching",
        strand_label="The teaching",
        card_title="The children of the promise are counted for the seed — selection within the line, never around it",
        anchor_refs=["Romans 9:7-8", "Romans 9:29", "Hebrews 11:18"],
        body=[
            Q("romans", 9, 7, 8),
            Q("hebrews", 11, 18),
            Q("romans", 9, 29),
            Q("isaiah", 1, 9),
            P("Paul's distinction runs inside Abraham's blood, not around it. Ishmael was seed of Abraham; Esau was seed of Isaac; yet the call ran through Isaac and through Jacob — in Isaac shall thy seed be called. Children of the flesh against children of the promise is not blood against faith; it is the promise selecting within the bloodline, exactly as it did in Genesis. Read it the other way — faith manufacturing seed out of any people — and the very verse Paul quotes dissolves, for there is then no line within which Isaac was chosen."),
            P("And when Paul reaches for Isaiah, the word for what survives is seed: except Yahuah (Lord) of Sabaoth had left us a seed, we had been as Sodoma. The promise never opens the line to those outside it. The promise is what keeps the line alive."),
        ],
    ),

    # ── 33. Romans 11:1 — Paul's own seed-credential ────────────────────────
    dict(
        mark=("romans", 11, 1),
        mirrors=[("2-corinthians", 11, 22)],
        strand="gathering",
        strand_label="The gathering",
        card_title="I also am of the seed of Abraham — Paul's exhibit against the casting-away",
        anchor_refs=["Romans 11:1", "2 Corinthians 11:22", "Philippians 3:5"],
        body=[
            Q("romans", 11, 1),
            Q("2-corinthians", 11, 22),
            Q("philippians", 3, 5),
            P("When Paul must prove that Elohim (God) has not cast away his people, his exhibit is his own bloodline: an Israelite, of the seed of Abraham, of the tribe of Benjamin. Pressed by rivals, he answers in lineage three times over — Hebrew, Israelite, seed of Abraham — and to the Philippians he files the full pedigree, tribe and all. The man the pulpit uses to spiritualize the seed never once spiritualized his own. His apostleship to the scattered stood on the fact that he was what they were: seed."),
        ],
    ),

    # ── 34. Hebrews 2:16 — he took on him the seed of Abraham ───────────────
    dict(
        mark=("hebrews", 2, 16),
        mirrors=[],
        strand="good_news",
        strand_label="The good news",
        card_title="He took on him the seed of Abraham — the kinsman from inside the kin",
        anchor_refs=["Hebrews 2:16-17"],
        body=[
            Q("hebrews", 2, 16, 17),
            P("The deliverer did not take hold of angels. He took on him the seed of Abraham — entering the bloodline the promises run through, made in all things like unto his brethren. Redemption in scripture is kinsman-work, and the kinsman must come from inside the kin. The Messiah (Christ) redeems the seed of Abraham as seed of Abraham — the rescue is mounted from within the family it rescues."),
        ],
    ),

    # ── 35. Galatians 3:16, 29 — the seed singular, and the seed he reveals ──
    dict(
        mark=("galatians", 3, 16),
        mirrors=[],
        strand="good_news",
        strand_label="The good news",
        card_title="And to thy seed, which is Messiah (Christ) — the singular seed and the seed he reveals",
        anchor_refs=["Galatians 3:16", "Galatians 3:29"],
        body=[
            Q("galatians", 3, 16),
            Q("galatians", 3, 29),
            P("Paul presses the grammar of Genesis: the promises were spoken to Abraham and to his seed, singular — and the singular seed in whom the promise stands is the Messiah (Christ) himself. Every seed-promise in the canon funnels to one man before it widens to anyone."),
            P("Then verse twenty-nine runs in the direction the whole letter runs. The Galatians were the scattered seed of Yashar'el (Israel), grown up among the nations without name or covenant memory, being told by the circumcision party that a flesh-credential could buy them standing. Paul's answer: if ye be Messiah's (Christ's), then are ye Abraham's seed — being his reveals whose blood they were, and heirs according to the promise names the inheritance that was theirs before they knew their own name. The sheep hear because they are sheep. Read the verse as a manufacturing line — believe and thereby become seed — and it inverts: hearing creates nothing; it uncovers what the Father wrote down before the foundation of the world."),
        ],
    ),
]

# ---------------------------------------------------------------------------
# Emit SQL
# ---------------------------------------------------------------------------

def sql_quote(s: str) -> str:
    return "$card$" + s + "$card$"


def verse_select(slug: str, ch: int, vn: int) -> str:
    return (
        "(SELECT v.id FROM verses v "
        "JOIN chapters c ON c.id = v.chapter_id "
        "JOIN books b ON b.id = c.book_id "
        "JOIN editions e ON e.id = b.edition_id "
        f"WHERE e.slug = 'canon' AND b.slug = '{slug}' "
        f"AND c.chapter_number = {ch} AND v.verse_number = {vn})"
    )


VALID_STRANDS = {"gathering", "good_news", "kingdom", "grace", "teaching"}

rows = []
seen = {}
skipped_mirrors = []
skipped_cards = []
for card in CARDS:
    if card["strand"] not in VALID_STRANDS:
        raise SystemExit(f"invalid strand: {card['strand']} on {card['mark']}")
    card_md = "\n\n".join(card["body"])
    anchors = "{" + ",".join('"' + a + '"' for a in card["anchor_refs"]) + "}"
    mark = card["mark"]
    if mark in seen:
        # Cross-wave collision: the first card keeps the verse; the
        # later card is skipped whole and reported for re-homing.
        skipped_cards.append((mark, card["card_title"]))
        continue
    targets = [mark]
    for m in card["mirrors"]:
        if m in seen:
            # First card keeps the mirror — skip, warn, keep going.
            skipped_mirrors.append((m, card["card_title"]))
            continue
        targets.append(m)
    for slug, ch, vn in targets:
        seen[(slug, ch, vn)] = card["card_title"]
        # sanity: the verse must exist in canon.json
        verse_text(slug, ch, vn)
        rows.append(
            "INSERT INTO kingdom_verses "
            "(verse_id, strand, strand_label, card_title, card_md, "
            "anchor_refs, tier_required, last_reviewed_at)\n"
            f"VALUES ({verse_select(slug, ch, vn)}, "
            f"'{card['strand']}', "
            f"'{card['strand_label'].replace(chr(39), chr(39)*2)}', "
            f"'{card['card_title'].replace(chr(39), chr(39)*2)}', "
            f"{sql_quote(card_md)}, "
            f"'{anchors}'::TEXT[], 'free', NOW())\n"
            "ON CONFLICT (verse_id) DO UPDATE SET\n"
            "    strand = EXCLUDED.strand,\n"
            "    strand_label = EXCLUDED.strand_label,\n"
            "    card_title = EXCLUDED.card_title,\n"
            "    card_md = EXCLUDED.card_md,\n"
            "    anchor_refs = EXCLUDED.anchor_refs,\n"
            "    last_reviewed_at = NOW(),\n"
            "    updated_at = NOW();"
        )

for m, title in skipped_cards:
    print(f"DROPPED CARD (mark collision) {m}: {title}")
for m, title in skipped_mirrors:
    print(f"NOTE: mirror {m} already carried by an earlier card; skipped for: {title}")

header = f"""-- =====================================================================
-- Session 205 seed v1 — THE KINGDOM (Blue Pill) full-sweep set
-- =====================================================================
-- GENERATED by restoration-pipeline/_session205_build_kingdom_seed.py.
-- Do not hand-edit; edit the generator and re-run. Every quote is the
-- exact restored verse text from canon.json. {len(CARDS) - len(skipped_cards)} cards /
-- {len(rows)} marked verses (Tanakh anchors carry the mark too —
-- full-sweep V1 per Yoshi's S205 call).
-- Idempotent: ON CONFLICT (verse_id) DO UPDATE refreshes cards.
-- Run: python3 api/apply_migration.py data-schema/migrations/session205_kingdom_seed_v1.sql
-- =====================================================================

BEGIN;

"""

footer = f"""

DO $verify$
DECLARE
    n INT;
BEGIN
    SELECT COUNT(*) INTO n FROM kingdom_verses;
    IF n < {len(rows)} THEN
        RAISE EXCEPTION 'session205 seed verify failed: % rows (expected >= {len(rows)})', n;
    END IF;
    RAISE NOTICE 'session205 seed verified: % kingdom verses live.', n;
END
$verify$;

COMMIT;
"""

with open(OUT, "w") as f:
    f.write(header + "\n\n".join(rows) + footer)

print(f"wrote {OUT}: {len(CARDS)} cards, {len(rows)} marked verses")
