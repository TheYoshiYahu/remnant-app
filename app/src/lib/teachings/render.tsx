/**
 * Teaching markdown renderer.
 *
 * Extends the reader's shared inline markdown (renderItalicSpans handles
 * *italic* / **bold**) with the three block forms the arranged-scripture
 * teachings use that the base renderMarkdownBody does not: single-`#` section
 * headings, `---` horizontal rules, and `> ` blockquoted scripture. Sacred-name
 * parentheticals — e.g. "Yahuah (LORD)" — are plain inline text and render as
 * authored. Styling uses the reader's own CSS variables (var(--reader-*)) so
 * teachings sit in the same visual register as every other reading surface;
 * no new global CSS is introduced.
 */

import type { ReactNode } from "react";
import { renderItalicSpans } from "../markdown";

function renderParagraph(paragraph: string): ReactNode {
  const lines = paragraph.split("\n");
  return lines.map((line, idx) => (
    <span key={idx}>
      {renderItalicSpans(line)}
      {idx < lines.length - 1 && <br />}
    </span>
  ));
}

/**
 * Render a teaching markdown body (or synopsis) as block elements, splitting on
 * blank lines. Recognizes `---` rules, `> ` blockquoted scripture, `#`/`##`/
 * `###` headings, and paragraphs.
 */
export function renderTeachingBody(body: string): ReactNode {
  if (!body) return null;
  const blocks = body.trim().split(/\n{2,}/);
  return (
    <>
      {blocks.map((block, i) => {
        const trimmed = block.trim();

        // Horizontal rule.
        if (/^-{3,}$/.test(trimmed)) {
          return (
            <hr
              key={i}
              className="my-7 border-0 border-t border-[var(--reader-rule)]"
            />
          );
        }

        // Blockquoted scripture — every line in the block starts with '>'.
        const lines = trimmed.split("\n");
        if (lines.length > 0 && lines.every((l) => /^\s*>/.test(l))) {
          const inner = lines.map((l) => l.replace(/^\s*>\s?/, "")).join("\n");
          return (
            <blockquote
              key={i}
              className="my-4 border-l-2 border-[var(--reader-accent)] pl-4 font-serif italic leading-relaxed text-[var(--reader-text)]"
            >
              {renderParagraph(inner)}
            </blockquote>
          );
        }

        // Section headings.
        const h = /^(#{1,3})\s+(.*)$/.exec(trimmed);
        if (h) {
          const level = h[1].length;
          const content = renderItalicSpans(h[2]);
          if (level === 1) {
            return (
              <h2
                key={i}
                className="mt-9 mb-3 font-serif text-xl font-semibold leading-snug text-[var(--reader-text)]"
              >
                {content}
              </h2>
            );
          }
          if (level === 2) {
            return (
              <h3
                key={i}
                className="mt-7 mb-2 font-serif text-lg font-semibold text-[var(--reader-text)]"
              >
                {content}
              </h3>
            );
          }
          return (
            <h4
              key={i}
              className="mt-6 mb-1.5 font-serif text-base font-semibold text-[var(--reader-text)]"
            >
              {content}
            </h4>
          );
        }

        // Ordinary paragraph.
        return (
          <p
            key={i}
            className="mt-4 font-serif leading-relaxed text-[var(--reader-text)]"
          >
            {renderParagraph(trimmed)}
          </p>
        );
      })}
    </>
  );
}
