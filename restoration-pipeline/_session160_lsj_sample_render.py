#!/usr/bin/env python3
"""
S160 LSJ sample render — 5 Greek entries through the DESIGN_LANGUAGE.md §26
LexiconSheet styling, parity with the BDB sample render. Each of the 5 entries
also has a framework callout already drafted at S160 (the parallel-subagent
wheel), so the LSJ render embeds the drafted callout bodies as fully-rendered
cards above the LSJ body — Greek-side gold-standard for Yoshi's review.

Source: STEPBible-Data TFLSJ — Tyndale-formatted full LSJ Bible lexicon, 1940
Liddell-Scott-Jones with Abbott-Smith NT-only fallback. Strong's-aligned by
Tyndale House; CC-BY-4.0.

Architecture:
  1. Read TFLSJ tab-delimited file (skip the header / metadata lines at the top)
  2. Index by eStrong (first column)
  3. For each target Strong's number, pull the row and render:
     - parse the LSJ Meaning column (already Tyndale-HTML) into safe display HTML
     - convert <a href="javascript:void(0)" title="..."> citation hovers into
       <span class="lsj-classical-cite" title="...">  (preserves hover citation
       text; classical attestations don't tap-navigate)
     - detect biblical citation prefixes (NT., LXX., OT.) and convert those
       segments to <a class="bdb-citation" data-verse="...">
     - Abbott-Smith fallback rows use <ref='Book.C.V'>Book.C:V</ref> markup;
       parser handles both
  4. Read the drafted callout markdown for the 5 target Strong's numbers and
     render the body as HTML for embedding above the LSJ body
  5. Wrap each entry with §26 LexiconSheet chrome
  6. Write to outputs/Phase_9.3_LSJ_Sample_Render_S160.html
"""

from __future__ import annotations

import html
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
TFLSJ_DIR = REPO_ROOT / "source-texts" / "stepbible-data" / "Lexicons"
DRAFTS_DIR = REPO_ROOT / "_scratch" / "lexicon-callouts-DRAFTS"
OUTPUT_HTML = REPO_ROOT / "outputs" / "Phase_9.3_LSJ_Sample_Render_S160.html"

# The 5 Greek anchors (per S160 open-prompt — framework-callout-list-with-the-biggest-anchors)
SAMPLE_STRONGS = [
    ("G5485", "charis"),
    ("G3551", "nomos"),
    ("G3807", "paidagogos"),
    ("G1484", "ethne"),
    ("G0065", "agrielaios"),
]


# --- TFLSJ parsing ---------------------------------------------------------

def pad_strong(strong: str) -> str:
    """G65 -> G0065."""
    if not strong.startswith(("H", "G")):
        raise ValueError(f"Strong's number must start with H or G: {strong!r}")
    letter, num = strong[0], strong[1:]
    return f"{letter}{int(num):04d}"


def parse_tflsj_files() -> dict:
    """Returns { 'G0065': { 'lemma': 'χάρις', 'translit': 'charis', ...,
                            'body': '<b> χάρις</b> [ᾰ]...' }, ... }
    """
    entries = {}
    # The TFLSJ main file covers 0-5624; the "extra" file covers higher-numbered
    # or supplementary entries.
    files = sorted(TFLSJ_DIR.glob("TFLSJ*.txt"))
    for fp in files:
        with fp.open(encoding="utf-8") as f:
            for line_no, line in enumerate(f, start=1):
                line = line.rstrip("\n")
                if not line.startswith(("G", "H")):
                    continue  # skip header / metadata / separator lines
                parts = line.split("\t")
                if len(parts) < 8:
                    continue  # malformed row (header echo, blank, etc.)
                e_strong = parts[0].strip()
                # Normalize G65 -> G0065
                m = re.match(r"^([GH])(\d+)([a-z]?)$", e_strong)
                if not m:
                    continue
                letter, num, suffix = m.group(1), m.group(2), m.group(3)
                padded = f"{letter}{int(num):04d}"
                key = padded if suffix in ("", "a") else f"{padded}{suffix}"
                if key in entries:
                    continue  # first row wins
                entries[key] = {
                    "lemma": parts[3].strip(),
                    "translit": parts[4].strip(),
                    "morph": parts[5].strip(),
                    "gloss": parts[6].strip(),
                    "body": parts[7] if len(parts) > 7 else "",
                }
    return entries


# --- LSJ body HTML transformation ------------------------------------------

# Tyndale's citation-hover pattern:
#   <a href="javascript:void(0)" title=" 8th c.BC: Ilias Homerus Epicus 'Iliad' 5.211">Refs 8th c.BC+</a>
# We want to:
#   - For BIBLICAL refs (title text contains 'NT.', 'LXX.', 'OT.'), convert to
#     <a class="lsj-citation" data-verse="...">Refs X+</a> with the title text
#     preserved as the source-date register
#   - For CLASSICAL refs (anything else), convert to <span> with the title
#     attribute carrying the source so a hover-tooltip works without JS

CITATION_HOVER_RE = re.compile(
    r'<a\s+href="javascript:void\(0\)"\s+title="([^"]*)">([^<]*)</a>',
    re.IGNORECASE,
)

ABBOTT_REF_RE = re.compile(
    r"<ref='([^']+)'>([^<]+)</ref>",
)


def safe_attr(s: str) -> str:
    """Escape for use in an HTML attribute (preserves entities like &amp;)."""
    return s.replace('"', "&quot;").replace("<", "&lt;").replace(">", "&gt;")


def transform_lsj_body(html_in: str) -> str:
    """Convert Tyndale's LSJ body HTML into our display-safe form."""
    if not html_in:
        return ""

    # 1. Citation hovers -> classical-cite span or biblical-citation anchor
    def repl_hover(m):
        title = m.group(1).strip()
        label = m.group(2).strip()
        # Biblical reference detection: title contains an NT./LXX./OT. prefix
        if re.search(r"\b(NT|LXX|OT)\.", title):
            return f'<a class="lsj-citation" title="{safe_attr(title)}">{html.escape(label)}</a>'
        return f'<span class="lsj-classical-cite" title="{safe_attr(title)}">{html.escape(label)}</span>'

    out = CITATION_HOVER_RE.sub(repl_hover, html_in)

    # 2. Abbott-Smith ref markup -> biblical citation anchor
    def repl_abbott(m):
        ref = m.group(1).strip()
        label = m.group(2).strip()
        return f'<a class="lsj-citation" data-ref="{safe_attr(ref)}">{html.escape(label)}</a>'

    out = ABBOTT_REF_RE.sub(repl_abbott, out)

    # 3. Wrap orphan top-level content in a <div class="lsj-prose">. The Tyndale
    # body is mostly inline (<b>, <i>, <br />, <span>) without surrounding block
    # elements. Wrap so CSS line-height + spacing applies cleanly.
    return f'<div class="lsj-prose">{out}</div>'


# --- Callout markdown -> HTML ----------------------------------------------

CALLOUT_FRONTMATTER_RE = re.compile(r"^---\n(.*?)\n---\n", re.DOTALL)


def parse_callout_markdown(path: Path) -> dict | None:
    """Return { 'strong_number', 'term_display', 'gloss_error_summary',
                'red_lines_cited', 'body_html' } or None if file missing."""
    if not path.exists():
        return None
    text = path.read_text(encoding="utf-8")
    m = CALLOUT_FRONTMATTER_RE.match(text)
    if not m:
        return None
    fm_block = m.group(1)
    body_md = text[m.end():].strip()

    fm = {}
    for line in fm_block.split("\n"):
        if ":" in line:
            k, v = line.split(":", 1)
            fm[k.strip()] = v.strip()

    # Parse red_lines_cited as JSON-ish array
    rl_raw = fm.get("red_lines_cited", "[]")
    rl = re.findall(r'"(\d+)"', rl_raw)

    return {
        "strong_number": fm.get("strong_number", ""),
        "term_display": fm.get("term_display", ""),
        "gloss_error_summary": fm.get("gloss_error_summary", ""),
        "red_lines_cited": rl,
        "body_html": markdown_to_html(body_md),
    }


def markdown_to_html(md: str) -> str:
    """Minimal markdown -> HTML for the callout drafts. Handles:
      - blockquote (> *text* (citation))
      - paragraphs (blank-line separated)
      - italic (*text*)
    """
    lines = md.split("\n")
    out = []
    para = []
    in_blockquote = False

    def flush_para():
        if para:
            text = " ".join(p.strip() for p in para if p.strip())
            if text:
                out.append(f"<p>{render_inline(text)}</p>")
        para.clear()

    def flush_blockquote(buf):
        if not buf:
            return
        text = " ".join(line.lstrip("> ").rstrip() for line in buf)
        out.append(f'<blockquote class="framework-scripture">{render_inline(text)}</blockquote>')

    bq_buf = []
    for line in lines:
        if line.startswith(">"):
            flush_para()
            bq_buf.append(line)
            in_blockquote = True
        elif not line.strip():
            if in_blockquote:
                flush_blockquote(bq_buf)
                bq_buf = []
                in_blockquote = False
            else:
                flush_para()
        else:
            if in_blockquote:
                flush_blockquote(bq_buf)
                bq_buf = []
                in_blockquote = False
            para.append(line)
    flush_para()
    if bq_buf:
        flush_blockquote(bq_buf)

    return "\n".join(out)


def render_inline(text: str) -> str:
    """Convert markdown inline: *italic* -> <em>italic</em>, & escape."""
    # Escape HTML special chars first (but not inside intended em pairs)
    # Simple approach: escape, then re-apply em transformation on the escaped form.
    text = html.escape(text)
    # Markdown italic *...* — keep it greedy-cautious by not crossing whitespace runs.
    text = re.sub(r"\*([^\*\n]+?)\*", r"<em>\1</em>", text)
    return text


# --- LexiconSheet rendering ------------------------------------------------

DISCLAIMER_LSJ = (
    "The lexicon below is <strong>LSJ (Liddell-Scott-Jones, 1940 — Tyndale-edited "
    "from the 9th edition)</strong>, with Abbott-Smith&apos;s <em>Manual Greek "
    "Lexicon of the New Testament</em> (1922) filling in NT-only vocabulary where "
    "LSJ has no entry. Preserved as data so you can see how the inherited 19th-20th-"
    "century classical-philological and NT-Greek scholarship handled the word. The "
    "framework&apos;s reading lives in the verse commentary and in the framework "
    "callouts below; where the lexicon and the framework diverge, the framework is "
    "the standard."
)


def render_callout_card(callout: dict) -> str:
    rl = ", ".join(f"#{n}" for n in callout["red_lines_cited"])
    return f"""
<aside class="framework-callout framework-callout-full">
  <div class="framework-callout-badge">Framework reading</div>
  <h3 class="framework-callout-title">
    <span class="framework-callout-term">{html.escape(callout["term_display"])}</span>
    <span class="framework-callout-sep">&middot;</span>
    <span class="framework-callout-error">{html.escape(callout["gloss_error_summary"])}</span>
  </h3>
  <div class="framework-callout-body">{callout["body_html"]}</div>
  <footer class="framework-callout-footer">Red Lines: {rl}</footer>
</aside>
"""


def render_lexicon_sheet(strong: str, translit: str, entry: dict, callout: dict | None) -> str:
    breadcrumb = f"Strong&apos;s {strong} ({translit}) &rsaquo; LSJ"

    callout_html = render_callout_card(callout) if callout else ""

    body_transformed = transform_lsj_body(entry["body"])

    lemma_block = ""
    if entry.get("lemma") or entry.get("morph") or entry.get("gloss"):
        lemma_block = f"""
<div class="lsj-lemma-block">
  <span class="lsj-lemma">{html.escape(entry.get("lemma", ""))}</span>
  <span class="lsj-translit">{html.escape(entry.get("translit", ""))}</span>
  <span class="lsj-morph">{html.escape(entry.get("morph", ""))}</span>
  <span class="lsj-gloss">&mdash; {html.escape(entry.get("gloss", ""))}</span>
</div>
"""

    return f"""
<section class="lexicon-sheet" data-strong="{strong}">
  <header class="lexicon-sheet-header">
    <div class="lexicon-breadcrumb">{breadcrumb}</div>
    <button class="lexicon-close" aria-label="Close lexicon entry">&times;</button>
  </header>
  <div class="lexicon-sheet-body">
    <p class="lexicon-disclaimer">{DISCLAIMER_LSJ}</p>
    {callout_html}
    <div class="lexicon-body lsj-body">
      {lemma_block}
      {body_transformed}
    </div>
  </div>
</section>
"""


# --- Embedded CSS (same registers as BDB render + LSJ-specific) ------------

PAGE_CSS = """
:root {
  --reader-bg: #000000;
  --reader-text: #FFFFFF;
  --reader-muted: #A3A3A3;
  --reader-rule: #2A2A2A;
  --reader-surface: #0A0A0A;
  --reader-surface-elev: #141414;
  --reader-accent: #0084FF;
  --techelet: #1A6FE5;
  --argaman: #8E4FB3;
  --argaman-deep: #3D1B5C;
  --argaman-light: #D4B0E0;
  --argaman-near-white: #F5E6FA;
  --emerald-deep: #04321E;
  --emerald-mid: #15A86A;
  --emerald-bright: #2EFFA1;
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

.lexicon-disclaimer {
  color: var(--reader-muted);
  font-size: 12px;
  font-style: italic;
  line-height: 1.5;
  margin: 0 0 16px;
}

.lexicon-disclaimer strong {
  font-style: normal;
  font-weight: 600;
}

.framework-callout {
  position: relative;
  border: 1px solid var(--argaman);
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
  margin: 0 0 10px;
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
  line-height: 1.65;
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
}

.framework-callout-footer {
  margin: 10px 0 0;
  font-size: 11px;
  color: var(--reader-muted);
  letter-spacing: 0.04em;
}

/* --- LSJ body styles --- */

.lexicon-body { font-size: 14px; line-height: 1.65; }

.lsj-lemma-block {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  align-items: baseline;
  margin: 4px 0 14px;
  padding: 8px 12px;
  background: rgba(255, 255, 255, 0.02);
  border-left: 2px solid var(--reader-rule);
}

.lsj-lemma {
  font-family: "SBL Greek", "Times New Roman", serif;
  font-size: 22px;
  font-weight: 500;
}

.lsj-translit { color: var(--reader-muted); font-style: italic; }
.lsj-morph    { color: var(--reader-muted); font-size: 12px; }
.lsj-gloss    { color: var(--reader-text); font-weight: 500; }

.lsj-prose {
  font-size: 14px;
  line-height: 1.75;
}

.lsj-prose b { font-weight: 600; color: var(--reader-text); }
.lsj-prose i { font-style: italic; }
.lsj-prose br { display: block; margin-top: 4px; content: ""; }

.lsj-citation {
  color: var(--reader-accent);
  text-decoration: none;
  border-bottom: 1px dotted var(--reader-accent);
  cursor: pointer;
}

.lsj-classical-cite {
  color: var(--emerald-mid);
  border-bottom: 1px dotted var(--emerald-mid);
  cursor: help;
}

.page-footer {
  max-width: 720px;
  margin: 0 auto;
  padding: 24px 16px 48px;
  color: var(--reader-muted);
  font-size: 12px;
  border-top: 1px solid var(--reader-rule);
}

/* --- Sample-render interactivity (S160 close — not production code) --- */

.lexicon-sheet-collapsed .lexicon-sheet-body { display: none; }
.lexicon-sheet-collapsed .lexicon-sheet-header { border-bottom: 0; }
.lexicon-sheet-collapsed { opacity: 0.55; }
.lexicon-sheet-header { cursor: pointer; }

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

.sample-banner strong { color: var(--reader-accent); font-style: normal; }
"""

PAGE_JS = """
// S160 LSJ sample-render interactivity (not production code).
document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.lexicon-sheet-header').forEach(header => {
    header.addEventListener('click', (e) => {
      if (e.target.tagName === 'A') return;
      const sheet = header.closest('.lexicon-sheet');
      sheet.classList.toggle('lexicon-sheet-collapsed');
      if (sheet.classList.contains('lexicon-sheet-collapsed')) {
        sheet.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
      }
    });
  });

  // Biblical-citation anchors (NT./LXX./OT.-prefixed in title) get nav tooltip
  document.querySelectorAll('.lsj-citation').forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault();
      const ref = link.dataset.ref || link.getAttribute('title') || link.textContent.trim();
      showTooltip(link, `Production surface navigates to ${ref}`);
    });
  });

  // Classical-citation spans already have a browser-default hover tooltip via
  // their title attribute — let the browser handle that without extra JS.

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


def render_page(sheets_html: str, resolved: int, missing: int) -> str:
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Phase 9.3 LSJ Sample Render &mdash; S160</title>
  <style>{PAGE_CSS}</style>
</head>
<body>

<div class="sample-banner">
  <strong>Sample render</strong> &middot; tap any sheet header to collapse / re-expand;
  hover classical citations for source date; tap biblical citations to see what production
  would navigate to
</div>

<header class="page-header">
  <h1>Phase 9.3 &mdash; LSJ Sample Render (S160)</h1>
  <p class="page-meta">
    5-entry Greek-side visual proof for the DESIGN_LANGUAGE.md &sect;26
    LexiconSheet styling. Source: STEPBible-Data TFLSJ (Tyndale-edited LSJ
    1940 with Abbott-Smith NT fallback 1922; SHA 0753f250...). Each entry's
    framework callout is fully drafted from the S160 parallel-subagent wheel
    and embedded above the LSJ body. Coverage: {resolved} resolved, {missing}
    missing.
  </p>
</header>

<main class="sheets-container">
{sheets_html}
</main>

<footer class="page-footer">
  S160 LSJ sample-render &mdash; production loader cribs the TFLSJ parse + body
  transformation from <code>restoration-pipeline/_session160_lsj_sample_render.py</code>.
</footer>

<script>{PAGE_JS}</script>
</body>
</html>
"""


# --- Main ------------------------------------------------------------------

def main() -> int:
    if not TFLSJ_DIR.exists():
        print(f"FATAL: TFLSJ dir not found at {TFLSJ_DIR}", file=sys.stderr)
        return 1

    print("Parsing TFLSJ files...", file=sys.stderr)
    entries = parse_tflsj_files()
    print(f"  -> {len(entries)} entries indexed", file=sys.stderr)

    print(f"Rendering {len(SAMPLE_STRONGS)} entries...", file=sys.stderr)
    sheets_parts = []
    resolved = 0
    missing = 0

    for strong, translit in SAMPLE_STRONGS:
        padded = pad_strong(strong)
        entry = entries.get(padded)
        if not entry:
            print(f"  MISS: {padded} ({translit}) -> no TFLSJ row", file=sys.stderr)
            missing += 1
            continue

        # Load matching callout draft
        callout = None
        draft_path = DRAFTS_DIR / f"{padded}_{translit}.md"
        callout = parse_callout_markdown(draft_path)
        if callout is None:
            # Try lowercase variant (the subagent batches lowercased some terms)
            draft_path = DRAFTS_DIR / f"{padded}_{translit.lower()}.md"
            callout = parse_callout_markdown(draft_path)

        sheets_parts.append(render_lexicon_sheet(padded, translit, entry, callout))
        resolved += 1
        callout_note = " +callout" if callout else " (no callout draft found)"
        print(f"  OK : {padded} ({translit}){callout_note}", file=sys.stderr)

    sheets_html = "\n".join(sheets_parts)
    page_html = render_page(sheets_html, resolved, missing)

    OUTPUT_HTML.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT_HTML.write_text(page_html, encoding="utf-8")

    print(f"\nWrote: {OUTPUT_HTML}", file=sys.stderr)
    print(f"  Resolved: {resolved}", file=sys.stderr)
    print(f"  Missing: {missing}", file=sys.stderr)
    print(f"  File size: {OUTPUT_HTML.stat().st_size:,} bytes", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
