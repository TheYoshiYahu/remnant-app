#!/usr/bin/env python3
"""
restore.py
----------
Deterministic restoration pipeline for the Remnant of Promise Official
Study Bible. Takes any English-text input (KJV, Charles 1912 Enoch,
Charles 1902 Jubilees, Noah 1840 Jasher, public-domain Apocrypha,
public-domain pseudepigrapha) and produces the Restored Names Edition
output by applying every rule in the yoshi-voice skill:

    Divine names:
      - LORD / Lord (the divine, not lordship)  -> Yahuah (God)
      - God (the Father, when not inside another phrase) -> Elohim (God)
      - Jesus -> Yahusha (Jesus)
      - Christ -> Messiah (Christ)
      - Holy Spirit / Holy Ghost -> Ruach HaKodesh (Holy Spirit)
      - Lord God / LORD God -> Yahuah Elohim (the LORD God)

    Covenant people-names:
      - Israel -> Yashar'el (Israel)
      - Judah  -> Yahudah (Judah)
      - Jews   -> Yahudim (Jews)
      - Jew    -> Yahudi (Jew)
      - Jewish -> Yahudi (Jewish)

    Compound covenant figures (LANDED 2026-05-09):
      - Melchizedek -> Melek Tsadiq (Melchizedek)

    Son-of-Adam restoration (LANDED, absolute):
      - "Son of Man" (Messianic title)         -> "Son of Adam"
      - "the son of man" (generic / vocative)  -> "the son of Adam"
      - "sons of men"                          -> "sons of Adam"

The pipeline is:
  - Deterministic: same input always produces same output
  - Idempotent: running it twice gives the same result as running it once
    (so a verse already restored isn't double-wrapped into "Yahuah (Yahuah (God))")
  - Word-boundary aware: doesn't substitute inside other words (e.g.
    "Godfrey", "lordship", "judaism" — though "judaism" is rare)
  - Order-aware: longer / more-specific patterns run before shorter ones

Usage:
    from restore import Restorer
    r = Restorer()
    out = r.restore_text("And the LORD said unto Moses...")
    # out = "And Yahuah (God) said unto Moses..."   <- needs article fixup,
    # see ARTICLE_FIXUPS below

CLI:
    python3 restore.py < input.txt > output.txt
    python3 restore.py --self-test         # runs the built-in test suite
    python3 restore.py --idempotency-check <file>   # confirms re-running
                                                     # produces identical output
"""

from __future__ import annotations
import argparse
import re
import sys
from dataclasses import dataclass, field
from typing import Callable, List, Optional


# ---------------------------------------------------------------------------
# Rule definitions
# ---------------------------------------------------------------------------
# A Rule is (pattern, replacement_callable, description). Rules apply in
# the order listed. Earlier rules take precedence — if a passage has
# already been touched by an earlier rule, later rules should not double-
# wrap it. Idempotency is enforced by the IDEMPOTENT_GUARD logic below.
# ---------------------------------------------------------------------------


@dataclass
class Rule:
    name: str
    pattern: re.Pattern
    replacement: str | Callable
    note: str = ""


# Idempotency guard: any token that already sits inside a parenthetical
# like "Yahuah (God)" should not be re-substituted. We accomplish this by
# (a) running compound rules first (Lord God before Lord, Holy Spirit before
# Holy/Spirit, etc.) and (b) using lookarounds in the patterns to skip
# tokens already preceded by their restored Hebrew name.

# Helper: a negative lookbehind for "already-restored" prefixes. If a word
# we're about to substitute is preceded by its Hebrew restoration plus a
# space (e.g., "Yahuah (God"), don't touch it — it's the parenthetical.
def _not_in_paren(hebrew_prefix: str) -> str:
    # Negative lookbehind: NOT preceded by `Hebrew (`
    return rf"(?<!{re.escape(hebrew_prefix)} \()"


# Word-boundary helpers using ASCII word chars + apostrophe (for "Yashar'el").
# Both ASCII apostrophe (U+0027) and typographic right single quotation mark
# (U+2019) are excluded from the boundary so that possessive forms like
# "God's" / "God’s" / "Lord's" / "Lord’s" don't accidentally match the base
# singular rule (which would leave "Elohim (God)'s" / "Yahuah (Lord)’s"
# garbage). Possessive forms are handled by the dedicated POSSESSIVE FORMS
# block below — surfaced 2026-05-11 session 19 by Whiston Josephus residuals.
LB = r"(?<![A-Za-z'’])"   # left boundary — no letter or apostrophe before
RB = r"(?![A-Za-z'’])"    # right boundary — no letter or apostrophe after


# ---------------------------------------------------------------------------
# Rule set — order matters
# ---------------------------------------------------------------------------

RULES: list[Rule] = [
    # --- POSSESSIVE FORMS (session 19, 2026-05-11) — run FIRST ---
    # Surfaced 2026-05-11 session 18 close by Whiston Josephus restoration
    # residuals. The base rules below use RB = (?![A-Za-z'’]) which by
    # design refuses to match the noun when an apostrophe follows it — that
    # keeps 'Lordship' from misfiring as 'Lord', but it also means 'Lord's',
    # 'God's', 'Jews'', 'Israel's', 'Judah's', 'Christ's', 'Jesus'', etc.
    # would be left untouched if no possessive rules existed. This block
    # restores possessives explicitly.
    #
    # Ordering: this block runs FIRST so compound possessives ('Lord God's',
    # 'Jesus Christ's') get matched before base singular rules ('Lord_mixed',
    # 'jesus_alone') could consume the head word and leave a broken half-
    # restored possessive trailing. Within this block, compound possessives
    # come before single-noun possessives (longer phrases win, parallel to
    # the base block's ordering).
    #
    # Yoshi's session-19 call: patch restore.py for general possessive
    # handling (option i) — one-time fix that stamps onto every text the
    # pipeline touches (canon, Apocrypha, pseudepigrapha, the seven W-2
    # master PDFs, every future extraction).
    #
    # Apostrophe-tolerance: both ASCII U+0027 and typographic U+2019
    # accepted in the source; the Hebrew head uses ASCII apostrophe for the
    # possessive marker (the canonical form), and the captured source
    # apostrophe is echoed inside the English parenthetical so the rendered
    # output preserves the source punctuation style (Whiston is ASCII,
    # Yoshi's commentary prose mixes both).
    #
    # The already-restored stash + the per-rule re-stash guarantee no
    # double-wrap: e.g., "Elohim's (God's)" gets re-stashed immediately
    # after this rule fires so subsequent rules don't see the inner 'God'.
    # Idempotency is verified by the self-test below and by the
    # --idempotency-check command run against the restored Whiston output.

    # Compound possessives — must run before any base rule (compound or
    # singular) that could consume part of the compound's head.

    # "the LORD God's" / "the Lord God's" -> source-echo parenthetical.
    # Session 54: captures source casing of "the" and LORD/Lord variant.
    Rule(
        name="lord_god_compound_possessive",
        pattern=re.compile(rf"{LB}([Tt]he)\s+(LORD|Lord)\s+God(['’])s{RB}"),
        replacement=r"Yahuah Elohim's (\1 \2 God\3s)",
    ),
    # "LORD God's" / "Lord God's" (no leading "the") -> source-echo.
    # Session 54: captures source casing.
    Rule(
        name="lord_god_naked_possessive",
        pattern=re.compile(rf"{LB}(LORD|Lord)\s+God(['’])s{RB}"),
        replacement=r"Yahuah Elohim's (\1 God\2s)",
    ),
    # "Jesus Christ's" -> "Yahusha HaMashiach's (Jesus Christ's)"
    Rule(
        name="jesus_christ_possessive",
        pattern=re.compile(rf"{LB}Jesus\s+Christ(['’])s{RB}"),
        replacement=r"Yahusha HaMashiach's (Jesus Christ\1s)",
    ),
    # "Christ Jesus's" / "Christ Jesus'" -> "HaMashiach Yahusha's (Christ Jesus's)"
    Rule(
        name="christ_jesus_possessive",
        pattern=re.compile(rf"{LB}Christ\s+Jesus(['’]s?){RB}"),
        replacement=r"HaMashiach Yahusha's (Christ Jesus\1)",
    ),

    # "Holy Spirit's" / "Holy Ghost's" -> "Ruach HaKodesh's (Holy Spirit's)"
    Rule(
        name="holy_spirit_possessive",
        pattern=re.compile(rf"{LB}Holy\s+(Spirit|Ghost)(['’])s{RB}"),
        replacement=r"Ruach HaKodesh's (Holy \1\2s)",
    ),

    # Single-noun possessives.

    # "LORD's" (all-caps) -> "Yahuah's (LORD's)"
    Rule(
        name="LORD_possessive",
        pattern=re.compile(rf"{LB}LORD(['’])s{RB}"),
        replacement=r"Yahuah's (LORD\1s)",
    ),
    # "Lord's" -> "Yahuah's (Lord's)"
    # The preserved-phrases pass stashes:
    #   (a) "the Lord's Supper/Prayer/Day" (Christian institutional terms)
    #   (b) "[possessive-pronoun] Lord" (secular vocative addressing humans)
    # before this rule fires, so this rule only sees divine "Lord's" in
    # genitive position where restoration is correct.
    Rule(
        name="Lord_possessive",
        pattern=re.compile(rf"{LB}Lord(['’])s{RB}"),
        replacement=r"Yahuah's (Lord\1s)",
    ),
    # "Jesus'" / "Jesus's" -> "Yahusha's (Jesus' / Jesus's)"
    # English convention for names ending in 's' allows either form; both
    # appear in Whiston, KJV, and Yoshi's prose. The capturing group catches
    # the apostrophe plus optional s so the parenthetical preserves source
    # fidelity.
    Rule(
        name="Jesus_possessive",
        pattern=re.compile(rf"{LB}Jesus(['’]s?){RB}"),
        replacement=r"Yahusha's (Jesus\1)",
    ),
    # "Christ's" -> "Messiah's (Christ's)"
    Rule(
        name="Christ_possessive",
        pattern=re.compile(rf"{LB}Christ(['’])s{RB}"),
        replacement=r"Messiah's (Christ\1s)",
    ),
    # "God's" -> "Elohim's (God's)"
    # Same conservative scope as god_cap — capitalized only; lowercase
    # "god's" (false gods) stays.
    Rule(
        name="God_possessive",
        pattern=re.compile(rf"{LB}God(['’])s{RB}"),
        replacement=r"Elohim's (God\1s)",
    ),

    # Covenant people-name possessives.

    # "Israel's" -> "Yashar'el's (Israel's)"
    Rule(
        name="Israel_possessive",
        pattern=re.compile(rf"{LB}Israel(['’])s{RB}"),
        replacement=r"Yashar'el's (Israel\1s)",
    ),
    # "Judah's" -> "Yahudah's (Judah's)"
    Rule(
        name="Judah_possessive",
        pattern=re.compile(rf"{LB}Judah(['’])s{RB}"),
        replacement=r"Yahudah's (Judah\1s)",
    ),
    # "Jews'" (plural possessive — apostrophe-only convention) ->
    # "Yahudim's (Jews')"
    # Must run before Jew_possessive (parallel to the base block running
    # jews/jewish before jew). The RB after the apostrophe excludes any
    # trailing 's', so this rule only fires on the well-formed plural
    # possessive "Jews'" and never on the malformed "Jews's".
    Rule(
        name="Jews_possessive",
        pattern=re.compile(rf"{LB}Jews(['’]){RB}"),
        replacement=r"Yahudim's (Jews\1)",
    ),
    # "Jew's" (singular possessive) -> "Yahudi's (Jew's)"
    Rule(
        name="Jew_possessive",
        pattern=re.compile(rf"{LB}Jew(['’])s{RB}"),
        replacement=r"Yahudi's (Jew\1s)",
    ),

    # Compound covenant figure possessive.

    # "Melchizedek's" (with KJV / Vulgate spelling variants) ->
    # "Melek Tsadiq's (Melchizedek's)". Variants covered identically to the
    # base melchizedek rule.
    Rule(
        name="melchizedek_possessive",
        pattern=re.compile(rf"{LB}Melchi[zs]ede[ck]h?(['’])s{RB}"),
        replacement=r"Melek Tsadiq's (Melchizedek\1s)",
    ),

    # Son-of-Adam possessives — must run before the base Son_of_Adam rules
    # (which use RB that excludes apostrophe — same as the singular rules —
    # so the base rules would leave 'son of Adam's' unmatched).

    # "Son of Man's" (Messianic title possessive) -> "Son of Adam's"
    Rule(
        name="Son_of_man_title_possessive",
        pattern=re.compile(rf"{LB}Son\s+of\s+[Mm]an(['’])s{RB}"),
        replacement=r"Son of Adam\1s",
    ),
    # "son of man's" (generic possessive) -> "son of Adam's"
    Rule(
        name="son_of_man_generic_possessive",
        pattern=re.compile(rf"{LB}son\s+of\s+man(['’])s{RB}"),
        replacement=r"son of Adam\1s",
    ),
    # "sons of men's" / "sons of men'" -> "sons of Adam's" / "sons of Adam'"
    Rule(
        name="sons_of_men_possessive",
        pattern=re.compile(rf"{LB}sons\s+of\s+men(['’])s?{RB}"),
        replacement=r"sons of Adam\1",
    ),
    # "Sons of men's" / "Sons of men'" (capitalized) -> "Sons of Adam's"
    Rule(
        name="Sons_of_men_possessive_cap",
        pattern=re.compile(rf"{LB}Sons\s+of\s+men(['’])s?{RB}"),
        replacement=r"Sons of Adam\1",
    ),

    # --- COMPOUND DIVINE NAMES (run first; longer phrases win) ---

    # "the LORD God" / "the Lord God" -> Yahuah Elohim, source-echo parenthetical.
    # Session 54: replacement now captures source casing of both "the" and the
    # LORD/Lord variant, so source "the Lord God" yields "Yahuah Elohim (the Lord God)"
    # and source "The LORD God" yields "Yahuah Elohim (The LORD God)".
    Rule(
        name="lord_god_compound",
        pattern=re.compile(rf"{LB}([Tt]he)\s+(LORD|Lord)\s+God{RB}"),
        replacement=r"Yahuah Elohim (\1 \2 God)",
    ),
    # "LORD God" / "Lord God" (no leading "the") -> Yahuah Elohim, source-echo.
    # Session 54: replacement captures source casing.
    Rule(
        name="lord_god_naked",
        pattern=re.compile(rf"{LB}(LORD|Lord)\s+God{RB}"),
        replacement=r"Yahuah Elohim (\1 God)",
    ),

    # --- HOLY SPIRIT / HOLY GHOST ---
    Rule(
        name="holy_spirit",
        pattern=re.compile(rf"{LB}Holy\s+(Spirit|Ghost){RB}"),
        replacement=r"Ruach HaKodesh (Holy Spirit)",
    ),

    # --- JESUS CHRIST / CHRIST JESUS ---
    Rule(
        name="jesus_christ",
        pattern=re.compile(rf"{LB}Jesus\s+Christ{RB}"),
        replacement=r"Yahusha HaMashiach (Jesus Christ)",
    ),
    Rule(
        name="christ_jesus",
        pattern=re.compile(rf"{LB}Christ\s+Jesus{RB}"),
        replacement=r"HaMashiach Yahusha (Christ Jesus)",
    ),

    # --- SESSION 54 SACRED NAMES CONSTRUCT EXPANSION ---
    # The 21 compound names elevated in Session 54 (Q1/Q2) plus the canon-only
    # Adonai Yahuah construction. Each fires on its specific English signal.
    # Patterns are disjoint by construction. Parenthetical echoes source per Q5.

    # === Yahuah-compounds (descriptive phrases) ===

    # "The LORD is my shepherd" / "The Lord is my shepherd" (Psalm 23:1)
    Rule(
        name="yahuah_raah",
        pattern=re.compile(rf"{LB}([Tt]he)\s+(LORD|Lord)\s+is\s+my\s+shepherd{RB}"),
        replacement=r"Yahuah Ra'ah (\1 \2 is my shepherd)",
    ),
    # "the LORD that healeth thee" / "the Lord that healeth thee" (Exodus 15:26)
    Rule(
        name="yahuah_rapha",
        pattern=re.compile(rf"{LB}([Tt]he)\s+(LORD|Lord)\s+that\s+healeth\s+thee{RB}"),
        replacement=r"Yahuah Rapha (\1 \2 that healeth thee)",
    ),
    # "The LORD is there" / "The Lord is there" (Ezekiel 48:35)
    Rule(
        name="yahuah_shammah",
        pattern=re.compile(rf"{LB}([Tt]he)\s+(LORD|Lord)\s+is\s+there{RB}"),
        replacement=r"Yahuah Shammah (\1 \2 is there)",
    ),

    # === Yahuah-compounds (possessive constructions — "the LORD <pronoun> God") ===

    # "the LORD thy God" / "the Lord thy God" (2nd singular)
    Rule(
        name="yahuah_elohayka",
        pattern=re.compile(rf"{LB}([Tt]he)\s+(LORD|Lord)\s+thy\s+God{RB}"),
        replacement=r"Yahuah Elohayka (\1 \2 thy God)",
    ),
    # "the LORD your God" / "the Lord your God" (2nd plural)
    Rule(
        name="yahuah_elohaychem",
        pattern=re.compile(rf"{LB}([Tt]he)\s+(LORD|Lord)\s+your\s+God{RB}"),
        replacement=r"Yahuah Elohaychem (\1 \2 your God)",
    ),
    # "the LORD our God" / "the Lord our God"
    Rule(
        name="yahuah_eloheinu",
        pattern=re.compile(rf"{LB}([Tt]he)\s+(LORD|Lord)\s+our\s+God{RB}"),
        replacement=r"Yahuah Eloheinu (\1 \2 our God)",
    ),
    # "the LORD my God" / "the Lord my God"
    Rule(
        name="yahuah_elohai",
        pattern=re.compile(rf"{LB}([Tt]he)\s+(LORD|Lord)\s+my\s+God{RB}"),
        replacement=r"Yahuah Elohai (\1 \2 my God)",
    ),
    # "the LORD his God" / "the Lord his God"
    Rule(
        name="yahuah_elohav",
        pattern=re.compile(rf"{LB}([Tt]he)\s+(LORD|Lord)\s+his\s+God{RB}"),
        replacement=r"Yahuah Elohav (\1 \2 his God)",
    ),

    # === Yahuah-compounds (titles and exact phrases) ===

    # "THE LORD OUR RIGHTEOUSNESS" (Jeremiah 23:6, 33:16 — all-caps title)
    Rule(
        name="yahuah_tsidkenu",
        pattern=re.compile(rf"{LB}THE\s+LORD\s+OUR\s+RIGHTEOUSNESS{RB}"),
        replacement=r"Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)",
    ),
    # "the LORD of hosts" / "the Lord of hosts" (with article).
    # The article is dropped: Yahuah is a name, not a title, so the English
    # "the LORD of hosts" loses its article on restoration. Parenthetical
    # therefore reads "(LORD of hosts)" / "(Lord of hosts)", matching the
    # convention used by yahuah_tseva_ot below and the app's strip list.
    # (Updated 2026-05-26 per Yoshi — was emitting buggy "(LORD of hosts)".)
    Rule(
        name="yahuah_tseva_ot_with_the",
        pattern=re.compile(rf"{LB}[Tt]he\s+(LORD|Lord)\s+of\s+hosts{RB}"),
        replacement=r"Yahuah Tseva'ot (\1 of hosts)",
    ),
    # "LORD of hosts" / "Lord of hosts" (no leading "the")
    Rule(
        name="yahuah_tseva_ot",
        pattern=re.compile(rf"{LB}(LORD|Lord)\s+of\s+hosts{RB}"),
        replacement=r"Yahuah Tseva'ot (\1 of hosts)",
    ),

    # === Yahuah-compounds (KJV transliterated place names) ===

    # "Jehovah-jireh" (Genesis 22:14)
    Rule(
        name="yahuah_yireh",
        pattern=re.compile(rf"{LB}Jehovah-jireh{RB}"),
        replacement=r"Yahuah Yireh (Jehovah-jireh)",
    ),
    # "Jehovah-nissi" (Exodus 17:15)
    Rule(
        name="yahuah_nissi",
        pattern=re.compile(rf"{LB}Jehovah-nissi{RB}"),
        replacement=r"Yahuah Nissi (Jehovah-nissi)",
    ),
    # "Jehovah-shalom" (Judges 6:24)
    Rule(
        name="yahuah_shalom",
        pattern=re.compile(rf"{LB}Jehovah-shalom{RB}"),
        replacement=r"Yahuah Shalom (Jehovah-shalom)",
    ),

    # === Adonai Yahuah (canon-only, requires <nd> preservation in re-parsed canon) ===

    # "the Lord GOD" / "the Lord GOD" (mixed-case Lord + small-caps GOD).
    # In the current flattened canon parse this never fires because small-caps
    # GOD is lost. After the Phase D re-parse with <nd> markers preserved,
    # the canon's GOD will be distinguishable from God and this rule activates.
    # Pattern: "Lord GOD" (mixed-case Lord + ALL CAPS GOD). The all-caps GOD
    # is the textual signal for YHWH-in-Adonai-construction in the post-re-parse
    # canon. This rule is dormant until that re-parse lands.
    Rule(
        name="adonai_yahuah",
        pattern=re.compile(rf"{LB}([Tt]he)\s+Lord\s+GOD{RB}"),
        replacement=r"Adonai Yahuah (\1 Lord GOD)",
    ),

    # === El-compounds ===

    # "the everlasting God" (Genesis 21:33) — Yahuah El Olam
    Rule(
        name="el_olam",
        pattern=re.compile(rf"{LB}([Tt]he)\s+(everlasting)\s+God{RB}"),
        replacement=r"El Olam (\1 \2 God)",
    ),
    # "most high God" / "Most High God" / variants (with God) — fires before el_elyon_high
    Rule(
        name="el_elyon_with_god",
        pattern=re.compile(rf"{LB}((?:most|Most)\s+(?:high|High))\s+God{RB}"),
        replacement=r"El Elyon (\1 God)",
    ),
    # "most High" / "Most High" (standalone, no God) — fires after el_elyon_with_god
    Rule(
        name="el_elyon_high",
        pattern=re.compile(rf"{LB}((?:most|Most)\s+High){RB}"),
        replacement=r"El Elyon (\1)",
    ),
    # "The mighty God" / "the mighty God" (Isaiah 9:6)
    Rule(
        name="el_gibbor",
        pattern=re.compile(rf"{LB}([Tt]he)\s+mighty\s+God{RB}"),
        replacement=r"El Gibbor (\1 mighty God)",
    ),
    # "God Almighty" / "Almighty God" — El Shaddai (Genesis 17:1, 28:3, 35:11, etc.)
    Rule(
        name="el_shaddai",
        pattern=re.compile(rf"{LB}(God\s+Almighty|Almighty\s+God){RB}"),
        replacement=r"El Shaddai (\1)",
    ),

    # === Isaiah 9:6 compound titles ===

    # "The everlasting Father" / "the everlasting Father"
    Rule(
        name="avi_ad",
        pattern=re.compile(rf"{LB}([Tt]he)\s+(everlasting)\s+Father{RB}"),
        replacement=r"Avi-ad (\1 \2 Father)",
    ),
    # "The Prince of Peace" / "the Prince of Peace"
    Rule(
        name="sar_shalom",
        pattern=re.compile(rf"{LB}([Tt]he)\s+Prince\s+of\s+Peace{RB}"),
        replacement=r"Sar Shalom (\1 Prince of Peace)",
    ),

    # === Ehyeh asher Ehyeh (Exodus 3:14) ===

    # "I AM THAT I AM" — the divine self-naming
    Rule(
        name="ehyeh_asher_ehyeh",
        pattern=re.compile(rf"{LB}I\s+AM\s+THAT\s+I\s+AM{RB}"),
        replacement=r"Ehyeh asher Ehyeh (I AM THAT I AM)",
    ),

    # --- SINGLE DIVINE NAMES ---
    # Idempotency guards: don't touch words already inside parentheticals.

    # "LORD" (all-caps; the YHWH render in KJV) -> "Yahuah (LORD)"
    # Session 54: source-echo per Q5 — parenthetical preserves source casing
    # (was "Yahuah (God)" under Session 53 normalization; reversed Session 54).
    Rule(
        name="LORD_caps",
        pattern=re.compile(rf"(?<!Yahuah \(){LB}LORD{RB}(?!\))"),
        replacement=r"Yahuah (LORD)",
    ),
    # "Lord" (mixed case; usually divine in KJV when standalone) -> Yahuah
    # NOTE: This is conservative. Some "Lord" instances refer to human
    # nobility — secular vocative addressing a human king or master is
    # common in OT-narrative texts (Jasher, Apocrypha, Genesis-style
    # narrative). Those cases are pre-stashed by PRESERVED_PHRASES below
    # ("Lord and king" / "Lord the king" universally; "[possessive] Lord"
    # when not followed by a divine-name word). The remaining "Lord" cases
    # this rule sees are divine — "the Lord", "Lord God" (handled by the
    # earlier compound rule), and similar.
    Rule(
        name="Lord_mixed",
        pattern=re.compile(rf"(?<!Yahuah \(){LB}Lord{RB}(?!\))"),
        # Session 54: reverses Session 53 normalization. Q5 source-echo —
        # every parenthetical preserves source casing. Source "Lord" yields
        # "Yahuah (Lord)"; source "LORD" yields "Yahuah (LORD)" via LORD_caps.
        # The pipeline is now internally consistent (every parenthetical echoes
        # source); voice skill Sacred Names Convention updated to match.
        replacement=r"Yahuah (Lord)",
    ),

    # "JESUS" (all-caps; KJV emphasis at name-giving) -> "Yahusha (JESUS)"
    # Source-echo per Q5: the parenthetical preserves source casing. The KJV
    # sets the name in all-caps at six scripture-body instances —
    # Matt 1:21, 1:25, 27:37 ("THIS IS JESUS THE KING OF THE JEWS"),
    # Luke 1:31, 2:21, and John 19:19 ("JESUS OF NAZARETH"). Without this
    # rule, the earlier `jesus_alone` regex (case-sensitive `Jesus`) misses
    # them entirely and the verse renders "thou shalt call his name JESUS:
    # for he shall save his people from their sins" — which voids the
    # etymological pedagogy of Matthew 1:21 (Yahusha = Yahuah saves).
    # Mirrors the LORD_caps / Lord_mixed split for the all-caps YHWH render.
    Rule(
        name="JESUS_caps",
        pattern=re.compile(rf"(?<!Yahusha \(){LB}JESUS{RB}(?!\))"),
        replacement=r"Yahusha (JESUS)",
    ),

    # "Jesus" (when not already in compound) -> "Yahusha (Jesus)"
    Rule(
        name="jesus_alone",
        pattern=re.compile(rf"(?<!Yahusha \(){LB}Jesus{RB}(?!\))"),
        replacement=r"Yahusha (Jesus)",
    ),

    # "CHRIST" (all-caps) -> "Messiah (CHRIST)"
    # Source-echo. KJV uses all-caps CHRIST at the few "JESUS CHRIST" name-
    # giving moments (the compound rule jesus_christ above already handles
    # the "JESUS CHRIST" pair when both are all-caps; this rule covers any
    # standalone all-caps CHRIST that slips past the compound match).
    Rule(
        name="CHRIST_caps",
        pattern=re.compile(rf"(?<!Messiah \(){LB}CHRIST{RB}(?!\))"),
        replacement=r"Messiah (CHRIST)",
    ),

    # "Christ" (when not already in compound) -> "Messiah (Christ)"
    Rule(
        name="christ_alone",
        pattern=re.compile(rf"(?<!Messiah \(){LB}Christ{RB}(?!\))"),
        replacement=r"Messiah (Christ)",
    ),

    # "God" (capitalized, divine) -> "Elohim (God)"
    # Conservative: only when capitalized; lowercase "god/gods" referring
    # to false gods stays.
    Rule(
        name="god_cap",
        pattern=re.compile(rf"(?<!Elohim \(){LB}God{RB}(?!\))"),
        replacement=r"Elohim (God)",
    ),

    # --- COVENANT PEOPLE-NAMES ---

    # "Israel" -> "Yashar'el (Israel)"
    Rule(
        name="israel",
        pattern=re.compile(rf"(?<!Yashar'el \(){LB}Israel{RB}(?!\))"),
        replacement=r"Yashar'el (Israel)",
    ),
    # "Judah" -> "Yahudah (Judah)"
    Rule(
        name="judah",
        pattern=re.compile(rf"(?<!Yahudah \(){LB}Judah{RB}(?!\))"),
        replacement=r"Yahudah (Judah)",
    ),
    # "Jews" -> "Yahudim (Jews)" (must run before "Jew")
    Rule(
        name="jews",
        pattern=re.compile(rf"(?<!Yahudim \(){LB}Jews{RB}(?!\))"),
        replacement=r"Yahudim (Jews)",
    ),
    # "Jewish" -> "Yahudi (Jewish)" (must run before "Jew")
    Rule(
        name="jewish",
        pattern=re.compile(rf"(?<!Yahudi \(){LB}Jewish{RB}(?!\))"),
        replacement=r"Yahudi (Jewish)",
    ),
    # "Jew" -> "Yahudi (Jew)"
    Rule(
        name="jew",
        pattern=re.compile(rf"(?<!Yahudi \(){LB}Jew{RB}(?!\))"),
        replacement=r"Yahudi (Jew)",
    ),

    # --- COMPOUND COVENANT FIGURES ---

    # "Melchizedek" -> "Melek Tsadiq (Melchizedek)"
    # LANDED 2026-05-09, pipeline-enforced per Section IX Q1.
    # Variant spellings covered (session 13 finding): the KJV uses
    # "Melchizedek" in the OT (Genesis 14, Psalm 110) but "Melchisedec"
    # in the NT (Hebrews 5-7) — the Latin/Greek transliteration form.
    # Also defensively covers Melchisedech (Vulgate) and Melchizedec
    # (rare KJV variant). All variants normalize to the OT spelling
    # in the parenthetical per YOSHI_RENDERED_PASSAGES.md.
    Rule(
        name="melchizedek",
        pattern=re.compile(rf"(?<!Melek Tsadiq \(){LB}Melchi[zs]ede[ck]h?{RB}(?!\))"),
        replacement=r"Melek Tsadiq (Melchizedek)",
    ),

    # --- SON OF ADAM RESTORATION ---
    # Absolute. Every "son of man" / "Son of Man" / "sons of men" gets
    # restored. Capitalization preserved as the source had it.

    # "Son of man" / "Son of Man" (Messianic title, capitalized) -> "Son of Adam"
    Rule(
        name="son_of_man_title",
        pattern=re.compile(rf"{LB}Son\s+of\s+[Mm]an{RB}"),
        replacement=r"Son of Adam",
    ),
    # "son of man" (lowercase / generic / vocative) -> "son of Adam"
    Rule(
        name="son_of_man_generic",
        pattern=re.compile(rf"{LB}son\s+of\s+man{RB}"),
        replacement=r"son of Adam",
    ),
    # --- PLURAL "sons of men" — REMOVED at S62 (Book-of-Life rule) ---
    #
    # Prior (pre-S62) wheel: an unconditional plural substitution
    #
    #     "sons of men"  -> "sons of Adam"
    #     "Sons of men"  -> "Sons of Adam"
    #
    # fired everywhere "sons of men" appeared. That overreach baked
    # 24 plural "sons of Adam" into parsed/canon.json — most of them
    # in passages where the phrase reads as humanity-broadly (Psalms
    # 4:2, 33:13, 57:4, 58:1, 145:12; Proverbs 8:31; Ecclesiastes
    # 2:3, 2:8, 3:10, 3:18, 3:19, 8:11, 9:3, 9:12; Isaiah 52:14;
    # Jeremiah 32:19; Daniel 5:21, 10:16; Joel 1:12; Micah 5:7;
    # Mark 3:28; Ephesians 3:5; and the contrast-pair at Psalm 31:19).
    #
    # The Book-of-Life rule (logged in the voice skill): "sons of
    # Adam" names the seed of promise — those whose names are
    # written in the Book of Life from the foundation of the world
    # (Revelation 13:8; 17:8). It is spiritual, not biological. It
    # never refers to humanity-broadly. Context is paragraph- and
    # chapter-level, not grammar.
    #
    # The plural substitution therefore cannot be a global default.
    # The default is "sons of men" (the source-language plain
    # rendering); the Book-of-Life keep is the named exception, and
    # the named exceptions live in YOSHI_RENDERED_PASSAGES.md as
    # verse-level overrides — currently Deuteronomy 32:8 only,
    # where El Elyon sets the bounds of the nations by reference
    # to *the number of the children of Yashar'el (Israel)* — the
    # covenant body, the seed line. The separated *sons of Adam*
    # at the boundary-setting is the seed distinguished out from
    # the nations.
    #
    # Singular rules above (`son_of_man_title`, `son_of_man_generic`)
    # stay intact — Red Line #12 is absolute: every singular "son of
    # man" (Messianic title in the gospels, Ezekiel vocative, Psalm 8
    # generic) restores to "son of Adam". The kaph-comparative cases
    # (Daniel 7:13 *kbar enash,* Revelation 1:13, 14:14) preserve the
    # *like a son of Adam* comparative and are handled elsewhere.
]


# ---------------------------------------------------------------------------
# Article fixups (post-pass)
# ---------------------------------------------------------------------------
# After substitution, certain article+name combinations need cleanup:
#   "Yahuah (God)" -> "Yahuah (God)" (typically — KJV's "the LORD" is
#       just "the divine name with article" in English; restored, the article
#       drops because Hebrew tetragrammaton stands alone).
# We handle this conservatively — only the most clear-cut cases — and let
# Yoshi flag others for inclusion via the validation diff against published
# editions.

ARTICLE_FIXUPS: list[Rule] = [
    # Use [ \t]+ (not \s+) to avoid matching across newlines, which would
    # collapse two source lines into one and break line-by-line diffing.
    # Surfaced 2026-05-10 session 5 by validate_diff against the published
    # Apocrypha — a single \s+ across a newline was creating a 13-line
    # shift cascade that produced ~26,000 alignment-artifact diffs.
    #
    # UPDATED 2026-05-26 (Yoshi): the "genitive position preserves 'the'"
    # carve-out has been retired. Yahuah is a personal name; English drops
    # the article before personal names in every position (subject, object,
    # genitive). The previous compromise left ~8,900 buggy "the Yahuah (...)"
    # forms across canon/apocrypha; those have been cleaned in the data and
    # the pipeline now drops the article on the restoration pass so future
    # regenerations stay correct. Match is anchored on the parenthetical
    # gloss so non-restored "the" usages aren't touched.
    Rule(
        name="the_yahuah_LORD",
        pattern=re.compile(rf"{LB}[Tt]he[ \t]+Yahuah[ \t]+\(LORD\){RB}"),
        replacement=r"Yahuah (LORD)",
        note="KJV 'the LORD' restores to 'Yahuah (LORD)' without leading article.",
    ),
    Rule(
        name="the_yahuah_Lord",
        pattern=re.compile(rf"{LB}[Tt]he[ \t]+Yahuah[ \t]+\(Lord\){RB}"),
        replacement=r"Yahuah (Lord)",
        note="KJV 'the Lord' restores to 'Yahuah (Lord)' without leading article.",
    ),
    Rule(
        name="the_yahuah_God",
        pattern=re.compile(rf"{LB}[Tt]he[ \t]+Yahuah[ \t]+\(God\){RB}"),
        replacement=r"Yahuah (God)",
        note="KJV 'the God' (rare) restores to 'Yahuah (God)' without leading article.",
    ),
    # Possessive form: "Yahuah's (Lord's)" / "Yahuah's (LORD's)" etc.
    # Handles both ASCII and typographic apostrophes in the parenthetical.
    Rule(
        name="the_yahuahs_possessive",
        pattern=re.compile(rf"{LB}[Tt]he[ \t]+Yahuah(['’])s[ \t]+\((LORD|Lord|God)(['’])s\){RB}"),
        replacement=r"Yahuah\1s (\2\3s)",
        note="KJV 'the LORD's' restores to 'Yahuah's' without leading article.",
    ),
]


# ---------------------------------------------------------------------------
# Restorer class
# ---------------------------------------------------------------------------


# All Hebrew restoration heads — used in the "already-restored" guard.
# Any sequence of these words followed by a parenthetical English gloss is
# treated as already-restored and protected from further substitution.
#
# The list includes the strict pipeline-enforced heads (Yahuah, Yahusha,
# Elohim, Messiah, the covenant people-names, Melek Tsadiq) AND additional
# Hebrew heads that remain "translator's call" in the voice skill but show up
# as already-restored Hebrew(English) parentheticals in Yoshi's commentary
# prose. Adding them here protects existing instances from being re-touched
# by the rules; it does NOT make them pipeline-enforced restorations. New
# heads land here when validation diffs against published editions surface
# them — El Shaddai and El Elyon were both surfaced 2026-05-10 session 7 by
# the Jubilees diff (El Shaddai (God Almighty) had its inner "God" re-wrapped
# by the god_cap rule because El Shaddai was not in this list).
_HEBREW_HEADS = [
    # Multi-word heads first (longest match wins in the regex below).
    "Yahusha HaMashiach",
    "HaMashiach Yahusha",
    "Ehyeh asher Ehyeh",
    "Yahuah Elohayka",
    "Yahuah Elohaychem",
    "Yahuah Eloheinu",
    "Yahuah Elohai",
    "Yahuah Elohav",
    "Yahuah Tseva'ot",
    "Yahuah Tsidkenu",
    "Yahuah Shammah",
    "Yahuah Shalom",
    "Yahuah Rapha",
    "Yahuah Ra'ah",
    "Yahuah Yireh",
    "Yahuah Nissi",
    "Yahuah Elohim",
    "Adonai Yahuah",
    "Ruach HaKodesh",
    "Melek Tsadiq",
    "Sar Shalom",
    "El Shaddai",
    "El Gibbor",
    "El Elyon",
    "El Olam",
    "El Roi",
    "Avi-ad",
    "Adonai",
    "Yahusha",
    "Yahuah",
    "Elohim",
    "Messiah",
    "Yashar'el",
    "Yahudah",
    "Yahudim",
    "Yahudi",
    "HaMashiach",
    "El",
    "Yah",
]
# Sort by length descending so the regex tries longest matches first.
_HEBREW_HEADS_SORTED = sorted(_HEBREW_HEADS, key=len, reverse=True)
# Apostrophe-tolerant escape — Yoshi's published prose mixes ASCII apostrophe
# (U+0027) and typographic right single quotation mark (U+2019) in the same
# verse, sometimes within the same paragraph. Hebrew heads carry an
# apostrophe (Yashar'el) that the published prose may render either way; the
# possessive marker after a Hebrew head also varies. Both forms must match.
def _apostrophe_tolerant(escaped: str) -> str:
    """Replace any apostrophe in an already-escaped regex token with a
    character class accepting both ASCII (U+0027) and typographic
    (U+2019) apostrophes. Python's re.escape does not escape apostrophes
    (they aren't regex metacharacters), so we substitute the literal
    apostrophe character — both forms — in a single pass via re.sub so
    the rewrite of the first form doesn't get re-rewritten by the second
    (an earlier two-pass `.replace` produced nested `[['’]'’]` garbage)."""
    return re.sub(r"['’]", "['’]", escaped)


# The "already-restored" pattern. Allows an optional possessive marker
# (ASCII ' or typographic ' followed by s) between the Hebrew head and the
# parenthetical English. This handles "Yahudah's (Judah's)" and the
# typographic-apostrophe variant "Yahudah's (Judah's)" — both forms appear
# in Yoshi's published commentary prose. The Hebrew-head apostrophe itself
# is also apostrophe-tolerant so "Yashar'el" matches "Yashar'el". Surfaced
# 2026-05-10 session 7 by the Jubilees diff (11 verses with possessive forms
# were having the inner English re-wrapped because the apostrophe-s broke
# the \s*\( match, plus typographic-apostrophe Hebrew heads weren't matching
# the ASCII-apostrophe literal in _HEBREW_HEADS).
_ALREADY_RESTORED_PAT = re.compile(
    r"(?:" + "|".join(_apostrophe_tolerant(re.escape(h)) for h in _HEBREW_HEADS_SORTED) + r")"
    r"(?:['’]s)?"
    r"\s*\([^)]+\)"
)
_SENTINEL_PAT = re.compile(r"\x00R(\d+)\x00")


# ---------------------------------------------------------------------------
# Preserved phrases — text that must NOT be restored.
# ---------------------------------------------------------------------------
# In the Apocrypha, "Jesus" is used as the name for several Old Testament
# figures whose Hebrew name is Yeshua/Yehoshua, NOT the Messiah:
#   - Jesus the son of Sirach (= Yeshua ben Sira; author of Ecclesiasticus)
#   - Jesus the son of Josedec (= Yehoshua the high priest; Ezra/Nehemiah)
#   - Jesus the son of Nave (= Yehoshua son of Nun = Joshua)
# Restoring these to "Yahusha (Jesus)" is semantically wrong — these aren't
# the Messiah. Yoshi's published Apocrypha preserves them as "Jesus."
# Surfaced 2026-05-10 session 5 by validate_diff against the published
# Apocrypha (lines 315-317 of the front-matter explained the convention).
#
# This list can grow over time as more cases come up. Each entry is a regex
# matched against the input text BEFORE the main substitution rules run; the
# match is stashed, the rules run, and the original phrase is restored
# verbatim after.
PRESERVED_PHRASES: list[re.Pattern] = [
    # "Jesus the son of <Proper Noun>" — Apocrypha figures whose Greek name
    # in the LXX/KJV is Iēsous (Jesus) but who are not the Messiah.
    re.compile(r"\bJesus\s+the\s+son\s+of\s+[A-Z][a-z]+(?:\s+[A-Z][a-z]+)?\b"),
    # "Jesus son of <Proper Noun>" — same case without "the"
    re.compile(r"\bJesus\s+son\s+of\s+[A-Z][a-z]+(?:\s+[A-Z][a-z]+)?\b"),
    # "Jesus called Justus" (Colossians 4:11) — also not the Messiah
    re.compile(r"\bJesus\s+called\s+Justus\b"),

    # ----- SECULAR LORD VOCATIVE -----
    # Surfaced 2026-05-10 session 6 by validate_verse_diff against the
    # published Jasher (62 of 723 verse diffs were secular "my Lord and
    # king" / "my Lord" addressing human kings — Nimrod, Pharaoh, Esau,
    # Joseph, Jacob, Abraham — being incorrectly restored to "Yahuah (Lord)").
    # In OT-narrative texts (Jasher, Apocrypha, Genesis-style narrative)
    # "Lord" capitalized in dialog with possessive pronouns is overwhelmingly
    # secular vocative — the speaker addressing or referring to a human
    # superior. Restoring those to the divine name is wrong.
    #
    # The two patterns below catch:
    #   (a) "Lord and king" / "Lord the king" — paired with "king" makes
    #       the secular meaning explicit (divine kingship doesn't pair
    #       with the noun "king" this way in scripture).
    #   (b) "[possessive] Lord" — my/our/your/his/her/their + Lord, when
    #       NOT followed by a divine name (Jesus/Christ/God/Yahusha/
    #       Yahuah/GOD/LORD). The negative lookahead protects NT cases
    #       like "our Lord Jesus Christ" and "our Lord God" so the divine
    #       Lord-title still restores in those contexts.

    # "Lord and king" / "Lord the king" — universal secular pattern
    re.compile(r"\bLord\s+(?:and|the)\s+king\b"),
    # "[possessive] Lord" — secular vocative, with NT divine-context exception
    re.compile(
        r"\b(?:[Mm]y|[Oo]ur|[Yy]our|[Hh]is|[Hh]er|[Tt]heir)\s+Lord\b"
        r"(?!\s+(?:Jesus|Christ|God|Yahusha|Yahuah|GOD|LORD))"
    ),

    # ----- CHRISTIAN INSTITUTIONAL TERMS -----
    # Surfaced 2026-05-10 session 7 by validate_verse_diff against the
    # published Jubilees (49:23 commentary names "what later Christianity
    # called the Lord's Supper" — the term is being quoted as the named
    # Christian rite, and restoring "Lord" inside it produces the awkward
    # "Yahuah (Lord)'s Supper" which is theologically wrong: Christianity
    # didn't call it the Yahuah's Supper, it called it the Lord's Supper).
    # Preserve the named Christian rites verbatim. Both ASCII and typographic
    # apostrophe accepted because Yoshi's published prose uses the typographic
    # form.
    re.compile(r"\bthe\s+Lord['’]s\s+(?:Supper|Prayer|Day)\b"),

    # ----- FRAMEWORK-PHRASE NAMING -----
    # Surfaced 2026-05-10 session 7 by validate_verse_diff against the
    # published Jubilees (31:32 commentary names "the Jew and Gentile binary"
    # — the voice skill's whole point about that phrase is to name it as the
    # LIE, not to restore "Jew" as a covenant-people name in this slot).
    # The phrase is a framework-quotation; preserve verbatim.
    re.compile(r"\bJew\s+and\s+Gentile\s+binary\b"),
]


# ---------------------------------------------------------------------------
# Edition-specific configurations
# ---------------------------------------------------------------------------
# Some books need certain rules turned OFF. The Apocrypha is the canonical
# example: every "Jesus" in the fourteen Apocrypha books is Yeshua/Yehoshua
# (Joshua), NOT the Messiah, because the Apocrypha is pre-Messiah scripture.
# The "jesus_alone" rule must be excluded when running the pipeline on
# Apocrypha books — surfaced 2026-05-10 session 5 by validate_verse_diff
# against the published Apocrypha (9 of 11 verse diffs were misrestored
# Joshua mentions).

# Mode names → set of rule names to exclude.
EXCLUDED_RULES_BY_MODE: dict[str, set[str]] = {
    "default": set(),
    # Apocrypha mode: every "Jesus" alone is Joshua/Yeshua, not the Messiah.
    # The Jesus Christ / Christ Jesus compounds stay in the rule list — they
    # don't fire in the Apocrypha (no such phrase appears) but kept for safety.
    "apocrypha": {"jesus_alone"},
    # Old Testament mode (not yet wired): same logic — "Jesus" doesn't
    # appear in the OT but if any pipeline path produced one, it would be
    # wrong to restore. Kept here for future extensibility.
    "old_testament": {"jesus_alone"},
}


@dataclass
class Restorer:
    rules: list[Rule] = field(default_factory=lambda: list(RULES))
    article_fixups: list[Rule] = field(default_factory=lambda: list(ARTICLE_FIXUPS))
    mode: str = "default"

    def __post_init__(self):
        excluded = EXCLUDED_RULES_BY_MODE.get(self.mode, set())
        if excluded:
            self.rules = [r for r in self.rules if r.name not in excluded]

    def restore_text(self, text: str) -> str:
        # The pipeline uses a "stash-after-every-rule" loop to keep
        # newly-created restored patterns from being re-touched by
        # subsequent rules. This makes the pipeline idempotent and
        # protects compound restorations from singular-rule overlap.
        stash: list[str] = []

        def _stash(m: re.Match) -> str:
            stash.append(m.group(0))
            return f"\x00R{len(stash)-1}\x00"

        # Stash preserved phrases first. These must come back verbatim,
        # so they go in BEFORE the already-restored guard runs and
        # before any substitution rule fires.
        out = text
        for pat in PRESERVED_PHRASES:
            out = pat.sub(_stash, out)

        # Initial stash of pre-existing restored patterns.
        out = _ALREADY_RESTORED_PAT.sub(_stash, out)

        # Run each rule, then re-stash any newly-created restored patterns
        # so they're protected from subsequent rules.
        for rule in self.rules:
            out = rule.pattern.sub(rule.replacement, out)
            out = _ALREADY_RESTORED_PAT.sub(_stash, out)

        # Unstash before article fixups — the fixups need to see the
        # literal restored text (e.g., "Yahuah (God)" -> "Yahuah (God)")
        # because they operate on the article-plus-restored-name pattern.
        def _unstash(m: re.Match) -> str:
            return stash[int(m.group(1))]

        while _SENTINEL_PAT.search(out):
            out = _SENTINEL_PAT.sub(_unstash, out)

        # Re-clear the stash for the article-fixup pass.
        stash.clear()
        out = _ALREADY_RESTORED_PAT.sub(_stash, out)

        # Article fixups need the un-stashed form. They operate on
        # "the <Hebrew> (<English>)" patterns explicitly. So we unstash
        # for this pass.
        while _SENTINEL_PAT.search(out):
            out = _SENTINEL_PAT.sub(_unstash, out)

        for fix in self.article_fixups:
            out = fix.pattern.sub(fix.replacement, out)

        return out

    def restore_lines(self, lines: list[str]) -> list[str]:
        return [self.restore_text(ln) for ln in lines]


# ---------------------------------------------------------------------------
# Self-test
# ---------------------------------------------------------------------------

SELF_TESTS: list[tuple[str, str, str]] = [
    # (description, input, expected_output)
    # Session 54: source-echo per Q5 — parentheticals preserve source casing.
    (
        "single LORD source-echo (article dropped 2026-05-26)",
        "And the LORD said unto Moses",
        "And Yahuah (LORD) said unto Moses",
    ),
    (
        "single Lord source-echo (mixed-case, divine)",
        "the Lord said unto Moses",
        "Yahuah (Lord) said unto Moses",
    ),
    (
        "compound the LORD God source-echo",
        "I am the LORD God of Israel",
        "I am Yahuah Elohim (the LORD God) of Yashar'el (Israel)",
    ),
    (
        "compound the Lord God source-echo",
        "I am the Lord God of Israel",
        "I am Yahuah Elohim (the Lord God) of Yashar'el (Israel)",
    ),
    (
        "Jesus Christ as compound",
        "the gospel of Jesus Christ",
        "the gospel of Yahusha HaMashiach (Jesus Christ)",
    ),
    (
        "Jesus alone",
        "Jesus wept.",
        "Yahusha (Jesus) wept.",
    ),
    (
        "Christ alone",
        "for the love of Christ",
        "for the love of Messiah (Christ)",
    ),
    (
        "Holy Spirit",
        "filled with the Holy Spirit",
        "filled with the Ruach HaKodesh (Holy Spirit)",
    ),
    (
        "Holy Ghost (KJV)",
        "the Holy Ghost descended",
        "the Ruach HaKodesh (Holy Spirit) descended",
    ),
    (
        "Israel and Judah",
        "the houses of Israel and Judah",
        "the houses of Yashar'el (Israel) and Yahudah (Judah)",
    ),
    (
        "Jews / Jewish / Jew",
        "the Jews said this Jewish man was a Jew",
        "the Yahudim (Jews) said this Yahudi (Jewish) man was a Yahudi (Jew)",
    ),
    (
        "Melchizedek",
        "after the order of Melchizedek",
        "after the order of Melek Tsadiq (Melchizedek)",
    ),
    (
        "Melchisedec (KJV NT spelling) — session 13 finding, pipeline now matches the variant",
        "after the order of Melchisedec",
        "after the order of Melek Tsadiq (Melchizedek)",
    ),
    (
        "Melchisedec mid-sentence (Heb 7:1) — El Elyon fires on 'most high God' (Session 54)",
        "For this Melchisedec, king of Salem, priest of the most high God",
        "For this Melek Tsadiq (Melchizedek), king of Salem, priest of the El Elyon (most high God)",
    ),
    (
        "Son of Man as Messianic title",
        "the Son of Man cometh",
        "the Son of Adam cometh",
    ),
    (
        "son of man (vocative to Ezekiel)",
        "Behold, son of man, what they do",
        "Behold, son of Adam, what they do",
    ),
    (
        # S62 (Book-of-Life rule): the global plural "sons of men" -> "sons
        # of Adam" rule was removed. Plural "sons of men" now stays as the
        # default; the named Book-of-Life keeps (Deut 32:8, etc.) live in
        # YOSHI_RENDERED_PASSAGES.md as verse-level overrides, not as a
        # pipeline rule. Test asserts the new default.
        "sons of men plural — default stays (S62 Book-of-Life rule)",
        "the sons of men do this",
        "the sons of men do this",
    ),
    (
        "idempotency — already restored verse",
        "And Yahuah (God) said unto Mosheh",
        "And Yahuah (God) said unto Mosheh",
    ),
    (
        "idempotency — full restored mix",
        "Yahusha HaMashiach (Jesus Christ) is Yahuah (God) of Yashar'el (Israel)",
        "Yahusha HaMashiach (Jesus Christ) is Yahuah (God) of Yashar'el (Israel)",
    ),
    (
        "no false trigger on 'godly'",
        "a godly man feared the Lord",
        "a godly man feared Yahuah (Lord)",
    ),
    (
        "no false trigger on 'jewelry'",
        "she wore jewelry",
        "she wore jewelry",
    ),
    (
        "the LORD (article dropped 2026-05-26 — Yahuah is a personal name, no article)",
        "Behold, the LORD reigns",
        "Behold, Yahuah (LORD) reigns",
    ),
    (
        "newline does not break substitution boundary",
        "And he said\nLORD is my shepherd",
        "And he said\nYahuah (LORD) is my shepherd",
    ),
    (
        "Apocrypha: Jesus the son of Sirach (NOT the Messiah) is preserved",
        "Jesus the son of Sirach wrote",
        "Jesus the son of Sirach wrote",
    ),
    (
        "Apocrypha: Jesus the son of Josedec is preserved",
        "Jesus the son of Josedec the high priest",
        "Jesus the son of Josedec the high priest",
    ),
    (
        "Apocrypha: Jesus the son of Nave is preserved",
        "Jesus the son of Nave",
        "Jesus the son of Nave",
    ),
    # --- secular Lord vocative preservation (Jasher session 6) ---
    (
        "secular: 'Lord and king' addressing Nimrod is preserved",
        "And now our Lord and king, behold we have seen this child.",
        "And now our Lord and king, behold we have seen this child.",
    ),
    (
        "secular: 'Lord the king' is preserved",
        "Now therefore my Lord the king imagine not that this child did this.",
        "Now therefore my Lord the king imagine not that this child did this.",
    ),
    (
        "secular: 'my Lord' addressing Abram is preserved (followed by name)",
        "you did tell my Lord Abram to go from his land",
        "you did tell my Lord Abram to go from his land",
    ),
    (
        "secular: 'my Lord' standalone vocative is preserved",
        "And Abram said to his father, My Lord, shew them to me.",
        "And Abram said to his father, My Lord, shew them to me.",
    ),
    (
        "secular: 'his Lord' / 'their Lord' / 'your Lord' all preserved",
        "Pharaoh his Lord knew nothing of it, nor did your Lord, nor their Lord.",
        "Pharaoh his Lord knew nothing of it, nor did your Lord, nor their Lord.",
    ),
    (
        "divine: 'our Lord Jesus Christ' still restores (negative lookahead exception)",
        "the gospel of our Lord Jesus Christ",
        "the gospel of our Yahuah (Lord) Yahusha HaMashiach (Jesus Christ)",
    ),
    (
        "divine: 'my Lord God' restores via compound rule (Lord God beats secular preservation)",
        "praise my Lord God for ever",
        "praise my Yahuah Elohim (Lord God) for ever",
    ),
    (
        "divine: bare 'the Lord' still restores (no possessive prefix)",
        "they cried unto the Lord their Elohim",
        "they cried unto Yahuah (Lord) their Elohim",
    ),

    # --- possessive idempotency (Jubilees session 7) ---
    (
        "idempotent: Hebrew(English) with possessive 's stays put — Yahudah's (Judah's)",
        "this distinction is Yahudah's (Judah's) alone",
        "this distinction is Yahudah's (Judah's) alone",
    ),
    (
        "idempotent: typographic apostrophe possessive — Yahudah’s (Judah’s)",
        "this distinction is Yahudah’s (Judah’s) alone",
        "this distinction is Yahudah’s (Judah’s) alone",
    ),
    (
        "idempotent: Yashar'el's (Israel's) possessive form is preserved",
        "the church has tried to inherit what was always Yashar'el's (Israel's)",
        "the church has tried to inherit what was always Yashar'el's (Israel's)",
    ),
    (
        "idempotent: Yahuah's (God's) possessive form is preserved",
        "the long arc is Yahuah's (God's) covenant",
        "the long arc is Yahuah's (God's) covenant",
    ),
    (
        "idempotent: Messiah's (Christ's) possessive form is preserved",
        "by faith and the Messiah's (Christ's) atonement",
        "by faith and the Messiah's (Christ's) atonement",
    ),

    # --- compound Hebrew head protection (Jubilees session 7) ---
    (
        "idempotent: El Shaddai (God Almighty) inner 'God' is protected",
        "I am El Shaddai (God Almighty); approve yourself",
        "I am El Shaddai (God Almighty); approve yourself",
    ),
    (
        "idempotent: El Elyon (Most High) inner content is protected",
        "the priest of the El Elyon (Most High)",
        "the priest of the El Elyon (Most High)",
    ),
    (
        "El Shaddai pipeline-enforced (Session 54) — 'God Almighty' fires El Shaddai rule",
        "the God Almighty of all flesh",
        "the El Shaddai (God Almighty) of all flesh",
    ),

    # --- Christian institutional terms (Jubilees session 7) ---
    (
        "preserved: the Lord's Supper as named Christian rite",
        "what later Christianity called the Lord's Supper",
        "what later Christianity called the Lord's Supper",
    ),
    (
        "preserved: the Lord's Prayer as named Christian rite",
        "they recited the Lord's Prayer at the meeting",
        "they recited the Lord's Prayer at the meeting",
    ),
    (
        "preserved: the Lord's Day as named Christian observance",
        "they kept the Lord's Day instead of the Sabbath",
        "they kept the Lord's Day instead of the Sabbath",
    ),
    (
        "preserved: typographic apostrophe Lord’s Supper variant",
        "what Christianity called the Lord’s Supper",
        "what Christianity called the Lord’s Supper",
    ),

    # --- framework-phrase preservation (Jubilees session 7) ---
    (
        "preserved: 'Jew and Gentile binary' as framework-named phrase",
        "the reader who has carried the Jew and Gentile binary all their reading life",
        "the reader who has carried the Jew and Gentile binary all their reading life",
    ),
    (
        "Jew NOT preserved outside the binary phrase — bare 'the Jew' still restores",
        "the Jew came up to the temple",
        "the Yahudi (Jew) came up to the temple",
    ),

    # --- apocalyptic divine compound titles (Enoch session 8; (God) reconcile session 53) ---
    # Defensive lock-in: 1 Enoch's "Lord of Spirits" (the Parables, chs. 37-69)
    # and "Lord of the sheep" (the Animal Apocalypse, chs. 85-90) are divine
    # compound titles that get standard Lord -> Yahuah (God) restoration.
    # They must NOT match the secular-Lord preserve list (which is human-king
    # vocatives only). These tests guard against any future regression that
    # accidentally extends secular preservation into divine apocalyptic titles.
    (
        "apocalyptic: 'Lord of Spirits' (1 Enoch Parables divine title) restores",
        "And the Lord of Spirits shall abide over them",
        "And Yahuah (Lord) of Spirits shall abide over them",
    ),
    (
        "apocalyptic: 'Lord of the sheep' (1 Enoch Animal Apocalypse) restores",
        "And the Lord of the sheep rejoiced over them",
        "And Yahuah (Lord) of the sheep rejoiced over them",
    ),
    (
        "apocalyptic: 'Lord of lords' (compound divine title) restores",
        "Lord of lords, Elohim (God) of elohiym, King of kings",
        "Yahuah (Lord) of lords, Elohim (God) of elohiym, King of kings",
    ),
    (
        "idempotent: 'Yahuah (God) of Spirits' already-restored stays put",
        "And Yahuah (God) of Spirits shall abide over them",
        "And Yahuah (God) of Spirits shall abide over them",
    ),

    # --- POSSESSIVE FORMS (session 19, 2026-05-11) ---
    # Whiston Josephus session-18-close residual scan surfaced these classes.
    # The patch route (option i) extends restore.py with general possessive
    # rules so the fix stamps onto every text the pipeline touches. These
    # tests anchor the new behavior and protect against regressions on
    # subsequent W-2 PDFs (Charles, Lightfoot, Malan, M.R. James, Box).
    (
        "possessive: God's restores to Elohim's (God's)",
        "the heavens declare God's glory",
        "the heavens declare Elohim's (God's) glory",
    ),
    (
        "possessive: typographic apostrophe God’s also restores",
        "the heavens declare God’s glory",
        "the heavens declare Elohim's (God’s) glory",
    ),
    (
        "possessive: Lord's restores to Yahuah's (Lord's)",
        "they walked in the Lord's ways",
        "they walked in Yahuah's (Lord's) ways",
    ),
    (
        "possessive: LORD's (all-caps) restores to Yahuah's (LORD's)",
        "the LORD's anointed",
        "Yahuah's (LORD's) anointed",
    ),
    (
        "possessive: Christ's restores to Messiah's (Christ's)",
        "by Christ's atonement",
        "by Messiah's (Christ's) atonement",
    ),
    (
        "possessive: Jesus' (apostrophe-only) restores to Yahusha's (Jesus')",
        "Jesus' disciples followed him",
        "Yahusha's (Jesus') disciples followed him",
    ),
    (
        "possessive: Jesus's (apostrophe-s) restores to Yahusha's (Jesus's)",
        "Jesus's disciples followed him",
        "Yahusha's (Jesus's) disciples followed him",
    ),
    (
        "possessive: Israel's restores to Yashar'el's (Israel's)",
        "Israel's God is one",
        "Yashar'el's (Israel's) Elohim (God) is one",
    ),
    (
        "possessive: Judah's restores to Yahudah's (Judah's)",
        "Judah's portion was great",
        "Yahudah's (Judah's) portion was great",
    ),
    (
        "possessive: Jews' (plural apostrophe-only) restores to Yahudim's (Jews')",
        "the Jews' customs were strict",
        "the Yahudim's (Jews') customs were strict",
    ),
    (
        "possessive: Jew's (singular) restores to Yahudi's (Jew's)",
        "the Jew's covenant identity",
        "the Yahudi's (Jew's) covenant identity",
    ),
    (
        "possessive: Holy Spirit's restores to Ruach HaKodesh's (Holy Spirit's)",
        "by the Holy Spirit's power",
        "by the Ruach HaKodesh's (Holy Spirit's) power",
    ),
    (
        "possessive: Holy Ghost's (KJV) restores to Ruach HaKodesh's (Holy Ghost's)",
        "by the Holy Ghost's power",
        "by the Ruach HaKodesh's (Holy Ghost's) power",
    ),
    (
        "possessive: Melchizedek's restores to Melek Tsadiq's (Melchizedek's)",
        "after Melchizedek's order",
        "after Melek Tsadiq's (Melchizedek's) order",
    ),
    (
        "possessive: Melchisedec's (NT spelling) also restores",
        "after Melchisedec's order",
        "after Melek Tsadiq's (Melchizedek's) order",
    ),
    (
        "possessive: Lord God's compound restores to Yahuah Elohim's (Lord God's) [source-echo]",
        "Lord God's commandments",
        "Yahuah Elohim's (Lord God's) commandments",
    ),
    (
        "possessive: the Lord God's compound restores cleanly [source-echo]",
        "the Lord God's mighty hand",
        "Yahuah Elohim's (the Lord God's) mighty hand",
    ),
    (
        "possessive: Jesus Christ's compound restores to Yahusha HaMashiach's (Jesus Christ's)",
        "by Jesus Christ's blood",
        "by Yahusha HaMashiach's (Jesus Christ's) blood",
    ),
    (
        "possessive: son of man's restores to son of Adam's",
        "the son of man's heart was troubled",
        "the son of Adam's heart was troubled",
    ),
    (
        "possessive: Son of Man's (Messianic title) restores to Son of Adam's",
        "the Son of Man's coming",
        "the Son of Adam's coming",
    ),

    # Idempotency — possessive restored forms must stay put on re-run.
    (
        "idempotent possessive: Elohim's (God's) stays put",
        "the heavens declare Elohim's (God's) glory",
        "the heavens declare Elohim's (God's) glory",
    ),
    (
        "idempotent possessive: Yahuah's (Lord's) stays put",
        "they walked in Yahuah's (Lord's) ways",
        "they walked in Yahuah's (Lord's) ways",
    ),
    (
        "idempotent possessive: Yahudim's (Jews') stays put",
        "the Yahudim's (Jews') customs were strict",
        "the Yahudim's (Jews') customs were strict",
    ),
    (
        "idempotent possessive: Yahusha's (Jesus') stays put",
        "Yahusha's (Jesus') disciples followed him",
        "Yahusha's (Jesus') disciples followed him",
    ),

    # Negative cases — preserved phrases must not be touched by the new
    # possessive rules.
    (
        "preserved: 'the Lord's Supper' still preserved when followed by Supper",
        "what Christianity called the Lord's Supper",
        "what Christianity called the Lord's Supper",
    ),
    (
        "preserved: secular 'my Lord' (no possessive '') still preserved",
        "And he said unto his father, My Lord, shew me the way.",
        "And he said unto his father, My Lord, shew me the way.",
    ),
    (
        "no false trigger: 'gods' (lowercase, false gods) stays unchanged",
        "they served the gods' altars",
        "they served the gods' altars",
    ),
    # === Session 54 new compound rule tests ===
    (
        "LORD of hosts",
        "thus saith the LORD of hosts",
        "thus saith Yahuah Tseva'ot (LORD of hosts)",
    ),
    (
        "Lord of hosts (mixed case)",
        "thus saith the Lord of hosts",
        "thus saith Yahuah Tseva'ot (Lord of hosts)",
    ),
    (
        "LORD thy God (Elohayka)",
        "thou shalt love the LORD thy God",
        "thou shalt love Yahuah Elohayka (the LORD thy God)",
    ),
    (
        "Lord our God (Eloheinu)",
        "hear O Israel the Lord our God is one Lord",
        "hear O Yashar'el (Israel) Yahuah Eloheinu (the Lord our God) is one Yahuah (Lord)",
    ),
    (
        "God Almighty (El Shaddai)",
        "I am the God Almighty",
        "I am the El Shaddai (God Almighty)",
    ),
    (
        "Almighty God (El Shaddai)",
        "I am the Almighty God",
        "I am the El Shaddai (Almighty God)",
    ),
    (
        "most high God (El Elyon with God)",
        "Melchizedek priest of the most high God",
        "Melek Tsadiq (Melchizedek) priest of the El Elyon (most high God)",
    ),
    (
        "most High (El Elyon standalone)",
        "saints of the most High",
        "saints of the El Elyon (most High)",
    ),
    (
        "the everlasting God (El Olam) — article absorbed into parenthetical",
        "called on the name of the everlasting God",
        "called on the name of El Olam (the everlasting God)",
    ),
    (
        "the mighty God (El Gibbor — Isaiah 9:6)",
        "his name shall be called The mighty God",
        "his name shall be called El Gibbor (The mighty God)",
    ),
    (
        "Yahuah Ra'ah (Psalm 23:1)",
        "The LORD is my shepherd",
        "Yahuah Ra'ah (The LORD is my shepherd)",
    ),
    (
        "Yahuah Rapha (Exodus 15:26)",
        "I am the LORD that healeth thee",
        "I am Yahuah Rapha (the LORD that healeth thee)",
    ),
    (
        "Yahuah Shammah (Ezekiel 48:35)",
        "the name of the city shall be The LORD is there",
        "the name of the city shall be Yahuah Shammah (The LORD is there)",
    ),
    (
        "Yahuah Tsidkenu (Jeremiah 23:6)",
        "his name shall be called THE LORD OUR RIGHTEOUSNESS",
        "his name shall be called Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)",
    ),
    (
        "Yahuah Yireh (Genesis 22:14)",
        "Abraham called the name of that place Jehovah-jireh",
        "Abraham called the name of that place Yahuah Yireh (Jehovah-jireh)",
    ),
    (
        "Yahuah Nissi (Exodus 17:15) — Moses is translator's call, not pipeline-restored",
        "Moses built an altar and called the name of it Jehovah-nissi",
        "Moses built an altar and called the name of it Yahuah Nissi (Jehovah-nissi)",
    ),
    (
        "Yahuah Shalom (Judges 6:24)",
        "Gideon built an altar there and called it Jehovah-shalom",
        "Gideon built an altar there and called it Yahuah Shalom (Jehovah-shalom)",
    ),
    (
        "Avi-ad (Isaiah 9:6)",
        "his name shall be called The everlasting Father",
        "his name shall be called Avi-ad (The everlasting Father)",
    ),
    (
        "Sar Shalom (Isaiah 9:6)",
        "his name shall be called The Prince of Peace",
        "his name shall be called Sar Shalom (The Prince of Peace)",
    ),
    (
        "Ehyeh asher Ehyeh (Exodus 3:14) — God restores via god_cap; Moses stays (translator's call)",
        "And God said unto Moses I AM THAT I AM",
        "And Elohim (God) said unto Moses Ehyeh asher Ehyeh (I AM THAT I AM)",
    ),
    (
        "adonai_yahuah dormant (no <nd> in current parse — pattern fires on literal Lord GOD)",
        "Thus saith the Lord GOD",
        "Thus saith Adonai Yahuah (the Lord GOD)",
    ),
    (
        "no double-wrap: already-restored Yahuah Tseva'ot stays put (idempotency)",
        "thus saith Yahuah Tseva'ot (LORD of hosts)",
        "thus saith Yahuah Tseva'ot (LORD of hosts)",
    ),
    (
        "no double-wrap: already-restored El Shaddai stays put",
        "I am the El Shaddai (God Almighty)",
        "I am the El Shaddai (God Almighty)",
    ),
]


APOCRYPHA_MODE_TESTS: list[tuple[str, str, str]] = [
    (
        "apocrypha mode: standalone Jesus is Joshua, kept as 'Jesus'",
        "Then stood up Jesus, and his sons and brothers",
        "Then stood up Jesus, and his sons and brothers",
    ),
    (
        "apocrypha mode: Jesus in returnee list kept",
        "with Zorobabel, with Jesus, Nehemias, and Zacharias",
        "with Zorobabel, with Jesus, Nehemias, and Zacharias",
    ),
    (
        "apocrypha mode: 'son of Jesus' kept",
        "the sons of Jeddu, the son of Jesus among the sons of Sanasib",
        "the sons of Jeddu, the son of Jesus among the sons of Sanasib",
    ),
    (
        "apocrypha mode: Jesus son a Nave (typo) kept",
        "Jesus the son a Nave was valiant in the wars",
        "Jesus the son a Nave was valiant in the wars",
    ),
    (
        "apocrypha mode: 'son of man' still restored to 'son of Adam'",
        "neither is he as the son of man",
        "neither is he as the son of Adam",
    ),
    (
        "apocrypha mode: other names still restore (Israel, God, LORD) [source-echo]",
        "the children of Israel cried unto the LORD their God",
        "the children of Yashar'el (Israel) cried unto Yahuah (LORD) their Elohim (God)",
    ),
]


def run_self_test(verbose: bool = False) -> tuple[int, int]:
    passed = 0
    failed = 0

    # Default mode tests
    r = Restorer()
    for desc, inp, expected in SELF_TESTS:
        actual = r.restore_text(inp)
        ok = actual == expected
        if ok:
            passed += 1
            if verbose:
                print(f"  PASS  {desc}")
        else:
            failed += 1
            print(f"  FAIL  {desc}")
            print(f"        input    : {inp!r}")
            print(f"        expected : {expected!r}")
            print(f"        actual   : {actual!r}")

    # Apocrypha mode tests
    r_apo = Restorer(mode="apocrypha")
    for desc, inp, expected in APOCRYPHA_MODE_TESTS:
        actual = r_apo.restore_text(inp)
        ok = actual == expected
        if ok:
            passed += 1
            if verbose:
                print(f"  PASS  [apo] {desc}")
        else:
            failed += 1
            print(f"  FAIL  [apo] {desc}")
            print(f"        input    : {inp!r}")
            print(f"        expected : {expected!r}")
            print(f"        actual   : {actual!r}")

    total = len(SELF_TESTS) + len(APOCRYPHA_MODE_TESTS)
    print(f"\nSelf-test: {passed} passed, {failed} failed (of {total})")
    return passed, failed


def run_idempotency_check(path: str) -> bool:
    r = Restorer()
    with open(path, "r", encoding="utf-8") as f:
        text = f.read()
    once = r.restore_text(text)
    twice = r.restore_text(once)
    if once == twice:
        print(f"OK  Idempotency holds for {path} ({len(text)} chars).")
        return True
    else:
        # Find first divergence
        for i, (a, b) in enumerate(zip(once, twice)):
            if a != b:
                start = max(0, i - 50)
                end = min(len(once), i + 50)
                print(f"FAIL Idempotency broken at offset {i}.")
                print(f"  once : ...{once[start:end]!r}")
                print(f"  twice: ...{twice[start:end]!r}")
                return False
        print(f"FAIL Idempotency broken (length differs: {len(once)} vs {len(twice)})")
        return False


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------


def main():
    p = argparse.ArgumentParser(description=__doc__.split("\n")[2].strip())
    p.add_argument("--self-test", action="store_true", help="run built-in test suite")
    p.add_argument("-v", "--verbose", action="store_true")
    p.add_argument(
        "--idempotency-check",
        metavar="PATH",
        help="confirm running the pipeline twice on PATH gives identical output",
    )
    p.add_argument(
        "--input",
        "-i",
        metavar="PATH",
        help="read input from PATH (default: stdin)",
    )
    p.add_argument(
        "--output",
        "-o",
        metavar="PATH",
        help="write output to PATH (default: stdout)",
    )
    args = p.parse_args()

    if args.self_test:
        passed, failed = run_self_test(verbose=args.verbose)
        sys.exit(0 if failed == 0 else 1)

    if args.idempotency_check:
        ok = run_idempotency_check(args.idempotency_check)
        sys.exit(0 if ok else 1)

    # Standard mode: read stdin/file, write stdout/file
    if args.input:
        with open(args.input, "r", encoding="utf-8") as f:
            text = f.read()
    else:
        text = sys.stdin.read()

    out = Restorer().restore_text(text)

    if args.output:
        with open(args.output, "w", encoding="utf-8") as f:
            f.write(out)
    else:
        sys.stdout.write(out)


if __name__ == "__main__":
    main()
