#!/usr/bin/env python3
"""
S160 BDB sample render — 25 entries through the DESIGN_LANGUAGE.md §26 LexiconSheet
styling, with the torah callout fully drafted as the visual gold-standard and 9
additional callout-list entries shown as preview cards above their lexicon bodies.

Architecture (per S159 findings):

  1. LexicalIndex.xml maps Strong's number -> BDB internal id
     `<entry id="aaf"><xref bdb="a.ac.aa" strong="6" .../></entry>`

  2. BrownDriverBriggs.xml carries the body content keyed by BDB internal id
     `<entry id="a.ac.aa" type="root">...</entry>`

  3. The Strong's join is INDIRECT: parse LexicalIndex first to build a
     Strong's -> BDB-id map; then look up entries in BDB by that id.

  4. Sub -> root resolution: when LexicalIndex says `<etym type="sub">aaf</etym>`,
     the entry is a derived noun/adjective and the full root analysis lives at
     the BDB entry that LexicalIndex entry `aaf` points to. Render both: the
     compact sub entry first, then a "Root analysis" divider, then the verbal
     root entry's body.

  5. Output: a single HTML doc with 25 LexiconSheet-styled entries stacked
     vertically, embedded CSS matching the §26 chrome + COLOR_PALETTE registers,
     ready for partner review at session close.

Per the spec-then-build standard, this script is the prototype the production
loader (Phase 9.3 full-corpus run) will crib from. Keep the render_element and
render_bdb_entry_body functions cleanly reusable.
"""

from __future__ import annotations

import os
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

# --- Paths -----------------------------------------------------------------

REPO_ROOT = Path(__file__).resolve().parent.parent
OS_BDB_DIR = REPO_ROOT / "source-texts" / "openscriptures-hebrewlexicon"
LEXICAL_INDEX_XML = OS_BDB_DIR / "LexicalIndex.xml"
BDB_XML = OS_BDB_DIR / "BrownDriverBriggs.xml"
OUTPUT_HTML = REPO_ROOT / "outputs" / "Phase_9.3_BDB_Sample_Render_S160.html"

NS = {"hb": "http://openscriptures.github.com/morphhb/namespace"}


# --- Sample selection ------------------------------------------------------
#
# 10 callout-listed entries (1 fully-drafted + 9 preview cards) + 15 non-callout
# common-vocabulary entries = 25.

SAMPLE_STRONGS = [
    # 10 callout entries
    ("H8451", "torah"),
    ("H2617", "chesed"),
    ("H1285", "brit"),
    ("H1471", "goy"),
    ("H5971", "am"),
    ("H1616", "ger"),
    ("H120", "adam"),
    ("H7676", "shabat"),
    ("H6918", "qadosh"),
    ("H3548", "kohen"),
    # 15 common-vocabulary non-callout entries
    ("H430", "elohim"),
    ("H410", "el"),
    ("H3068", "yahuah"),
    ("H1696", "dabar"),
    ("H1004", "bayit"),
    ("H4428", "melek"),
    ("H6213", "asah"),
    ("H559", "amar"),
    ("H1320", "basar"),
    ("H1980", "halak"),
    ("H8085", "shama"),
    ("H7965", "shalom"),
    ("H113", "adon"),
    ("H7223", "rishon"),
    ("H6086", "ets"),
]


# --- Framework callouts (mirrors DESIGN_LANGUAGE §26 callout table) -------
#
# All 16 Hebrew callouts from §26. body_html is fully drafted for torah only
# (the gold-standard); the others render as preview cards carrying just the
# gloss-error-summary headline.

CALLOUTS = {
    "H8451": {
        "term": "torah",
        "gloss_error": "The lexicons gloss law / burden / system of statutes",
        "red_lines": ["4", "5"],
        "body_html": """
<p>The inherited reading hangs three weights on <em>torah</em>: law (a binding statute),
burden (something heavy to carry), and system (an externalized code one operates under). All
three weights are in the lexicons; all three are unhooked from what the word actually carries
in Hebrew. The root <em>yarah</em> (H3384) means <em>to point out, to teach, to direct the
way</em>. <em>Torah</em> is the instruction the Father pointed out &mdash; the way of life
Yahuah laid down for the people he set apart. Not the curse, not the bondage, not the rulebook
strapped to the back of those who would later be told they were saved out from under it.</p>

<p>The prophets named it as the inheritance:</p>

<blockquote class="framework-scripture"><em>I will put my law in their inward parts, and write
it in their hearts; and will be their Elohim (God), and they shall be my people.</em>
(Jeremiah 31:33)</blockquote>

<blockquote class="framework-scripture"><em>And I will put my spirit within you, and cause you
to walk in my statutes, and ye shall keep my judgments, and do them.</em> (Ezekiel
36:27)</blockquote>

<p>The Father did not give covenant instruction to take it back. The Ruach HaKodesh (Holy
Spirit) who lives in the believer is the Spirit who spoke at Sinai. The curse of the
Deuteronomy 28 exile-judgment came on covenant-breaking &mdash; not on the <em>torah</em>
itself. <em>Torah</em> is what the curse defended; the curse was never <em>torah</em>. Where
the lexicons collapse the two, the framework restores them as separate substances. The
principle the framework holds: never present <em>torah</em> as the curse. The curse is the
exile judgment of Deuteronomy 28. <em>Torah</em> is the covenant instruction of the living
Elohim. <em>Torah</em> is the inheritance.</p>

<p>When <em>nomos</em> shows up in the Greek of Paul and the lexicons gloss it as <em>law /
Mosaic law / legal system</em>, the same flattening happens at the Greek-side seam.
<em>Nomos</em> is the LXX's Greek translation of <em>torah</em> &mdash; same word, same
instruction, same inheritance. The Reformation's <em>grace-against-law</em> reading is the
antichrist reading of the same word the prophets gave as the inheritance. The covenant the
Father is writing on the new heart is the covenant the lexicons here call <em>law</em>.</p>
""",
    },
    "H2617": {"term": "chesed", "gloss_error": "Lexicons gloss mercy / kindness / loyalty in standalone register",
              "red_lines": ["5", "10"], "body_html": None},
    "H1285": {"term": "brit", "gloss_error": "Lexicons gloss covenant / pact / agreement as general bilateral instrument",
              "red_lines": ["7", "11"], "body_html": None},
    "H1471": {"term": "goy / goyim", "gloss_error": "Lexicons gloss nation / Gentile / heathen",
              "red_lines": ["1", "7"], "body_html": None},
    "H5971": {"term": "am", "gloss_error": "Lexicons gloss people generically",
              "red_lines": ["1", "7"], "body_html": None},
    "H1616": {"term": "ger", "gloss_error": "Lexicons gloss stranger / sojourner / proselyte",
              "red_lines": ["1", "7"], "body_html": None},
    "H120": {"term": "adam", "gloss_error": "Lexicons gloss man / mankind / human being",
             "red_lines": ["7", "12"], "body_html": None},
    "H7676": {"term": "shabat", "gloss_error": "Lexicons gloss sabbath / cessation / Jewish rest day",
              "red_lines": ["2", "9"], "body_html": None},
    "H6918": {"term": "qadosh", "gloss_error": "Lexicons gloss holy / sacred / set apart in generic register",
              "red_lines": ["7"], "body_html": None},
    "H3548": {"term": "kohen", "gloss_error": "Lexicons gloss priest / Aaronic priest / officiant",
              "red_lines": ["7", "11"], "body_html": None},
}


# --- Strong's number helpers ----------------------------------------------

def pad_strong(strong: str) -> str:
    """H1 -> H0001, H430 -> H0430. Match the OpenScriptures convention."""
    if not strong.startswith(("H", "G")):
        raise ValueError(f"Strong's number must start with H or G: {strong!r}")
    letter, num = strong[0], strong[1:]
    return f"{letter}{int(num):04d}"


# --- LexicalIndex parsing -------------------------------------------------

def parse_lexical_index(path: Path):
    """Returns (strong_to_bdb, bdb_to_index_entry, index_id_to_entry).

    strong_to_bdb: { 'H0001': 'a.ae.ab', ... }  -- the join key for BDB lookup
    bdb_to_index_entry: { 'a.ac.aa': <ET.Element> } -- LexicalIndex entry by bdb id
    index_id_to_entry:  { 'aaf': <ET.Element> }     -- LexicalIndex entry by internal id
    """
    tree = ET.parse(path)
    root = tree.getroot()

    strong_to_bdb = {}
    bdb_to_index_entry = {}
    index_id_to_entry = {}

    for entry in root.iter(f"{{{NS['hb']}}}entry"):
        entry_id = entry.get("id")
        if entry_id:
            index_id_to_entry[entry_id] = entry
        xref = entry.find(f"{{{NS['hb']}}}xref")
        if xref is None:
            continue
        bdb_id = xref.get("bdb")
        strong = xref.get("strong")
        if bdb_id and strong:
            # Strong's may carry a homograph suffix like '6b' (the 'b' variant
            # of H6). For the canonical Strong's -> BDB map, register only the
            # bare-numeric and 'a' suffix entries. 'b'/'c'/'d' variants register
            # under a suffixed key so callers can request the variant explicitly.
            m = re.match(r"^(\d+)([a-z]?)$", strong)
            if m:
                num, suffix = m.group(1), m.group(2)
                padded = f"H{int(num):04d}"
                if suffix in ("", "a"):
                    strong_to_bdb.setdefault(padded, bdb_id)
                else:
                    strong_to_bdb.setdefault(f"{padded}{suffix}", bdb_id)
        if bdb_id:
            bdb_to_index_entry.setdefault(bdb_id, entry)

    return strong_to_bdb, bdb_to_index_entry, index_id_to_entry


# --- BDB parsing ----------------------------------------------------------

def parse_bdb(path: Path):
    """Returns { 'a.ac.aa': <ET.Element>, ... } keyed by entry/@id."""
    tree = ET.parse(path)
    root = tree.getroot()

    bdb_entries = {}
    for entry in root.iter(f"{{{NS['hb']}}}entry"):
        eid = entry.get("id")
        if eid:
            bdb_entries[eid] = entry
    return bdb_entries


# --- Sub -> root resolution -----------------------------------------------

def resolve_sub_to_root(index_entry, index_id_to_entry):
    """If the LexicalIndex entry is etym type='sub', return the (root_bdb_id,
    root_index_entry) it points to. Otherwise return (None, None)."""
    etym = index_entry.find(f"{{{NS['hb']}}}etym")
    if etym is None or etym.get("type") != "sub":
        return None, None
    root_idx_id = (etym.text or "").strip()
    if not root_idx_id:
        return None, None
    root_entry = index_id_to_entry.get(root_idx_id)
    if root_entry is None:
        return None, None
    root_xref = root_entry.find(f"{{{NS['hb']}}}xref")
    if root_xref is None:
        return None, None
    return root_xref.get("bdb"), root_entry


# --- TEI XML -> HTML transformation ---------------------------------------

# Tag handling: maps the BDB TEI tags onto inline HTML wrappers. Tags we skip
# entirely (editorial metadata) -> None.

SKIP_TAGS = {"status", "page"}


def render_element(elem) -> str:
    """Recursively render a BDB XML element to HTML body fragment."""
    if elem is None:
        return ""

    tag = elem.tag.split("}", 1)[-1] if "}" in elem.tag else elem.tag
    if tag in SKIP_TAGS:
        return elem.tail or ""

    children_html = "".join(render_element(child) for child in elem)
    text_before = escape_html(elem.text or "")
    tail = escape_html(elem.tail or "")

    if tag == "entry":
        return f"{text_before}{children_html}{tail}"

    if tag == "w":
        src = elem.get("src")
        mod = elem.get("mod")
        classes = ["bdb-hebrew"]
        if mod:
            classes.append(f"bdb-mod-{mod}")
        if src:
            return (
                f'<a class="bdb-cross-lemma" data-bdb="{src}">'
                f'<span class="{" ".join(classes)}">{text_before}{children_html}</span>'
                f"</a>{tail}"
            )
        return f'<span class="{" ".join(classes)}">{text_before}{children_html}</span>{tail}'

    if tag == "def":
        return f'<em class="bdb-def">{text_before}{children_html}</em>{tail}'

    if tag == "ref":
        r = elem.get("r", "")
        return f'<a class="bdb-citation" data-verse="{r}">{text_before}{children_html}</a>{tail}'

    if tag == "sense":
        n = elem.get("n")
        if n:
            return (
                f'<li class="bdb-sense" data-sense="{n}"><span class="bdb-sense-num">{n}.</span> '
                f"{text_before}{children_html}</li>{tail}"
            )
        return f'<div class="bdb-sense-block">{text_before}{children_html}</div>{tail}'

    if tag == "pos":
        return f'<span class="bdb-pos">{text_before}{children_html}</span>{tail}'

    if tag == "stem":
        return f'<span class="bdb-stem">{text_before}{children_html}</span>{tail}'

    if tag == "asp":
        return f'<span class="bdb-aspect">{text_before}{children_html}</span>{tail}'

    if tag == "foreign":
        lang = elem.get("{http://www.w3.org/XML/1998/namespace}lang", "")
        return f'<span class="bdb-foreign" data-lang="{lang}">{text_before}{children_html}</span>{tail}'

    if tag == "em":
        return f"<em>{text_before}{children_html}</em>{tail}"

    if tag == "pron":
        return f'<span class="bdb-pron">{text_before}{children_html}</span>{tail}'

    # Fallback: render text content + children, no wrapper.
    return f"{text_before}{children_html}{tail}"


def escape_html(text: str) -> str:
    return (
        text.replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
    )


def render_bdb_entry_body(entry) -> str:
    """Wrap the entry's senses in an <ol> if there are numbered senses."""
    body_html = render_element(entry)
    # Wrap free-floating <li class="bdb-sense"> chunks in <ol class="bdb-senses">.
    # The BDB XML alternates <sense n="1"> direct children with bare <sense> blocks
    # for the verb-stem (Qal / Pi / Hiph) sections; the numbered senses nest inside
    # those. Simplest pragmatic move: wrap each contiguous run of bdb-sense <li>s.
    # For the sample render this lands close enough; the production loader can
    # refine via a proper SAX-style walk.
    body_html = re.sub(
        r"((?:<li class=\"bdb-sense\".*?</li>\s*)+)",
        r'<ol class="bdb-senses">\1</ol>',
        body_html,
        flags=re.DOTALL,
    )
    return body_html


# --- LexiconSheet HTML rendering ------------------------------------------

DISCLAIMER_BDB = (
    "The lexicon below is <strong>BDB (Brown-Driver-Briggs, 1906)</strong> "
    "&mdash; a 19th-century Christian-era Hebrew scholarship work, preserved "
    "as data so you can see how the inherited tradition handled the word. "
    "The framework&apos;s reading lives in the verse commentary and in the "
    "framework callouts below; where the lexicon and the framework diverge, "
    "the framework is the standard."
)


def render_callout_card(strong: str, callout: dict) -> str:
    """Render the framework-callout card. Full draft for torah; preview for others."""
    rl = ", ".join(f"#{n}" for n in callout["red_lines"])

    if callout.get("body_html"):
        # Fully-drafted callout (gold-standard visual register)
        return f"""
<aside class="framework-callout framework-callout-full">
  <div class="framework-callout-badge">Framework reading</div>
  <h3 class="framework-callout-title">
    <span class="framework-callout-term">{callout["term"]}</span>
    <span class="framework-callout-sep">&middot;</span>
    <span class="framework-callout-error">{callout["gloss_error"]}</span>
  </h3>
  <div class="framework-callout-body">{callout["body_html"]}</div>
  <footer class="framework-callout-footer">Red Lines: {rl}</footer>
</aside>
"""

    # Preview card — gloss-error visible, body to-be-drafted at S161 wheel
    return f"""
<aside class="framework-callout framework-callout-preview">
  <div class="framework-callout-badge">Framework reading</div>
  <h3 class="framework-callout-title">
    <span class="framework-callout-term">{callout["term"]}</span>
    <span class="framework-callout-sep">&middot;</span>
    <span class="framework-callout-error">{callout["gloss_error"]}</span>
  </h3>
  <div class="framework-callout-preview-stub">
    <em>Framework callout body to be drafted under voice-skill load
    at the S161 parallel-subagent wheel.</em>
  </div>
  <footer class="framework-callout-footer">Red Lines: {rl}</footer>
</aside>
"""


def render_lexicon_sheet(strong: str, transliteration: str, sub_entry, root_entry, callout) -> str:
    """Render a single LexiconSheet block."""
    breadcrumb = f"Strong&apos;s {strong} ({transliteration}) &rsaquo; BDB"

    callout_html = ""
    if callout is not None:
        callout_html = render_callout_card(strong, callout)

    # Sub entry body (compact)
    sub_html = render_bdb_entry_body(sub_entry) if sub_entry is not None else ""

    # Root entry body (root analysis) — only render the divider + root block when
    # we actually have a sub->root relationship and the root is different from the
    # sub entry itself.
    root_html = ""
    if (
        root_entry is not None
        and sub_entry is not None
        and root_entry.get("id") != sub_entry.get("id")
    ):
        root_body = render_bdb_entry_body(root_entry)
        root_html = f"""
<hr class="lexicon-sub-root-divider" />
<div class="bdb-root-analysis">
  <h4 class="bdb-root-header">Root analysis</h4>
  <div class="bdb-root-body">{root_body}</div>
</div>
"""
    elif sub_entry is None and root_entry is not None:
        # Entry IS the verbal root (no sub-form).
        root_html = render_bdb_entry_body(root_entry)
        sub_html = ""

    return f"""
<section class="lexicon-sheet" data-strong="{strong}">
  <header class="lexicon-sheet-header">
    <div class="lexicon-breadcrumb">{breadcrumb}</div>
    <button class="lexicon-close" aria-label="Close lexicon entry">&times;</button>
  </header>

  <div class="lexicon-sheet-body">
    <p class="lexicon-disclaimer">{DISCLAIMER_BDB}</p>

    {callout_html}

    <div class="lexicon-body bdb-body">
      {sub_html}
      {root_html}
    </div>
  </div>
</section>
"""


# --- Embedded CSS (mirrors COLOR_PALETTE §1-§5 + §9 + DESIGN_LANGUAGE §26) ---

PAGE_CSS = """
:root {
  /* Reader theme — dark default (COLOR_PALETTE §5) */
  --reader-bg: #000000;
  --reader-text: #FFFFFF;
  --reader-muted: #A3A3A3;
  --reader-rule: #2A2A2A;
  --reader-surface: #0A0A0A;
  --reader-surface-elev: #141414;
  --reader-accent: #0084FF;

  /* §1 Sacred-Color Register */
  --techelet: #1A6FE5;
  --argaman: #8E4FB3;
  --argaman-deep: #3D1B5C;
  --argaman-light: #D4B0E0;
  --argaman-near-white: #F5E6FA;

  /* §3 Expansion register */
  --emerald-deep: #04321E;
  --emerald-mid: #15A86A;
  --emerald-bright: #2EFFA1;
  --emerald-light: #80FFC9;
}

* { box-sizing: border-box; }

body {
  margin: 0;
  background: var(--reader-bg);
  color: var(--reader-text);
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", system-ui, sans-serif;
  line-height: 1.5;
  -webkit-font-smoothing: antialiased;
}

.page-header {
  max-width: 720px;
  margin: 0 auto;
  padding: 32px 16px 16px;
  border-bottom: 1px solid var(--reader-rule);
}

.page-header h1 {
  margin: 0 0 8px;
  font-size: 22px;
  font-weight: 600;
}

.page-header .page-meta {
  color: var(--reader-muted);
  font-size: 13px;
}

.sheets-container {
  max-width: 720px;
  margin: 0 auto;
  padding: 24px 16px;
}

/* --- LexiconSheet chrome (§26 Gate #3 spec) --- */

.lexicon-sheet {
  background: var(--reader-surface);
  border: 1px solid var(--reader-rule);
  border-radius: 8px;
  margin: 0 0 32px;
  overflow: hidden;
}

.lexicon-sheet-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 12px 16px;
  border-bottom: 1px solid var(--reader-rule);
  background: var(--reader-surface);
}

.lexicon-breadcrumb {
  font-size: 12px;
  color: var(--reader-accent);
  letter-spacing: 0.02em;
}

.lexicon-close {
  background: transparent;
  border: 0;
  color: var(--reader-muted);
  font-size: 18px;
  cursor: pointer;
  padding: 4px 8px;
  line-height: 1;
}

.lexicon-sheet-body {
  padding: 16px;
  max-height: 85vh;
  overflow-y: auto;
}

/* --- Standing disclaimer (§26 Gate #1) --- */

.lexicon-disclaimer {
  color: var(--reader-muted);
  font-size: 12px;
  font-style: italic;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", system-ui, sans-serif;
  line-height: 1.5;
  margin: 0 0 16px;
  padding: 0;
}

.lexicon-disclaimer strong {
  font-style: normal;
  font-weight: 600;
}

/* --- Framework callout card (§26 + §22 NotesPanel inner-card pattern) --- */

.framework-callout {
  position: relative;
  border: 1px solid var(--reader-rule);
  background: var(--reader-surface-elev);
  border-radius: 6px;
  padding: 14px 14px 12px;
  margin: 0 0 20px;
}

.framework-callout-badge {
  position: absolute;
  top: -10px;
  right: 12px;
  background: var(--reader-bg);
  color: var(--reader-accent);
  font-size: 10px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  padding: 2px 8px;
  border: 1px solid var(--reader-accent);
  border-radius: 4px;
}

.framework-callout-title {
  margin: 0 0 8px;
  font-size: 14px;
  font-weight: 500;
  line-height: 1.4;
}

.framework-callout-term {
  color: var(--argaman-light);
  font-style: italic;
  font-weight: 600;
}

.framework-callout-sep {
  color: var(--reader-muted);
  margin: 0 6px;
}

.framework-callout-error {
  color: var(--reader-text);
  font-weight: 400;
}

.framework-callout-body {
  font-size: 14px;
  line-height: 1.6;
  color: var(--reader-text);
}

.framework-callout-body p {
  margin: 0 0 12px;
}

.framework-callout-body p:last-child {
  margin-bottom: 0;
}

.framework-scripture {
  margin: 12px 16px;
  padding: 8px 12px;
  border-left: 3px solid var(--techelet);
  font-style: italic;
  color: var(--reader-text);
}

.framework-callout-preview-stub {
  font-size: 13px;
  color: var(--reader-muted);
  padding: 8px 0;
}

.framework-callout-footer {
  margin: 10px 0 0;
  font-size: 11px;
  color: var(--reader-muted);
  letter-spacing: 0.04em;
}

.framework-callout-full {
  border-color: var(--argaman);
}

/* --- Lexicon body (BDB) --- */

.lexicon-body {
  font-size: 14px;
  line-height: 1.65;
}

.bdb-hebrew {
  font-family: "SBL Hebrew", "Ezra SIL", "Times New Roman", serif;
  font-size: 17px;
  font-weight: 500;
}

.bdb-def {
  color: var(--reader-text);
  font-style: italic;
  font-weight: 500;
}

.bdb-pos {
  color: var(--reader-muted);
  font-style: italic;
  font-size: 13px;
}

.bdb-pron {
  color: var(--reader-muted);
  font-style: italic;
  font-size: 13px;
}

.bdb-stem {
  color: var(--emerald-mid);
  font-weight: 600;
  font-size: 13px;
  margin-right: 4px;
}

.bdb-aspect {
  color: var(--reader-muted);
  font-size: 13px;
}

.bdb-foreign {
  font-style: italic;
  color: var(--reader-muted);
}

.bdb-citation {
  color: var(--reader-accent);
  text-decoration: none;
  border-bottom: 1px dotted var(--reader-accent);
  cursor: pointer;
}

.bdb-citation:hover {
  border-bottom-style: solid;
}

.bdb-cross-lemma {
  color: var(--argaman-light);
  text-decoration: none;
  border-bottom: 1px dotted var(--argaman);
  cursor: pointer;
}

.bdb-senses {
  list-style: none;
  padding: 0;
  margin: 8px 0;
}

.bdb-sense {
  margin: 0 0 8px;
  padding: 0 0 0 20px;
  position: relative;
}

.bdb-sense-num {
  position: absolute;
  left: 0;
  top: 0;
  color: var(--reader-accent);
  font-weight: 600;
  font-size: 13px;
  font-variant-numeric: tabular-nums;
}

.bdb-sense-block {
  margin: 12px 0;
  padding: 8px 12px;
  background: rgba(255, 255, 255, 0.02);
  border-left: 2px solid var(--reader-rule);
}

/* --- Sub -> root divider --- */

.lexicon-sub-root-divider {
  border: 0;
  border-top: 1px solid var(--reader-rule);
  margin: 20px 0;
}

.bdb-root-header {
  margin: 0 0 8px;
  font-size: 12px;
  color: var(--reader-muted);
  text-transform: uppercase;
  letter-spacing: 0.08em;
  font-weight: 600;
}

.bdb-root-analysis {
  background: rgba(255, 255, 255, 0.02);
  border-radius: 4px;
  padding: 12px;
}

/* --- Page summary footer --- */

.page-footer {
  max-width: 720px;
  margin: 0 auto;
  padding: 24px 16px 48px;
  color: var(--reader-muted);
  font-size: 12px;
  border-top: 1px solid var(--reader-rule);
}

/* --- Sample-render interactivity (S160 close — not production code) --- */

.lexicon-sheet-collapsed .lexicon-sheet-body {
  display: none;
}

.lexicon-sheet-collapsed .lexicon-sheet-header {
  border-bottom: 0;
}

.lexicon-sheet-collapsed {
  opacity: 0.55;
}

.lexicon-sheet-header {
  cursor: pointer;
}

.sample-tooltip {
  position: absolute;
  background: var(--reader-surface-elev);
  color: var(--reader-text);
  border: 1px solid var(--reader-accent);
  padding: 6px 10px;
  font-size: 12px;
  border-radius: 4px;
  pointer-events: none;
  z-index: 100;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);
  max-width: 320px;
  animation: tooltip-fade 2400ms ease-out forwards;
}

@keyframes tooltip-fade {
  0%   { opacity: 0; transform: translateY(-4px); }
  10%  { opacity: 1; transform: translateY(0); }
  80%  { opacity: 1; }
  100% { opacity: 0; transform: translateY(-4px); }
}

.sample-banner {
  max-width: 720px;
  margin: 0 auto;
  padding: 8px 16px;
  background: var(--reader-surface-elev);
  border-bottom: 1px solid var(--reader-rule);
  color: var(--reader-muted);
  font-size: 11px;
  font-style: italic;
  text-align: center;
}

.sample-banner strong {
  color: var(--reader-accent);
  font-style: normal;
}
"""

PAGE_JS = """
// S160 sample-render interactivity (not production code). Wires up the
// §26 LexiconSheet chrome so Yoshi can poke the surface during review.
// The production React PWA implements §26 from scratch with real state.

document.addEventListener('DOMContentLoaded', () => {
  // Build an index of which Strong's numbers are present in this render,
  // for cross-lemma navigation simulation.
  const presentStrongs = new Set(
    Array.from(document.querySelectorAll('.lexicon-sheet[data-strong]'))
      .map(s => s.dataset.strong)
  );

  // × close (and breadcrumb-tap) collapses / expands the sheet body
  document.querySelectorAll('.lexicon-sheet-header').forEach(header => {
    header.addEventListener('click', (e) => {
      // ignore clicks on links inside the header (none expected, but defensive)
      if (e.target.tagName === 'A') return;
      const sheet = header.closest('.lexicon-sheet');
      sheet.classList.toggle('lexicon-sheet-collapsed');
      if (sheet.classList.contains('lexicon-sheet-collapsed')) {
        sheet.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
      }
    });
  });

  // Verse citations — tooltip noting where production would navigate
  document.querySelectorAll('.bdb-citation, .lsj-citation').forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault();
      const verse = link.dataset.verse || link.dataset.ref || link.textContent.trim();
      showTooltip(link, `Production surface navigates to ${verse}`);
    });
  });

  // Cross-lemma links — scroll to entry if it's in the sample, else tooltip
  document.querySelectorAll('.bdb-cross-lemma').forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault();
      const bdbId = link.dataset.bdb || link.textContent.trim();
      showTooltip(link, `Production surface navigates to BDB entry ${bdbId} (this sample only carries 25 entries; production loader covers ~8,600)`);
    });
  });

  function showTooltip(anchorEl, text) {
    document.querySelectorAll('.sample-tooltip').forEach(t => t.remove());
    const tip = document.createElement('div');
    tip.className = 'sample-tooltip';
    tip.textContent = text;
    document.body.appendChild(tip);
    const rect = anchorEl.getBoundingClientRect();
    tip.style.top = (rect.bottom + window.scrollY + 6) + 'px';
    tip.style.left = Math.min(
      rect.left + window.scrollX,
      window.innerWidth - tip.offsetWidth - 16
    ) + 'px';
    setTimeout(() => tip.remove(), 2500);
  }
});
"""


# --- Main ------------------------------------------------------------------

def main() -> int:
    if not LEXICAL_INDEX_XML.exists():
        print(f"FATAL: LexicalIndex.xml not found at {LEXICAL_INDEX_XML}", file=sys.stderr)
        return 1
    if not BDB_XML.exists():
        print(f"FATAL: BrownDriverBriggs.xml not found at {BDB_XML}", file=sys.stderr)
        return 1

    print(f"Parsing LexicalIndex.xml...", file=sys.stderr)
    strong_to_bdb, bdb_to_index_entry, index_id_to_entry = parse_lexical_index(LEXICAL_INDEX_XML)
    print(f"  -> {len(strong_to_bdb)} Strong's -> BDB-id mappings", file=sys.stderr)

    print(f"Parsing BrownDriverBriggs.xml...", file=sys.stderr)
    bdb_entries = parse_bdb(BDB_XML)
    print(f"  -> {len(bdb_entries)} BDB entries", file=sys.stderr)

    print(f"Rendering {len(SAMPLE_STRONGS)} entries...", file=sys.stderr)

    sheets_html_parts = []
    resolved_count = 0
    sub_root_count = 0
    missing_count = 0

    for strong, translit in SAMPLE_STRONGS:
        padded = pad_strong(strong)
        bdb_id = strong_to_bdb.get(padded)
        if not bdb_id:
            print(f"  MISS: {padded} ({translit}) -> no LexicalIndex mapping", file=sys.stderr)
            sheets_html_parts.append(render_missing_sheet(padded, translit))
            missing_count += 1
            continue

        sub_entry = bdb_entries.get(bdb_id)
        if sub_entry is None:
            print(f"  MISS: {padded} ({translit}) -> bdb-id {bdb_id} not in BDB", file=sys.stderr)
            sheets_html_parts.append(render_missing_sheet(padded, translit, bdb_id=bdb_id))
            missing_count += 1
            continue

        index_entry = bdb_to_index_entry.get(bdb_id)
        root_bdb_id, _root_index_entry = (None, None)
        if index_entry is not None:
            root_bdb_id, _root_index_entry = resolve_sub_to_root(index_entry, index_id_to_entry)

        root_entry = bdb_entries.get(root_bdb_id) if root_bdb_id else None

        # If we got root resolution but sub IS the root (etym main, not sub),
        # collapse: render only the root entry as the primary body.
        if root_entry is None and index_entry is not None:
            etym = index_entry.find(f"{{{NS['hb']}}}etym")
            if etym is not None and etym.get("type") == "main":
                # Sub entry IS the root entry
                root_entry, sub_entry = sub_entry, None

        if root_entry is not None and sub_entry is not None:
            sub_root_count += 1

        callout = CALLOUTS.get(padded)
        sheets_html_parts.append(
            render_lexicon_sheet(padded, translit, sub_entry, root_entry, callout)
        )
        resolved_count += 1
        print(f"  OK : {padded} ({translit}) -> {bdb_id}"
              + (f"  +root({root_bdb_id})" if root_bdb_id else "")
              , file=sys.stderr)

    sheets_html = "\n".join(sheets_html_parts)
    page_html = render_page(sheets_html, resolved_count, sub_root_count, missing_count)

    OUTPUT_HTML.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT_HTML.write_text(page_html, encoding="utf-8")

    print(f"\nWrote: {OUTPUT_HTML}", file=sys.stderr)
    print(f"  Resolved: {resolved_count}", file=sys.stderr)
    print(f"  Sub->Root pairs: {sub_root_count}", file=sys.stderr)
    print(f"  Missing: {missing_count}", file=sys.stderr)
    print(f"  File size: {OUTPUT_HTML.stat().st_size:,} bytes", file=sys.stderr)
    return 0


def render_missing_sheet(strong: str, translit: str, bdb_id: str | None = None) -> str:
    explainer = (
        f"No BDB entry resolved for Strong's <code>{strong}</code> ({translit})."
        + (f" Lexical-index pointed at <code>{bdb_id}</code> but BDB has no entry at that id." if bdb_id else "")
    )
    return f"""
<section class="lexicon-sheet" data-strong="{strong}">
  <header class="lexicon-sheet-header">
    <div class="lexicon-breadcrumb">Strong's {strong} ({translit}) &rsaquo; BDB</div>
    <button class="lexicon-close" aria-label="Close lexicon entry">&times;</button>
  </header>
  <div class="lexicon-sheet-body">
    <p class="lexicon-disclaimer">{DISCLAIMER_BDB}</p>
    <div class="lexicon-body bdb-body">
      <p style="color: var(--reader-muted); font-style: italic;">{explainer}</p>
    </div>
  </div>
</section>
"""


def render_page(sheets_html: str, resolved: int, sub_root_pairs: int, missing: int) -> str:
    summary = (
        f"{resolved} entries resolved &middot; {sub_root_pairs} sub&rarr;root pairs "
        f"&middot; {missing} missing"
    )
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Phase 9.3 BDB Sample Render &mdash; S160</title>
  <style>{PAGE_CSS}</style>
</head>
<body>

<div class="sample-banner">
  <strong>Sample render</strong> &middot; tap any sheet header to collapse / re-expand;
  tap verse citations or cross-lemma links to see what production would navigate to
</div>

<header class="page-header">
  <h1>Phase 9.3 &mdash; BDB Sample Render (S160)</h1>
  <p class="page-meta">
    25-entry visual proof for the DESIGN_LANGUAGE.md &sect;26 LexiconSheet styling.
    Source: OpenScriptures HebrewLexicon (SHA 21c9add1...).
    Coverage: {summary}.
    1 framework callout fully drafted (torah); 9 preview cards above their lexicon
    bodies; 15 non-callout entries showing the disclaimer + lexicon body baseline.
  </p>
</header>

<main class="sheets-container">
{sheets_html}
</main>

<footer class="page-footer">
  S160 sample-render &mdash; the production loader (Phase 9.3 full-corpus run)
  cribs the parse + render functions from
  <code>restoration-pipeline/_session160_bdb_sample_render.py</code>.
  Render artifact persists at <code>outputs/Phase_9.3_BDB_Sample_Render_S160.html</code>
  per the &sect;.gitignore S160 exception (locked after S159's render was lost to
  session-scratchpad collision).
</footer>

<script>{PAGE_JS}</script>
</body>
</html>
"""


if __name__ == "__main__":
    sys.exit(main())
