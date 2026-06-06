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
for card in CARDS:
    if card["strand"] not in VALID_STRANDS:
        raise SystemExit(f"invalid strand: {card['strand']} on {card['mark']}")
    card_md = "\n\n".join(card["body"])
    anchors = "{" + ",".join('"' + a + '"' for a in card["anchor_refs"]) + "}"
    mark = card["mark"]
    if mark in seen:
        raise SystemExit(f"duplicate MARK verse: {mark} (also {seen[mark]})")
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

for m, title in skipped_mirrors:
    print(f"NOTE: mirror {m} already carried by an earlier card; skipped for: {title}")

header = f"""-- =====================================================================
-- Session 205 seed v1 — THE KINGDOM (Blue Pill) full-sweep set
-- =====================================================================
-- GENERATED by restoration-pipeline/_session205_build_kingdom_seed.py.
-- Do not hand-edit; edit the generator and re-run. Every quote is the
-- exact restored verse text from canon.json. {len(CARDS)} cards /
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
