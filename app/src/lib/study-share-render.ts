/**
 * study-share-render.ts — Session 170, §30 Shareable Study-Modal Exports.
 *
 * Renders the StrongsLookup / LexiconSheet (BDB / LSJ) modal as a
 * 1080×1920 portrait share card with the §170-locked 20% watermark
 * footer. Locked at DESIGN_LANGUAGE.md §30.
 *
 * ─── V1 pipeline (html2canvas walk-the-DOM) ─────────────────────────
 *
 * The modal DOM element IS the source of truth — html2canvas walks it
 * at 2× device-pixel-ratio, paints to a Canvas, and the result is
 * composed into the upper 80% of the share card. The lower 20% is the
 * shared watermark footer per §170. V1.1 deferred: custom Canvas
 * paint-from-data pipeline (perfect SBL Hebrew / SBL BibLit kerning,
 * smaller bundle); ship V1 first, gather partner feedback, then iterate.
 *
 * ─── DOM modifications applied before capture ───────────────────────
 *
 * The shared image is a snapshot of the modal *as the partner read it*,
 * with two specific transformations:
 *
 *   1. "Read full lexicon entry" button → URL text line.
 *      In the live modal this is a clickable button that opens the
 *      LexiconSheet. In the export it becomes a non-clickable text
 *      line carrying the deep-link URL — partner-paste-and-go discovery.
 *      Detected via `[data-export-replace="lexicon-deeplink"]`.
 *
 *   2. Concordance "Other verses using this word" rail collapses
 *      to its first page (no Show-more button in the export). The
 *      live rail is paginated; the export captures only what the
 *      partner saw above the fold of the rail to keep the share card
 *      length reasonable. Detected via the Show-more button's
 *      `[data-export-suppress]` attribute on the rail container.
 *
 * Both transformations are applied to a *clone* of the modal element
 * (off-screen, then disposed); the live DOM is never mutated.
 *
 * ─── Composition + 20% footer ───────────────────────────────────────
 *
 * Final canvas: 1080×1920 (9:16 portrait). Body region: top 80%
 * (1536px). The captured modal canvas is scaled to fit the body
 * region preserving aspect (object-fit: contain), centered both ways
 * with the modal's background color filling the body region. The
 * footer 20% (384px) is painted by the shared `paintWatermarkFooter`
 * helper per §170.
 *
 * ─── Transport chain ────────────────────────────────────────────────
 *
 *   1. navigator.share({ files: [file] })       — OS share sheet
 *   2. navigator.clipboard.write(ClipboardItem) — image clipboard
 *   3. <a download> blob URL                    — manual fallback
 *
 * AbortError (partner dismissed) is a normal flow exit, not a fallback
 * trigger. Same chain as §24.
 */

import html2canvas from "html2canvas";
import {
  FOOTER_PCT,
  type WatermarkTheme,
  paintWatermarkFooter,
  preloadFooterBrandMark,
} from "./watermark-footer-render";

// ─────────────────────────────────────────────────────────────────────
// Constants — locked per DESIGN_LANGUAGE.md §30
// ─────────────────────────────────────────────────────────────────────

/** 1080 × 1920 PNG (9:16 portrait). Locked at §30. */
export const STUDY_CARD_WIDTH = 1080;
export const STUDY_CARD_HEIGHT = 1920;

/** Body region height — the upper 80% (1536 px on the locked card).
 *  The remaining 20% (384 px) is the shared watermark footer. */
const BODY_PCT = 1 - FOOTER_PCT;

/** Body region inner padding so the captured modal sits inside the
 *  body with a small margin on each side. S170 walk-4: dropped from
 *  40 → 16 to maximize content area at messaging-app thumbnail size. */
const BODY_INNER_PAD_PX = 16;

/** Forced capture width for the cloned modal. S170 walk-4 (Yoshi's
 *  "text too small to read without clicking" redline): tightened from
 *  720 → 540. Narrower capture = each glyph occupies a larger fraction
 *  of the canvas → text reads bigger at messaging-app preview
 *  compression. */
const CAPTURE_WIDTH_PX = 540;

/** Sandbox root font-size override. S170 walk-4: bumped from default
 *  16px → 24px. Tailwind v4 sizes (`text-xs`, `text-sm`, etc.) are
 *  rem-based, so a 1.5× root cascade makes every text utility 1.5×
 *  bigger in the cloned subtree without per-element overrides. The
 *  live modal is unchanged; only the cloned subtree inside the
 *  off-screen sandbox uses the larger size. */
const SANDBOX_ROOT_FONT_PX = 24;

/** Base URL for the deep-link replacement in the export. The §30 spec
 *  locks the URL pattern as bible.remnantofpromise.org/strongs/{N}. */
const STRONGS_URL_BASE = "bible.remnantofpromise.org/strongs";

/** S171 §17 — base host for the xref-share anchor-verse permalink. The
 *  full pattern is `{HOST}/{book-slug}/{chapter}.{verse}` (e.g.,
 *  `bible.remnantofpromise.org/genesis/1.1`). The route is V1.1 work
 *  alongside `/strongs/{N}`; in V1 the URL is text-only on the share
 *  card and serves as paste-and-go discovery. */
const ANCHOR_URL_HOST = "bible.remnantofpromise.org";

// ─────────────────────────────────────────────────────────────────────
// Types — discriminated union (S171 refactor)
// ─────────────────────────────────────────────────────────────────────

/**
 * §30 V1 word-study share (StrongsLookup / LexiconSheet BDB / LSJ).
 * Carries a Strong's number + transliteration for the filename slug
 * and the "Full {SOURCE} entry at ..." deeplink replacement line.
 */
export interface StrongsShareMeta {
  kind: "strongs";
  /** Strong's number (e.g., "H7225", "G3056"). */
  strongNumber: string;
  /** Transliteration (lowercase, hyphenated if multi-word). Used for
   *  the filename slug; safe-default to `"entry"` if not available. */
  transliteration: string;
  /** Optional surface — informs the "Full {SOURCE} entry at ..." line
   *  source label. */
  source?: "strongs" | "bdb" | "lsj";
}

/**
 * S171 §17 V1.1 cross-reference share (ChapterEndCard rows). Two
 * shapes inside one variant:
 *
 *   - `xrefKind: "baseline"` — a per-source-verse block from Layer 1
 *     of the chapter-end card. Captures the anchor verse heading +
 *     all curated target refs for that verse.
 *   - `xrefKind: "thread"`   — a per-thread callout from Layer 2.
 *     Captures the thread title + anchor + summary_md prose + member
 *     rows in this chapter.
 *
 * The anchor permalink (built from bookSlug/chapterNumber/verseNumber)
 * substitutes the watermark's CTA URL line so every shared xref carries
 * a discovery doorway pointing back at the verse it cites. `subject`
 * is the human-readable label baked into the filename slug — e.g., the
 * source-verse label ("verse-1") for baseline, the thread slug
 * ("kingdom-gospel") for thread.
 */
export interface XrefShareMeta {
  kind: "xref";
  xrefKind: "baseline" | "thread";
  bookSlug: string;
  chapterNumber: number;
  verseNumber: number;
  /** Filename slug subject (e.g., "verse-1" or "kingdom-gospel"). */
  subject: string;
}

export type StudyShareMeta = StrongsShareMeta | XrefShareMeta;

export type StudyTransportResult =
  | { ok: true; transport: "share" | "clipboard-image" | "download" }
  | { ok: false; aborted: true }
  | { ok: false; error: string };

// ─────────────────────────────────────────────────────────────────────
// Pure helpers — node-testable.
// ─────────────────────────────────────────────────────────────────────

/**
 * Canonical filename for a study-share export. Branches on meta.kind:
 *
 *   - strongs: `{strong_number}-{lemma_translit}-rop-study.png`
 *              e.g., `H7225-reshith-rop-study.png` (§30).
 *   - xref baseline:
 *              `xref-{book-slug}-{chap}.{verse}-rop-study.png`
 *              e.g., `xref-genesis-1.1-rop-study.png` (§17 V1.1).
 *   - xref thread:
 *              `thread-{thread-slug}-rop-study.png`
 *              e.g., `thread-kingdom-gospel-rop-study.png` (§17 V1.1).
 *
 * Transliterations / subjects are slug-normalized via the same
 * NFD-strip-downcase pipeline so the filename is filesystem-safe on
 * every platform.
 */
export function buildStudyShareFilename(meta: StudyShareMeta): string {
  if (meta.kind === "strongs") {
    const slug = slugifyTransliteration(meta.transliteration);
    return `${meta.strongNumber}-${slug}-rop-study.png`;
  }
  // xref
  const subjectSlug = slugifyTransliteration(meta.subject);
  if (meta.xrefKind === "thread") {
    return `thread-${subjectSlug}-rop-study.png`;
  }
  // baseline — anchor verse permalink in the filename.
  return `xref-${meta.bookSlug}-${meta.chapterNumber}.${meta.verseNumber}-rop-study.png`;
}

/**
 * S171 §17 — build the anchor-verse permalink that substitutes the
 * watermark's CTA URL for xref shares. Pattern:
 *
 *   bible.remnantofpromise.org/{book-slug}/{chapter}.{verse}
 *
 * Reads like "Genesis 1:1" when scanned by eye, fits the watermark's
 * 22pt Lora line at 1080px width with the 6% inset (longest book slug
 * `1-thessalonians` + 3-digit chapter/verse runs ~32 chars — well
 * inside the safe span). The route itself is V1.1 work alongside
 * `/strongs/{N}`; in V1 the URL is text-only on the share card and
 * serves as paste-and-go discovery.
 */
export function buildAnchorPermalink(
  bookSlug: string,
  chapterNumber: number,
  verseNumber: number
): string {
  return `${ANCHOR_URL_HOST}/${bookSlug}/${chapterNumber}.${verseNumber}`;
}

export function slugifyTransliteration(translit: string): string {
  if (!translit || !translit.trim()) return "entry";
  // Normalize + strip combining marks (diacritics), downcase, strip
  // non-[a-z0-9 -], collapse runs of whitespace/hyphen to single hyphen.
  const stripped = translit
    .normalize("NFD")
    .replace(/[̀-ͯ]/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9\s-]+/g, "")
    .trim()
    .replace(/[\s-]+/g, "-");
  return stripped || "entry";
}

/**
 * Build the "Full {SOURCE} entry at {URL}" text replacement string
 * for the lexicon-deeplink button per §30. Source code → display label:
 *
 *   - "strongs" → "Strong's"   (StrongsLookup variant — falls back to the
 *                              source-language label if present, otherwise
 *                              this generic)
 *   - "bdb"     → "BDB"
 *   - "lsj"     → "LSJ"
 *
 *   buildLexiconDeeplinkText("H7225", "bdb")
 *     → "Full BDB entry at bible.remnantofpromise.org/strongs/H7225"
 */
export function buildLexiconDeeplinkText(
  strongNumber: string,
  source: StrongsShareMeta["source"] | undefined
): string {
  const label =
    source === "bdb"
      ? "BDB"
      : source === "lsj"
      ? "LSJ"
      : "lexicon";
  return `Full ${label} entry at ${STRONGS_URL_BASE}/${strongNumber}`;
}

// ─────────────────────────────────────────────────────────────────────
// DOM transformation — clone the modal, swap the deeplink button,
// suppress the Show-more rail expander.
// ─────────────────────────────────────────────────────────────────────

interface PreparedClone {
  /** The off-DOM clone, positioned absolutely off-screen. The caller
   *  is responsible for cleanup via `dispose()`. */
  element: HTMLElement;
  dispose: () => void;
}

/**
 * Clone the modal element off-screen, apply the export-time
 * transformations, return the prepared clone. Live DOM never mutated.
 *
 * The clone sits at `position: fixed; left: -99999px` so html2canvas
 * can capture it with full layout applied (fonts, sizing, computed
 * styles) without flashing visually in the partner's viewport.
 */
function prepareModalClone(
  modalElement: HTMLElement,
  meta: StudyShareMeta
): PreparedClone {
  const clone = modalElement.cloneNode(true) as HTMLElement;

  // Force a narrow render width AND a bumped root font-size so the
  // captured canvas comes out tall-aspect with readable-at-thumbnail
  // text. (S170 walk-1: width force, walk-4: font-size bump per
  // Yoshi's "text too small without clicking" redline.) Tailwind's
  // `w-full max-w-6xl` on the modal resolves to min(100%, 1152px) =
  // CAPTURE_WIDTH_PX under this sandbox; the modal's interior content
  // re-wraps to a portrait reading column. The rem-based text
  // utilities cascade through the SANDBOX_ROOT_FONT_PX override so
  // every text size scales up 1.5×.
  const sandbox = document.createElement("div");
  sandbox.style.position = "fixed";
  sandbox.style.left = "-99999px";
  sandbox.style.top = "0";
  sandbox.style.width = `${CAPTURE_WIDTH_PX}px`;
  sandbox.style.fontSize = `${SANDBOX_ROOT_FONT_PX}px`;
  sandbox.style.pointerEvents = "none";
  sandbox.style.zIndex = "-1";
  sandbox.appendChild(clone);
  document.body.appendChild(sandbox);

  // Transformation 1 — strongs only — replace the "Read full lexicon
  // entry" button with a non-clickable URL text line per §30. Xref
  // shares have no such button (their permalink lives in the watermark
  // line 3 override instead).
  if (meta.kind === "strongs") {
    const deeplinks = clone.querySelectorAll<HTMLElement>(
      "[data-export-replace='lexicon-deeplink']"
    );
    deeplinks.forEach((el) => {
      const replacement = document.createElement("div");
      replacement.textContent = buildLexiconDeeplinkText(
        meta.strongNumber,
        meta.source
      );
      // Preserve the visual register — match the original button's
      // muted accent register.
      replacement.style.fontFamily =
        "ui-sans-serif, system-ui, -apple-system, sans-serif";
      replacement.style.fontSize = "0.95rem";
      replacement.style.fontWeight = "500";
      replacement.style.color = "var(--reader-accent, #1A6FE5)";
      replacement.style.padding = "0.5rem 0.75rem";
      replacement.style.borderRadius = "4px";
      replacement.style.border = "1px solid var(--reader-rule, rgba(255,255,255,0.12))";
      replacement.style.textAlign = "center";
      el.replaceWith(replacement);
    });
  }

  // Transformation 2 — suppress nodes marked `data-export-suppress`
  // (Share button itself, close ✕, Show-more expanders, etc.) so the
  // export image carries content only, no chrome.
  const suppressed = clone.querySelectorAll<HTMLElement>(
    "[data-export-suppress]"
  );
  suppressed.forEach((el) => el.remove());

  return {
    element: clone,
    dispose: () => {
      if (sandbox.parentNode) sandbox.parentNode.removeChild(sandbox);
    },
  };
}

// ─────────────────────────────────────────────────────────────────────
// Composite renderer — modal capture + watermark footer.
// ─────────────────────────────────────────────────────────────────────

/**
 * Render the study-share card. Returns a 1080×1920 canvas with the
 * modal captured into the upper 80% (object-fit: contain, centered)
 * and the §170 watermark painted in the lower 20%.
 *
 * The modal capture runs via html2canvas at 2× DPR for retina quality
 * at messaging-app preview size. The background of the body region
 * matches the modal's computed background color so the captured
 * content sits on a continuous surface (no jarring color boundary).
 */
export async function renderStudyShareCard(
  modalElement: HTMLElement,
  meta: StudyShareMeta
): Promise<HTMLCanvasElement> {
  const W = STUDY_CARD_WIDTH;
  const H = STUDY_CARD_HEIGHT;

  const prepared = prepareModalClone(modalElement, meta);
  let modalCanvas: HTMLCanvasElement;
  try {
    modalCanvas = await html2canvas(prepared.element, {
      backgroundColor: null,
      scale: 2,
      useCORS: true,
      logging: false,
    });
  } finally {
    prepared.dispose();
  }

  // Card canvas.
  const canvas = document.createElement("canvas");
  canvas.width = W;
  canvas.height = H;
  const ctx = canvas.getContext("2d");
  if (!ctx) {
    throw new Error("study-share-render: 2D canvas context unavailable");
  }

  // S170 walk-3 fix: paint the ENTIRE canvas with the theme-appropriate
  // background FIRST. The previous code only filled the body region,
  // leaving the footer band transparent. When iMessage/X/Slack
  // composite the PNG against their own surface (white on most light-
  // theme messaging UIs), the transparent footer picked up the host
  // background. A light-theme share-card with white-text wordmark on a
  // transparent footer rendered as white-on-white in Yoshi's X tweet
  // preview — wordmark invisible. Filling the whole canvas with a
  // solid theme bg guarantees the share-card is self-contained and
  // displays identically across every messaging surface.
  const theme: WatermarkTheme = detectThemeForExport();
  const themeBg = theme === "light" ? "#fafaf7" : "#0a0a0a";
  ctx.fillStyle = themeBg;
  ctx.fillRect(0, 0, W, H);

  // Body region — overlay the modal's actual surface color on top of
  // the theme bg. This handles the case where the modal surface
  // diverges from the parchment/dark bg (e.g., elevated card with a
  // slightly different tone); the captured modal lands on a matching
  // ground. The reader bg shows through above/below the modal where
  // there's no overlay.
  const bodyH = Math.round(H * BODY_PCT);
  const bodyRegion = { x: 0, y: 0, w: W, h: bodyH };

  const surfaceColor = readModalSurfaceColor(modalElement);
  ctx.fillStyle = surfaceColor;
  ctx.fillRect(bodyRegion.x, bodyRegion.y, bodyRegion.w, bodyRegion.h);

  // S170 walk-3 fix: scale-to-fit-HEIGHT (preserving aspect), accept
  // small left/right margin. The previous contain-fit prioritized
  // width-fit when the capture was wider than the body region; in
  // practice the captured modal is portrait-ish after the 720px width
  // force, so fit-by-height fills the vertical space nearly fully and
  // only loses small horizontal margins. Trades unused dead-space
  // above/below for cleaner vertical fill.
  const availW = bodyRegion.w - BODY_INNER_PAD_PX * 2;
  const availH = bodyRegion.h - BODY_INNER_PAD_PX * 2;
  const captureAspect = modalCanvas.width / modalCanvas.height;
  let drawH = availH;
  let drawW = availH * captureAspect;
  if (drawW > availW) {
    // Capture aspect is wider than the body region; fall back to
    // width-fit so the capture doesn't overflow horizontally.
    drawW = availW;
    drawH = availW / captureAspect;
  }
  const drawX = bodyRegion.x + (bodyRegion.w - drawW) / 2;
  const drawY = bodyRegion.y + (bodyRegion.h - drawH) / 2;
  ctx.drawImage(modalCanvas, drawX, drawY, drawW, drawH);

  // Footer 20% — shared watermark per §170. S170 walk-1 fix: theme
  // must match the body region. The reader theme toggle sets
  // `document.documentElement.dataset.theme = 'light' | 'dark'`; we
  // mirror that here so a light-theme partner gets dark wordmark on
  // parchment and dark-theme partner gets white wordmark on
  // near-black.
  //
  // S171 §17: xref shares swap the watermark URL CTA from the bare
  // brand domain to the anchor-verse permalink so the share carries a
  // doorway URL pointing back at the specific verse it cites. Word-
  // study shares (§30) keep the default brand-domain URL.
  const brandMark = await preloadFooterBrandMark();
  const urlOverride =
    meta.kind === "xref"
      ? buildAnchorPermalink(meta.bookSlug, meta.chapterNumber, meta.verseNumber)
      : undefined;
  await paintWatermarkFooter(ctx, W, H, { brandMark, theme, urlOverride });

  return canvas;
}

/**
 * Detect the export theme. Reads
 * `document.documentElement.dataset.theme`, which the §144 reader
 * theme toggle sets to "light" or "dark". Defaults to "dark" when
 * absent so SSR / pre-toggle contexts get the original §1 register.
 */
function detectThemeForExport(): WatermarkTheme {
  if (typeof document === "undefined") return "dark";
  const t = document.documentElement.dataset.theme;
  return t === "light" ? "light" : "dark";
}

/**
 * Read the modal's computed background color so the body-region fill
 * matches the source surface. Walks up the DOM until a non-transparent
 * background is found; falls back to the §1 reader-surface hex if no
 * ancestor has an explicit color (e.g., portaled modal w/ inherited
 * styles).
 */
function readModalSurfaceColor(el: HTMLElement): string {
  let cursor: HTMLElement | null = el;
  while (cursor) {
    const cs = window.getComputedStyle(cursor);
    const bg = cs.backgroundColor;
    if (
      bg &&
      bg !== "rgba(0, 0, 0, 0)" &&
      bg !== "transparent" &&
      !bg.endsWith(", 0)") // any zero-alpha rgba()
    ) {
      return bg;
    }
    cursor = cursor.parentElement;
  }
  // §1 default-theme reader-surface (dark).
  return "#0a0a0a";
}

// ─────────────────────────────────────────────────────────────────────
// Export helpers — canvas → File
// ─────────────────────────────────────────────────────────────────────

export function studyCardToBlob(canvas: HTMLCanvasElement): Promise<Blob> {
  return new Promise((resolve, reject) => {
    canvas.toBlob((blob) => {
      if (blob) resolve(blob);
      else
        reject(new Error("study-share-render: canvas.toBlob returned null"));
    }, "image/png");
  });
}

export async function studyCardToFile(
  canvas: HTMLCanvasElement,
  filename: string
): Promise<File> {
  const blob = await studyCardToBlob(canvas);
  return new File([blob], filename, { type: "image/png" });
}

// ─────────────────────────────────────────────────────────────────────
// Transport pipeline — high-level entry point for the Share button.
// ─────────────────────────────────────────────────────────────────────

/**
 * Render + share a study card. Transports tried in priority order
 * per §30:
 *
 *   1. navigator.share({ files: [file] })       — OS share sheet
 *   2. navigator.clipboard.write(ClipboardItem) — image clipboard
 *   3. <a download> blob URL                    — manual fallback
 *
 * AbortError from the share sheet is treated as a normal flow exit.
 */
export async function executeStudyShare(
  modalElement: HTMLElement,
  meta: StudyShareMeta
): Promise<StudyTransportResult> {
  const filename = buildStudyShareFilename(meta);

  let canvas: HTMLCanvasElement;
  try {
    canvas = await renderStudyShareCard(modalElement, meta);
  } catch (err) {
    return {
      ok: false,
      error: `render failed: ${(err as Error)?.message ?? String(err)}`,
    };
  }

  // Path 1 — navigator.share with files.
  if (
    typeof navigator !== "undefined" &&
    typeof navigator.share === "function"
  ) {
    try {
      const file = await studyCardToFile(canvas, filename);
      const canShareFiles =
        typeof navigator.canShare === "function"
          ? navigator.canShare({ files: [file] })
          : true;
      if (canShareFiles) {
        await navigator.share({ files: [file] });
        return { ok: true, transport: "share" };
      }
    } catch (err) {
      const name = (err as Error)?.name;
      if (name === "AbortError") {
        return { ok: false, aborted: true };
      }
      // Fall through to clipboard.
    }
  }

  // Path 2 — clipboard image.
  const hasClipboardWrite =
    typeof navigator !== "undefined" &&
    !!navigator.clipboard &&
    typeof (navigator.clipboard as unknown as { write?: unknown }).write ===
      "function" &&
    typeof (globalThis as unknown as { ClipboardItem?: unknown })
      .ClipboardItem !== "undefined";
  if (hasClipboardWrite) {
    try {
      const blob = await studyCardToBlob(canvas);
      const CtorRef = (globalThis as unknown as {
        ClipboardItem: new (items: Record<string, Blob>) => unknown;
      }).ClipboardItem;
      const item = new CtorRef({ "image/png": blob });
      await (
        navigator.clipboard as unknown as {
          write: (items: unknown[]) => Promise<void>;
        }
      ).write([item]);
      return { ok: true, transport: "clipboard-image" };
    } catch {
      // Fall through to download.
    }
  }

  // Path 3 — <a download>.
  try {
    const url = canvas.toDataURL("image/png");
    const a = document.createElement("a");
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    return { ok: true, transport: "download" };
  } catch (err) {
    return {
      ok: false,
      error: `download failed: ${(err as Error)?.message ?? String(err)}`,
    };
  }
}
