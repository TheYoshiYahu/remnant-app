#!/usr/bin/env python3
"""Session 204 — generate the Witness (Red Pill) seed SQL from canon.json.

Every quote in every card is pulled live from source-texts/parsed/canon.json
so the card text is the exact restored verse text (sacred names intact,
son-of-Adam restoration and the kaph-comparative exactly as the pipeline
landed them). The connective prose is hand-curated here and checker-gated
before load (Red Line #12, checklist 10, quote-don't-cite, sacred names).

Output: data-schema/migrations/session204_red_pill_seed_v1.sql
Idempotent: ON CONFLICT (verse_id) DO UPDATE — re-running refreshes cards.

Run:  python3 restoration-pipeline/_session204_build_red_pill_seed.py
Then: python3 api/apply_migration.py data-schema/migrations/session204_red_pill_seed_v1.sql
"""

import json
import os

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
CANON = os.path.join(ROOT, "source-texts", "parsed", "canon.json")
OUT = os.path.join(ROOT, "data-schema", "migrations", "session204_red_pill_seed_v1.sql")

DISPLAY = {
    "psalms": "Psalm",
    "1-corinthians": "1 Corinthians",
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
# The starter set — 30 hand-curated cards across the four claim classes.
# 'mark' is the verse that carries the mark; 'mirrors' are additional verses
# (full-canon V1 — the Tanakh anchor side is marked too) that carry the SAME
# card. body is the come-and-see card: every load-bearing verse quoted in
# full, stand-alone italics; the connective prose stays minimal — the verses
# do the work and the proclaimer steps aside.
# ---------------------------------------------------------------------------

CARDS = [
    # ============== CLASS 1 — DIRECT ==============
    dict(
        mark=("john", 8, 58),
        mirrors=[("exodus", 3, 14)],
        claim_class="direct",
        class_label="His own mouth",
        card_title="Before Abraham was — I AM",
        anchor_refs=["Exodus 3:14", "John 8:59"],
        body=[
            Q("john", 8, 58),
            Q("exodus", 3, 14),
            P(
                "The name spoken at the bush is the name he takes up in the "
                "temple court. He does not say *before Abraham was, I existed* "
                "— the language had plain ways to say that. He says *I AM*, "
                "the name Elohim (God) gave Moses to carry to the children of "
                "Yashar'el (Israel). And the crowd hears exactly what he claimed:"
            ),
            Q("john", 8, 59),
            P(
                "Stoning was the penalty for blasphemy. There is no third "
                "reading: either he is claiming the I AM of the bush as his own "
                "name, or the claim is blasphemy and the stones were right. The "
                "inherited view has always heard deity in this verse — rightly. "
                "What it misses is who stood at the bush:"
            ),
            Q("john", 1, 18),
            P(
                "The Father is the Formless, whom no eye has seen. The one who "
                "appeared at the bush, who spoke, who sent Moses, who led "
                "Yashar'el (Israel) out — that was the Formed, the Word who "
                "would come in the flesh. He is not borrowing the name. He is "
                "answering to it."
            ),
        ],
    ),
    dict(
        mark=("john", 10, 30),
        mirrors=[("deuteronomy", 6, 4)],
        claim_class="direct",
        class_label="His own mouth",
        card_title="I and my Father are one",
        anchor_refs=["Deuteronomy 6:4", "John 10:33"],
        body=[
            Q("john", 10, 30),
            Q("deuteronomy", 6, 4),
            P(
                "The hearers in the temple did not take this as a figure of "
                "speech about agreement. They reached for stones, and they "
                "said why:"
            ),
            Q("john", 10, 33),
            P(
                "The charge is exact: *thou, being a man, makest thyself "
                "Elohim (God).* They heard a man stand inside the Shema — the "
                "oneness that belongs to Yahuah (God) alone — and claim it. "
                "The Father is the Formless; the Son is the Formed, drawn "
                "from him, eternally submitted to him, one with him. He has a "
                "Father, and he is one with the Father — the canon holds both "
                "without strain, and this verse is where it says so."
            ),
        ],
    ),
    dict(
        mark=("john", 20, 28),
        mirrors=[("isaiah", 42, 8)],
        claim_class="direct",
        class_label="Spoken of him",
        card_title="My Lord and my Elohim (God)",
        anchor_refs=["Isaiah 42:8", "John 20:29"],
        body=[
            Q("john", 20, 28),
            Q("isaiah", 42, 8),
            P(
                "Thomas, a Torah-keeping son of Yashar'el (Israel), addresses "
                "the risen one to his face: *my Lord and my Elohim (God).* If "
                "the address were too high, this is the moment to refuse it — "
                "Yahuah (God) does not give his glory to another. Instead:"
            ),
            Q("john", 20, 29),
            P(
                "He receives the address and blesses everyone who will make it "
                "without seeing. The one who will not share his glory accepts "
                "this glory — because it is his."
            ),
        ],
    ),
    dict(
        mark=("mark", 2, 10),
        mirrors=[("isaiah", 43, 25)],
        claim_class="direct",
        class_label="His own mouth",
        card_title="Who can forgive sins but Elohim (God) only?",
        anchor_refs=["Isaiah 43:25", "Mark 2:5-7"],
        body=[
            Q("mark", 2, 5, 7),
            Q("isaiah", 43, 25),
            P(
                "The scribes' theology is correct: sin is against Yahuah (God), "
                "so only Yahuah (God) can blot it out — *I, even I, am he.* "
                "Their question is the right question. His answer is not a "
                "correction of their theology but a demonstration in front of "
                "their eyes:"
            ),
            Q("mark", 2, 10, 11),
            P(
                "The Son of Adam does on earth what the Tanakh says Yahuah "
                "(God) alone does. The paralytic walks so that the scribes — "
                "and the reader — may know whose authority just spoke."
            ),
        ],
    ),
    dict(
        mark=("mark", 14, 62),
        mirrors=[("daniel", 7, 13)],
        claim_class="direct",
        class_label="His own mouth",
        card_title="Ye shall see the Son of Adam coming in the clouds",
        anchor_refs=["Daniel 7:13-14", "Mark 14:61"],
        body=[
            Q("mark", 14, 61, 62),
            Q("daniel", 7, 13, 14),
            P(
                "Asked under oath whether he is the Messiah (Christ), he "
                "answers *I am* — and then places himself inside Daniel's "
                "night vision. Notice what Daniel's text actually says: *one "
                "LIKE the Son of Adam.* The comparison is the text's own move, "
                "and it is worth keeping. The figure rides the clouds — and "
                "everywhere else in scripture the cloud-rider is Yahuah (God) "
                "himself — yet he is *like* a son of Adam. The vision holds "
                "both: one who bears the form of Adam's line and arrives on "
                "the clouds no creature rides, receiving an everlasting "
                "kingdom that shall not be destroyed. He resembled mortal man "
                "because he took on flesh; he remained the cloud-rider. At the "
                "trial he claims that seat in the first person, and the high "
                "priest tears his clothes — he heard the claim exactly."
            ),
        ],
    ),
    dict(
        mark=("revelation", 1, 8),
        mirrors=[("isaiah", 41, 4)],
        claim_class="direct",
        class_label="His own mouth",
        card_title="Alpha and Omega — which is, and which was, and which is to come",
        anchor_refs=["Isaiah 41:4", "Revelation 1:7"],
        body=[
            Q("revelation", 1, 7, 8),
            Q("isaiah", 41, 4),
            P(
                "The speaker of verse 8 is the one verse 7 says is coming with "
                "clouds — the pierced one. He names himself with Yahuah (God)'s "
                "own self-description from the prophets: the first, with the "
                "last, *I am he.* The Almighty's name in the mouth of the one "
                "who was pierced."
            ),
        ],
    ),
    dict(
        mark=("revelation", 1, 17),
        mirrors=[("isaiah", 44, 6)],
        claim_class="direct",
        class_label="His own mouth",
        card_title="The first and the last — who was dead, and is alive",
        anchor_refs=["Isaiah 44:6"],
        body=[
            Q("revelation", 1, 17, 18),
            Q("isaiah", 44, 6),
            P(
                "In Isaiah, *I am the first, and I am the last* is spoken by "
                "Yahuah (LORD) the King of Yashar'el (Israel), with the verdict "
                "attached: *beside me there is no Elohim (God).* In Revelation "
                "the same title is spoken by one who *was dead and is alive for "
                "evermore.* Yahuah (God) does not share that title — and the "
                "Father, the Formless, did not die. Either the verse breaks "
                "Isaiah, or the Formed — the one who came in the flesh, died, "
                "and rose — is the first and the last of Isaiah's own mouth."
            ),
        ],
    ),
    dict(
        mark=("1-corinthians", 12, 3),
        mirrors=[("joel", 2, 32)],
        claim_class="direct",
        class_label="Spoken of him",
        card_title="No man can say it but by the Ruach HaKodesh (Holy Spirit)",
        anchor_refs=["Joel 2:32", "Romans 10:13"],
        body=[
            Q("1-corinthians", 12, 3),
            Q("joel", 2, 32),
            Q("romans", 10, 13),
            P(
                "Paul quotes Joel's promise — call on the name of Yahuah "
                "(LORD) and be delivered — and lands it on Yahusha (Jesus). "
                "And he tells the Corinthians plainly that the confession "
                "*Yahusha (Jesus) is Yahuah (Lord)* is not a conclusion flesh "
                "reaches on its own: only the Ruach HaKodesh (Holy Spirit) "
                "reveals it. The equation is the Spirit's own teaching — the "
                "center the rest of these marked verses keep returning to."
            ),
        ],
    ),
    dict(
        mark=("philippians", 2, 10),
        mirrors=[("isaiah", 45, 23)],
        claim_class="direct",
        class_label="Spoken of him",
        card_title="Every knee shall bow, every tongue shall swear",
        anchor_refs=["Isaiah 45:22-23"],
        body=[
            Q("philippians", 2, 9, 11),
            Q("isaiah", 45, 22, 23),
            P(
                "Isaiah's oath could not be more guarded: *I am Elohim (God), "
                "and there is none else... unto ME every knee shall bow.* "
                "Yahuah (God) swore it by himself. Paul takes that sworn, "
                "unshareable homage and writes it onto the name of Yahusha "
                "(Jesus) — to the glory of Elohim (God) the Father. The "
                "Formed receives the bow the Formless swore to himself, and "
                "the Father is glorified in it. That is either the deepest "
                "harmony in the canon, or a contradiction at its center. The "
                "verses, side by side, let you watch which."
            ),
        ],
    ),
    dict(
        mark=("john", 9, 38),
        mirrors=[("exodus", 34, 14)],
        claim_class="direct",
        class_label="Worship received",
        card_title="And he worshipped him",
        anchor_refs=["Exodus 34:14", "Revelation 19:10"],
        body=[
            Q("john", 9, 37, 38),
            Q("exodus", 34, 14),
            P(
                "The healed man worships, and Yahusha (Jesus) receives it "
                "without a word of correction. Compare what a faithful "
                "messenger does when worship lands on him by mistake:"
            ),
            Q("revelation", 19, 10),
            P(
                "The angel refuses instantly — *worship Elohim (God).* Every "
                "faithful creature in scripture deflects worship on contact. "
                "He never does. Worship belongs to Yahuah (God) alone, and he "
                "receives it as his own."
            ),
        ],
    ),
    dict(
        mark=("mark", 2, 28),
        mirrors=[("exodus", 20, 10), ("isaiah", 58, 13)],
        claim_class="direct",
        class_label="His own mouth",
        card_title="Lord also of the sabbath",
        anchor_refs=["Exodus 20:10", "Isaiah 58:13"],
        body=[
            Q("mark", 2, 27, 28),
            Q("exodus", 20, 10),
            Q("isaiah", 58, 13),
            P(
                "The sabbath is not a free-floating institution anyone might "
                "administer. It is *the sabbath of Yahuah Elohayka (the LORD "
                "thy God)* — Yahuah (God) calls it *my holy day.* To stand in "
                "Galilee and claim lordship over that day is to claim the day's "
                "owner's seat. The Son of Adam claims it."
            ),
        ],
    ),
    dict(
        mark=("john", 1, 1),
        mirrors=[("genesis", 1, 1), ("psalms", 33, 6)],
        claim_class="direct",
        class_label="Spoken of him",
        card_title="The Word was Elohim (God)",
        anchor_refs=["Genesis 1:1", "Psalm 33:6"],
        body=[
            Q("john", 1, 1, 2),
            Q("genesis", 1, 1),
            Q("psalms", 33, 6),
            P(
                "John opens his witness with Genesis' own opening words — *in "
                "the beginning* — and stations the Word there: with Elohim "
                "(God), and Elohim (God). The psalmist had already said how "
                "the heavens of Genesis came to be: *by the word of Yahuah "
                "(LORD).* The Word is not a creature standing near the "
                "Creator; the Word is what the creating sounded like. The "
                "Father is the Formless; the Word is the Formed, drawn from "
                "him before anything was — with him, and Elohim (God). This "
                "is the verse the rest of John's record unfolds."
            ),
        ],
    ),
    dict(
        mark=("john", 1, 3),
        mirrors=[("isaiah", 44, 24)],
        claim_class="act",
        class_label="The act transferred",
        card_title="All things were made by him — alone, by myself",
        anchor_refs=["Isaiah 44:24"],
        body=[
            Q("john", 1, 3),
            Q("isaiah", 44, 24),
            P(
                "Isaiah's words are built to exclude every helper: Yahuah "
                "(LORD) makes all things, stretches the heavens ALONE, "
                "spreads the earth BY MYSELF. John says all things were made "
                "by the Word — not some things, not the later things: *without "
                "him was not any thing made that was made.* Hold both "
                "sentences at once. Either the Word stands inside Isaiah's "
                "*alone,* or one of the two verses is false. The canon's own "
                "answer is the Formed — the Word by whom the Formless made "
                "everything, the *by myself* with a voice."
            ),
        ],
    ),
    dict(
        mark=("john", 1, 14),
        mirrors=[("zechariah", 2, 10), ("zechariah", 2, 11)],
        claim_class="structural",
        class_label="Only possible if",
        card_title="The Word made flesh — I will dwell in the midst of thee",
        anchor_refs=["Zechariah 2:10-11"],
        body=[
            Q("john", 1, 14),
            Q("zechariah", 2, 10, 11),
            P(
                "Zechariah's promise has two movements that the inherited "
                "reading rarely slows down for. First: Yahuah (LORD) himself "
                "says *I come, and I will dwell in the midst of thee* — the "
                "dwelling is his own act, in his own first person. Second: "
                "the one dwelling then says *thou shalt know that Yahuah "
                "Tseva'ot (LORD of hosts) hath sent me* — Yahuah (LORD), "
                "sent by Yahuah Tseva'ot (LORD of hosts). Two in one "
                "promise: the Formless who sends, the Formed who comes and "
                "dwells. John writes the fulfillment in one line: the Word "
                "was made flesh, and dwelt — tabernacled — among us, and we "
                "beheld his glory. The dwelling Yahuah (LORD) promised in "
                "his own voice happened on foot, in Galilee."
            ),
        ],
    ),
    # ============== CLASS 2 — TITLE TRANSFER ==============
    dict(
        mark=("john", 10, 11),
        mirrors=[("ezekiel", 34, 11), ("ezekiel", 34, 15), ("psalms", 23, 1)],
        claim_class="title",
        class_label="The title transferred",
        card_title="I am the good shepherd",
        anchor_refs=["Ezekiel 34:11-15", "Psalm 23:1"],
        body=[
            Q("john", 10, 11),
            Q("ezekiel", 34, 11, 12),
            Q("ezekiel", 34, 15),
            Q("psalms", 23, 1),
            P(
                "In Ezekiel, Adonai Yahuah (the Lord GOD) takes the shepherd's "
                "office into his own hands — *I, even I, will both search my "
                "sheep... I will feed my flock.* David's psalm names the "
                "shepherd outright: Yahuah Ra'ah (The LORD is my shepherd). "
                "Then the Formed stands in "
                "Yerushalayim (Jerusalem) and says *I am the good shepherd* — "
                "the office Yahuah (God) reserved for himself, claimed in the "
                "first person. And notice which sheep Ezekiel's shepherd comes "
                "for: the flock *scattered in the cloudy and dark day.* The "
                "shepherd's claim and the gathering of scattered Yashar'el "
                "(Israel) are one fabric — he is who he says, doing what "
                "Yahuah (God) said he himself would do."
            ),
        ],
    ),
    dict(
        mark=("mark", 2, 19),
        mirrors=[("isaiah", 54, 5)],
        claim_class="title",
        class_label="The title transferred",
        card_title="The bridegroom",
        anchor_refs=["Isaiah 54:5", "Hosea 2:19-20"],
        body=[
            Q("mark", 2, 19, 20),
            Q("isaiah", 54, 5),
            Q("hosea", 2, 19, 20),
            P(
                "Asked about fasting, he answers with a title: the bridegroom "
                "is here. In the prophets there is exactly one husband of the "
                "covenant people — *thy Maker is thine husband; Yahuah "
                "Tseva'ot (LORD of hosts) is his name* — and exactly one "
                "betrothal promised: *I will betroth thee unto me for ever.* "
                "A rabbi calling himself the bridegroom of Yashar'el (Israel) "
                "is not reaching for a wedding metaphor. He is standing in "
                "the husband's place."
            ),
        ],
    ),
    dict(
        mark=("john", 8, 12),
        mirrors=[("psalms", 27, 1), ("isaiah", 60, 19)],
        claim_class="title",
        class_label="The title transferred",
        card_title="I am the light of the world",
        anchor_refs=["Psalm 27:1", "Isaiah 60:19"],
        body=[
            Q("john", 8, 12),
            Q("psalms", 27, 1),
            Q("isaiah", 60, 19),
            P(
                "*Yahuah (LORD) is my light* — David's confession, and "
                "Isaiah's promise of the age to come: Yahuah (LORD) himself "
                "an everlasting light in place of the sun. The one speaking "
                "in the treasury of the temple claims the title as his own "
                "present tense — *I am the light of the world* — and attaches "
                "to it what only the source of light can give: *the light of "
                "life.*"
            ),
        ],
    ),
    dict(
        mark=("john", 12, 13),
        mirrors=[("zephaniah", 3, 15)],
        claim_class="title",
        class_label="The title transferred",
        card_title="The King of Yashar'el (Israel)",
        anchor_refs=["Zephaniah 3:15", "Isaiah 44:6"],
        body=[
            Q("john", 12, 13),
            Q("zephaniah", 3, 15),
            Q("isaiah", 44, 6),
            P(
                "The crowds at the gate hail him as the King of Yashar'el "
                "(Israel). In the prophets that throne is occupied: *the king "
                "of Yashar'el (Israel), even Yahuah (LORD), is in the midst of "
                "thee.* Isaiah binds the title tighter still — Yahuah (LORD) "
                "the King of Yashar'el (Israel), beside whom there is no "
                "Elohim (God). Zephaniah's words land with strange precision: "
                "the King of Yashar'el (Israel), Yahuah (LORD), *in the midst "
                "of thee* — and there he is, riding through the midst of "
                "Yerushalayim (Jerusalem)."
            ),
        ],
    ),
    dict(
        mark=("revelation", 22, 12),
        mirrors=[("isaiah", 40, 10)],
        claim_class="title",
        class_label="The title transferred",
        card_title="My reward is with me",
        anchor_refs=["Isaiah 40:10", "Revelation 22:13"],
        body=[
            Q("revelation", 22, 12, 13),
            Q("isaiah", 40, 10),
            P(
                "Isaiah announces Adonai Yahuah (the Lord GOD) coming with "
                "strong hand — *behold, his reward is with him, and his work "
                "before him.* The voice at the end of the canon takes the "
                "sentence into the first person: *behold, I come quickly; and "
                "my reward is with me* — and seals it with the unshareable "
                "name: Alpha and Omega, the first and the last. Isaiah's "
                "coming Yahuah (God) speaks in Revelation as I."
            ),
        ],
    ),
    # ============== CLASS 3 — ACT TRANSFER ==============
    dict(
        mark=("luke", 21, 27),
        mirrors=[("zechariah", 14, 3), ("zechariah", 14, 4)],
        claim_class="act",
        class_label="The act transferred",
        card_title="His feet on the mount of Olives",
        anchor_refs=["Zechariah 14:3-4", "Acts 1:11-12"],
        body=[
            Q("luke", 21, 27),
            Q("zechariah", 14, 3, 4),
            Q("acts", 1, 11, 12),
            P(
                "Zechariah gives the day of battle to Yahuah (LORD) in person "
                "— he goes forth, he fights, *his feet shall stand in that day "
                "upon the mount of Olives.* Then watch the geography of the "
                "ascension: Yahusha (Jesus) is taken up FROM Olivet, and the "
                "messengers promise he will return *in like manner* — to the "
                "same mountain Zechariah reserved for the feet of Yahuah "
                "(LORD). The Son of Adam coming in a cloud, and Yahuah (LORD) "
                "going forth to fight, arrive at the same spot of ground on "
                "the same day."
            ),
        ],
    ),
    dict(
        mark=("mark", 6, 48),
        mirrors=[("job", 9, 8)],
        claim_class="act",
        class_label="The act transferred",
        card_title="Walking upon the sea",
        anchor_refs=["Job 9:8"],
        body=[
            Q("mark", 6, 48, 50),
            Q("job", 9, 8),
            P(
                "Job's confession is categorical: the one *which ALONE "
                "spreadeth out the heavens, and treadeth upon the waves of "
                "the sea.* Alone. No agent, no deputy — the sea's waves are "
                "Yahuah (God)'s own footpath and no one else's. Then the "
                "disciples watch a figure tread the waves of Galilee, and his "
                "word to them is *It is I* — literally, *I AM; be not afraid.* "
                "The act that belongs to one alone, performed by one who "
                "answers with the name."
            ),
        ],
    ),
    dict(
        mark=("luke", 22, 20),
        mirrors=[("jeremiah", 31, 31), ("jeremiah", 31, 33)],
        claim_class="act",
        class_label="The act transferred",
        card_title="The new covenant — cut in his own blood",
        anchor_refs=["Jeremiah 31:31-33"],
        body=[
            Q("luke", 22, 20),
            Q("jeremiah", 31, 31),
            Q("jeremiah", 31, 33),
            P(
                "Jeremiah's promise is unambiguous about whose covenant the "
                "new covenant is: *I will make... saith Yahuah (LORD)* — with "
                "the house of Yashar'el (Israel) and the house of Yahudah "
                "(Judah), Torah written on the heart. Covenants are cut in "
                "blood, and the covenant-maker provides it. At the table, the "
                "Formed lifts the cup and cuts Yahuah (LORD)'s promised "
                "covenant *in my blood.* Only the covenant's owner can cut "
                "it — and he cuts it in himself."
            ),
        ],
    ),
    dict(
        mark=("john", 10, 16),
        mirrors=[("ezekiel", 34, 12), ("ezekiel", 37, 21)],
        claim_class="act",
        class_label="The act transferred",
        card_title="Other sheep — one fold, one shepherd",
        anchor_refs=["Ezekiel 34:12", "Ezekiel 37:21"],
        body=[
            Q("john", 10, 16),
            Q("ezekiel", 34, 12),
            Q("ezekiel", 37, 21),
            P(
                "*I will seek out my sheep... I will take the children of "
                "Yashar'el (Israel) from among the heathen... and gather them.* "
                "The gathering of the scattered flock is Yahuah (God)'s own "
                "promised act, in his own first person. The shepherd speaking "
                "in John claims sheep *not of this fold* — the scattered house, "
                "sown among the nations — and takes the gathering on himself: "
                "*them also I MUST bring.* One flock, one shepherd: Ezekiel's "
                "words, his mouth. The claim of deity and the gathering of "
                "Yashar'el (Israel) are one announcement."
            ),
        ],
    ),
    dict(
        mark=("matthew", 15, 24),
        mirrors=[("jeremiah", 50, 6)],
        claim_class="act",
        class_label="The act transferred",
        card_title="Sent to the lost sheep of the house of Yashar'el (Israel)",
        anchor_refs=["Jeremiah 50:6", "Ezekiel 34:11-12"],
        body=[
            Q("matthew", 15, 24),
            Q("jeremiah", 50, 6),
            Q("ezekiel", 34, 11, 12),
            P(
                "*My people hath been lost sheep* — Jeremiah names them, and "
                "Ezekiel records whose job their recovery is: *I, even I, will "
                "both search my sheep, and seek them out.* When Yahusha "
                "(Jesus) defines his entire mission as the lost sheep of the "
                "house of Yashar'el (Israel), he is not narrowing his "
                "compassion — he is executing the search Yahuah (God) said he "
                "himself would make. The seeker Ezekiel promised has arrived, "
                "on foot."
            ),
        ],
    ),
    dict(
        mark=("matthew", 25, 31),
        mirrors=[("ezekiel", 34, 17)],
        claim_class="act",
        class_label="The act transferred",
        card_title="The shepherd who judges between sheep and goats",
        anchor_refs=["Ezekiel 34:17"],
        body=[
            Q("matthew", 25, 31, 32),
            Q("ezekiel", 34, 17),
            P(
                "In Ezekiel the shepherd-judgment is Yahuah (God)'s own "
                "verdict in his own flock — *I judge between cattle and "
                "cattle, between the rams and the he goats,* spoken by Adonai "
                "Yahuah (the Lord GOD) over the gathered sheep. In Matthew, "
                "the Son of Adam sits on the throne of his glory, the flock "
                "gathered out of all nations before him, and the dividing "
                "staff is in his hand. The seat Ezekiel's *I* occupies is the "
                "seat he takes — the shepherd doing the shepherd-owner's own "
                "separating."
            ),
        ],
    ),
    # ============== CLASS 4 — STRUCTURAL ==============
    dict(
        mark=("romans", 7, 4),
        mirrors=[("jeremiah", 3, 8), ("deuteronomy", 24, 4), ("hosea", 2, 19), ("hosea", 2, 20)],
        claim_class="structural",
        class_label="Only possible if",
        card_title="The first husband died",
        anchor_refs=["Jeremiah 3:8", "Deuteronomy 24:4", "Hosea 2:19-20"],
        body=[
            Q("romans", 7, 2, 3),
            Q("jeremiah", 3, 8),
            Q("deuteronomy", 24, 4),
            P(
                "Hold the three together and the dilemma closes like a vise. "
                "The northern house of Yashar'el (Israel) was not merely "
                "scattered — she was DIVORCED, bill of divorce in hand. And "
                "the Torah bars the road home: her former husband *may not "
                "take her again.* Yet the prophets promise remarriage:"
            ),
            Q("hosea", 2, 19, 20),
            P(
                "How can the promise keep the Torah? Paul's answer hangs on "
                "the one fact the wife's bond turns on — *if the husband be "
                "dead, she is loosed from the law of her husband:*"
            ),
            Q("romans", 7, 4),
            P(
                "*Dead to the law by the body of Messiah (Christ)* — not the "
                "Torah dissolved, but the marriage-bond satisfied, because "
                "the husband himself died. The argument only functions if the "
                "one who died on the tree IS the husband who covenanted at "
                "Sinai — the Formed, who took flesh, died, and rose. The "
                "divorced house is freed by his death and married to him "
                "raised: Hosea's betrothal, legally clean, the Torah unbroken. "
                "One argument — and the whole good news of the gathering "
                "inside it."
            ),
        ],
    ),
    dict(
        mark=("john", 14, 15),
        mirrors=[("exodus", 20, 6)],
        claim_class="structural",
        class_label="Only possible if",
        card_title="MY commandments — the ME of Sinai",
        anchor_refs=["Exodus 20:6"],
        body=[
            Q("john", 14, 15),
            Q("exodus", 20, 6),
            P(
                "The second commandment describes its own people: *them that "
                "love ME, and keep MY commandments* — the me is Yahuah (God) "
                "speaking from Sinai. At the table, the night before his "
                "death, he says the sentence in the first person and does not "
                "change the pronouns: *if ye love ME, keep MY commandments.* "
                "Either he is quoting Sinai's I as his own voice — the Formed, "
                "who spoke the words at the mountain — or he is overwriting "
                "it. And love-shown-by-keeping-his-commandments is the exact "
                "shape the commandment itself gave; the claim and the "
                "covenant stand or fall together."
            ),
        ],
    ),
    dict(
        mark=("john", 12, 41),
        mirrors=[("isaiah", 6, 1), ("isaiah", 6, 5)],
        claim_class="structural",
        class_label="Only possible if",
        card_title="Isaiah saw HIS glory",
        anchor_refs=["Isaiah 6:1", "Isaiah 6:5"],
        body=[
            Q("john", 12, 41),
            Q("isaiah", 6, 1),
            Q("isaiah", 6, 5),
            P(
                "Whose glory did Isaiah see? The prophet's own record says: "
                "Yahuah (Lord) on the throne, high and lifted up — *mine eyes "
                "have seen the King, Yahuah Tseva'ot (LORD of hosts).* John, "
                "writing of Yahusha (Jesus), says *these things said Esaias, "
                "when he saw HIS glory, and spake of HIM.* The sentence only "
                "works one way: the enthroned King Isaiah saw and the one "
                "John follows are one and the same. The throne vision was the "
                "Formed — seen, as the Formless never is."
            ),
        ],
    ),
    dict(
        mark=("1-corinthians", 10, 4),
        mirrors=[("deuteronomy", 32, 4), ("exodus", 17, 7)],
        claim_class="structural",
        class_label="Only possible if",
        card_title="That Rock was Messiah (Christ)",
        anchor_refs=["Deuteronomy 32:3-4", "Exodus 17:7"],
        body=[
            Q("1-corinthians", 10, 4),
            Q("deuteronomy", 32, 3, 4),
            P(
                "Moses' song leaves no room: *He is the Rock* — the title "
                "belongs to Yahuah (LORD) whose name the song publishes. Paul "
                "says the Rock that went with the fathers in the wilderness "
                "WAS Messiah (Christ). And he presses it further:"
            ),
            Q("1-corinthians", 10, 9),
            Q("exodus", 17, 7),
            P(
                "Who was tempted at Massah? The Torah says *they tempted "
                "Yahuah (LORD), saying, Is Yahuah (LORD) among us, or not?* "
                "Paul says: they tempted Messiah (Christ). The wilderness "
                "presence — the Rock, the tempted one, the one among them — "
                "was the Formed. Paul's warning to Corinth only makes sense "
                "if it is so."
            ),
        ],
    ),
    dict(
        mark=("jude", 1, 5),
        mirrors=[("exodus", 20, 2)],
        claim_class="structural",
        class_label="Only possible if",
        card_title="The one who saved the people out of Egypt",
        anchor_refs=["Exodus 20:2"],
        body=[
            Q("jude", 1, 5),
            Q("exodus", 20, 2),
            P(
                "Sinai opens with the credential: *I am Yahuah Elohayka (the "
                "LORD thy God), which have brought thee out of the land of "
                "Egypt.* The exodus is Yahuah (God)'s signature act — the one "
                "he names himself by. Jude asks his readers to REMEMBER who "
                "saved the people out of Egypt and then judged the unbelieving "
                "— and he writes it of the Lord his brother-after-the-flesh "
                "served. The Master Jude serves and the Elohim (God) of the "
                "exodus are one and the same, or the remembrance fails."
            ),
        ],
    ),
    dict(
        mark=("john", 1, 18),
        mirrors=[("exodus", 33, 20), ("exodus", 24, 10)],
        claim_class="structural",
        class_label="Only possible if",
        card_title="No man hath seen Elohim (God) — so who was seen?",
        anchor_refs=["Exodus 33:20", "Exodus 24:10", "John 14:9"],
        body=[
            Q("john", 1, 18),
            Q("exodus", 33, 20),
            P(
                "Two witnesses agree: the Father, the Formless, no man has "
                "seen or can see and live. Yet the Torah also records, without "
                "blinking:"
            ),
            Q("exodus", 24, 10),
            P(
                "They SAW the Elohim (God) of Yashar'el (Israel) — and ate "
                "and drank. The canon does not contradict itself; it "
                "distinguishes. The Formless no eye beholds; the Formed — the "
                "Word, the only begotten in the bosom of the Father — is the "
                "one who was seen at the mountain, who declared him, and who "
                "could later say:"
            ),
            Q("john", 14, 9),
            P(
                "Every appearance of Elohim (God) in the Tanakh — seen, "
                "heard, wrestled with, eaten with — was him. That is what "
                "*he hath declared him* has always meant."
            ),
        ],
    ),
    dict(
        mark=("john", 19, 37),
        mirrors=[("zechariah", 12, 10)],
        claim_class="structural",
        class_label="Only possible if",
        card_title="They shall look upon ME whom they have pierced",
        anchor_refs=["Zechariah 12:10", "Revelation 1:7"],
        body=[
            Q("john", 19, 37),
            Q("zechariah", 12, 10),
            P(
                "Read Zechariah's pronouns slowly. The speaker is Yahuah "
                "(LORD) — and he says *they shall look upon ME whom they have "
                "PIERCED, and they shall mourn for HIM.* Me, pierced; him, "
                "mourned — both in one breath, centuries before the spear. "
                "John stands at the cross and says this is that scripture. "
                "And the canon's last book seals it:"
            ),
            Q("revelation", 1, 7),
            P(
                "Yahuah (LORD) said *me.* The spear found flesh. The verse "
                "was only ever possible if the pierced one is the speaker — "
                "the Formed, Yahuah (God) come in the flesh, mourned as a "
                "firstborn son."
            ),
        ],
    ),
    dict(
        mark=("mark", 12, 36),
        mirrors=[("psalms", 110, 1)],
        claim_class="structural",
        class_label="Only possible if",
        card_title="Yahuah (LORD) said unto my Lord",
        anchor_refs=["Psalm 110:1"],
        body=[
            Q("mark", 12, 35, 37),
            Q("psalms", 110, 1),
            P(
                "His own riddle to the scribes, left hanging in the temple "
                "air. David, king of Yashar'el (Israel), bows to no man — yet "
                "by the Ruach HaKodesh (Holy Spirit) he calls someone *my "
                "Lord,* seated at the right hand of Yahuah (LORD). Whom does "
                "a king call Lord? Not a son who is merely a son. The psalm "
                "holds two — Yahuah (LORD) who speaks, and David's Lord who "
                "sits — the Formless and the Formed, in one verse, a thousand "
                "years early. *And the common people heard him gladly.*"
            ),
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


rows = []
seen = set()
for card in CARDS:
    card_md = "\n\n".join(card["body"])
    anchors = "{" + ",".join('"' + a + '"' for a in card["anchor_refs"]) + "}"
    targets = [card["mark"]] + card["mirrors"]
    for slug, ch, vn in targets:
        key = (slug, ch, vn)
        if key in seen:
            raise SystemExit(f"duplicate marked verse: {key}")
        seen.add(key)
        # sanity: the verse must exist in canon.json
        verse_text(slug, ch, vn)
        rows.append(
            "INSERT INTO red_pill_verses "
            "(verse_id, claim_class, class_label, card_title, card_md, "
            "anchor_refs, tier_required, last_reviewed_at)\n"
            f"VALUES ({verse_select(slug, ch, vn)}, "
            f"'{card['claim_class']}', "
            f"'{card['class_label'].replace(chr(39), chr(39)*2)}', "
            f"'{card['card_title'].replace(chr(39), chr(39)*2)}', "
            f"{sql_quote(card_md)}, "
            f"'{anchors}'::TEXT[], 'free', NOW())\n"
            "ON CONFLICT (verse_id) DO UPDATE SET\n"
            "    claim_class = EXCLUDED.claim_class,\n"
            "    class_label = EXCLUDED.class_label,\n"
            "    card_title = EXCLUDED.card_title,\n"
            "    card_md = EXCLUDED.card_md,\n"
            "    anchor_refs = EXCLUDED.anchor_refs,\n"
            "    last_reviewed_at = NOW(),\n"
            "    updated_at = NOW();"
        )

header = f"""-- =====================================================================
-- Session 204 seed v1 — THE WITNESS (Red Pill) starter set
-- =====================================================================
-- GENERATED by restoration-pipeline/_session204_build_red_pill_seed.py.
-- Do not hand-edit; edit the generator and re-run. Every quote is the
-- exact restored verse text from canon.json. {len(CARDS)} cards /
-- {len(rows)} marked verses (Tanakh anchors carry the mark too —
-- full-canon V1 per Yoshi's S204 call).
-- Idempotent: ON CONFLICT (verse_id) DO UPDATE refreshes cards.
-- Run: python3 api/apply_migration.py data-schema/migrations/session204_red_pill_seed_v1.sql
-- =====================================================================

BEGIN;

"""

footer = f"""

DO $verify$
DECLARE
    n INT;
BEGIN
    SELECT COUNT(*) INTO n FROM red_pill_verses;
    IF n < {len(rows)} THEN
        RAISE EXCEPTION 'session204 seed verify failed: % rows (expected >= {len(rows)})', n;
    END IF;
    RAISE NOTICE 'session204 seed verified: % witness verses live.', n;
END
$verify$;

COMMIT;
"""

with open(OUT, "w") as f:
    f.write(header + "\n\n".join(rows) + footer)

print(f"wrote {OUT}: {len(CARDS)} cards, {len(rows)} marked verses")
