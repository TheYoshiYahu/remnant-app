#!/usr/bin/env python3
"""
S165 — Production sample-render for the pre-walk visual check.

Re-runs the S163 loader's BDB + LSJ parses in-memory, parses the S162
callout migration's $callout$-quoted bodies, and renders 15 sample
LexiconSheet entries to a single HTML file using the S160 sample-render's
chrome + CSS. The output mirrors what Yoshi will see on the live walk at
bible.remnantofpromise.org once LEXICON_ENABLED flips to true — without
requiring the apply sequence to have run.

Closes the carried-residual "Optional BDB sample-render re-render" item:
the S160 BDB sample render captured the pre-S162 versions of chesed /
shabat / qadosh / kohen callout drafts; this render uses the current
session162_lexicon_callouts_v1.sql (post-REDRAFT) callout bodies + the
session163 loader's body_html for the lexicon entries.

15-entry sample:
  Framework-deep callouts (12):
    Hebrew  — H8451 torah, H2617 chesed, H6918 qadosh, H7307 ruach,
              H0530 emunah, H7676 shabat, H3548 kohen, H6664 tsedek
    Greek   — G5485 charis, G4102 pistis, G3551 nomos, G0040 hagios
  Non-callout sanity entries (3):
    H0001 av (father), H0430 elohim, G3056 logos (LSJ outlier — ~74KB body)

Output: outputs/Phase_9.3_Production_Sample_Render_S165.html

Run from the host:
  cd ~/Desktop/App
  python3 restoration-pipeline/_session165_production_sample_render.py
"""

from __future__ import annotations

import html
import re
import sys
from pathlib import Path

# Import the S163 loader's parsing functions (in-memory, no SQL emit).
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _session163_load_lexicon_entries import (  # type: ignore
    BDB_XML,
    LEXICAL_INDEX_XML,
    LoaderContext,
    TFLSJ_FILES,
    build_bdb_body_html,
    load_canon_book_slugs,
    parse_bdb_xml,
    parse_lexical_index,
    parse_tflsj_files,
    transform_lsj_body,
)

REPO_ROOT = Path(__file__).resolve().parent.parent
CALLOUTS_SQL = REPO_ROOT / "data-schema" / "migrations" / "session162_lexicon_callouts_v1.sql"
OUTPUT_HTML = REPO_ROOT / "outputs" / "Phase_9.3_Production_Sample_Render_S165.html"

SAMPLE = [
    # Hebrew callouts
    ("H8451", "torah",   "hebrew"),
    ("H2617", "chesed",  "hebrew"),
    ("H6918", "qadosh",  "hebrew"),
    ("H7307", "ruach",   "hebrew"),
    ("H0530", "emunah",  "hebrew"),
    ("H7676", "shabat",  "hebrew"),
    ("H3548", "kohen",   "hebrew"),
    ("H6664", "tsedek",  "hebrew"),
    # Greek callouts
    ("G5485", "charis",      "greek"),
    ("G4102", "pistis",      "greek"),
    ("G3551", "nomos",       "greek"),
    ("G0040", "hagios",      "greek"),
    # Non-callout sanity entries
    ("H0001", "av",      "hebrew"),
    ("H0430", "elohim",  "hebrew"),
    ("G3056", "logos",   "greek"),
]


# ──────────────────────────────────────────────────────────────────────────────
# Callout migration parser — extract $callout$-quoted bodies for our sample.
# ──────────────────────────────────────────────────────────────────────────────

CALLOUT_INSERT_RE = re.compile(
    r"INSERT INTO lexicon_callouts \([^)]*\) VALUES \(\s*"
    r"'(?P<strong>[GH]\d{4})',\s*"
    r"'(?P<term>[^']*(?:''[^']*)*)',\s*"
    r"'(?P<gloss>[^']*(?:''[^']*)*)',\s*"
    r"\$callout\$(?P<body>.*?)\$callout\$,\s*"
    r"ARRAY\[(?P<rl>[^\]]*)\]::TEXT\[\]",
    re.DOTALL,
)


def parse_callouts(sql_path: Path) -> dict[str, dict]:
    """Returns { 'H8451': { 'term', 'gloss', 'body_md', 'red_lines': [...] }, ... }"""
    callouts: dict[str, dict] = {}
    text = sql_path.read_text(encoding="utf-8")
    for m in CALLOUT_INSERT_RE.finditer(text):
        strong = m.group("strong")
        term = m.group("term").replace("''", "'")
        gloss = m.group("gloss").replace("''", "'")
        body = m.group("body")
        rl_raw = m.group("rl")
        rl = [s.strip().strip("'") for s in rl_raw.split(",") if s.strip()]
        callouts[strong] = {
            "term": term,
            "gloss": gloss,
            "body_md": body,
            "red_lines": rl,
        }
    return callouts


# ──────────────────────────────────────────────────────────────────────────────
# Markdown → HTML (mirrors S160 LSJ sample-render's markdown_to_html)
# ──────────────────────────────────────────────────────────────────────────────

def render_inline(text: str) -> str:
    text = html.escape(text)
    return re.sub(r"\*([^\*\n]+?)\*", r"<em>\1</em>", text)


def markdown_to_html(md: str) -> str:
    """Minimal markdown — paragraphs, blockquote `> ...`, *italic*."""
    lines = md.split("\n")
    out: list[str] = []
    para: list[str] = []
    bq: list[str] = []
    in_bq = False

    def flush_para() -> None:
        if para:
            text = " ".join(p.strip() for p in para if p.strip())
            if text:
                out.append(f"<p>{render_inline(text)}</p>")
        para.clear()

    def flush_bq() -> None:
        if bq:
            text = " ".join(b.lstrip("> ").rstrip() for b in bq)
            out.append(f'<blockquote class="framework-scripture">{render_inline(text)}</blockquote>')
        bq.clear()

    for line in lines:
        if line.startswith(">"):
            flush_para()
            bq.append(line)
            in_bq = True
        elif not line.strip():
            if in_bq:
                flush_bq()
                in_bq = False
            else:
                flush_para()
        else:
            if in_bq:
                flush_bq()
                in_bq = False
            para.append(line)
    flush_para()
    flush_bq()
    return "\n".join(out)


# ──────────────────────────────────────────────────────────────────────────────
# LexiconSheet HTML render (mirrors S160 LSJ sample chrome with both registers)
# ──────────────────────────────────────────────────────────────────────────────

DISCLAIMER_BDB = (
    "The lexicon below is <strong>BDB (Brown-Driver-Briggs, 1906)</strong> "
    "&mdash; a 19th-century Christian-era Hebrew scholarship work, preserved "
    "as data so you can see how the inherited tradition handled the word. "
    "The framework&apos;s reading lives in the verse commentary and in the "
    "framework callouts below; where the lexicon and the framework diverge, "
    "the framework is the standard."
)
DISCLAIMER_LSJ = (
    "The lexicon below is <strong>LSJ (Liddell-Scott-Jones, 1940 &mdash; "
    "Tyndale-edited from the 9th edition)</strong>, with Abbott-Smith&apos;s "
    "<em>Manual Greek Lexicon of the New Testament</em> (1922) filling in "
    "NT-only vocabulary where LSJ has no entry. Preserved as data so you can "
    "see how the inherited 19th&ndash;20th-century classical-philological "
    "and NT-Greek scholarship handled the word. The framework&apos;s reading "
    "lives in the verse commentary and in the framework callouts below; "
    "where the lexicon and the framework diverge, the framework is the standard."
)


def render_callout_card(callout: dict) -> str:
    rl = ", ".join(f"#{n}" for n in callout["red_lines"])
    body_html = markdown_to_html(callout["body_md"])
    return f"""
<aside class="framework-callout framework-callout-full">
  <div class="framework-callout-badge">Framework reading</div>
  <h3 class="framework-callout-title">
    <span class="framework-callout-term">{html.escape(callout["term"])}</span>
    <span class="framework-callout-sep">&middot;</span>
    <span class="framework-callout-error">{html.escape(callout["gloss"])}</span>
  </h3>
  <div class="framework-callout-body">{body_html}</div>
  <footer class="framework-callout-footer">Red Lines: {rl}</footer>
</aside>
"""


def render_lexicon_sheet(
    strong: str,
    translit: str,
    source: str,
    body_html: str,
    callout: dict | None,
) -> str:
    disc = DISCLAIMER_BDB if source == "bdb" else DISCLAIMER_LSJ
    breadcrumb = f"Strong&apos;s {strong} ({translit}) &rsaquo; {source.upper()}"
    callout_html = render_callout_card(callout) if callout else ""
    return f"""
<section class="lexicon-sheet" data-strong="{strong}">
  <header class="lexicon-sheet-header">
    <div class="lexicon-breadcrumb">{breadcrumb}</div>
    <button class="lexicon-close" aria-label="Close lexicon entry">&times;</button>
  </header>
  <div class="lexicon-sheet-body">
    <p class="lexicon-disclaimer">{disc}</p>
    {callout_html}
    <div class="lexicon-body {source}-body">
      {body_html}
    </div>
  </div>
</section>
"""


# ──────────────────────────────────────────────────────────────────────────────
# Page CSS — combined BDB + LSJ register from S160 sample renders.
# ──────────────────────────────────────────────────────────────────────────────

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
  --argaman-light: #D4B0E0;
  --emerald-mid: #15A86A;
}
* { box-sizing: border-box; }
body {
  margin: 0; background: var(--reader-bg); color: var(--reader-text);
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", system-ui, sans-serif;
  line-height: 1.5; -webkit-font-smoothing: antialiased;
}
.page-header { max-width: 720px; margin: 0 auto; padding: 32px 16px 16px;
  border-bottom: 1px solid var(--reader-rule); }
.page-header h1 { margin: 0 0 8px; font-size: 22px; font-weight: 600; }
.page-header .page-meta { color: var(--reader-muted); font-size: 13px; }
.sheets-container { max-width: 720px; margin: 0 auto; padding: 24px 16px; }
.lexicon-sheet { background: var(--reader-surface);
  border: 1px solid var(--reader-rule); border-radius: 8px; margin: 0 0 32px; overflow: hidden; }
.lexicon-sheet-header { display: flex; align-items: center; justify-content: space-between;
  padding: 12px 16px; border-bottom: 1px solid var(--reader-rule); cursor: pointer; }
.lexicon-breadcrumb { font-size: 12px; color: var(--reader-accent); letter-spacing: 0.02em; }
.lexicon-close { background: transparent; border: 0; color: var(--reader-muted);
  font-size: 18px; cursor: pointer; padding: 4px 8px; line-height: 1; }
.lexicon-sheet-body { padding: 16px; max-height: 85vh; overflow-y: auto; }
.lexicon-disclaimer { color: var(--reader-muted); font-size: 12px; font-style: italic;
  line-height: 1.5; margin: 0 0 16px; }
.lexicon-disclaimer strong { font-style: normal; font-weight: 600; }
.framework-callout { position: relative; border: 1px solid var(--argaman);
  background: var(--reader-surface-elev); border-radius: 6px; padding: 14px 14px 12px; margin: 0 0 20px; }
.framework-callout-badge { position: absolute; top: -10px; right: 12px;
  background: var(--reader-bg); color: var(--reader-accent); font-size: 10px;
  font-weight: 600; text-transform: uppercase; letter-spacing: 0.08em;
  padding: 2px 8px; border: 1px solid var(--reader-accent); border-radius: 4px; }
.framework-callout-title { margin: 0 0 10px; font-size: 14px; font-weight: 500; line-height: 1.4; }
.framework-callout-term { color: var(--argaman-light); font-style: italic; font-weight: 600; }
.framework-callout-sep { color: var(--reader-muted); margin: 0 6px; }
.framework-callout-error { color: var(--reader-text); font-weight: 400; }
.framework-callout-body { font-size: 14px; line-height: 1.65; }
.framework-callout-body p { margin: 0 0 12px; }
.framework-callout-body p:last-child { margin-bottom: 0; }
.framework-scripture { margin: 12px 16px; padding: 8px 12px;
  border-left: 3px solid var(--techelet); font-style: italic; }
.framework-callout-footer { margin: 10px 0 0; font-size: 11px;
  color: var(--reader-muted); letter-spacing: 0.04em; }
.lexicon-body { font-size: 14px; line-height: 1.65; }
.bdb-hebrew { font-family: "SBL Hebrew", "Ezra SIL", "Times New Roman", serif;
  font-size: 17px; font-weight: 500; }
.bdb-def { color: var(--reader-text); font-style: italic; font-weight: 500; }
.bdb-pos { color: var(--reader-muted); font-style: italic; font-size: 13px; }
.bdb-stem { color: var(--emerald-mid); font-weight: 600; font-size: 13px; margin-right: 4px; }
.bdb-aspect, .bdb-pron { color: var(--reader-muted); font-size: 13px; }
.bdb-foreign { font-style: italic; color: var(--reader-muted); }
.bdb-citation, .lsj-citation { color: var(--reader-accent); text-decoration: none;
  border-bottom: 1px dotted var(--reader-accent); cursor: pointer; }
.bdb-cross-lemma { color: var(--argaman-light); text-decoration: none;
  border-bottom: 1px dotted var(--argaman); cursor: pointer; }
.lsj-classical-cite { color: var(--emerald-mid); border-bottom: 1px dotted var(--emerald-mid); cursor: help; }
.lexicon-unresolved-cite { color: var(--reader-muted); border-bottom: 1px dotted var(--reader-muted);
  font-style: italic; cursor: help; }
.bdb-senses { list-style: none; padding: 0; margin: 8px 0; }
.bdb-sense { margin: 0 0 8px; padding: 0 0 0 20px; position: relative; }
.bdb-sense-num { position: absolute; left: 0; top: 0; color: var(--reader-accent);
  font-weight: 600; font-size: 13px; font-variant-numeric: tabular-nums; }
.bdb-sense-block { margin: 12px 0; padding: 8px 12px;
  background: rgba(255, 255, 255, 0.02); border-left: 2px solid var(--reader-rule); }
.lexicon-sub-root-divider { border: 0; border-top: 1px solid var(--reader-rule); margin: 20px 0; }
.bdb-root-header { margin: 0 0 8px; font-size: 12px; color: var(--reader-muted);
  text-transform: uppercase; letter-spacing: 0.08em; font-weight: 600; }
.bdb-root-analysis { background: rgba(255, 255, 255, 0.02); border-radius: 4px; padding: 12px; }
.lsj-lemma-block { display: flex; flex-wrap: wrap; gap: 8px; align-items: baseline;
  margin: 4px 0 14px; padding: 8px 12px;
  background: rgba(255, 255, 255, 0.02); border-left: 2px solid var(--reader-rule); }
.lsj-lemma { font-family: "SBL Greek", "Times New Roman", serif; font-size: 22px; font-weight: 500; }
.lsj-translit { color: var(--reader-muted); font-style: italic; }
.lsj-morph { color: var(--reader-muted); font-size: 12px; }
.lsj-gloss { color: var(--reader-text); font-weight: 500; }
.lsj-prose { font-size: 14px; line-height: 1.75; }
.lsj-prose b { font-weight: 600; color: var(--reader-text); }
.lsj-prose i { font-style: italic; }
.page-footer { max-width: 720px; margin: 0 auto; padding: 24px 16px 48px;
  color: var(--reader-muted); font-size: 12px; border-top: 1px solid var(--reader-rule); }
.sample-banner { max-width: 720px; margin: 0 auto; padding: 8px 16px;
  background: var(--reader-surface-elev); border-bottom: 1px solid var(--reader-rule);
  color: var(--reader-muted); font-size: 11px; font-style: italic; text-align: center; }
.sample-banner strong { color: var(--reader-accent); font-style: normal; }
"""


def render_page(sheets_html: str, callout_count: int) -> str:
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Phase 9.3 Production Sample Render &mdash; S165</title>
  <style>{PAGE_CSS}</style>
</head>
<body>
<div class="sample-banner">
  <strong>Pre-walk sample render</strong> &middot; what Yoshi will see on the live walk at
  bible.remnantofpromise.org once LEXICON_ENABLED flips to true
</div>
<header class="page-header">
  <h1>Phase 9.3 &mdash; Production Sample Render (S165)</h1>
  <p class="page-meta">
    15-entry pre-walk visual check. Source: S163 loader's BDB + LSJ parse
    output (in-memory re-run; identical to what
    <code>session163_lexicon_entries_load.sql</code> will load on apply).
    Callouts: <code>session162_lexicon_callouts_v1.sql</code> ({callout_count}
    out of 12 framework-deep + sanity samples).
    Loader: <code>restoration-pipeline/_session163_load_lexicon_entries.py</code>.
    Closes the carried-residual &ldquo;Optional BDB sample-render re-render&rdquo;
    item with post-REDRAFT callout bodies.
  </p>
</header>
<main class="sheets-container">
{sheets_html}
</main>
<footer class="page-footer">
  S165 production sample-render &mdash; output of
  <code>restoration-pipeline/_session165_production_sample_render.py</code>.
  This file persists at <code>outputs/Phase_9.3_Production_Sample_Render_S165.html</code>.
</footer>
</body>
</html>
"""


# ──────────────────────────────────────────────────────────────────────────────
# Main
# ──────────────────────────────────────────────────────────────────────────────

def main() -> int:
    print("S165 production sample-render starting…", file=sys.stderr)

    if not CALLOUTS_SQL.exists():
        print(f"FATAL: callouts SQL not found at {CALLOUTS_SQL}", file=sys.stderr)
        return 1

    print("  Parsing callout migration…", file=sys.stderr)
    callouts = parse_callouts(CALLOUTS_SQL)
    print(f"    {len(callouts)} callouts parsed", file=sys.stderr)

    print("  Loading canonical book slugs…", file=sys.stderr)
    valid_slugs = load_canon_book_slugs()

    print("  Parsing LexicalIndex + BDB…", file=sys.stderr)
    strong_to_bdb, bdb_to_index, index_id_to_entry, bdb_to_strong = parse_lexical_index(
        LEXICAL_INDEX_XML,
    )
    bdb_entries = parse_bdb_xml(BDB_XML)

    print("  Parsing TFLSJ…", file=sys.stderr)
    tflsj_entries = parse_tflsj_files(TFLSJ_FILES)

    ctx = LoaderContext(
        valid_book_slugs=valid_slugs,
        valid_strongs=set(strong_to_bdb.keys()) | set(tflsj_entries.keys()),
    )

    print(f"  Rendering {len(SAMPLE)} sample entries…", file=sys.stderr)
    sheets_parts: list[str] = []
    matched_callouts = 0

    for strong, translit, language in SAMPLE:
        if language == "hebrew":
            out = build_bdb_body_html(
                strong, strong_to_bdb.get(strong, ""),
                bdb_entries, bdb_to_index, bdb_to_index, index_id_to_entry,
                bdb_to_strong, ctx,
            )
            if out is None:
                print(f"  MISS: {strong} ({translit}) — no BDB entry", file=sys.stderr)
                continue
            body_html, _ = out
            source = "bdb"
        else:
            entry = tflsj_entries.get(strong)
            if entry is None:
                print(f"  MISS: {strong} ({translit}) — no TFLSJ entry", file=sys.stderr)
                continue
            body_transformed = transform_lsj_body(entry["body"], ctx, "lsj", strong)
            lemma_block = (
                f'<div class="lsj-lemma-block">'
                f'<span class="lsj-lemma">{html.escape(entry["lemma"])}</span>'
                f'<span class="lsj-translit">{html.escape(entry["translit"])}</span>'
                f'<span class="lsj-morph">{html.escape(entry["morph"])}</span>'
                f'<span class="lsj-gloss">&mdash; {html.escape(entry["gloss"])}</span>'
                f"</div>"
            )
            body_html = f'<div class="lsj-body">{lemma_block}{body_transformed}</div>'
            source = "lsj"

        callout = callouts.get(strong)
        if callout:
            matched_callouts += 1

        sheets_parts.append(
            render_lexicon_sheet(strong, translit, source, body_html, callout),
        )
        cnote = " +callout" if callout else ""
        print(f"  OK : {strong} ({translit}) [{source}]{cnote}", file=sys.stderr)

    sheets_html = "\n".join(sheets_parts)
    page_html = render_page(sheets_html, matched_callouts)

    OUTPUT_HTML.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT_HTML.write_text(page_html, encoding="utf-8")

    print(f"\nWrote: {OUTPUT_HTML}", file=sys.stderr)
    print(f"  File size: {OUTPUT_HTML.stat().st_size:,} bytes", file=sys.stderr)
    print(f"  Entries: {len(sheets_parts)}", file=sys.stderr)
    print(f"  Callouts matched: {matched_callouts}/12", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
