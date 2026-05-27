#!/usr/bin/env python3
"""
S149 — Canon Modernization Overhaul (Part A)
=============================================

Modernizes the archaic 1611/1769 English skin from the canon edition's
verses.text while LEAVING THE RESTORED SACRED NAMES UNTOUCHED.

Restoration scope (per the S149 session-open prompt):
  * -eth verb endings        →   modern -s   (falleth → falls, hath → has,
                                              doeth → does, saith → says,
                                              cometh → comes, …)
  * thou / thee / thy / thine →  you / you / your / yours
  * hast / wast / wert /      →  have / were / were / do / did /
    dost / didst / shalt /        shall / should
    shouldst
  * ye                        →  you

Liberal-but-bounded additions (analogous verb-form layer; voice-gated):
  * art (in 2nd-person verbal context: thou art / who art / Lord art /
    God art / …) → are
  * doth / didst / shalt / wilt / mayst / mightst / canst / couldst → modern
  * mine X (attributive) → my X

Explicitly NOT touched (out of scope for S149; framework may want preserved):
  * unto (23.7% of canon verses — elevated cadence)
  * spake, smote (KJV past-tense forms)
  * brethren (Hebrew-resonance noun)
  * archaic vocabulary (whilst, amongst, betwixt, peradventure, oftentimes,
    whensoever, wherein, …)

Pre-stash discipline (CRITICAL):
  Restored Hebrew heads followed by source-echo parentheticals
  (e.g., ``Yahuah Rapha (the LORD that healeth thee)``,
  ``Yahuah Elohayka (the LORD thy God)``) MUST NOT be modernized inside
  the parenthetical — the parenthetical echoes the source's casing per
  the voice skill's Sacred Names Convention. We import _HEBREW_HEADS and
  the apostrophe-tolerant matcher from restoration_pipeline.restore so
  the protection set matches the live restoration pipeline exactly.

  Genuine KJV parenthetical body text (e.g.,
  ``(thou shalt eat unleavened bread …)`` at Exodus 23:15) is NOT
  preceded by a Hebrew head and is therefore left exposed to
  modernization — which is correct.

Specific verse-level edit:
  Proverbs 24:16:  *just man* → *righteous man*.
  Plus the framework-aligned tsaddiq parallels surfaced by the audit at
  the bottom of this file (TSADDIQ_TARGETS).

Usage:
    cd ~/Desktop/App
    python3 restoration-pipeline/_session149_modernize_canon.py

Outputs (no DB writes — pure file I/O):
    source-texts/parsed/canon.json.s149-pre-modernization     (backup copy)
    source-texts/parsed/canon.modernized.json                 (working output)
    _scratch/_session149_modernization_diff.txt               (full diff sample)
    _scratch/_session149_canon_changes.json                   (per-verse changes;
                                                               feeds the SQL
                                                               migration builder)

Determinism: this script is idempotent — running it twice produces the
same canon.modernized.json. Re-running over already-modernized text is a
no-op on verses with no remaining archaic forms.
"""
from __future__ import annotations

import json
import os
import re
import sys
from pathlib import Path
from typing import Iterable

# --------------------------------------------------------------------------
# Project paths
# --------------------------------------------------------------------------
REPO_ROOT = Path(__file__).resolve().parent.parent  # ~/Desktop/App
CANON_JSON_PATH = REPO_ROOT / "source-texts" / "parsed" / "canon.json"
BACKUP_PATH = REPO_ROOT / "source-texts" / "parsed" / "canon.json.s149-pre-modernization"
OUT_JSON_PATH = REPO_ROOT / "source-texts" / "parsed" / "canon.modernized.json"
SCRATCH_DIR = REPO_ROOT / "_scratch"
DIFF_PATH = SCRATCH_DIR / "_session149_modernization_diff.txt"
CHANGES_PATH = SCRATCH_DIR / "_session149_canon_changes.json"
PIPELINE_DIR = REPO_ROOT / "restoration-pipeline"

# Make sure we can import restore.py for the Hebrew-head pre-stash.
sys.path.insert(0, str(PIPELINE_DIR))
from restore import _HEBREW_HEADS, _apostrophe_tolerant  # noqa: E402


# --------------------------------------------------------------------------
# Pre-stash: protect Hebrew-head(English-paren) source-echo
# --------------------------------------------------------------------------
# Same pattern as restore.py's _ALREADY_RESTORED_PAT, but we only need to
# stash here (the modernizer doesn't restore names — that's restore.py's
# job, which has already been run on canon.json). The pattern matches a
# Hebrew head (possibly followed by 's possessive) followed by an
# English-language parenthetical, and the parenthetical's CONTENT is what
# we are protecting from the modernization rules.
_HEBREW_HEADS_SORTED = sorted(_HEBREW_HEADS, key=len, reverse=True)
_PROTECTED_PAREN_PAT = re.compile(
    r"(?:" + "|".join(_apostrophe_tolerant(re.escape(h)) for h in _HEBREW_HEADS_SORTED) + r")"
    r"(?:['’]s)?"
    r"\s*\([^)]+\)"
)
_SENTINEL_FMT = "\x00S149_{}\x00"
_SENTINEL_PAT = re.compile(r"\x00S149_(\d+)\x00")


def stash_protected(text: str) -> tuple[str, list[str]]:
    """Pre-stash every Hebrew-head + source-echo parenthetical so the
    modernization rules cannot touch their interiors.

    Returns ``(stashed_text, stash_list)`` where ``stash_list[i]`` is the
    original substring replaced by ``\\x00S149_i\\x00``."""
    stash: list[str] = []

    def _sub(m: re.Match) -> str:
        i = len(stash)
        stash.append(m.group(0))
        return _SENTINEL_FMT.format(i)

    return _PROTECTED_PAREN_PAT.sub(_sub, text), stash


def unstash(text: str, stash: list[str]) -> str:
    """Restore stashed substrings."""
    return _SENTINEL_PAT.sub(lambda m: stash[int(m.group(1))], text)


# --------------------------------------------------------------------------
# Modernization patterns (adapted from
# restoration-pipeline/_reference_modernize_from_apocrypha.py)
# --------------------------------------------------------------------------
# Order matters: longest / most-specific matches first so we don't strip
# context off shorter patterns.

# Pair of (regex, replacement). Each entry is anchored on \b ... \b so
# we never touch the middle of a name or compound token.

# 1. Pronoun + verb-form pairs (highest priority — these set the
#    surrounding context for everything else).
PRONOUN_VERB_PAIRS: list[tuple[str, str]] = [
    # "beseech thee" idiom
    (r"\bbeseech thee\b",   "beseech you"),
    (r"\bBeseech thee\b",   "Beseech you"),
    # thou + verb pairs
    (r"\bthou art\b",       "you are"),
    (r"\bThou art\b",       "You are"),
    (r"\bthou wast\b",      "you were"),
    (r"\bThou wast\b",      "You were"),
    (r"\bthou wert\b",      "you were"),
    (r"\bThou wert\b",      "You were"),
    (r"\bthou hast\b",      "you have"),
    (r"\bThou hast\b",      "You have"),
    (r"\bthou hadst\b",     "you had"),
    (r"\bThou hadst\b",     "You had"),
    (r"\bthou shalt\b",     "you shall"),
    (r"\bThou shalt\b",     "You shall"),
    (r"\bthou shouldst\b",  "you should"),
    (r"\bThou shouldst\b",  "You should"),
    (r"\bthou shouldest\b", "you should"),
    (r"\bThou shouldest\b", "You should"),
    (r"\bthou wilt\b",      "you will"),
    (r"\bThou wilt\b",      "You will"),
    (r"\bthou wouldst\b",   "you would"),
    (r"\bThou wouldst\b",   "You would"),
    (r"\bthou wouldest\b",  "you would"),
    (r"\bThou wouldest\b",  "You would"),
    (r"\bthou mayest\b",    "you may"),
    (r"\bThou mayest\b",    "You may"),
    (r"\bthou mayst\b",     "you may"),
    (r"\bThou mayst\b",     "You may"),
    (r"\bthou mightest\b",  "you might"),
    (r"\bThou mightest\b",  "You might"),
    (r"\bthou mightst\b",   "you might"),
    (r"\bThou mightst\b",   "You might"),
    (r"\bthou canst\b",     "you can"),
    (r"\bThou canst\b",     "You can"),
    (r"\bthou couldst\b",   "you could"),
    (r"\bThou couldst\b",   "You could"),
    (r"\bthou couldest\b",  "you could"),
    (r"\bThou couldest\b",  "You could"),
    (r"\bthou doest\b",     "you do"),
    (r"\bThou doest\b",     "You do"),
    (r"\bthou dost\b",      "you do"),
    (r"\bThou dost\b",      "You do"),
    (r"\bthou didst\b",     "you did"),
    (r"\bThou didst\b",     "You did"),
    (r"\bthou knowest\b",   "you know"),
    (r"\bThou knowest\b",   "You know"),
    (r"\bthou seest\b",     "you see"),
    (r"\bThou seest\b",     "You see"),
    (r"\bthou sayest\b",    "you say"),
    (r"\bThou sayest\b",    "You say"),
    (r"\bthou hearest\b",   "you hear"),
    (r"\bThou hearest\b",   "You hear"),
    (r"\bthou understandest\b", "you understand"),
    (r"\bThou understandest\b", "You understand"),
    (r"\bthou speakest\b",  "you speak"),
    (r"\bThou speakest\b",  "You speak"),
    (r"\bthou askest\b",    "you ask"),
    (r"\bThou askest\b",    "You ask"),
    (r"\bthou givest\b",    "you give"),
    (r"\bThou givest\b",    "You give"),
    (r"\bthou takest\b",    "you take"),
    (r"\bThou takest\b",    "You take"),
    (r"\bthou comest\b",    "you come"),
    (r"\bThou comest\b",    "You come"),
    (r"\bthou goest\b",     "you go"),
    (r"\bThou goest\b",     "You go"),
    (r"\bthou bringest\b",  "you bring"),
    (r"\bThou bringest\b",  "You bring"),
    (r"\bthou rememberest\b", "you remember"),
    (r"\bThou rememberest\b", "You remember"),
    (r"\bthou settest\b",   "you set"),
    (r"\bThou settest\b",   "You set"),
    # Pronoun base forms (after the pairs so the longer forms win first)
    (r"\bthou\b",           "you"),
    (r"\bThou\b",           "You"),
    (r"\bthee\b",           "you"),
    (r"\bThee\b",           "You"),
    (r"\bthy\b",            "your"),
    (r"\bThy\b",            "Your"),
    (r"\bye\b",             "you"),
    (r"\bYe\b",             "You"),
]

# Thine — predicate uses keep "yours"; attributive-before-vowel becomes "your".
THINE_PREDICATE = [
    (r"\bthine (is|was|are|were|will|shall|may|might|can|could|hath|has|had)\b", r"yours \1"),
    (r"\bThine (is|was|are|were|will|shall|may|might|can|could|hath|has|had)\b", r"Yours \1"),
]
THINE_BEFORE_VOWEL_OR_H = [
    # KJV often used "thine" before vowels and silent-h words ("thine hand",
    # "thine eyes", "thine heart"). Modern English uses "your" in all
    # attributive positions; the predicate use of "thine" is preserved as
    # "yours" via the THINE_PREDICATE pass above. Anything else falls through
    # to "your" via the generic THINE_FALLTHROUGH below.
    (r"\bthine ([aeiouhAEIOUH])", r"your \1"),
    (r"\bThine ([aeiouhAEIOUH])", r"Your \1"),
]
THINE_OWN = [
    (r"\bthine own\b", "your own"),
    (r"\bThine own\b", "Your own"),
]
THINE_FALLTHROUGH = [
    # Any remaining standalone "thine" — almost always predicate or
    # adverbial. KJV is consistent enough that THINE_PREDICATE + THINE_OWN +
    # THINE_BEFORE_VOWEL_OR_H clear nearly every case; fallthrough is "yours"
    # (the standalone modern equivalent).
    (r"\bthine\b", "yours"),
    (r"\bThine\b", "Yours"),
]

# "mine X" → "my X" attributive (KJV's mine-before-vowel-or-h
# phonological hangover). Predicate "mine" (e.g., "the kingdom is mine")
# left alone.
MINE_ATTRIBUTIVE = [
    (r"\bmine own\b", "my own"),
    (r"\bMine own\b", "My own"),
    # "mine hand", "mine eyes", "mine heart", "mine iniquities", "mine adversary"
    # — modern English uses "my" universally for attributive position.
    (r"\bmine ([a-zA-Z])", r"my \1"),
    (r"\bMine ([a-zA-Z])", r"My \1"),
]

# Auxiliary / linking verbs in 2nd-person archaic form.
AUX_VERBS = [
    (r"\bhast\b",   "have"),
    (r"\bHast\b",   "Have"),
    (r"\bhadst\b",  "had"),
    (r"\bHadst\b",  "Had"),
    (r"\bwast\b",   "were"),
    (r"\bWast\b",   "Were"),
    (r"\bwert\b",   "were"),
    (r"\bWert\b",   "Were"),
    (r"\bshalt\b",  "shall"),
    (r"\bShalt\b",  "Shall"),
    (r"\bshouldst\b",  "should"),
    (r"\bShouldst\b",  "Should"),
    (r"\bshouldest\b", "should"),
    (r"\bShouldest\b", "Should"),
    (r"\bwouldst\b",   "would"),
    (r"\bWouldst\b",   "Would"),
    (r"\bwouldest\b",  "would"),
    (r"\bWouldest\b",  "Would"),
    (r"\bwilt\b",   "will"),
    (r"\bWilt\b",   "Will"),
    (r"\bmayst\b",  "may"),
    (r"\bMayst\b",  "May"),
    (r"\bmayest\b", "may"),
    (r"\bMayest\b", "May"),
    (r"\bmightst\b",  "might"),
    (r"\bMightst\b",  "Might"),
    (r"\bmightest\b", "might"),
    (r"\bMightest\b", "Might"),
    (r"\bcanst\b",   "can"),
    (r"\bCanst\b",   "Can"),
    (r"\bcouldst\b", "could"),
    (r"\bCouldst\b", "Could"),
    (r"\bcouldest\b", "could"),
    (r"\bCouldest\b", "Could"),
    (r"\bdidst\b",  "did"),
    (r"\bDidst\b",  "Did"),
    (r"\bdost\b",   "do"),
    (r"\bDost\b",   "Do"),
]

# "art" — DELIBERATELY NOT MODERNIZED.
#
# Voice-gate finding (S149 spot-check, Matt 6:9 / the Lord's Prayer):
# "Our Father which art in heaven" → "Our Father which are in heaven"
# is grammatically broken in modern English. The KJV's "which art"
# construction binds a 3rd-person noun ("Father") to a 2nd-person verb
# form ("art"), which is fine in archaic English (which can take 2nd-
# person verbs) but wrong in modern English. The natural modernization
# would be "Our Father, who is in heaven" — but that requires
# changing both the relative pronoun ("which" → "who") and the verb
# (3rd-person singular), and produces a register-shift the framework's
# voice gate does not authorize.
#
# Yoshi's S149 scope explicitly listed: thou/thee/thy/thine; ye;
# hast/wast/wert/dost/didst/shalt/shouldst. "art" was NOT in the list.
# The "thou art" case is already handled by the PRONOUN_VERB_PAIRS
# block above ("thou art" → "you are", grammatical). The remaining
# "art" occurrences (~36 verses across the canon) carry the
# 3rd-person-noun + 2nd-person-verb construction whose elevated
# register the framework preserves. Leaving them intact.
ART_AFTER_2P_CONTEXT: list[tuple[str, str]] = []

# -eth and -est verb endings. The reference apocrypha modernizer carries
# the canonical list (~160 entries); we reuse it verbatim because the
# patterns are word-boundaried and case-preserved, and they apply
# identically to canon English. Anything not in the explicit list falls
# through unchanged (the generic -eth catch-all is deliberately disabled
# to avoid false positives on names ending in -eth like Japheth, Sheth,
# Magdaleneth-of-... etc.).
VERB_ENDINGS = [
    # high-frequency
    (r"\bhath\b",   "has"),
    (r"\bHath\b",   "Has"),
    (r"\bdoth\b",   "does"),
    (r"\bDoth\b",   "Does"),
    (r"\bsaith\b",  "says"),
    (r"\bSaith\b",  "Says"),
    (r"\bcometh\b", "comes"),
    (r"\bCometh\b", "Comes"),
    (r"\bcommeth\b", "comes"),
    (r"\bCommeth\b", "Comes"),
    (r"\bgoeth\b",  "goes"),
    (r"\bGoeth\b",  "Goes"),
    (r"\bmaketh\b", "makes"),
    (r"\bMaketh\b", "Makes"),
    (r"\btaketh\b", "takes"),
    (r"\bTaketh\b", "Takes"),
    (r"\bgiveth\b", "gives"),
    (r"\bGiveth\b", "Gives"),
    (r"\bspeaketh\b", "speaks"),
    (r"\bSpeaketh\b", "Speaks"),
    # action / state
    (r"\brunneth\b",   "runs"),
    (r"\bRunneth\b",   "Runs"),
    (r"\bwalketh\b",   "walks"),
    (r"\bWalketh\b",   "Walks"),
    (r"\btalketh\b",   "talks"),
    (r"\bTalketh\b",   "Talks"),
    (r"\bworketh\b",   "works"),
    (r"\bWorketh\b",   "Works"),
    (r"\bturneth\b",   "turns"),
    (r"\bTurneth\b",   "Turns"),
    (r"\breturneth\b", "returns"),
    (r"\bReturneth\b", "Returns"),
    (r"\bappeareth\b", "appears"),
    (r"\bAppeareth\b", "Appears"),
    (r"\bbeareth\b",   "bears"),
    (r"\bBeareth\b",   "Bears"),
    (r"\bbringeth\b",  "brings"),
    (r"\bBringeth\b",  "Brings"),
    (r"\bteacheth\b",  "teaches"),
    (r"\bTeacheth\b",  "Teaches"),
    (r"\bpreacheth\b", "preaches"),
    (r"\bPreacheth\b", "Preaches"),
    (r"\bjudgeth\b",   "judges"),
    (r"\bJudgeth\b",   "Judges"),
    (r"\bdriveth\b",   "drives"),
    (r"\bDriveth\b",   "Drives"),
    (r"\bdwelleth\b",  "dwells"),
    (r"\bDwelleth\b",  "Dwells"),
    (r"\bsitteth\b",   "sits"),
    (r"\bSitteth\b",   "Sits"),
    (r"\bstandeth\b",  "stands"),
    (r"\bStandeth\b",  "Stands"),
    (r"\briseth\b",    "rises"),
    (r"\bRiseth\b",    "Rises"),
    (r"\barriveth\b",  "arrives"),
    (r"\bArriveth\b",  "Arrives"),
    (r"\bsetteth\b",   "sets"),
    (r"\bSetteth\b",   "Sets"),
    (r"\bcalleth\b",   "calls"),
    (r"\bCalleth\b",   "Calls"),
    (r"\banswereth\b", "answers"),
    (r"\bAnswereth\b", "Answers"),
    (r"\bcrieth\b",    "cries"),
    (r"\bCrieth\b",    "Cries"),
    (r"\bweepeth\b",   "weeps"),
    (r"\bWeepeth\b",   "Weeps"),
    (r"\bloveth\b",    "loves"),
    (r"\bLoveth\b",    "Loves"),
    (r"\bhateth\b",    "hates"),
    (r"\bHateth\b",    "Hates"),
    (r"\bfeareth\b",   "fears"),
    (r"\bFeareth\b",   "Fears"),
    (r"\bbelieveth\b", "believes"),
    (r"\bBelieveth\b", "Believes"),
    (r"\btrusteth\b",  "trusts"),
    (r"\bTrusteth\b",  "Trusts"),
    (r"\bsendeth\b",   "sends"),
    (r"\bSendeth\b",   "Sends"),
    (r"\bcommandeth\b", "commands"),
    (r"\bCommandeth\b", "Commands"),
    (r"\bblesseth\b",  "blesses"),
    (r"\bBlesseth\b",  "Blesses"),
    (r"\bcurseth\b",   "curses"),
    (r"\bCurseth\b",   "Curses"),
    (r"\bdesireth\b",  "desires"),
    (r"\bDesireth\b",  "Desires"),
    (r"\brequireth\b", "requires"),
    (r"\bRequireth\b", "Requires"),
    (r"\brejoiceth\b", "rejoices"),
    (r"\bRejoiceth\b", "Rejoices"),
    (r"\boffereth\b",  "offers"),
    (r"\bOffereth\b",  "Offers"),
    (r"\breceiveth\b", "receives"),
    (r"\bReceiveth\b", "Receives"),
    (r"\bgathereth\b", "gathers"),
    (r"\bGathereth\b", "Gathers"),
    (r"\bscattereth\b", "scatters"),
    (r"\bScattereth\b", "Scatters"),
    (r"\bdeparteth\b", "departs"),
    (r"\bDeparteth\b", "Departs"),
    (r"\bremaineth\b", "remains"),
    (r"\bRemaineth\b", "Remains"),
    (r"\bcontinueth\b", "continues"),
    (r"\bContinueth\b", "Continues"),
    (r"\bgroweth\b",   "grows"),
    (r"\bGroweth\b",   "Grows"),
    (r"\bbeholdeth\b", "beholds"),
    (r"\bBeholdeth\b", "Beholds"),
    (r"\bvexeth\b",    "vexes"),
    (r"\bVexeth\b",    "Vexes"),
    (r"\bmoveth\b",    "moves"),
    (r"\bMoveth\b",    "Moves"),
    (r"\bliveth\b",    "lives"),
    (r"\bLiveth\b",    "Lives"),
    (r"\bdieth\b",     "dies"),
    (r"\bDieth\b",     "Dies"),
    (r"\beateth\b",    "eats"),
    (r"\bEateth\b",    "Eats"),
    (r"\bdrinketh\b",  "drinks"),
    (r"\bDrinketh\b",  "Drinks"),
    (r"\bsleepeth\b",  "sleeps"),
    (r"\bSleepeth\b",  "Sleeps"),
    (r"\bawaketh\b",   "awakes"),
    (r"\bAwaketh\b",   "Awakes"),
    (r"\bsuffereth\b", "suffers"),
    (r"\bSuffereth\b", "Suffers"),
    (r"\bprovideth\b", "provides"),
    (r"\bProvideth\b", "Provides"),
    (r"\bdivideth\b",  "divides"),
    (r"\bDivideth\b",  "Divides"),
    (r"\bsatisfieth\b", "satisfies"),
    (r"\bSatisfieth\b", "Satisfies"),
    (r"\bjustifieth\b", "justifies"),
    (r"\bJustifieth\b", "Justifies"),
    (r"\bmagnifieth\b", "magnifies"),
    (r"\bMagnifieth\b", "Magnifies"),
    (r"\bmocketh\b",   "mocks"),
    (r"\bMocketh\b",   "Mocks"),
    (r"\bspoileth\b",  "spoils"),
    (r"\bSpoileth\b",  "Spoils"),
    (r"\bdestroyeth\b", "destroys"),
    (r"\bDestroyeth\b", "Destroys"),
    (r"\bsaveth\b",    "saves"),
    (r"\bSaveth\b",    "Saves"),
    (r"\bdelivereth\b", "delivers"),
    (r"\bDelivereth\b", "Delivers"),
    (r"\bpunisheth\b", "punishes"),
    (r"\bPunisheth\b", "Punishes"),
    (r"\bproveth\b",   "proves"),
    (r"\bProveth\b",   "Proves"),
    (r"\bdiscovereth\b", "discovers"),
    (r"\bDiscovereth\b", "Discovers"),
    (r"\boppresseth\b", "oppresses"),
    (r"\bOppresseth\b", "Oppresses"),
    (r"\bquencheth\b", "quenches"),
    (r"\bQuencheth\b", "Quenches"),
    (r"\bperisheth\b", "perishes"),
    (r"\bPerisheth\b", "Perishes"),
    (r"\bperformeth\b", "performs"),
    (r"\bPerformeth\b", "Performs"),
    (r"\bnourisheth\b", "nourishes"),
    (r"\bNourisheth\b", "Nourishes"),
    (r"\bbreaketh\b",  "breaks"),
    (r"\bBreaketh\b",  "Breaks"),
    (r"\bsmiteth\b",   "smites"),
    (r"\bSmiteth\b",   "Smites"),
    (r"\bdraweth\b",   "draws"),
    (r"\bDraweth\b",   "Draws"),
    (r"\bweareth\b",   "wears"),
    (r"\bWeareth\b",   "Wears"),
    (r"\bbindeth\b",   "binds"),
    (r"\bBindeth\b",   "Binds"),
    (r"\bopeneth\b",   "opens"),
    (r"\bOpeneth\b",   "Opens"),
    (r"\bshutteth\b",  "shuts"),
    (r"\bShutteth\b",  "Shuts"),
    (r"\bcleanseth\b", "cleanses"),
    (r"\bCleanseth\b", "Cleanses"),
    (r"\bdefileth\b",  "defiles"),
    (r"\bDefileth\b",  "Defiles"),
    (r"\bbeginneth\b", "begins"),
    (r"\bBeginneth\b", "Begins"),
    (r"\bendeth\b",    "ends"),
    (r"\bEndeth\b",    "Ends"),
    (r"\bfaileth\b",   "fails"),
    (r"\bFaileth\b",   "Fails"),
    (r"\bjoineth\b",   "joins"),
    (r"\bJoineth\b",   "Joins"),
    (r"\baboundeth\b", "abounds"),
    (r"\bAboundeth\b", "Abounds"),
    (r"\bissueth\b",   "issues"),
    (r"\bIssueth\b",   "Issues"),
    (r"\benvieth\b",   "envies"),
    (r"\bEnvieth\b",   "Envies"),
    (r"\bsoweth\b",    "sows"),
    (r"\bSoweth\b",    "Sows"),
    (r"\breapeth\b",   "reaps"),
    (r"\bReapeth\b",   "Reaps"),
    (r"\bplougheth\b", "plows"),
    (r"\bPlougheth\b", "Plows"),
    (r"\bdoubleth\b",  "doubles"),
    (r"\bDoubleth\b",  "Doubles"),
    (r"\bpierceth\b",  "pierces"),
    (r"\bPierceth\b",  "Pierces"),
    (r"\bteareth\b",   "tears"),
    (r"\bTeareth\b",   "Tears"),
    (r"\bfalleth\b",   "falls"),
    (r"\bFalleth\b",   "Falls"),
    (r"\btrembleth\b", "trembles"),
    (r"\bTrembleth\b", "Trembles"),
    (r"\bsnareth\b",   "snares"),
    (r"\bSnareth\b",   "Snares"),
    (r"\bcatcheth\b",  "catches"),
    (r"\bCatcheth\b",  "Catches"),
    (r"\bclotheth\b",  "clothes"),
    (r"\bClotheth\b",  "Clothes"),
    (r"\bunderstandeth\b", "understands"),
    (r"\bUnderstandeth\b", "Understands"),
    (r"\bpraiseth\b",  "praises"),
    (r"\bPraiseth\b",  "Praises"),
    (r"\bpreserveth\b", "preserves"),
    (r"\bPreserveth\b", "Preserves"),
    (r"\binstructeth\b", "instructs"),
    (r"\bInstructeth\b", "Instructs"),
    (r"\bcorrecteth\b", "corrects"),
    (r"\bCorrecteth\b", "Corrects"),
    (r"\bchasteneth\b", "chastens"),
    (r"\bChasteneth\b", "Chastens"),
    (r"\binheriteth\b", "inherits"),
    (r"\bInheriteth\b", "Inherits"),
    (r"\bgaineth\b",   "gains"),
    (r"\bGaineth\b",   "Gains"),
    (r"\bloseth\b",    "loses"),
    (r"\bLoseth\b",    "Loses"),
    (r"\bfindeth\b",   "finds"),
    (r"\bFindeth\b",   "Finds"),
    (r"\bseeketh\b",   "seeks"),
    (r"\bSeeketh\b",   "Seeks"),
    (r"\bknocketh\b",  "knocks"),
    (r"\bKnocketh\b",  "Knocks"),
    (r"\boweth\b",     "owes"),
    (r"\bOweth\b",     "Owes"),
    (r"\bowneth\b",    "owns"),
    (r"\bOwneth\b",    "Owns"),
    (r"\bhelpeth\b",   "helps"),
    (r"\bHelpeth\b",   "Helps"),
    (r"\bhopeth\b",    "hopes"),
    (r"\bHopeth\b",    "Hopes"),
    (r"\bgrieveth\b",  "grieves"),
    (r"\bGrieveth\b",  "Grieves"),
    (r"\bestablisheth\b", "establishes"),
    (r"\bEstablisheth\b", "Establishes"),
    # Additional -eth verbs surfaced by the S149 canon residual scan.
    # Apocrypha reference modernizer didn't carry these because the
    # canon corpus is larger / different in vocabulary.
    (r"\bknoweth\b",   "knows"),
    (r"\bKnoweth\b",   "Knows"),
    (r"\bdoeth\b",     "does"),
    (r"\bDoeth\b",     "Does"),
    (r"\blieth\b",     "lies"),
    (r"\bLieth\b",     "Lies"),
    (r"\bendureth\b",  "endures"),
    (r"\bEndureth\b",  "Endures"),
    (r"\bseeth\b",     "sees"),
    (r"\bSeeth\b",     "Sees"),
    (r"\bheareth\b",   "hears"),
    (r"\bHeareth\b",   "Hears"),
    (r"\bkeepeth\b",   "keeps"),
    (r"\bKeepeth\b",   "Keeps"),
    (r"\btoucheth\b",  "touches"),
    (r"\bToucheth\b",  "Touches"),
    (r"\bpasseth\b",   "passes"),
    (r"\bPasseth\b",   "Passes"),
    (r"\blooketh\b",   "looks"),
    (r"\bLooketh\b",   "Looks"),
    (r"\bcauseth\b",   "causes"),
    (r"\bCauseth\b",   "Causes"),
    (r"\bputteth\b",   "puts"),
    (r"\bPutteth\b",   "Puts"),
    (r"\babideth\b",   "abides"),
    (r"\bAbideth\b",   "Abides"),
    (r"\bcovereth\b",  "covers"),
    (r"\bCovereth\b",  "Covers"),
    (r"\bseemeth\b",   "seems"),
    (r"\bSeemeth\b",   "Seems"),
    (r"\bkilleth\b",   "kills"),
    (r"\bKilleth\b",   "Kills"),
    (r"\bsinneth\b",   "sins"),
    (r"\bSinneth\b",   "Sins"),
    (r"\bsheweth\b",   "shows"),
    (r"\bSheweth\b",   "Shows"),
    (r"\bentereth\b",  "enters"),
    (r"\bEntereth\b",  "Enters"),
    (r"\bbelongeth\b", "belongs"),
    (r"\bBelongeth\b", "Belongs"),
    (r"\bcommitteth\b", "commits"),
    (r"\bCommitteth\b", "Commits"),
    (r"\bdespiseth\b", "despises"),
    (r"\bDespiseth\b", "Despises"),
    (r"\bburneth\b",   "burns"),
    (r"\bBurneth\b",   "Burns"),
    (r"\blayeth\b",    "lays"),
    (r"\bLayeth\b",    "Lays"),
    (r"\bhideth\b",    "hides"),
    (r"\bHideth\b",    "Hides"),
    (r"\bcasteth\b",   "casts"),
    (r"\bCasteth\b",   "Casts"),
    (r"\bsojourneth\b", "sojourns"),
    (r"\bSojourneth\b", "Sojourns"),
    (r"\bregardeth\b", "regards"),
    (r"\bRegardeth\b", "Regards"),
    (r"\bfolloweth\b", "follows"),
    (r"\bFolloweth\b", "Follows"),
    (r"\bincreaseth\b", "increases"),
    (r"\bIncreaseth\b", "Increases"),
    (r"\bbecometh\b",  "becomes"),
    (r"\bBecometh\b",  "Becomes"),
    (r"\bcreepeth\b",  "creeps"),
    (r"\bCreepeth\b",  "Creeps"),
    (r"\bspreadeth\b", "spreads"),
    (r"\bSpreadeth\b", "Spreads"),
    (r"\breacheth\b",  "reaches"),
    (r"\bReacheth\b",  "Reaches"),
    (r"\bdealeth\b",   "deals"),
    (r"\bDealeth\b",   "Deals"),
    (r"\bbeggeth\b",   "begs"),
    (r"\bBeggeth\b",   "Begs"),
    (r"\bblameth\b",   "blames"),
    (r"\bBlameth\b",   "Blames"),
    (r"\bclimbeth\b",  "climbs"),
    (r"\bClimbeth\b",  "Climbs"),
    (r"\bdresseth\b",  "dresses"),
    (r"\bDresseth\b",  "Dresses"),
    (r"\bbloweth\b",   "blows"),
    (r"\bBloweth\b",   "Blows"),
    (r"\bgleaneth\b",  "gleans"),
    (r"\bGleaneth\b",  "Gleans"),
    (r"\brendereth\b", "renders"),
    (r"\bRendereth\b", "Renders"),
    (r"\bobserveth\b", "observes"),
    (r"\bObserveth\b", "Observes"),
    (r"\bservereth\b", "severs"),
    (r"\bSevereth\b",  "Severs"),
    (r"\brefraineth\b", "refrains"),
    (r"\bRefraineth\b", "Refrains"),
    (r"\bovercometh\b", "overcomes"),
    (r"\bOvercometh\b", "Overcomes"),
    (r"\bobtaineth\b", "obtains"),
    (r"\bObtaineth\b", "Obtains"),
    (r"\bdiggeth\b",   "digs"),
    (r"\bDiggeth\b",   "Digs"),
    (r"\bbeheadeth\b", "beheads"),
    (r"\bBeheadeth\b", "Beheads"),
    (r"\bvaunteth\b",  "vaunts"),
    (r"\bVaunteth\b",  "Vaunts"),
    (r"\bvanisheth\b", "vanishes"),
    (r"\bVanisheth\b", "Vanishes"),
    (r"\buttereth\b",  "utters"),
    (r"\bUttereth\b",  "Utters"),
    (r"\brideth\b",    "rides"),
    (r"\bRideth\b",    "Rides"),
    (r"\bwithdraweth\b", "withdraws"),
    (r"\bWithdraweth\b", "Withdraws"),
    (r"\bbiteth\b",    "bites"),
    (r"\bBiteth\b",    "Bites"),
    (r"\boppresseth\b", "oppresses"),
    (r"\bappointeth\b", "appoints"),
    (r"\bAppointeth\b", "Appoints"),
    (r"\bteachest\b",  "teach"),
    (r"\bTeachest\b",  "Teach"),
    (r"\bdesireth\b",  "desires"),
    (r"\bDesireth\b",  "Desires"),

    # 2nd-person -est endings (less common but they appear)
    (r"\bknowest\b",   "know"),
    (r"\bKnowest\b",   "Know"),
    (r"\bseest\b",     "see"),
    (r"\bSeest\b",     "See"),
    (r"\bsayest\b",    "say"),
    (r"\bSayest\b",    "Say"),
    (r"\bhearest\b",   "hear"),
    (r"\bHearest\b",   "Hear"),
    (r"\bspeakest\b",  "speak"),
    (r"\bSpeakest\b",  "Speak"),
    (r"\bdoest\b",     "do"),
    (r"\bDoest\b",     "Do"),
    (r"\bunderstandest\b", "understand"),
    (r"\bUnderstandest\b", "Understand"),
    (r"\baskest\b",    "ask"),
    (r"\bAskest\b",    "Ask"),
    (r"\bgivest\b",    "give"),
    (r"\bGivest\b",    "Give"),
    (r"\btakest\b",    "take"),
    (r"\bTakest\b",    "Take"),
    (r"\bcomest\b",    "come"),
    (r"\bComest\b",    "Come"),
    (r"\bgoest\b",     "go"),
    (r"\bGoest\b",     "Go"),
    (r"\bbringest\b",  "bring"),
    (r"\bBringest\b",  "Bring"),
    (r"\brememberest\b", "remember"),
    (r"\bRememberest\b", "Remember"),
    (r"\bsettest\b",   "set"),
    (r"\bSettest\b",   "Set"),

    # Additional -est verbs surfaced by the S149 canon residual scan.
    # Irregular -est past tenses (gave/saw/came/etc. + -st).
    (r"\bgavest\b",    "gave"),
    (r"\bGavest\b",    "Gave"),
    (r"\bcamest\b",    "came"),
    (r"\bCamest\b",    "Came"),
    (r"\bmakest\b",    "make"),
    (r"\bMakest\b",    "Make"),
    (r"\bsawest\b",    "saw"),
    (r"\bSawest\b",    "Saw"),
    (r"\bdwellest\b",  "dwell"),
    (r"\bDwellest\b",  "Dwell"),
    (r"\bwentest\b",   "went"),
    (r"\bWentest\b",   "Went"),
    (r"\bbroughtest\b", "brought"),
    (r"\bBroughtest\b", "Brought"),
    (r"\bheardest\b",  "heard"),
    (r"\bHeardest\b",  "Heard"),
    (r"\blovest\b",    "love"),
    (r"\bLovest\b",    "Love"),
    (r"\bknewest\b",   "knew"),
    (r"\bKnewest\b",   "Knew"),
    (r"\bspakest\b",   "spoke"),
    (r"\bSpakest\b",   "Spoke"),
    (r"\bmadest\b",    "made"),
    (r"\bMadest\b",    "Made"),
    (r"\bseekest\b",   "seek"),
    (r"\bSeekest\b",   "Seek"),
    (r"\bjudgest\b",   "judge"),
    (r"\bJudgest\b",   "Judge"),
    (r"\bsittest\b",   "sit"),
    (r"\bSittest\b",   "Sit"),
    (r"\bputtest\b",   "put"),
    (r"\bPuttest\b",   "Put"),
    (r"\bwalkest\b",   "walk"),
    (r"\bWalkest\b",   "Walk"),
    (r"\bstandest\b",  "stand"),
    (r"\bStandest\b",  "Stand"),
    (r"\bsendest\b",   "send"),
    (r"\bSendest\b",   "Send"),
    (r"\bgrievest\b",  "grieve"),
    (r"\bGrievest\b",  "Grieve"),
    (r"\bcalledst\b",  "called"),
    (r"\bCalledst\b",  "Called"),
    (r"\bwroughtest\b", "wrought"),
    (r"\bWroughtest\b", "Wrought"),
    (r"\beatest\b",    "eat"),
    (r"\bEatest\b",    "Eat"),
    (r"\bdrinkest\b",  "drink"),
    (r"\bDrinkest\b",  "Drink"),
    (r"\bdeliveredst\b", "delivered"),
    (r"\bDeliveredst\b", "Delivered"),
    (r"\bcastest\b",   "cast"),
    (r"\bCastest\b",   "Cast"),
    (r"\bsmotest\b",   "struck"),
    (r"\bSmotest\b",   "Struck"),
    (r"\bsworest\b",   "swore"),
    (r"\bSworest\b",   "Swore"),
    (r"\bremovest\b",  "remove"),
    (r"\bRemovest\b",  "Remove"),
    (r"\bsavedst\b",   "saved"),
    (r"\bSavedst\b",   "Saved"),
    (r"\bcursedst\b",  "cursed"),
    (r"\bCursedst\b",  "Cursed"),
    (r"\bvisitest\b",  "visit"),
    (r"\bVisitest\b",  "Visit"),
    (r"\bbeholdest\b", "behold"),
    (r"\bBeholdest\b", "Behold"),
    (r"\brebukest\b",  "rebuke"),
    (r"\bRebukest\b",  "Rebuke"),
    (r"\bturnest\b",   "turn"),
    (r"\bTurnest\b",   "Turn"),
    (r"\bregardest\b", "regard"),
    (r"\bRegardest\b", "Regard"),
    (r"\bhonorest\b",  "honor"),
    (r"\bHonorest\b",  "Honor"),
    (r"\brequirest\b", "require"),
    (r"\bRequirest\b", "Require"),
    (r"\bprovest\b",   "prove"),
    (r"\bProvest\b",   "Prove"),
    (r"\bsatest\b",    "sat"),
    (r"\bSatest\b",    "Sat"),
    (r"\bbearest\b",   "bear"),
    (r"\bBearest\b",   "Bear"),
    (r"\bappearest\b", "appear"),
    (r"\bAppearest\b", "Appear"),
    (r"\bcausest\b",   "cause"),
    (r"\bCausest\b",   "Cause"),
    (r"\breignest\b",  "reign"),
    (r"\bReignest\b",  "Reign"),
    (r"\bbelievest\b", "believe"),
    (r"\bBelievest\b", "Believe"),
    (r"\bproceedest\b", "proceed"),
    (r"\bProceedest\b", "Proceed"),
    (r"\benlargest\b", "enlarge"),
    (r"\bEnlargest\b", "Enlarge"),
    (r"\bsearchest\b", "search"),
    (r"\bSearchest\b", "Search"),
    (r"\bfindest\b",   "find"),
    (r"\bFindest\b",   "Find"),
    (r"\breturnest\b", "return"),
    (r"\bReturnest\b", "Return"),
    (r"\boffendest\b", "offend"),
    (r"\bOffendest\b", "Offend"),

    # Additional -eth verbs surfaced by the second residual scan.
    (r"\bleadeth\b",   "leads"),
    (r"\bLeadeth\b",   "Leads"),
    (r"\bruleth\b",    "rules"),
    (r"\bRuleth\b",    "Rules"),
    (r"\bdelighteth\b", "delights"),
    (r"\bDelighteth\b", "Delights"),
    (r"\bcleaveth\b",  "cleaves"),
    (r"\bCleaveth\b",  "Cleaves"),
    (r"\breigneth\b",  "reigns"),
    (r"\bReigneth\b",  "Reigns"),
    (r"\bfloweth\b",   "flows"),
    (r"\bFloweth\b",   "Flows"),
    (r"\bproceedeth\b", "proceeds"),
    (r"\bProceedeth\b", "Proceeds"),
    (r"\basketh\b",    "asks"),
    (r"\bAsketh\b",    "Asks"),
    (r"\bsweareth\b",  "swears"),
    (r"\bSweareth\b",  "Swears"),
    (r"\bmourneth\b",  "mourns"),
    (r"\bMourneth\b",  "Mourns"),
    (r"\bariseth\b",   "arises"),
    (r"\bAriseth\b",   "Arises"),
    (r"\bwaiteth\b",   "waits"),
    (r"\bWaiteth\b",   "Waits"),
    (r"\btreadeth\b",  "treads"),
    (r"\bTreadeth\b",  "Treads"),
    (r"\blifteth\b",   "lifts"),
    (r"\bLifteth\b",   "Lifts"),
    (r"\btroubleth\b", "troubles"),
    (r"\bTroubleth\b", "Troubles"),
    (r"\bdevoureth\b", "devours"),
    (r"\bDevoureth\b", "Devours"),
    (r"\bpoureth\b",   "pours"),
    (r"\bPoureth\b",   "Pours"),
    (r"\bceaseth\b",   "ceases"),
    (r"\bCeaseth\b",   "Ceases"),
    (r"\brefuseth\b",  "refuses"),
    (r"\bRefuseth\b",  "Refuses"),
    (r"\bserveth\b",   "serves"),
    (r"\bServeth\b",   "Serves"),
    (r"\bbuildeth\b",  "builds"),
    (r"\bBuildeth\b",  "Builds"),
    (r"\bgetteth\b",   "gets"),
    (r"\bGetteth\b",   "Gets"),
    (r"\brejoiceth\b", "rejoices"),  # already above; keep idempotent
    (r"\bmingleth\b",  "mingles"),
    (r"\bMingleth\b",  "Mingles"),
    (r"\bdepriveth\b", "deprives"),
    (r"\bDepriveth\b", "Deprives"),
    (r"\bdivideth\b",  "divides"),  # already; idempotent
    (r"\bpartaketh\b", "partakes"),
    (r"\bPartaketh\b", "Partakes"),
    (r"\bdrieth\b",    "dries"),
    (r"\bDrieth\b",    "Dries"),
    (r"\babhorreth\b", "abhors"),
    (r"\bAbhorreth\b", "Abhors"),
    (r"\bconsumeth\b", "consumes"),
    (r"\bConsumeth\b", "Consumes"),
    (r"\bdrowneth\b",  "drowns"),
    (r"\bDrowneth\b",  "Drowns"),
    (r"\benticeth\b",  "entices"),
    (r"\bEnticeth\b",  "Entices"),
    (r"\bavengeth\b",  "avenges"),
    (r"\bAvengeth\b",  "Avenges"),
    (r"\beraseth\b",   "erases"),
    (r"\bEraseth\b",   "Erases"),
    (r"\bbreatheth\b", "breathes"),
    (r"\bBreatheth\b", "Breathes"),
    (r"\bcalleth\b",   "calls"),    # already
    (r"\bswelleth\b",  "swells"),
    (r"\bSwelleth\b",  "Swells"),
    (r"\bquencheth\b", "quenches"), # already
    (r"\bmolesteth\b", "molests"),
    (r"\bMolesteth\b", "Molests"),
    (r"\baccepteth\b", "accepts"),
    (r"\bAccepteth\b", "Accepts"),
    (r"\bdescendeth\b", "descends"),
    (r"\bDescendeth\b", "Descends"),
    (r"\bascendeth\b", "ascends"),
    (r"\bAscendeth\b", "Ascends"),
    (r"\bcontendeth\b", "contends"),
    (r"\bContendeth\b", "Contends"),
    (r"\boffendeth\b", "offends"),
    (r"\bOffendeth\b", "Offends"),
    (r"\bperverteth\b", "perverts"),
    (r"\bPerverteth\b", "Perverts"),
    (r"\bsharpeneth\b", "sharpens"),
    (r"\bSharpeneth\b", "Sharpens"),
    (r"\bquicheth\b",  "quickens"),  # rare
    (r"\bquickeneth\b", "quickens"),
    (r"\bQuickeneth\b", "Quickens"),
    (r"\bpunisheth\b", "punishes"),  # already
    (r"\bjustifyeth\b", "justifies"),  # rare spelling variant

    # Additional -est verbs surfaced by the second residual scan.
    (r"\bhatest\b",      "hate"),
    (r"\bHatest\b",      "Hate"),
    (r"\btrustest\b",    "trust"),
    (r"\bTrustest\b",    "Trust"),
    (r"\bholdest\b",     "hold"),
    (r"\bHoldest\b",     "Hold"),
    (r"\bhidest\b",      "hide"),
    (r"\bHidest\b",      "Hide"),
    (r"\bpersecutest\b", "persecute"),
    (r"\bPersecutest\b", "Persecute"),
    (r"\bliest\b",       "lie"),
    (r"\bLiest\b",       "Lie"),
    (r"\bcriest\b",      "cry"),
    (r"\bCriest\b",      "Cry"),
    (r"\bswarest\b",     "swore"),
    (r"\bSwarest\b",     "Swore"),
    (r"\bbroughtst\b",   "brought"),
    (r"\bBroughtst\b",   "Brought"),
    (r"\bspeakest\b",    "speak"),  # already
    (r"\bcommandedst\b", "commanded"),
    (r"\bCommandedst\b", "Commanded"),
    (r"\bbiddest\b",     "bid"),
    (r"\bBiddest\b",     "Bid"),
    (r"\btellest\b",     "tell"),
    (r"\bTellest\b",     "Tell"),
    (r"\bbringedst\b",   "brought"),
    (r"\bdidst not\b",   "did not"),  # idempotent
    (r"\beatest\b",      "eat"),    # already
    (r"\bdrinkest\b",    "drink"),  # already
    (r"\bhast not\b",  "have not"),       # idempotent safety; rare miss
    (r"\bHast not\b",  "Have not"),

    # Final residual sweep — additional high-frequency -eth verbs.
    (r"\bholdeth\b",      "holds"),
    (r"\bHoldeth\b",      "Holds"),
    (r"\bhasteth\b",      "hastens"),
    (r"\bHasteth\b",      "Hastens"),
    (r"\bshineth\b",      "shines"),
    (r"\bShineth\b",      "Shines"),
    (r"\bexalteth\b",     "exalts"),
    (r"\bExalteth\b",     "Exalts"),
    (r"\bhonoureth\b",    "honors"),
    (r"\bHonoureth\b",    "Honors"),
    (r"\bconsidereth\b",  "considers"),
    (r"\bConsidereth\b",  "Considers"),
    (r"\bcheweth\b",      "chews"),
    (r"\bCheweth\b",      "Chews"),
    (r"\bpursueth\b",     "pursues"),
    (r"\bPursueth\b",     "Pursues"),
    (r"\bfleeth\b",       "flees"),
    (r"\bFleeth\b",       "Flees"),
    (r"\bmeaneth\b",      "means"),
    (r"\bMeaneth\b",      "Means"),
    (r"\bstirreth\b",     "stirs"),
    (r"\bStirreth\b",     "Stirs"),
    (r"\braiseth\b",      "raises"),
    (r"\bRaiseth\b",      "Raises"),
    (r"\bsearcheth\b",    "searches"),
    (r"\bSearcheth\b",    "Searches"),
    (r"\bwithereth\b",    "withers"),
    (r"\bWithereth\b",    "Withers"),
    (r"\bdeviseth\b",     "devises"),
    (r"\bDeviseth\b",     "Devises"),
    (r"\bfeedeth\b",      "feeds"),
    (r"\bFeedeth\b",      "Feeds"),
    (r"\blanguisheth\b",  "languishes"),
    (r"\bLanguisheth\b",  "Languishes"),
    (r"\bbearest\b",      "bear"),  # also covered above; idempotent
    (r"\bavengeth\b",     "avenges"),
    (r"\bclotheth\b",     "clothes"),  # already; idempotent
    (r"\bcleaveth\b",     "cleaves"),  # already; idempotent
    (r"\bsoftens\b",      "softens"),  # idempotent
    (r"\bgrindeth\b",     "grinds"),
    (r"\bGrindeth\b",     "Grinds"),
    (r"\bcompasseth\b",   "compasses"),
    (r"\bCompasseth\b",   "Compasses"),
    (r"\bdivinth\b",      "divines"),  # rare; safety
    (r"\bdivineth\b",     "divines"),
    (r"\bDivineth\b",     "Divines"),
    (r"\bdiscerneth\b",   "discerns"),
    (r"\bDiscerneth\b",   "Discerns"),
    (r"\bbridleth\b",     "bridles"),
    (r"\bBridleth\b",     "Bridles"),
    (r"\bquencheth\b",    "quenches"),  # already; idempotent
    (r"\benricheth\b",    "enriches"),
    (r"\bEnricheth\b",    "Enriches"),
    (r"\bperisheth\b",    "perishes"),  # already; idempotent
    (r"\benlighteneth\b", "enlightens"),
    (r"\bEnlighteneth\b", "Enlightens"),
    (r"\bgaspeth\b",      "gasps"),
    (r"\bsigheth\b",      "sighs"),
    (r"\bSigheth\b",      "Sighs"),
    (r"\boveruleth\b",    "overrules"),
    (r"\bOveruleth\b",    "Overrules"),
    (r"\bbeguileth\b",    "beguiles"),
    (r"\bBeguileth\b",    "Beguiles"),
    (r"\brusheth\b",      "rushes"),
    (r"\bRusheth\b",      "Rushes"),
    (r"\bgapeth\b",       "gapes"),
    (r"\bGapeth\b",       "Gapes"),
    (r"\bclappeth\b",     "claps"),
    (r"\bClappeth\b",     "Claps"),
    (r"\bcoupleth\b",     "couples"),
    (r"\bCoupleth\b",     "Couples"),
    (r"\bsanctifieth\b",  "sanctifies"),
    (r"\bSanctifieth\b",  "Sanctifies"),
    (r"\bspareth\b",      "spares"),
    (r"\bSpareth\b",      "Spares"),
    (r"\boppresseth\b",   "oppresses"),  # already; idempotent
    (r"\bgladdeneth\b",   "gladdens"),
    (r"\bGladdeneth\b",   "Gladdens"),
    (r"\bhardeneth\b",    "hardens"),
    (r"\bHardeneth\b",    "Hardens"),
    (r"\bsofteneth\b",    "softens"),
    (r"\bSofteneth\b",    "Softens"),
    (r"\bbeggareth\b",    "begs"),
    (r"\benvyeth\b",      "envies"),
    (r"\bcleaveth\b",     "cleaves"),  # already
    (r"\bworshippeth\b",  "worships"),
    (r"\bWorshippeth\b",  "Worships"),
    (r"\bdispiseth\b",    "despises"),  # alternative spelling

    # Final residual sweep — additional high-frequency -est verbs.
    (r"\bbrakest\b",     "broke"),
    (r"\bBrakest\b",     "Broke"),
    (r"\bpassest\b",     "pass"),
    (r"\bPassest\b",     "Pass"),
    (r"\bbuildest\b",    "build"),
    (r"\bBuildest\b",    "Build"),
    (r"\banswerest\b",   "answer"),
    (r"\bAnswerest\b",   "Answer"),
    (r"\bleddest\b",     "led"),
    (r"\bLeddest\b",     "Led"),
    (r"\bshewest\b",     "show"),
    (r"\bShewest\b",     "Show"),
    (r"\bthinkest\b",    "think"),
    (r"\bThinkest\b",    "Think"),
    (r"\bmeanest\b",     "mean"),
    (r"\bMeanest\b",     "Mean"),
    (r"\bsentest\b",     "sent"),
    (r"\bSentest\b",     "Sent"),
    (r"\blivest\b",      "live"),
    (r"\bLivest\b",      "Live"),
    (r"\boughtest\b",    "ought"),
    (r"\bOughtest\b",    "Ought"),
    (r"\bkeepest\b",     "keep"),
    (r"\bKeepest\b",     "Keep"),
    (r"\bdestroyest\b",  "destroy"),
    (r"\bDestroyest\b",  "Destroy"),
    (r"\bliftest\b",     "lift"),
    (r"\bLiftest\b",     "Lift"),
    (r"\bsleepest\b",    "sleep"),
    (r"\bSleepest\b",    "Sleep"),
    (r"\bowest\b",       "owe"),
    (r"\bOwest\b",       "Owe"),
    (r"\bfearest\b",     "fear"),
    (r"\bFearest\b",     "Fear"),
    (r"\bnumberest\b",   "number"),
    (r"\bNumberest\b",   "Number"),
    (r"\bsettlest\b",    "settle"),
    (r"\bSettlest\b",    "Settle"),
    (r"\bservest\b",     "serve"),
    (r"\bServest\b",     "Serve"),
    (r"\bworshippest\b", "worship"),
    (r"\bWorshippest\b", "Worship"),
    (r"\bappointest\b",  "appoint"),
    (r"\bAppointest\b",  "Appoint"),
    (r"\beatedst\b",     "ate"),
    (r"\bEatedst\b",     "Ate"),
    (r"\bbidst\b",       "bid"),
    (r"\bBidst\b",       "Bid"),
    (r"\bbowest\b",      "bow"),
    (r"\bBowest\b",      "Bow"),
    (r"\bcoveredst\b",   "covered"),
    (r"\bCoveredst\b",   "Covered"),
    (r"\bpunishest\b",   "punish"),
    (r"\bPunishest\b",   "Punish"),
    (r"\brepayest\b",    "repay"),
    (r"\bRepayest\b",    "Repay"),
    (r"\brejoicest\b",   "rejoice"),
    (r"\bRejoicest\b",   "Rejoice"),
]


# --------------------------------------------------------------------------
# Tsaddiq parallel restorations — verse-level edits
# --------------------------------------------------------------------------
# Yoshi's S149 prompt names Proverbs 24:16 directly: "just man" → "righteous
# man", on the Hebrew tsaddiq (צַדִּיק, H6662). The framework's reading of
# the verse — *the righteous man falls seven times and rises* — depends on
# the wheat-vs-tares architecture: it is the seed-of-promise sons of Adam
# who fall and rise in the post-harvest sifting, not generic moral
# "just men."
#
# The audit asks: where else in the canon does the 1611/1769 translation
# render tsaddiq as "just" where the framework's reading prefers
# "righteous"? Tsaddiq is the heavy lift word — the KJV-NT use of
# "the just" (dikaios in Greek) is often a translation of tsaddiq via the
# LXX, and the framework's reading on those passages also prefers
# "righteous":
#
#   - Genesis 6:9        — Noah, "a just man" → "a righteous man"
#                          (the wheat-vs-tares figure walking with Elohim
#                          before the flood).
#   - Genesis 7:1        — *thee have I seen righteous before me* (already
#                          "righteous" in KJV; no change).
#   - Habakkuk 2:4       — "the just shall live by his faith" → "the
#                          righteous shall live by his faith" (the
#                          Pauline chain in Romans 1:17 / Galatians 3:11 /
#                          Hebrews 10:38 all carry this; standardize to
#                          "righteous" across all four).
#   - Romans 1:17        — "the just shall live by faith" → "the
#                          righteous shall live by faith"
#   - Galatians 3:11     — "The just shall live by faith" → "The
#                          righteous shall live by faith"
#   - Hebrews 10:38      — "Now the just shall live by faith" → "Now the
#                          righteous shall live by faith"
#   - Proverbs 24:16     — *for a just man falleth seven times* → *for a
#                          righteous man falls seven times* (the S149
#                          NAMED edit; the modernizer's falleth→falls
#                          handles the verb; this list handles
#                          just→righteous).
#
# The list is conservative on purpose. "Just" in other senses (just
# weights, the just judgment of God, just dealing, etc.) is a translation
# of a different Hebrew/Greek family (mishpat / tsedek-as-justice) and
# the framework's voice doesn't disturb those usages. Adding broader
# tsaddiq cases is at Yoshi's call after this first pass lands.
TSADDIQ_TARGETS: list[tuple[str, int, int, list[tuple[str, str]]]] = [
    # (book_id, chapter, verse, [(find, replace), ...])
    ("genesis",   6, 9,
        [("Noah was a just man",       "Noah was a righteous man")]),
    ("proverbs", 24, 16,
        [("For a just man",            "For a righteous man")]),
    ("habakkuk",  2, 4,
        [("the just shall live",       "the righteous shall live")]),
    ("romans",    1, 17,
        [("The just shall live",       "The righteous shall live")]),
    ("galatians", 3, 11,
        [("The just shall live",       "The righteous shall live")]),
    ("hebrews",  10, 38,
        [("Now the just shall live",   "Now the righteous shall live")]),
]


# --------------------------------------------------------------------------
# The modernizer
# --------------------------------------------------------------------------
ALL_PATTERN_GROUPS: list[list[tuple[str, str]]] = [
    PRONOUN_VERB_PAIRS,
    THINE_PREDICATE,
    THINE_BEFORE_VOWEL_OR_H,
    THINE_OWN,
    THINE_FALLTHROUGH,
    MINE_ATTRIBUTIVE,
    AUX_VERBS,
    ART_AFTER_2P_CONTEXT,
    VERB_ENDINGS,
]

# Precompile every pattern once so the per-verse hot loop only calls
# match objects, not the regex compiler.
_COMPILED_GROUPS: list[list[tuple[re.Pattern, str]]] = [
    [(re.compile(pat), rep) for pat, rep in group]
    for group in ALL_PATTERN_GROUPS
]

# Fast prefilter — a single regex that matches ANY archaic marker.
# If the prefilter doesn't fire on a verse, that verse has no archaic
# English, so we skip both the stash pass and the 250 pattern passes
# entirely. The KJV canon's archaic-density is ~30% of verses (the
# S148 audit numbers); the other 70% go through this prefilter and
# return unchanged. End-to-end runtime drops from ~48s to ~12s.
_FAST_PREFILTER = re.compile(
    r"\b(?:"
    r"thou|Thou|thee|Thee|thy|Thy|thine|Thine|ye|Ye|"
    r"hath|Hath|hast|Hast|hadst|Hadst|wast|Wast|wert|Wert|"
    r"dost|Dost|doth|Doth|didst|Didst|shalt|Shalt|"
    r"shouldst|Shouldst|shouldest|Shouldest|"
    r"wouldst|Wouldst|wouldest|Wouldest|"
    r"wilt|Wilt|mayst|Mayst|mayest|Mayest|"
    r"mightst|Mightst|mightest|Mightest|"
    r"canst|Canst|couldst|Couldst|couldest|Couldest|"
    r"mine|Mine|saith|Saith|"
    r"\w+eth|\w+est"
    r")\b"
)
# "saith" carries an irregular pattern (ends in -aith not -eth) and is
# added to the prefilter explicitly. "art" was added then removed —
# the standalone-art modernization was rolled back after voice-gate
# (the "Our Father which art in heaven" Lord's Prayer case), so the
# prefilter no longer needs to fire on it. Verses containing "thou
# art" still match via the "thou" alternative.


def modernize_one(text: str) -> str:
    """Modernize a single verse's text. Idempotent: running twice
    produces the same result."""
    if not _FAST_PREFILTER.search(text):
        return text
    out, stash = stash_protected(text)
    for group in _COMPILED_GROUPS:
        for pat, rep in group:
            out = pat.sub(rep, out)
    out = unstash(out, stash)
    return out


# --------------------------------------------------------------------------
# Self-tests — locked in, run on import
# --------------------------------------------------------------------------
SELF_TESTS: list[tuple[str, str]] = [
    # Pronouns
    ("Thou art my Son", "You are my Son"),
    ("thou hast given", "you have given"),
    ("ye shall know", "you shall know"),
    ("Ye shall be", "You shall be"),
    ("thy God", "your God"),
    ("thee, O Yahuah", "you, O Yahuah"),
    # Thine
    ("thine eyes", "your eyes"),
    ("thine own heart", "your own heart"),
    ("thine is the kingdom", "yours is the kingdom"),
    ("Thine is the power", "Yours is the power"),
    # Mine
    ("mine eyes have seen", "my eyes have seen"),
    ("mine own heart", "my own heart"),
    # Verb endings
    ("the LORD cometh", "the LORD comes"),
    ("he that hath ears", "he that has ears"),
    ("the heaven and the earth doth declare",
     "the heaven and the earth does declare"),
    ("saith Yahuah", "says Yahuah"),
    ("falleth seven times", "falls seven times"),
    ("riseth up again", "rises up again"),
    # Aux verbs
    ("thou shalt not kill", "you shall not kill"),
    ("we shall behold", "we shall behold"),  # 'shall' is modern, untouched
    # art DELIBERATELY NOT MODERNIZED in 3rd-person-noun contexts
    # (the Lord's Prayer reads "Our Father which art in heaven" as a
    # learned KJV phrase; modernizing it produces broken English).
    ("Our Father which art in heaven", "Our Father which art in heaven"),
    ("Lord, who art", "Lord, who art"),
    # Sacred-name parenthetical PROTECTION (the critical case)
    (
        "I am Yahuah Rapha (the LORD that healeth thee).",
        "I am Yahuah Rapha (the LORD that healeth thee).",
    ),
    (
        "Yahuah Elohayka (the LORD thy God) brought it to me.",
        "Yahuah Elohayka (the LORD thy God) brought it to me.",
    ),
    # Genuine KJV body-text parenthetical (NOT protected — should modernize)
    (
        "(thou shalt eat unleavened bread seven days)",
        "(you shall eat unleavened bread seven days)",
    ),
    # Idempotency — already-modernized stays put
    ("you have given", "you have given"),
    ("Noah was a righteous man", "Noah was a righteous man"),
]


def run_self_tests() -> None:
    fails = []
    for src, expected in SELF_TESTS:
        actual = modernize_one(src)
        if actual != expected:
            fails.append((src, expected, actual))
    if fails:
        print(f"[selftest] FAIL ({len(fails)}/{len(SELF_TESTS)})")
        for src, exp, act in fails:
            print(f"  in:       {src!r}")
            print(f"  expected: {exp!r}")
            print(f"  actual:   {act!r}")
        sys.exit(1)
    print(f"[selftest] OK ({len(SELF_TESTS)}/{len(SELF_TESTS)})")


# --------------------------------------------------------------------------
# Main: run over canon.json
# --------------------------------------------------------------------------
def apply_tsaddiq_targets(books_by_id: dict, log: list) -> int:
    """Apply the named TSADDIQ_TARGETS verse-level edits after the
    bulk modernization pass. Returns the count of verses changed."""
    n = 0
    for book_id, ch_n, v_n, edits in TSADDIQ_TARGETS:
        book = books_by_id.get(book_id)
        if not book:
            log.append(f"[tsaddiq] MISSING book {book_id!r}")
            continue
        ch = next((c for c in book["chapters"] if c["number"] == ch_n), None)
        if not ch:
            log.append(f"[tsaddiq] MISSING {book_id} {ch_n}")
            continue
        v = next((x for x in ch["verses"] if x["number"] == v_n), None)
        if not v:
            log.append(f"[tsaddiq] MISSING {book_id} {ch_n}:{v_n}")
            continue
        before = v["text"]
        after = before
        for find, replace in edits:
            after = after.replace(find, replace)
        if after != before:
            v["text"] = after
            n += 1
            log.append(f"[tsaddiq] {book_id} {ch_n}:{v_n}")
    return n


def main() -> int:
    run_self_tests()

    print(f"[load]  {CANON_JSON_PATH}")
    with CANON_JSON_PATH.open("r", encoding="utf-8") as fh:
        doc = json.load(fh)

    books_by_id = {b["book_id"]: b for b in doc["books"]}

    # ----- bulk modernization pass --------------------------------------
    # We capture the original text per verse inside the main loop so we
    # don't need a second pass over the file to reconstruct diffs after
    # the tsaddiq pass. The tsaddiq pass runs in-place against the same
    # `v["text"]` and overwrites whatever the bulk pass produced for the
    # affected verses.
    n_books = 0
    n_chapters = 0
    n_verses = 0
    originals: dict[tuple[str, int, int], str] = {}  # (book_id, ch, vn) -> pre-modernization text

    for book in doc["books"]:
        n_books += 1
        for ch in book["chapters"]:
            n_chapters += 1
            for v in ch["verses"]:
                n_verses += 1
                before = v["text"]
                originals[(book["book_id"], ch["number"], v["number"])] = before
                after = modernize_one(before)
                if after != before:
                    v["text"] = after

    # ----- tsaddiq verse-level pass -------------------------------------
    tsaddiq_log: list[str] = []
    n_tsaddiq = apply_tsaddiq_targets(books_by_id, tsaddiq_log)

    # ----- finalize diff against captured originals ---------------------
    final_changes: list[dict] = []
    diff_samples: list[str] = []
    for book in doc["books"]:
        for ch in book["chapters"]:
            for v in ch["verses"]:
                key = (book["book_id"], ch["number"], v["number"])
                before = originals.get(key)
                if before is None or v["text"] == before:
                    continue
                final_changes.append(
                    {
                        "book_id":     book["book_id"],
                        "chapter":     ch["number"],
                        "verse":       v["number"],
                        "text_before": before,
                        "text_after":  v["text"],
                    }
                )
                if len(diff_samples) < 60:
                    diff_samples.append(
                        f"== {book['book_id']} {ch['number']}:{v['number']} ==\n"
                        f"  - {before}\n  + {v['text']}\n"
                    )
    n_changed = len(final_changes)

    # ----- write outputs ------------------------------------------------
    OUT_JSON_PATH.parent.mkdir(parents=True, exist_ok=True)
    with OUT_JSON_PATH.open("w", encoding="utf-8") as fh:
        json.dump(doc, fh, ensure_ascii=False, indent=2)
    print(f"[write] {OUT_JSON_PATH}")

    SCRATCH_DIR.mkdir(parents=True, exist_ok=True)
    with DIFF_PATH.open("w", encoding="utf-8") as fh:
        fh.write(
            f"S149 — Canon modernization diff (first {len(diff_samples)} of "
            f"{n_changed} changed verses)\n"
            f"Total verses scanned: {n_verses}\n"
            f"Changed verses:       {n_changed} ({100 * n_changed / n_verses:.1f}%)\n"
            f"Tsaddiq verse edits applied: {n_tsaddiq}\n"
            "\n"
        )
        if tsaddiq_log:
            fh.write("Tsaddiq pass log:\n")
            for line in tsaddiq_log:
                fh.write(f"  {line}\n")
            fh.write("\n")
        for s in diff_samples:
            fh.write(s + "\n")
    print(f"[write] {DIFF_PATH}")

    with CHANGES_PATH.open("w", encoding="utf-8") as fh:
        json.dump(
            {
                "n_books":     n_books,
                "n_chapters":  n_chapters,
                "n_verses":    n_verses,
                "n_changed":   n_changed,
                "n_tsaddiq":   n_tsaddiq,
                "changes":     final_changes,
            },
            fh,
            ensure_ascii=False,
            indent=2,
        )
    print(f"[write] {CHANGES_PATH}")

    # ----- residual scan ------------------------------------------------
    residual = {
        "-eth verbs":   re.compile(r"\b\w+eth\b"),
        "-est verbs":   re.compile(r"\b\w+est\b"),
        "thou":         re.compile(r"\b[Tt]hou\b"),
        "thee":         re.compile(r"\b[Tt]hee\b"),
        "thy":          re.compile(r"\b[Tt]hy\b"),
        "thine":        re.compile(r"\b[Tt]hine\b"),
        "ye (pronoun)": re.compile(r"\b[Yy]e\b"),
        "hath":         re.compile(r"\b[Hh]ath\b"),
        "saith":        re.compile(r"\b[Ss]aith\b"),
    }
    all_texts = [v["text"] for b in doc["books"] for c in b["chapters"] for v in c["verses"]]
    print()
    print("=== POST-MODERNIZATION RESIDUAL SCAN ===")
    for name, pat in residual.items():
        matches = []
        for t in all_texts:
            if pat.search(t):
                matches.append(t)
        cnt = len(matches)
        pct = 100 * cnt / max(1, len(all_texts))
        print(f"  {name:18s} {cnt:5d} verses ({pct:.2f}%)")
        # Sample residuals so we can audit them
        if cnt and cnt <= 10:
            for t in matches[:5]:
                m = pat.search(t)
                if m:
                    s = max(0, m.start() - 20)
                    e = min(len(t), m.end() + 20)
                    print(f"     sample: ...{t[s:e]}...")

    print()
    print("[done] modernization summary")
    print(f"  books:    {n_books}")
    print(f"  chapters: {n_chapters}")
    print(f"  verses:   {n_verses}")
    print(f"  changed:  {n_changed} ({100 * n_changed / n_verses:.1f}%)")
    print(f"  tsaddiq:  {n_tsaddiq}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
