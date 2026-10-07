/**
 * study-blocks.ts — the building blocks shared by My Teachings and For
 * Teachers assignments (S442, YEAR_PLAN_STUDY_SPEC.md steps 4–5), plus their
 * Markdown and print renderers.
 *
 * A document is an ordered list of blocks. The server stores the list as-is
 * (JSONB); these shapes are the contract.
 *
 * Printing reuses study-export.ts (wrapPrintDocument / openPrintHtml /
 * downloadMarkdown) — no new export machinery. Like the S203 export, printed
 * scripture is the server text as restored (names + parentheticals intact);
 * the reader's display prefs are not applied to a document meant for others.
 */

import { getChapter, type Verse } from "./api";
import { downloadMarkdown, esc, openPrintHtml, wrapPrintDocument } from "./study-export";

export interface PassageRef {
  book_slug: string;
  book_title: string;
  chapter: number;
  verse_start?: number | null;
  verse_end?: number | null;
}

export type StudyBlock =
  | { id: string; type: "heading"; text: string }
  | { id: string; type: "text"; text: string }
  | ({ id: string; type: "passage" } & PassageRef)
  | {
      id: string;
      type: "reading";
      /** e.g. "Day 18 · Thu, Oct 8" */
      label: string;
      passages: PassageRef[];
    }
  | { id: string; type: "note"; note_id: string; ref: string | null; body: string }
  | { id: string; type: "question"; text: string; answer?: string; lines?: number }
  | ({ id: string; type: "memory" } & PassageRef);

export type BlockType = StudyBlock["type"];

export function newBlockId(): string {
  return Math.random().toString(36).slice(2, 10) + Date.now().toString(36).slice(-4);
}

export function passageLabel(p: PassageRef): string {
  let s = `${p.book_title} ${p.chapter}`;
  if (p.verse_start) {
    s += `:${p.verse_start}`;
    if (p.verse_end && p.verse_end !== p.verse_start) s += `–${p.verse_end}`;
  }
  return s;
}

export function passageHref(p: PassageRef): string {
  return `/read?book=${encodeURIComponent(p.book_slug)}&chapter=${p.chapter}`;
}

/** Every passage a document points at (for text loading). */
export function passagesIn(blocks: StudyBlock[]): PassageRef[] {
  const out: PassageRef[] = [];
  for (const b of blocks) {
    if (b.type === "passage" || b.type === "memory") out.push(b);
    else if (b.type === "reading") out.push(...b.passages);
  }
  return out;
}

const chapterKey = (slug: string, ch: number) => `${slug}::${ch}`;

export type ChapterTexts = Map<string, Verse[]>;

/**
 * Fetch the chapter text for every passage in the document (one request per
 * distinct chapter, a few at a time). Chapters the reader's tier can't open,
 * or that fail to load, are simply absent — the printout falls back to the
 * reference for those.
 */
export async function loadChapterTexts(passages: PassageRef[]): Promise<ChapterTexts> {
  const keys = Array.from(new Set(passages.map((p) => chapterKey(p.book_slug, p.chapter))));
  const out: ChapterTexts = new Map();
  const queue = [...keys];
  const worker = async () => {
    while (queue.length) {
      const key = queue.shift()!;
      const [slug, ch] = key.split("::");
      try {
        const detail = await getChapter(slug, Number(ch));
        out.set(key, detail.verses);
      } catch {
        /* locked or offline — leave it out */
      }
    }
  };
  await Promise.all(Array.from({ length: Math.min(4, keys.length) }, worker));
  return out;
}

function versesFor(p: PassageRef, texts: ChapterTexts): Verse[] | null {
  const vs = texts.get(chapterKey(p.book_slug, p.chapter));
  if (!vs) return null;
  if (!p.verse_start) return vs;
  const end = p.verse_end ?? p.verse_start;
  return vs.filter((v) => v.verse_number >= p.verse_start! && v.verse_number <= end);
}

// ---------------------------------------------------------------------------
// Rendering
// ---------------------------------------------------------------------------

export type PrintCopy = "plain" | "student" | "teacher";

export interface RenderOptions {
  title: string;
  /** Subtitle line (date, due date, class). */
  meta?: string;
  /** Instructions shown under the title (assignments). */
  instructions?: string;
  /** student = blank lines under questions, no answers; teacher = answers + notes. */
  copy?: PrintCopy;
  /** Print the full chapter / verse text under each passage. */
  includeText?: boolean;
  texts?: ChapterTexts;
}

const PRINT_EXTRA_CSS = `
  .q { margin: 10pt 0 2pt; font-weight: 600; page-break-inside: avoid; }
  .lines { margin: 2pt 0 10pt; }
  .lines div { border-bottom: 1px solid #bdbdbd; height: 22pt; }
  .answer { margin: 2pt 0 10pt 12pt; color: #0f6e56; }
  .answer b { font-family: ui-sans-serif, system-ui, sans-serif; font-size: 9pt;
              text-transform: uppercase; letter-spacing: 0.06em; }
  .ref { font-weight: 600; margin: 10pt 0 2pt; }
  .reading { margin: 8pt 0; }
  .reading .label { font-family: ui-sans-serif, system-ui, sans-serif; font-weight: 600;
                    font-size: 10.5pt; }
  .memory { border: 1.5px solid #8e4fb3; border-radius: 6px; padding: 6pt 10pt; margin: 10pt 0;
            page-break-inside: avoid; }
  .memory .tag { font-family: ui-sans-serif, system-ui, sans-serif; font-size: 8.5pt;
                 text-transform: uppercase; letter-spacing: 0.1em; color: #8e4fb3; }
  .verses sup { font-family: ui-sans-serif, system-ui, sans-serif; font-size: 7.5pt;
                color: #6b6b6b; margin-right: 2pt; }
  .note { border-left: 2.5px solid #b4a078; padding: 2pt 0 2pt 10pt; margin: 8pt 0; }
  .note .cite { display: block; }
  .instructions { background: #f4f4ef; border-radius: 6px; padding: 8pt 12pt; margin: 6pt 0 14pt; }
  .copy-tag { font-family: ui-sans-serif, system-ui, sans-serif; font-size: 8.5pt;
              text-transform: uppercase; letter-spacing: 0.12em; color: #6b6b6b; }
  .name-line { font-family: ui-sans-serif, system-ui, sans-serif; font-size: 10pt; margin: 0 0 14pt; }
`;

const nl2br = (s: string) => esc(s).replaceAll("\n", "<br>");

function versesHtml(vs: Verse[]): string {
  return `<blockquote class="verses">${vs
    .map((v) => `<sup>${v.verse_number}</sup>${esc(v.text)}`)
    .join(" ")}</blockquote>`;
}

function passageHtml(p: PassageRef, o: RenderOptions): string {
  const head = `<p class="ref">${esc(passageLabel(p))}</p>`;
  if (!o.includeText || !o.texts) return head;
  const vs = versesFor(p, o.texts);
  return vs && vs.length ? head + versesHtml(vs) : head;
}

export function renderBlocksHtml(blocks: StudyBlock[], o: RenderOptions): string {
  const copy = o.copy ?? "plain";
  const parts: string[] = [];
  parts.push(`<h1>${esc(o.title)}</h1>`);
  if (copy !== "plain") {
    parts.push(`<p class="copy-tag">${copy === "teacher" ? "Teacher copy — with answers" : "Student copy"}</p>`);
  }
  if (o.meta) parts.push(`<p class="meta">${esc(o.meta)}</p>`);
  if (copy === "student") parts.push(`<p class="name-line">Name: ______________________________</p>`);
  if (o.instructions?.trim()) parts.push(`<div class="instructions">${nl2br(o.instructions)}</div>`);

  for (const b of blocks) {
    switch (b.type) {
      case "heading":
        parts.push(`<h2>${esc(b.text)}</h2>`);
        break;
      case "text":
        if (b.text.trim()) parts.push(`<p>${nl2br(b.text)}</p>`);
        break;
      case "passage":
        parts.push(passageHtml(b, o));
        break;
      case "reading":
        if (o.includeText) {
          parts.push(`<h3>${esc(b.label)}</h3>`);
          for (const p of b.passages) parts.push(passageHtml(p, o));
        } else {
          parts.push(
            `<div class="reading"><span class="label">${esc(b.label)}:</span> ${esc(
              b.passages.map(passageLabel).join(" · "),
            )}</div>`,
          );
        }
        break;
      case "memory": {
        const vs = o.texts ? versesFor(b, o.texts) : null;
        parts.push(
          `<div class="memory"><div class="tag">Memory verse</div><div class="ref">${esc(
            passageLabel(b),
          )}</div>${vs && vs.length ? versesHtml(vs) : ""}</div>`,
        );
        break;
      }
      case "note":
        if (copy === "student") break; // the teacher's own notes stay on the teacher copy
        parts.push(
          `<div class="note">${b.ref ? `<span class="cite">${esc(b.ref)}</span>` : ""}${nl2br(b.body)}</div>`,
        );
        break;
      case "question": {
        parts.push(`<p class="q">${nl2br(b.text)}</p>`);
        if (copy === "teacher") {
          if (b.answer?.trim()) parts.push(`<div class="answer"><b>Answer</b><br>${nl2br(b.answer)}</div>`);
        } else if (copy === "student") {
          const n = Math.max(1, Math.min(20, b.lines ?? 3));
          parts.push(`<div class="lines">${"<div></div>".repeat(n)}</div>`);
        }
        break;
      }
    }
  }
  return wrapPrintDocument(o.title, parts.join("\n"), PRINT_EXTRA_CSS);
}

export function renderBlocksMarkdown(blocks: StudyBlock[], o: RenderOptions): string {
  const copy = o.copy ?? "plain";
  const L: string[] = [`# ${o.title}`, ""];
  if (copy !== "plain") L.push(copy === "teacher" ? "_Teacher copy — with answers_" : "_Student copy_", "");
  if (o.meta) L.push(`_${o.meta}_`, "");
  if (o.instructions?.trim()) L.push(o.instructions.trim(), "");
  const quote = (p: PassageRef) => {
    if (!o.includeText || !o.texts) return;
    const vs = versesFor(p, o.texts);
    if (vs && vs.length) L.push(`> ${vs.map((v) => `${v.verse_number} ${v.text}`).join(" ")}`, "");
  };
  for (const b of blocks) {
    switch (b.type) {
      case "heading":
        L.push(`## ${b.text}`, "");
        break;
      case "text":
        if (b.text.trim()) L.push(b.text.trim(), "");
        break;
      case "passage":
        L.push(`**${passageLabel(b)}**`, "");
        quote(b);
        break;
      case "reading":
        L.push(`**${b.label}:** ${b.passages.map(passageLabel).join(" · ")}`, "");
        if (o.includeText) b.passages.forEach((p) => quote(p));
        break;
      case "memory":
        L.push(`**Memory verse — ${passageLabel(b)}**`, "");
        if (o.texts) {
          const vs = versesFor(b, o.texts);
          if (vs && vs.length) L.push(`> ${vs.map((v) => v.text).join(" ")}`, "");
        }
        break;
      case "note":
        if (copy === "student") break;
        L.push(`> ${b.ref ? `*${b.ref}* — ` : ""}${b.body.replaceAll("\n", "\n> ")}`, "");
        break;
      case "question":
        L.push(`**Q.** ${b.text}`, "");
        if (copy === "teacher" && b.answer?.trim()) L.push(`*Answer:* ${b.answer.trim()}`, "");
        if (copy === "student") L.push("_____________________________________________", "");
        break;
    }
  }
  return L.join("\n");
}

/** A file-name-safe slug for downloads. */
export function fileSlug(title: string): string {
  return (
    title
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, "-")
      .replace(/^-+|-+$/g, "")
      .slice(0, 60) || "document"
  );
}

/**
 * Print a document: opens the print tab right away (inside the tap, so popup
 * blockers allow it), loads any chapter text needed, then writes the page and
 * the system print dialog appears. Memory verses always carry their text.
 */
export async function printBlocks(blocks: StudyBlock[], o: RenderOptions): Promise<void> {
  const w = typeof window !== "undefined" ? window.open("", "_blank") : null;
  if (w) {
    w.document.write(
      '<p style="font-family:system-ui,sans-serif;padding:24px;color:#555">Preparing your printout…</p>',
    );
  }
  const wanted = o.includeText
    ? passagesIn(blocks)
    : blocks.filter((b) => b.type === "memory").map((b) => b as PassageRef);
  const texts = wanted.length ? await loadChapterTexts(wanted) : new Map();
  const html = renderBlocksHtml(blocks, { ...o, texts });
  if (w) {
    w.document.open();
    w.document.write(html);
    w.document.close();
  } else {
    openPrintHtml(html);
  }
}

/** Markdown download of a document (chapter text loaded when asked for). */
export async function downloadBlocksMarkdown(blocks: StudyBlock[], o: RenderOptions): Promise<void> {
  const wanted = o.includeText
    ? passagesIn(blocks)
    : blocks.filter((b) => b.type === "memory").map((b) => b as PassageRef);
  const texts = wanted.length ? await loadChapterTexts(wanted) : new Map();
  const md = renderBlocksMarkdown(blocks, { ...o, texts });
  const suffix = o.copy === "teacher" ? "-teacher" : o.copy === "student" ? "-student" : "";
  downloadMarkdown(md, `${fileSlug(o.title)}${suffix}.md`);
}

const readingDayFmt = new Intl.DateTimeFormat(undefined, { weekday: "short", month: "short", day: "numeric" });

/** Plan days → one "reading" block per day (label "Day 18 · Thu, Oct 8"). */
export function readingBlocksFromDays(
  days: {
    dayNumber: number;
    dateISO: string;
    items: { book_id: string; book_title: string; chapter: number }[];
  }[],
): StudyBlock[] {
  return days.map((d) => {
    const [y, m, dd] = d.dateISO.split("-").map(Number);
    return {
      id: newBlockId(),
      type: "reading" as const,
      label: `Day ${d.dayNumber} · ${readingDayFmt.format(new Date(y, m - 1, dd))}`,
      passages: d.items.map((it) => ({
        book_slug: it.book_id,
        book_title: it.book_title,
        chapter: it.chapter,
      })),
    };
  });
}
