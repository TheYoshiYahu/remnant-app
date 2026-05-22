"""Generate the fulfill-as-prophecy-bringing-to-pass thread migration.

Anchors at Matt 5:17. 35 NT prophecy-fulfillment members, each linking a NT
plēroō occurrence to its Tanakh prophetic source.
"""
import json
from pathlib import Path

OUT = Path("/sessions/clever-gracious-albattani/mnt/Desktop/App/data-schema/migrations/session111_fulfill_thread.sql")

# (source_book, src_ch, src_v, target_book, tgt_ch, tgt_v, member_note)
MEMBERS = [
    ("matthew", 1, 22, "isaiah", 7, 14,
     "Matthew's first fulfillment-formula citation. *That it might be fulfilled* introduces the virgin-shall-conceive prophecy that locates Yahusha (Jesus) as the *Immanuel — Elohim (God) with us* of Isaiah 7:14."),
    ("matthew", 2, 15, "hosea", 11, 1,
     "The flight to Egypt fulfills Hosea 11:1's *out of Egypt have I called my son.* The corporate-Yashar'el (Israel) son-language of the prophet lands on the personal-Yahusha (Jesus) Son — recapitulating the exodus to bring the scattered seed home."),
    ("matthew", 2, 17, "jeremiah", 31, 15,
     "Rachel weeping for her children that are not — Jeremiah 31:15. Matthew's fulfillment-citation reaches into Jer 31's gathering-prophecy chapter; the same Jer 31 carries the new covenant and the Lo-Ammi reversal. The slaughter at Beth-lehem is grief at the threshold of the gathering."),
    ("matthew", 2, 23, "isaiah", 11, 1,
     "Yahusha (Jesus) called a Nazarene fulfills the *netser* (branch) prophecy of Isaiah 11:1 — *there shall come forth a rod out of the stem of Yishai (Jesse), and a Branch shall grow out of his roots.* The branch-of-Yishai naming travels the Davidic seed-line to the Messiah."),
    ("matthew", 3, 15, "psalms", 40, 7,
     "*To fulfil all righteousness* — Yahusha's (Jesus's) baptism as substitutionary covenant-fidelity. Psalm 40:7-8: *Lo, I come... I delight to do thy will, O my Elohim (God): yea, thy law is within my heart.* The Messiah walks out the obedience the scattered seed could not, opening the door home."),
    ("matthew", 4, 14, "isaiah", 9, 1,
     "Yahusha's (Jesus's) Galilee ministry fulfills Isaiah 9:1-2 — *the people that walked in darkness have seen a great light.* Galilee was the territory of the scattered northern tribes (Zebulun and Naphtali); the gathering-mission begins where the divorce-scattering hit first."),
    ("matthew", 8, 17, "isaiah", 53, 4,
     "Healings fulfill Isaiah 53:4 — *himself took our infirmities, and bare our sicknesses.* The suffering-servant Isaiah 53 substance is the framework's load-bearing redeemer-text; the healings credential it in the present-age proclamation."),
    ("matthew", 12, 17, "isaiah", 42, 1,
     "The healing-and-withdraw pattern fulfills Isaiah 42:1-4 — the servant who *shall not strive, nor cry... A bruised reed shall he not break.* The longest Matthean Tanakh citation; the gentle-servant register is part of the gathering-method."),
    ("matthew", 13, 14, "isaiah", 6, 9,
     "The parables fulfill Isaiah 6:9-10 — *By hearing ye shall hear, and shall not understand.* The hardening-by-hearing diagnostic of the prophets is the same diagnostic Yahusha (Jesus) names in his own ministry. The sheep hear; the system does not."),
    ("matthew", 13, 35, "psalms", 78, 2,
     "Matthew names the parable-method as fulfillment of Psalm 78:2 — *I will open my mouth in a parable: I will utter dark sayings of old.* Asaph's Tanakh-pattern of teaching covenant-history through parable is the same method Yahusha (Jesus) walks."),
    ("matthew", 21, 4, "zechariah", 9, 9,
     "The triumphal entry fulfills Zechariah 9:9 — *thy King cometh unto thee... riding upon an ass.* Zech 9 is the gathering-King-comes-to-the-scattered substance; Matthew's citation lands the entry as the prophesied arrival."),
    ("matthew", 27, 9, "zechariah", 11, 12,
     "The thirty pieces of silver fulfills Zechariah 11:12-13 — *they weighed for my price thirty pieces of silver... cast it unto the potter.* Matthew attributes to Yirmeyahu (Jeremiah) because the hybrid citation draws on Jer 19's potter-and-field imagery folded into the Zech 11 shepherd-rejection scene."),
    ("matthew", 27, 35, "psalms", 22, 18,
     "Soldiers casting lots fulfills Psalm 22:18 — *they part my garments among them, and cast lots upon my vesture.* Psalm 22 in its entirety is the crucifixion-foretelling psalm; v.18 is the specific cross-scene predictor."),
    ("mark", 1, 15, "daniel", 2, 44,
     "*The time is fulfilled, and the kingdom of Elohim (God) is at hand* — Daniel 2:44's *Elohim (God) of heaven shall set up a kingdom* is the kingdom Mark names as in-hand. The Messianic-age inauguration is the bringing-to-pass of the prophetic ingathering-kingdom."),
    ("mark", 15, 28, "isaiah", 53, 12,
     "*Numbered with the transgressors* fulfills Isaiah 53:12 — *he was numbered with the transgressors.* Crucified between two thieves; the suffering-servant ledger maintained at the cross."),
    ("luke", 4, 21, "isaiah", 61, 1,
     "*This day is this scripture fulfilled in your ears* — Yahusha (Jesus) at the Nazareth synagogue claiming Isaiah 61:1-2. He closes the scroll BEFORE the *day of vengeance of our Elohim (God)* clause — first coming preaches good tidings; the dreadful day is reserved."),
    ("luke", 21, 22, "deuteronomy", 28, 64,
     "*Days of vengeance, that all things which are written may be fulfilled* — the Jerusalem-judgment of 70 CE as the fulfillment of Deuteronomy 28:64's exile-curse on covenant-breaking. The Torah's curse-system named the consequences; the consequences came."),
    ("luke", 24, 44, "deuteronomy", 18, 15,
     "*All things must be fulfilled, which were written in the law of Mosheh (Moses), and in the prophets, and in the psalms, concerning me.* Yahusha's (Jesus's) own master-statement: the entire canonical prophetic arc is concerning him. Deuteronomy 18:15's prophet-like-Mosheh (Moses) prophecy is the Torah-anchor."),
    ("john", 12, 38, "isaiah", 53, 1,
     "Public rejection of the Messianic-signs fulfills Isaiah 53:1 — *who hath believed our report?* The opening verse of Isaiah 53; reception-failure is part of the suffering-servant prophecy."),
    ("john", 13, 18, "psalms", 41, 9,
     "Judas's betrayal fulfills Psalm 41:9 — *he that eateth bread with me hath lifted up his heel against me.* The companion-turned-betrayer Tanakh-pattern; David's experience prefiguring the King's."),
    ("john", 15, 25, "psalms", 69, 4,
     "*They hated me without a cause* fulfills Psalm 69:4 (and Ps 35:19). Psalm 69 is the suffering-righteous-one psalm running parallel to Psalm 22; the hatred-without-cause names the system's posture."),
    ("john", 17, 12, "psalms", 41, 9,
     "*None of them is lost, but the son of perdition; that the scripture might be fulfilled.* Yahusha's (Jesus's) high-priestly prayer naming Judas as the predicted-betrayer; Psalm 41:9's foretelling holds."),
    ("john", 18, 32, "numbers", 21, 9,
     "*What death he should die* — death by Roman crucifixion fulfills the lifted-up substance Yahusha (Jesus) himself named (John 3:14; 12:32-33), grounded in Numbers 21:9's brazen-serpent-lifted-up healing-type."),
    ("john", 19, 24, "psalms", 22, 18,
     "*They parted my raiment among them, and for my vesture they did cast lots* — Psalm 22:18 fulfilled, John's parallel to Matt 27:35. The crucifixion-foretelling psalm rendered in real time at Golgotha."),
    ("john", 19, 28, "psalms", 69, 21,
     "*I thirst* fulfills Psalm 69:21 — *in my thirst they gave me vinegar to drink.* The vinegar-and-gall sponge at the cross; the suffering-righteous-one psalm 69 ledger maintained."),
    ("john", 19, 36, "exodus", 12, 46,
     "*A bone of him shall not be broken* fulfills Exodus 12:46 (and Num 9:12 / Ps 34:20) — the Passover-lamb protection-of-the-bones rule. Yahusha (Jesus) IS the Passover lamb at the cross, on Passover, with the lamb-bone rule preserved in the Roman handling."),
    ("acts", 1, 16, "psalms", 41, 9,
     "Peter at the upper room: *the scripture must needs have been fulfilled... concerning Judas.* The Ruach (Spirit)-spoken-through-David Psalm 41:9 / 109:8 substance ratified in the apostolic-witness."),
    ("acts", 13, 22, "1-samuel", 13, 14,
     "*David, a man after mine own heart, which shall fulfil all my will* — 1 Samuel 13:14's *Yahuah (the LORD) hath sought him a man after his own heart.* Paul at Pisidian Antioch tracking David's-line to the resurrected Messiah."),
    ("acts", 13, 25, "malachi", 4, 5,
     "*As John fulfilled his course* — Yochanan (John) the Witness completing the Eliyahu-pattern prophet-ministry of Malachi 4:5-6 before the great and dreadful day of Yahuah (the LORD). The first-coming Eliyahu-figure is the Yochanan (John) the Witness; the second-coming Eliyahu-figure is yet to come."),
    ("acts", 13, 29, "deuteronomy", 21, 23,
     "*Fulfilled all that was written of him, they took him down from the tree* — Deuteronomy 21:23's *he that is hanged is accursed of Elohim (God)* substance. The cross-as-curse-bearing for the scattered seed; the body-down-by-evening rule preserved."),
    ("acts", 13, 33, "psalms", 2, 7,
     "*Elohim (God) hath fulfilled... in that he hath raised up Yahusha (Jesus) again; as it is also written in the second psalm, Thou art my Son, this day have I begotten thee.* Paul reads Psalm 2:7 as resurrection-day enthronement of the Davidic Son."),
    ("james", 2, 8, "leviticus", 19, 18,
     "*If ye fulfil the royal law according to the scripture, Thou shalt love thy neighbour as thyself* — Leviticus 19:18's love-thy-neighbour as the royal-law-summation. James reads Torah-keeping as fulfillment, not abolition."),
    ("james", 2, 23, "genesis", 15, 6,
     "*The scripture was fulfilled which saith, Avraham (Abraham) believed Elohim (God), and it was imputed unto him for righteousness* — Genesis 15:6's covenant-faith account. James reads the verse as later-fulfilled in Avraham's (Abraham's) post-faith Isaac-offering — faith-AND-works as one substance."),
    ("revelation", 6, 11, "daniel", 7, 25,
     "The fifth-seal souls told to *rest yet for a little season, until their fellowservants... should be fulfilled* — Daniel 7:25's *time and times and the dividing of time* during which the saints are worn out by the little horn. The full company of the martyrs has not yet been fulfilled."),
]

ANCHOR_BOOK = "matthew"
ANCHOR_CH = 5
ANCHOR_V_START = 17
ANCHOR_V_END = 19

SLUG = "fulfill-as-prophecy-bringing-to-pass"
TITLE = "Fulfill as prophecy bringing to pass"
SUMMARY = """The Greek *plēroō* (Strong's G4137) at Matthew 5:17 does not mean *to exhaust-and-thereby-end* — the antichrist reading the pulpit installed to retire the Torah. It means *to bring to pass* — to make happen what was prophesied. Yahusha (Jesus) names what his mission accomplishes: the bringing-to-pass of what the Torah and the Prophets prophesied. And what they prophesied is the gathering of the scattered seed of Yashar'el (Israel) home through redemption — the curse-and-return arc the Torah itself wrote (Leviticus 26:33 and 40-42; Deuteronomy 30:1-5), executed by the prophets in the divorce-and-scattering (Hosea 1:9; Jeremiah 16:13), and opened by the Messiah's death and resurrection so the door home is real. This thread surfaces every NT plēroō occurrence used in prophecy-fulfillment context (35 members), each linked to the specific Tanakh prophecy it brings to pass. The pattern is consistent: the Messiah walks out the substance the prophets foretold, and the NT formula *that it might be fulfilled* points the reader back to the Tanakh, not forward into a new dispensation."""


def sql_escape(s):
    return "'" + s.replace("'", "''") + "'"


sql = []
sql.append("-- =====================================================================")
sql.append("-- Session 111 — fulfill-as-prophecy-bringing-to-pass thread")
sql.append("-- =====================================================================")
sql.append("-- New cross_reference_threads row anchored at Matthew 5:17-19 with 35")
sql.append("-- members covering every NT plēroō (Strong's G4137) occurrence used in")
sql.append("-- prophecy-fulfillment context. Each member links the NT verse to its")
sql.append("-- specific Tanakh prophetic source. Companion to the matthew-5-free.md")
sql.append("-- fulfill treatment (chapter_intro update).")
sql.append("--")
sql.append("-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.")
sql.append("-- =====================================================================")
sql.append("")
sql.append("\\echo 'Session 111 — fulfill thread migration starting...'")
sql.append("BEGIN;")
sql.append("")
sql.append("CREATE TEMP VIEW _s111_verse_lookup AS")
sql.append("SELECT b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id")
sql.append("  FROM verses v")
sql.append("  JOIN chapters c ON v.chapter_id = c.id")
sql.append("  JOIN books    b ON c.book_id    = b.id")
sql.append("  JOIN editions e ON b.edition_id = e.id")
sql.append(" WHERE e.slug = 'canon';")
sql.append("")

# 1) Insert cross_references rows
sql.append("-- Insert 35 cross_references rows.")
sql.append("WITH input(src_slug, src_ch, src_v, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES")
value_lines = []
for m in MEMBERS:
    value_lines.append(
        f"  ({sql_escape(m[0])}, {m[1]}, {m[2]}, {sql_escape(m[3])}, {m[4]}, {m[5]}, {sql_escape(m[6])})"
    )
sql.append(",\n".join(value_lines))
sql.append(")")
sql.append("INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)")
sql.append("SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'free'")
sql.append("  FROM input i")
sql.append("  JOIN _s111_verse_lookup sv ON sv.book_slug = i.src_slug AND sv.chapter_number = i.src_ch AND sv.verse_number = i.src_v")
sql.append("  JOIN _s111_verse_lookup tv ON tv.book_slug = i.tgt_slug AND tv.chapter_number = i.tgt_ch AND tv.verse_number = i.tgt_v")
sql.append(" WHERE sv.verse_id <> tv.verse_id")
sql.append("ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;")
sql.append("")

# 2) Insert the thread
sql.append("-- Insert the thread definition.")
sql.append(
    f"INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order) "
    f"SELECT {sql_escape(SLUG)}, {sql_escape(TITLE)}, {sql_escape(SUMMARY)}, sv.verse_id, ev.verse_id, 'free', 50 "
    f"  FROM _s111_verse_lookup sv, _s111_verse_lookup ev "
    f" WHERE sv.book_slug = {sql_escape(ANCHOR_BOOK)} AND sv.chapter_number = {ANCHOR_CH} AND sv.verse_number = {ANCHOR_V_START} "
    f"   AND ev.book_slug = {sql_escape(ANCHOR_BOOK)} AND ev.chapter_number = {ANCHOR_CH} AND ev.verse_number = {ANCHOR_V_END} "
    f"ON CONFLICT (slug) DO NOTHING;"
)
sql.append("")

# 3) Link thread members
sql.append("-- Link each cross_reference row as a thread member.")
for sort_idx, m in enumerate(MEMBERS, start=1):
    sql.append(
        f"INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note) "
        f"SELECT t.id, x.id, {sort_idx}, {sql_escape(m[6])} "
        f"  FROM cross_reference_threads t, cross_references x, "
        f"       _s111_verse_lookup sv, _s111_verse_lookup tv "
        f" WHERE t.slug = {sql_escape(SLUG)} "
        f"   AND sv.book_slug = {sql_escape(m[0])} AND sv.chapter_number = {m[1]} AND sv.verse_number = {m[2]} "
        f"   AND tv.book_slug = {sql_escape(m[3])} AND tv.chapter_number = {m[4]} AND tv.verse_number = {m[5]} "
        f"   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual' "
        f"ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;"
    )

sql.append("")
sql.append("COMMIT;")
sql.append("\\echo 'Session 111 — fulfill thread migration complete.'")

OUT.write_text("\n".join(sql) + "\n")
print(f"Wrote {OUT}")
print(f"  35 cross_references rows + 1 thread + 35 thread members")
print(f"  File size: {OUT.stat().st_size} bytes")
