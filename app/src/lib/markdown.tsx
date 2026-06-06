/**
 * Shared markdown helpers for the reader UI.
 *
 * Originally introduced in ChapterEndCard.tsx (Session 74) for thread
 * summary_md rendering. Extracted to a shared module at Session 110
 * Round-1 italic-fix so that the chapter-intro free-tier commentary
 * surface in App.tsx renders italics the same way the cross-reference
 * threads do.
 *
 * Coverage: paragraph splitting on `\n\n`, single-line breaks on `\n`
 * within a paragraph, `*italic*` and `**bold**` inline spans, and
 * `## Section heading` lines (S202 — the consolidated comprehensive
 * Commentary uses section headings + bold lead-ins; the chapter_intro
 * surface renders them so the long single Commentary stays navigable).
 * Sacred names are restored with parentheticals at the seed-data layer —
 * they render as plain inline text with no special treatment.
 *
 * Still intentionally narrow: no lists, links, code, or images. The
 * curated commentary and summary_md surfaces use only headings, bold,
 * italic, and paragraphs.
 */

import type { ReactNode } from "react";

/**
 * Render `**bold**` and `*italic*` inline spans inside a single line of
 * text. Returns a flat array of <span> / <strong> / <em> nodes ready to
 * be embedded in a parent. The combined regex matches the two-asterisk
 * bold form first so `**x**` is never mis-parsed as two empty italics.
 * No nesting. (Kept named `renderItalicSpans` for backward compatibility
 * with existing callers — it now also handles bold, a strict superset.)
 */
export function renderItalicSpans(line: string): ReactNode[] {
  const parts: ReactNode[] = [];
  const re = /\*\*([^*]+)\*\*|\*([^*]+)\*/g;
  let lastIdx = 0;
  let key = 0;
  let m: RegExpExecArray | null;
  while ((m = re.exec(line)) !== null) {
    if (m.index > lastIdx) {
      parts.push(<span key={key++}>{line.slice(lastIdx, m.index)}</span>);
    }
    if (m[1] !== undefined) {
      parts.push(<strong key={key++}>{m[1]}</strong>);
    } else {
      parts.push(<em key={key++}>{m[2]}</em>);
    }
    lastIdx = m.index + m[0].length;
  }
  if (lastIdx < line.length) {
    parts.push(<span key={key++}>{line.slice(lastIdx)}</span>);
  }
  return parts;
}

/**
 * Render one paragraph (no surrounding `<p>`): inline spans on every
 * line, with single-`\n` line breaks honored as soft breaks via `<br>`.
 * Wrap the return value in a `<p>` in the caller.
 */
export function renderMarkdownParagraph(paragraph: string): ReactNode {
  const lines = paragraph.split("\n");
  return lines.map((line, lineIdx) => (
    <span key={lineIdx}>
      {renderItalicSpans(line)}
      {lineIdx < lines.length - 1 && <br />}
    </span>
  ));
}

/**
 * Render an entire markdown body as a sequence of block elements,
 * splitting on `\n{2,}`. A block whose first line begins with `## ` (or
 * `### `) renders as a section heading; every other block renders as a
 * `<p>`. Suitable for `chapter_intro` (the consolidated Commentary) and
 * thread `summary_md`. Returns a React fragment.
 *
 * Headings render in the serif body face (inherited — substance, not
 * chrome), sized above body with breathing room above, so the long
 * comprehensive Commentary reads like a book section, not a dashboard
 * label.
 */
export function renderMarkdownBody(body: string): ReactNode {
  if (!body) return null;
  const blocks = body.trim().split(/\n{2,}/);
  return (
    <>
      {blocks.map((block, i) => {
        const headingMatch = /^(#{2,3})\s+(.*)$/.exec(block.trimStart());
        if (headingMatch) {
          const isSub = headingMatch[1].length === 3;
          return isSub ? (
            <h5
              key={i}
              className={
                (i > 0 ? "mt-5 " : "") +
                "mb-1 text-base font-semibold text-[var(--reader-text)]"
              }
            >
              {renderItalicSpans(headingMatch[2])}
            </h5>
          ) : (
            <h4
              key={i}
              className={
                (i > 0 ? "mt-6 " : "") +
                "mb-1.5 text-lg font-semibold text-[var(--reader-text)]"
              }
            >
              {renderItalicSpans(headingMatch[2])}
            </h4>
          );
        }
        return (
          <p key={i} className={i > 0 ? "mt-3" : ""}>
            {renderMarkdownParagraph(block)}
          </p>
        );
      })}
    </>
  );
}
