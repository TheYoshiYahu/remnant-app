/**
 * study-export — Session 203 (Session C).
 *
 * Renders the partner's whole study apparatus (notes + bookmarks +
 * highlights from GET /v1/study/index) as a clean standalone document:
 * Markdown download, or a print view the system dialog turns into a
 * PDF. Study Notes tier ($1.99+) — the gate lives in MyStudy.tsx.
 *
 * Come-and-see discipline: every anchored verse is QUOTED IN FULL,
 * italicized, citation at the end — the reader of the exported
 * document sees the verse on the page, not a reference to go look up.
 * Sacred names stay intact: verse_text arrives from the server with
 * the restored names + parentheticals, and the export deliberately
 * does NOT apply the partner's display prefs (sacred-name mask /
 * hide-parentheticals) — same partner-pref-stripping precedent as the
 * S171 share-card. The exported document is the partner's study as a
 * come-and-see document for whoever they hand it to.
 *
 * Both renderers are pure functions over the payload; no fetches.
 */

import type {
  BookmarkIndexEntry,
  StudyHighlightEntry,
  StudyIndexResponse,
  StudyNoteEntry,
} from "./api";

// ----- shared assembly -----------------------------------------------------

type ExportItem =
  | { kind: "note"; when: string; entry: StudyNoteEntry }
  | { kind: "bookmark"; when: string; entry: BookmarkIndexEntry }
  | { kind: "highlight"; when: string; entry: StudyHighlightEntry };

interface BookGroup {
  bookSlug: string;
  bookTitle: string;
  items: ExportItem[];
}

export interface ExportOptions {
  /** Narrow the export to one collection (tag); null/undefined = all. */
  collection?: string | null;
  /** slug → canonical_order, for canonical book ordering. Books
   *  missing from the map sort after mapped ones, alphabetically. */
  bookOrder?: Record<string, number>;
  /** Partner's color labels (color → label) for highlight captions. */
  colorLabels?: Record<string, string>;
}

function itemTags(it: ExportItem): string[] {
  if (it.kind === "highlight") return [];
  return it.entry.tags ?? [];
}

function refOf(it: ExportItem): {
  slug: string | null;
  title: string;
  chapter: number;
  verse: number;
} {
  if (it.kind === "note") {
    const n = it.entry;
    return {
      slug: n.book_slug,
      // Notes carry verse_ref ("Hosea 1:10"); recover the book title
      // by stripping the trailing chapter:verse.
      title: n.verse_ref ? n.verse_ref.replace(/\s+\d+:\d+$/, "") : "",
      chapter: n.chapter_number ?? 0,
      verse: n.verse_number ?? 0,
    };
  }
  const e = it.entry;
  return {
    slug: e.book_slug,
    title: e.book_title,
    chapter: e.chapter_number,
    verse: e.verse_number,
  };
}

/** Group + order the apparatus for the document: books in canonical
 *  order (alphabetical fallback), items by chapter:verse within each
 *  book, unanchored notes in a trailing "Notes without an anchor"
 *  group. Collection filter applies to notes + bookmarks (highlights
 *  carry no tags and are excluded by an active collection filter). */
export function assembleExport(
  data: StudyIndexResponse,
  opts: ExportOptions = {},
): { groups: BookGroup[]; unanchored: StudyNoteEntry[] } {
  const items: ExportItem[] = [
    ...data.notes.map(
      (n): ExportItem => ({ kind: "note", when: n.created_at, entry: n }),
    ),
    ...data.bookmarks.map(
      (b): ExportItem => ({ kind: "bookmark", when: b.created_at, entry: b }),
    ),
    ...data.highlights.map(
      (h): ExportItem => ({ kind: "highlight", when: h.created_at, entry: h }),
    ),
  ];

  const filtered = opts.collection
    ? items.filter((it) => itemTags(it).includes(opts.collection as string))
    : items;

  const unanchored: StudyNoteEntry[] = [];
  const bySlug = new Map<string, BookGroup>();
  for (const it of filtered) {
    const ref = refOf(it);
    if (it.kind === "note" && it.entry.verse_id === null) {
      unanchored.push(it.entry);
      continue;
    }
    if (!ref.slug) continue;
    let group = bySlug.get(ref.slug);
    if (!group) {
      group = { bookSlug: ref.slug, bookTitle: ref.title, items: [] };
      bySlug.set(ref.slug, group);
    }
    group.items.push(it);
  }

  const order = opts.bookOrder ?? {};
  const groups = [...bySlug.values()].sort((a, b) => {
    const ao = order[a.bookSlug];
    const bo = order[b.bookSlug];
    if (ao !== undefined && bo !== undefined) return ao - bo;
    if (ao !== undefined) return -1;
    if (bo !== undefined) return 1;
    return a.bookTitle.localeCompare(b.bookTitle);
  });
  for (const g of groups) {
    g.items.sort((x, y) => {
      const rx = refOf(x);
      const ry = refOf(y);
      return rx.chapter - ry.chapter || rx.verse - ry.verse;
    });
  }
  return { groups, unanchored };
}

// ----- captions -------------------------------------------------------------

const COLOR_DISPLAY: Record<string, string> = {
  neon_yellow: "neon yellow",
  crimson: "crimson",
  tangerine: "tangerine",
  honey: "honey",
  sage: "sage",
  emerald: "emerald",
  teal: "teal",
  sky_blue: "sky blue",
  periwinkle: "periwinkle",
  lilac: "lilac",
  magenta: "magenta",
  rose: "rose",
  parchment: "parchment",
};

function highlightCaption(
  h: StudyHighlightEntry,
  colorLabels?: Record<string, string>,
): string {
  const color = COLOR_DISPLAY[h.color] ?? h.color;
  const label = colorLabels?.[h.color];
  return label
    ? `Highlighted ${color} (${h.style}) — “${label}”`
    : `Highlighted ${color} (${h.style})`;
}

function fmtDate(iso: string): string {
  try {
    return new Date(iso).toLocaleDateString(undefined, {
      year: "numeric",
      month: "long",
      day: "numeric",
    });
  } catch {
    return iso.slice(0, 10);
  }
}

// ----- Markdown -------------------------------------------------------------

export function buildStudyMarkdown(
  data: StudyIndexResponse,
  opts: ExportOptions = {},
): string {
  const { groups, unanchored } = assembleExport(data, opts);
  const lines: string[] = [];
  lines.push("# My Study");
  lines.push("");
  const scope = opts.collection ? ` — ${opts.collection}` : "";
  lines.push(`_Exported ${fmtDate(new Date().toISOString())}${scope}_`);
  lines.push("");

  for (const g of groups) {
    lines.push(`## ${g.bookTitle}`);
    lines.push("");
    for (const it of g.items) {
      const ref = refOf(it);
      const refStr = `${g.bookTitle} ${ref.chapter}:${ref.verse}`;
      if (it.kind === "note") {
        const n = it.entry;
        lines.push(`### ${refStr} — Note (${fmtDate(n.created_at)})`);
        lines.push("");
        if (n.verse_text) {
          lines.push(`> *${n.verse_text}* (${refStr})`);
          lines.push("");
        }
        lines.push(n.body);
        lines.push("");
        if (n.tags && n.tags.length > 0) {
          lines.push(`Collections: ${n.tags.join(", ")}`);
          lines.push("");
        }
      } else if (it.kind === "bookmark") {
        const b = it.entry;
        lines.push(`### ${refStr} — Bookmark (${fmtDate(b.created_at)})`);
        lines.push("");
        lines.push(`> *${b.verse_text}* (${refStr})`);
        lines.push("");
        if (b.short_description) {
          lines.push(b.short_description);
          lines.push("");
        }
        if (b.tags && b.tags.length > 0) {
          lines.push(`Collections: ${b.tags.join(", ")}`);
          lines.push("");
        }
      } else {
        const h = it.entry;
        lines.push(
          `### ${refStr} — ${highlightCaption(h, opts.colorLabels)} (${fmtDate(h.created_at)})`,
        );
        lines.push("");
        lines.push(`> *${h.verse_text}* (${refStr})`);
        lines.push("");
      }
    }
  }

  if (unanchored.length > 0) {
    lines.push("## Notes without an anchor");
    lines.push("");
    for (const n of unanchored) {
      lines.push(`### Note (${fmtDate(n.created_at)})`);
      lines.push("");
      lines.push(n.body);
      lines.push("");
      if (n.tags && n.tags.length > 0) {
        lines.push(`Collections: ${n.tags.join(", ")}`);
        lines.push("");
      }
    }
  }

  return lines.join("\n");
}

export function downloadMarkdown(markdown: string, filename: string): void {
  const blob = new Blob([markdown], { type: "text/markdown;charset=utf-8" });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = filename;
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);
  URL.revokeObjectURL(url);
}

// ----- print view (PDF via the system dialog) -------------------------------

function esc(s: string): string {
  return s
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;");
}

/** Build a standalone print-friendly HTML document: serif substance,
 *  left-ruled come-and-see blockquotes, page margins. The partner's
 *  browser/OS print dialog saves it as a PDF. */
export function buildStudyPrintHtml(
  data: StudyIndexResponse,
  opts: ExportOptions = {},
): string {
  const { groups, unanchored } = assembleExport(data, opts);
  const parts: string[] = [];
  const scope = opts.collection ? ` — ${esc(opts.collection)}` : "";
  parts.push(`<h1>My Study</h1>`);
  parts.push(
    `<p class="meta">Exported ${esc(fmtDate(new Date().toISOString()))}${scope}</p>`,
  );

  const verseBlock = (text: string, refStr: string) =>
    `<blockquote><em>${esc(text)}</em> <span class="cite">(${esc(refStr)})</span></blockquote>`;
  const collections = (tags: string[] | null) =>
    tags && tags.length > 0
      ? `<p class="coll">Collections: ${tags.map(esc).join(", ")}</p>`
      : "";

  for (const g of groups) {
    parts.push(`<h2>${esc(g.bookTitle)}</h2>`);
    for (const it of g.items) {
      const ref = refOf(it);
      const refStr = `${g.bookTitle} ${ref.chapter}:${ref.verse}`;
      if (it.kind === "note") {
        const n = it.entry;
        parts.push(
          `<h3>${esc(refStr)} — Note <span class="when">${esc(fmtDate(n.created_at))}</span></h3>`,
        );
        if (n.verse_text) parts.push(verseBlock(n.verse_text, refStr));
        parts.push(`<p>${esc(n.body).replaceAll("\n", "<br>")}</p>`);
        parts.push(collections(n.tags));
      } else if (it.kind === "bookmark") {
        const b = it.entry;
        parts.push(
          `<h3>${esc(refStr)} — Bookmark <span class="when">${esc(fmtDate(b.created_at))}</span></h3>`,
        );
        parts.push(verseBlock(b.verse_text, refStr));
        if (b.short_description) {
          parts.push(
            `<p>${esc(b.short_description).replaceAll("\n", "<br>")}</p>`,
          );
        }
        parts.push(collections(b.tags));
      } else {
        const h = it.entry;
        parts.push(
          `<h3>${esc(refStr)} — ${esc(highlightCaption(h, opts.colorLabels))} <span class="when">${esc(fmtDate(h.created_at))}</span></h3>`,
        );
        parts.push(verseBlock(h.verse_text, refStr));
      }
    }
  }

  if (unanchored.length > 0) {
    parts.push(`<h2>Notes without an anchor</h2>`);
    for (const n of unanchored) {
      parts.push(
        `<h3>Note <span class="when">${esc(fmtDate(n.created_at))}</span></h3>`,
      );
      parts.push(`<p>${esc(n.body).replaceAll("\n", "<br>")}</p>`);
      parts.push(collections(n.tags));
    }
  }

  return `<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>My Study</title>
<style>
  @page { margin: 22mm 18mm; }
  body { font-family: Lora, Georgia, "Iowan Old Style", serif;
         color: #1a1a1a; line-height: 1.65; font-size: 12.5pt;
         max-width: 42em; margin: 0 auto; padding: 24px; }
  h1 { font-size: 22pt; margin: 0 0 2pt; }
  .meta { font-family: ui-sans-serif, system-ui, sans-serif;
          color: #6b6b6b; font-size: 9.5pt; margin: 0 0 18pt; }
  h2 { font-size: 15pt; border-bottom: 1px solid #c9c9c9;
       padding-bottom: 3pt; margin: 22pt 0 8pt; page-break-after: avoid; }
  h3 { font-size: 11.5pt; margin: 14pt 0 4pt; page-break-after: avoid; }
  h3 .when { font-family: ui-sans-serif, system-ui, sans-serif;
             font-weight: 400; color: #6b6b6b; font-size: 8.5pt; }
  blockquote { border-left: 2.5px solid #0084ff; margin: 6pt 0;
               padding: 2pt 0 2pt 10pt; page-break-inside: avoid; }
  .cite { font-style: normal; color: #6b6b6b; font-size: 9.5pt; }
  .coll { font-family: ui-sans-serif, system-ui, sans-serif;
          color: #6b6b6b; font-size: 9pt; }
  p { margin: 4pt 0 8pt; }
</style>
</head>
<body>
${parts.join("\n")}
<script>window.addEventListener('load', function () { setTimeout(function () { window.print(); }, 150); });</script>
</body>
</html>`;
}

/** Open the print view in a new tab/window and trigger the system
 *  print dialog (the partner picks "Save as PDF"). Falls back to a
 *  same-tab hidden iframe when the popup is blocked. */
export function openStudyPrintView(
  data: StudyIndexResponse,
  opts: ExportOptions = {},
): void {
  const html = buildStudyPrintHtml(data, opts);
  const w = window.open("", "_blank");
  if (w) {
    w.document.open();
    w.document.write(html);
    w.document.close();
    return;
  }
  const frame = document.createElement("iframe");
  frame.style.position = "fixed";
  frame.style.right = "0";
  frame.style.bottom = "0";
  frame.style.width = "0";
  frame.style.height = "0";
  frame.style.border = "0";
  document.body.appendChild(frame);
  const doc = frame.contentDocument;
  if (!doc) return;
  doc.open();
  doc.write(html);
  doc.close();
  // The inline onload print fires inside the iframe; clean up after.
  setTimeout(() => document.body.removeChild(frame), 60000);
}
