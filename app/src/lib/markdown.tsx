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
 * within a paragraph, and `*italic*` spans. Sacred names are restored
 * with parentheticals at the seed-data layer — they render as plain
 * inline text with no special treatment.
 *
 * No other markdown is supported on purpose. Headings, lists, links,
 * code, and bold are not used in the curated commentary or summary_md
 * surfaces; keeping the parser narrow keeps the surface area small
 * and predictable.
 */

import type { ReactNode } from "react";

/**
 * Render `*...*` italic spans inside a single line of text. Returns
 * a flat array of <span> / <em> nodes ready to be embedded in a parent.
 * No nesting; the regex is intentionally simple.
 */
export function renderItalicSpans(line: string): ReactNode[] {
  const parts: ReactNode[] = [];
  const re = /\*([^*]+)\*/g;
  let lastIdx = 0;
  let key = 0;
  let m: RegExpExecArray | null;
  while ((m = re.exec(line)) !== null) {
    if (m.index > lastIdx) {
      parts.push(<span key={key++}>{line.slice(lastIdx, m.index)}</span>);
    }
    parts.push(<em key={key++}>{m[1]}</em>);
    lastIdx = m.index + m[0].length;
  }
  if (lastIdx < line.length) {
    parts.push(<span key={key++}>{line.slice(lastIdx)}</span>);
  }
  return parts;
}

/**
 * Render one paragraph (no surrounding `<p>`): italic spans on every
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
 * Render an entire markdown body as a sequence of `<p>` elements,
 * splitting on `\n{2,}`. Suitable for `chapter_intro` (free-tier
 * commentary) and thread `summary_md`. Returns a React fragment.
 */
export function renderMarkdownBody(body: string): ReactNode {
  if (!body) return null;
  const paragraphs = body.trim().split(/\n{2,}/);
  return (
    <>
      {paragraphs.map((para, i) => (
        <p key={i} className={i > 0 ? "mt-3" : ""}>
          {renderMarkdownParagraph(para)}
        </p>
      ))}
    </>
  );
}
