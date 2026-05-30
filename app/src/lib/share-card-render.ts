/**
 * share-card-render.ts — Session 127, Wheel 7 of the pre-launch sweep.
 *
 * The shared render path for every watermark-bearing export from the
 * app: single-verse Share, single-verse Copy, multi-verse range Share,
 * multi-verse range Copy. Closes the §9 Free-tier "Share verse with
 * watermark" promise, promotes the §21 RangeActionPicker Copy/Share
 * items from Coming-soon to Live, and upgrades the §20 single-verse
 * Copy path from text-only-clipboard to canvas-PNG (with text-only
 * fallback).
 *
 * Pure functions + a canvas render entry point + a transport pipeline.
 * No React imports; no global state beyond the cached brand-mark Image
 * object loaded once at first use. Test-friendly per the post-S121
 * W2 / W3 / S122 / S123 / S125 forward standard — four pure helpers
 * (formatRangeHeader, computeBodyFontSize, buildShareFilename,
 * buildTextOnlyFallback) are deterministic and unit-testable; the
 * canvas render itself is visually verified at S127 ship time.
 *
 * Locked at DESIGN_LANGUAGE.md §24.
 *
 * ─── Three-zone layout (reserved-band rule is load-bearing) ──────────
 *
 * The card is composed as three vertically-stacked zones per §24:
 * header 9% / body 73% / footer 18%. The body-zone bottom boundary is
 * the SAME pixel line as the footer-band top — auto-fit shrinks verse
 * text into the body zone, and no collision between verse text and
 * brand-mark watermark is geometrically possible. The watermark
 * source asset is 240×360 native, but the canvas scales it
 * aspect-preserved into the footer band's available vertical space
 * (band height minus the 4% bottom pad). Scaling here is the right
 * call: the §24 zone percentages are the locked visual proportions,
 * and the source asset's native pixel dimensions are NOT a load-
 * bearing constraint — what matters is the brand-mark reads cleanly
 * at the rendered size, which the v4 Grok-rendered detail comfortably
 * supports.
 *
 * ─── Transport chain (locked S126, §24 "Export path") ───────────────
 *
 *   Share actions:  1. navigator.share({ files: [file] })
 *                   3. <a download> blob URL                    (fallback)
 *
 *   Copy actions:   1. navigator.share({ files: [file] })
 *                   2. navigator.clipboard.write(ClipboardItem) (image)
 *                   3a. clipboard.writeText(textFallback)       (text)
 *                       + <a download> for the PNG              (manual save)
 *                   3b. <a download>                            (bare fallback)
 *
 * AbortError from the share sheet (partner dismissed) is treated as a
 * normal flow exit, not a fallback trigger.
 */

import {
  FOOTER_PCT as WATERMARK_FOOTER_PCT,
  paintWatermarkFooter,
  preloadFooterBrandMark,
} from "./watermark-footer-render";
import { tryNativeShare } from "./capacitor-share";

// ─────────────────────────────────────────────────────────────────────
// Types
// ─────────────────────────────────────────────────────────────────────

/**
 * One rendered verse — verse number + body text. The canvas helper
 * renders the verse number as a small superscript before the body
 * text. The `text` field is the in-memory verse text from
 * ChapterDetail.verses[].text, which has correct spacing regardless of
 * how the tappable-span render produces visible output.
 */
export interface VerseRender {
  verseNumber: number;
  text: string;
}

/**
 * Range metadata — discriminated union across the four range types
 * locked in §24's reference-line format table. Drives both the
 * range-header (`formatRangeHeader`) AND the canonical filename
 * (`buildShareFilename`); a single source-of-truth so the two strings
 * never drift across the four range kinds.
 *
 *   - single        : Psalm 23:1
 *   - same-chapter  : Psalm 23:1–3            (EN DASH, U+2013)
 *   - cross-chapter : Genesis 50:26 → Exodus 1:1
 *   - cross-book    : Genesis 50:26 → Exodus 1:1
 *
 * Cross-chapter / cross-book are W7+ surfaces and only fire when the
 * range-selection helper resolves a captured range spanning chapter
 * or book boundaries. Same-chapter is the W7-ship Copy/Share target.
 */
export type RangeMeta =
  | {
      kind: "single";
      bookTitle: string;
      bookSlug: string;
      chapter: number;
      verse: number;
    }
  | {
      kind: "same-chapter";
      bookTitle: string;
      bookSlug: string;
      chapter: number;
      startVerse: number;
      endVerse: number;
    }
  | {
      kind: "cross-chapter";
      bookTitle: string;
      bookSlug: string;
      startChapter: number;
      startVerse: number;
      endChapter: number;
      endVerse: number;
    }
  | {
      kind: "cross-book";
      startBookTitle: string;
      startBookSlug: string;
      startChapter: number;
      startVerse: number;
      endBookTitle: string;
      endBookSlug: string;
      endChapter: number;
      endVerse: number;
    };

export interface RenderShareCardOpts {
  width?: number;
  height?: number;
  /** Inject a pre-loaded brand-mark Image (used by tests and by the
   *  consumer that wants to preload-then-render in two phases). When
   *  omitted, the helper lazily loads the bundled v4 asset once. */
  brandMark?: HTMLImageElement | null;
}

/** Result of a transport pipeline invocation. AbortError from the
 *  share sheet is encoded as `aborted: true` rather than an error
 *  (partner dismissed the picker — not a failure). */
export type TransportResult =
  | {
      ok: true;
      transport: "share" | "clipboard-image" | "clipboard-text" | "download";
    }
  | { ok: false; aborted: true }
  | { ok: false; error: string };

export interface SharePipelineInput {
  verses: VerseRender[];
  meta: RangeMeta;
}

// ─────────────────────────────────────────────────────────────────────
// Constants — locked per DESIGN_LANGUAGE.md §24
// ─────────────────────────────────────────────────────────────────────

/** 1080 × 1350 PNG-24 (IG portrait, 4:5 aspect). Locked at §24. */
export const CARD_WIDTH = 1080;
export const CARD_HEIGHT = 1350;

/** Header band: 9% of card height per §24. */
const HEADER_PCT = 0.09;
/** Footer band: 20% of card height per §30 watermark spec (bumped
 *  from §24's original 18% — S170 back-edit per Yoshi's wife's redline
 *  that the watermark crushed below legibility in iMessage thumbnails).
 *  Sourced from the shared `watermark-footer-render` constant so §24
 *  and §30 cannot drift. */
const FOOTER_PCT = WATERMARK_FOOTER_PCT;

/** 4% outer padding from each card edge for the header chrome and
 *  body zone. The footer watermark owns its own inset math via the
 *  shared `paintWatermarkFooter` helper. */
const SIDE_PAD_PCT = 0.04;

/** Auto-fit body-font search range. Max calibrated against single short
 *  verses (e.g., Psalm 23:1); min is the §24 readable-floor (14px at
 *  1080 width). Below the floor, the W7 caller is expected to surface
 *  the multi-card warning modal (out of helper scope at V1). */
const MAX_BODY_FONT = 72;
const MIN_BODY_FONT = 14;

/** §24 — line-height 1.42 for comfortable wrapping at the wider card
 *  width (vs the narrower reader column). */
const BODY_LINE_HEIGHT = 1.42;

/** Approximate average glyph-width-to-font-size ratio for a serif body
 *  (Iowan Old Style / Palatino / Georgia fall in this range at the
 *  card's rendered sizes). Used by computeBodyFontSize for a pure,
 *  deterministic auto-fit estimate that does NOT need a canvas — the
 *  helper stays node-testable. The constant is conservative (slight
 *  over-estimate of width) so the auto-fit picks a font that's a hair
 *  smaller than the absolute max, leaving a small visual breathing
 *  margin in the body zone. */
const AVG_GLYPH_RATIO = 0.55;

/** Verse-number overhead per verse — the superscript number occupies
 *  a small inline footprint before the verse body. Adds ~3 character
 *  widths to each verse's effective character count for wrap math. */
const VERSE_NUM_OVERHEAD_CHARS = 3;

/** §24 footer reference-line format separator. */
const EN_DASH = "–";
/** §24 cross-chapter / cross-book reference-line format separator. */
const ARROW = " → ";

// §3 / §5 sacred-color register hex.
const TECHELET = "#1A6FE5";
const SPECTRAL_BLUE = "#0084FF";
const CHROME_MUTED = "#A8A8A8";

// Suppress unused-warnings until sacred-name segmentation is wired
// (deferred per the §24 sacred-name-outline implementation note —
// the renderer accepts the segments-aware extension without breaking
// the V1 plain-text path).
void TECHELET;

// ─────────────────────────────────────────────────────────────────────
// 1. formatRangeHeader — pure helper, node-testable.
// ─────────────────────────────────────────────────────────────────────

/**
 * Format a RangeMeta into the §24 reference-line string. Pure function;
 * one switch over the discriminator. Cross-chapter SAME-book renders
 * the book title once (e.g., "Genesis 50:26 → 51:1"-style) per the
 * format table's "Cross-chapter range" example — but the spec example
 * actually uses cross-book wording for both cases ("Genesis 50:26 →
 * Exodus 1:1"). We split: cross-chapter same-book renders one book
 * title for cleaner reading; cross-book renders both.
 */
export function formatRangeHeader(meta: RangeMeta): string {
  switch (meta.kind) {
    case "single":
      return `${meta.bookTitle} ${meta.chapter}:${meta.verse}`;
    case "same-chapter":
      return `${meta.bookTitle} ${meta.chapter}:${meta.startVerse}${EN_DASH}${meta.endVerse}`;
    case "cross-chapter":
      return `${meta.bookTitle} ${meta.startChapter}:${meta.startVerse}${ARROW}${meta.endChapter}:${meta.endVerse}`;
    case "cross-book":
      return `${meta.startBookTitle} ${meta.startChapter}:${meta.startVerse}${ARROW}${meta.endBookTitle} ${meta.endChapter}:${meta.endVerse}`;
  }
}

// ─────────────────────────────────────────────────────────────────────
// 2. computeBodyFontSize — pure helper, node-testable.
// ─────────────────────────────────────────────────────────────────────

/**
 * Iterate downward from MAX_BODY_FONT and return the first integer
 * pixel size at which the rendered verse text fits within the body
 * zone given verse count, total character length, and line-height.
 * Floor: MIN_BODY_FONT. Below the floor, the W7 caller surfaces the
 * multi-card warning per §24's range-handling sub-section; this
 * helper returns MIN_BODY_FONT (the floor) so the partner-facing
 * card still renders if they pick the "accept smaller text" option.
 *
 * Pure / deterministic: same inputs → same output regardless of host
 * (browser or node). Uses AVG_GLYPH_RATIO + BODY_LINE_HEIGHT
 * calibration constants rather than measuring against a real canvas,
 * so it stays testable without a canvas mock.
 *
 * Empty `verses` returns the floor as a guard against degenerate
 * input — the partner can't reach this in normal use because the W7
 * callers always pass at least one verse, but the helper stays
 * defensive.
 */
export function computeBodyFontSize(
  verses: VerseRender[],
  zoneHeight: number,
  zoneWidth: number
): number {
  if (verses.length === 0) return MIN_BODY_FONT;
  if (zoneHeight <= 0 || zoneWidth <= 0) return MIN_BODY_FONT;
  for (let font = MAX_BODY_FONT; font >= MIN_BODY_FONT; font--) {
    if (fitsAt(verses, font, zoneHeight, zoneWidth)) return font;
  }
  return MIN_BODY_FONT;
}

function fitsAt(
  verses: VerseRender[],
  fontSize: number,
  zoneHeight: number,
  zoneWidth: number
): boolean {
  const charsPerLine = Math.max(
    1,
    Math.floor(zoneWidth / (fontSize * AVG_GLYPH_RATIO))
  );
  const lineHeightPx = fontSize * BODY_LINE_HEIGHT;
  let totalLines = 0;
  for (const v of verses) {
    const effChars = v.text.length + VERSE_NUM_OVERHEAD_CHARS;
    totalLines += Math.max(1, Math.ceil(effChars / charsPerLine));
  }
  // Inter-verse gap: one blank line per inter-verse boundary
  // (§24 — "a single line-height gap separates each verse from the next").
  totalLines += Math.max(0, verses.length - 1);
  return totalLines * lineHeightPx <= zoneHeight;
}

// ─────────────────────────────────────────────────────────────────────
// 3. buildShareFilename — pure helper, node-testable.
// ─────────────────────────────────────────────────────────────────────

/**
 * Canonical filename per §24 "Accessibility — Filename pattern":
 *
 *   single             : remnant-of-promise-{book-slug}-{chapter}-{verse}.png
 *   same-chapter range : remnant-of-promise-{book-slug}-{chapter}-{start}-{end}.png
 *   cross-chapter range: remnant-of-promise-{book-slug}-{chapter₁}-{verse₁}--{book-slug}-{chapter₂}-{verse₂}.png
 *   cross-book range   : remnant-of-promise-{book-slug₁}-{chapter₁}-{verse₁}--{book-slug₂}-{chapter₂}-{verse₂}.png
 *
 * The cross-chapter same-book form repeats the slug on both sides of
 * the double-dash separator — consistent with the cross-book pattern
 * (§24 lumps them under one filename template), even though the
 * repetition looks slightly redundant for same-book ranges.
 */
export function buildShareFilename(meta: RangeMeta): string {
  const base = "remnant-of-promise";
  switch (meta.kind) {
    case "single":
      return `${base}-${meta.bookSlug}-${meta.chapter}-${meta.verse}.png`;
    case "same-chapter":
      return `${base}-${meta.bookSlug}-${meta.chapter}-${meta.startVerse}-${meta.endVerse}.png`;
    case "cross-chapter":
      return `${base}-${meta.bookSlug}-${meta.startChapter}-${meta.startVerse}--${meta.bookSlug}-${meta.endChapter}-${meta.endVerse}.png`;
    case "cross-book":
      return `${base}-${meta.startBookSlug}-${meta.startChapter}-${meta.startVerse}--${meta.endBookSlug}-${meta.endChapter}-${meta.endVerse}.png`;
  }
}

// ─────────────────────────────────────────────────────────────────────
// 4. buildTextOnlyFallback — pure helper, node-testable.
// ─────────────────────────────────────────────────────────────────────

/**
 * Plain-text fallback for the Copy path when image clipboard write
 * rejects (browser supports clipboard.write but the OS clipboard
 * rejects PNG — observed on some Linux desktop environments). The
 * partner gets the verse text + the attribution line; the PNG is
 * offered as a manual download via the transport-3 fallback so the
 * partner can attach it separately if they want the visual card.
 *
 * Format per §24:
 *
 *   {verse text}
 *   {verse text}
 *   …
 *
 *   — {range-header} · The Remnant of Promise Official Study Bible
 *
 * The trailing attribution line uses the FULL product name (not the
 * footer's "ROP" abbreviation) because plain-text contexts have no
 * width constraint — partners pasting into a Twitter / iMessage /
 * email surface get the brand-recognizable string in full.
 */
export function buildTextOnlyFallback(
  verses: VerseRender[],
  rangeHeader: string
): string {
  const body = verses.map((v) => v.text.trim()).join("\n");
  return `${body}\n\n— ${rangeHeader} · The Remnant of Promise Official Study Bible`;
}

// ─────────────────────────────────────────────────────────────────────
// Brand-mark lazy loader — delegated to the shared watermark helper.
// S170 back-edit: the local singleton was deleted when §24 migrated to
// `paintWatermarkFooter` (shared helper). The named export is preserved
// as a thin alias so existing call sites (e.g., App.tsx's app-init
// preload effect) continue to work without modification.
// ─────────────────────────────────────────────────────────────────────

export const preloadBrandMark = preloadFooterBrandMark;

// ─────────────────────────────────────────────────────────────────────
// renderShareCard — the canvas entry point.
// ─────────────────────────────────────────────────────────────────────

/**
 * Compose the share card and return the canvas. Three zones rendered
 * top-to-bottom: header band (chrome brand tag + scope label), body
 * zone (verse text, auto-fit), footer band (reference line left +
 * brand-mark right, with hairline divider at the band's top edge).
 *
 * Reserved-band rule: body-zone bottom = watermark top, so verse text
 * never overlaps the brand-mark regardless of range length. This is
 * the load-bearing geometric invariant locked at S126.
 *
 * Returns the rendered canvas (not yet exported to blob/file). The
 * caller chooses the transport via shareCardToBlob / shareCardToFile
 * + the navigator.share / clipboard.write / a-download chain. The
 * canvas-render call and the transport call are split so the caller
 * can re-use the canvas across multiple transports if it falls back
 * through several.
 */
export async function renderShareCard(
  verses: VerseRender[],
  rangeHeader: string,
  opts: RenderShareCardOpts = {}
): Promise<HTMLCanvasElement> {
  const W = opts.width ?? CARD_WIDTH;
  const H = opts.height ?? CARD_HEIGHT;
  const brandMark =
    opts.brandMark !== undefined
      ? opts.brandMark
      : await preloadFooterBrandMark();

  const canvas = document.createElement("canvas");
  canvas.width = W;
  canvas.height = H;
  const ctx = canvas.getContext("2d");
  if (!ctx) {
    throw new Error("share-card-render: 2D canvas context unavailable");
  }

  // ── 1. Background (§1 default theme) ──────────────────────────────
  ctx.fillStyle = "#000";
  ctx.fillRect(0, 0, W, H);

  // ── 2. Zone geometry ──────────────────────────────────────────────
  // S170 back-edit per §30 watermark spec — footer band is now 20%
  // (was 18%). Body zone shrinks from 73% to 71%. Header stays 9%.
  // The brand chrome that previously lived in the header band
  // (`REMNANT OF PROMISE` / `OFFICIAL STUDY BIBLE`) has migrated into
  // the new footer wordmark stack; the header now carries the verse
  // reference instead, giving the reference proper header prominence
  // and dropping the brand-text duplication.
  const sidePadX = W * SIDE_PAD_PCT;
  const headerTop = 0;
  const headerBottom = H * HEADER_PCT;
  const footerTop = H * (1 - FOOTER_PCT);
  const bodyTop = headerBottom;
  const bodyBottom = footerTop;
  const bodyHeight = bodyBottom - bodyTop;
  const zoneWidth = W - sidePadX * 2;

  // ── 3. Header band — verse reference, centered ────────────────────
  const headerMidY = headerTop + (headerBottom - headerTop) / 2;
  const headerFontSize = Math.max(18, Math.round(H * 0.022));
  ctx.fillStyle = CHROME_MUTED;
  ctx.font = `600 ${headerFontSize}px ui-sans-serif, system-ui, -apple-system, "Segoe UI", sans-serif`;
  ctx.textBaseline = "middle";
  ctx.textAlign = "center";
  ctx.fillText(rangeHeader, W / 2, headerMidY);

  // ── 4. Body zone — verse text, auto-fit ───────────────────────────
  const fontSize = computeBodyFontSize(verses, bodyHeight, zoneWidth);
  const lineHeightPx = fontSize * BODY_LINE_HEIGHT;
  // Small breathing room from the header-bottom edge into the body
  // text-baseline; partner reads the body, not a flush-with-the-band
  // typographic anomaly.
  let yCursor = bodyTop + lineHeightPx * 0.35;
  for (let i = 0; i < verses.length; i++) {
    yCursor = renderVerseToCanvas(
      ctx,
      verses[i],
      sidePadX,
      yCursor,
      zoneWidth,
      fontSize,
      lineHeightPx
    );
    if (i < verses.length - 1) yCursor += lineHeightPx;
  }

  // ── 5. Watermark footer — shared painter per §170 ────────────────
  // The 20% footer band (divider + brand-mark icon + wordmark stack)
  // is painted by the single canonical helper. §24 and §30 share this
  // call so the watermark composition cannot drift across the two
  // share surfaces.
  await paintWatermarkFooter(ctx, W, H, { brandMark, theme: "dark" });

  return canvas;
}

/**
 * Render one verse — superscript verse number followed by wrapped body
 * text. Returns the y-cursor position for the next paragraph's start.
 *
 * Verse number per §24: 55% of body font, sans-serif, spectral blue
 * `#0084FF`, opacity 0.85, baseline raised. The body text wraps
 * word-by-word at the zone-width edge.
 *
 * Sacred-name outline (techelet 4-direction render per §3) is NOT
 * applied at V1 ship — the renderer accepts plain VerseRender input
 * and renders all body text in white. Wiring per-word sacred-name
 * segmentation is a deferred upgrade that lands when the W7 callers
 * pass through verse-align output; the VerseRender type can be
 * extended with optional `segments` without changing this entry point.
 */
function renderVerseToCanvas(
  ctx: CanvasRenderingContext2D,
  verse: VerseRender,
  x: number,
  y: number,
  maxWidth: number,
  fontSize: number,
  lineHeight: number
): number {
  // Verse number — superscript, sans, spectral blue, raised baseline.
  const numFontSize = Math.max(10, Math.round(fontSize * 0.55));
  ctx.save();
  ctx.font = `400 ${numFontSize}px ui-sans-serif, system-ui, -apple-system, sans-serif`;
  ctx.fillStyle = SPECTRAL_BLUE;
  ctx.globalAlpha = 0.85;
  ctx.textBaseline = "top";
  ctx.textAlign = "left";
  const numText = String(verse.verseNumber);
  // Raised baseline: render the number slightly above the body line
  // top so it reads as a superscript before the body.
  const numY = y - fontSize * 0.08;
  ctx.fillText(numText, x, numY);
  const numWidth = ctx.measureText(numText).width;
  ctx.restore();

  // Verse body — word-wrap at zone-width.
  ctx.save();
  ctx.font = `400 ${fontSize}px "Iowan Old Style", "Palatino Linotype", Palatino, Georgia, serif`;
  ctx.fillStyle = "#ffffff";
  ctx.textBaseline = "top";
  ctx.textAlign = "left";
  const numGap = Math.max(8, fontSize * 0.3);
  let curX = x + numWidth + numGap;
  let curY = y;
  const spaceWidth = ctx.measureText(" ").width;
  const words = verse.text.split(/\s+/).filter(Boolean);
  for (const word of words) {
    const wordWidth = ctx.measureText(word).width;
    // Wrap if this word would overflow the zone — but never wrap on
    // the very first word of the verse (it always starts inline after
    // the verse number, even if it's super-long; the auto-fit will
    // have shrunk the font to make this fit at the floor).
    if (curX !== x && curX + wordWidth > x + maxWidth) {
      curY += lineHeight;
      curX = x;
    }
    ctx.fillText(word, curX, curY);
    curX += wordWidth + spaceWidth;
  }
  ctx.restore();
  return curY + lineHeight;
}

// ─────────────────────────────────────────────────────────────────────
// Export helpers — canvas → Blob / File
// ─────────────────────────────────────────────────────────────────────

export function shareCardToBlob(canvas: HTMLCanvasElement): Promise<Blob> {
  return new Promise((resolve, reject) => {
    canvas.toBlob((blob) => {
      if (blob) resolve(blob);
      else reject(new Error("share-card-render: canvas.toBlob returned null"));
    }, "image/png");
  });
}

export async function shareCardToFile(
  canvas: HTMLCanvasElement,
  filename: string
): Promise<File> {
  const blob = await shareCardToBlob(canvas);
  return new File([blob], filename, { type: "image/png" });
}

// ─────────────────────────────────────────────────────────────────────
// Transport pipelines — high-level entry points for the W7 consumers.
// ─────────────────────────────────────────────────────────────────────

/**
 * Render + share a card. Transports tried in priority order per §24:
 *
 *   1. navigator.share({ files: [file] })  — OS share sheet
 *   3. <a download> blob URL                — fallback
 *
 * AbortError (partner dismissed the share sheet) is treated as a
 * normal flow exit, not a fallback trigger — the partner closed the
 * picker deliberately, downloading the file would be unwelcome.
 */
export async function executeShare(
  input: SharePipelineInput
): Promise<TransportResult> {
  const rangeHeader = formatRangeHeader(input.meta);
  const filename = buildShareFilename(input.meta);

  let canvas: HTMLCanvasElement;
  try {
    canvas = await renderShareCard(input.verses, rangeHeader);
  } catch (err) {
    return {
      ok: false,
      error: `render failed: ${(err as Error)?.message ?? String(err)}`,
    };
  }

  // S173 — Path 0: Capacitor-native share. Fires only when the bundle
  // is running inside the iOS/Android shell; web/PWA returns
  // {handled:false} and falls through to path 1. On native, writes the
  // PNG to the platform CACHE dir and invokes @capacitor/share with a
  // real file URI (the iOS Action Extension / Android intent picker
  // need a file URI, not a Blob).
  const nativeText = buildTextOnlyFallback(input.verses, rangeHeader);
  const nativeUrl = `https://bible.remnantofpromise.org`;
  try {
    const native = await tryNativeShare({
      canvas,
      filename,
      text: nativeText,
      url: nativeUrl,
    });
    if (native.handled) {
      if (native.aborted) return { ok: false, aborted: true };
      if (native.ok) return { ok: true, transport: "share" };
      // native handled but failed (filesystem write error etc.) — fall
      // through to the web chain so we still ship something useful.
    }
  } catch {
    // Dynamic import or unexpected throw — fall through.
  }

  // Path 1: navigator.share with files.
  if (typeof navigator !== "undefined" && typeof navigator.share === "function") {
    try {
      const file = await shareCardToFile(canvas, filename);
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
      // Otherwise: fall through to download fallback.
    }
  }

  // Path 3 (Share skips path 2 per §24): <a download>.
  return executeDownload(canvas, filename);
}

/**
 * Render + copy a card. Transports tried in priority order per §24:
 *
 *   1. navigator.share({ files: [file] })
 *   2. navigator.clipboard.write(ClipboardItem image/png)
 *   3a. clipboard.writeText(textFallback) + <a download> for the PNG
 *   3b. <a download> (bare)
 *
 * The text-only fallback fires when clipboard.write rejects PNG; the
 * partner gets the verse text on the clipboard + the PNG offered as a
 * manual download.
 */
export async function executeCopy(
  input: SharePipelineInput
): Promise<TransportResult> {
  const rangeHeader = formatRangeHeader(input.meta);
  const filename = buildShareFilename(input.meta);
  const textFallback = buildTextOnlyFallback(input.verses, rangeHeader);

  let canvas: HTMLCanvasElement;
  try {
    canvas = await renderShareCard(input.verses, rangeHeader);
  } catch (err) {
    // Canvas itself unavailable — drop straight to text-only clipboard.
    if (
      typeof navigator !== "undefined" &&
      navigator.clipboard &&
      typeof navigator.clipboard.writeText === "function"
    ) {
      try {
        await navigator.clipboard.writeText(textFallback);
        return { ok: true, transport: "clipboard-text" };
      } catch {
        /* fall through */
      }
    }
    return {
      ok: false,
      error: `render failed: ${(err as Error)?.message ?? String(err)}`,
    };
  }

  // S173 — Path 0: Capacitor-native share. On native, writes the PNG
  // to the platform CACHE dir and invokes @capacitor/share. No-op on
  // web — falls straight through to path 1.
  try {
    const native = await tryNativeShare({
      canvas,
      filename,
      text: textFallback,
      url: `https://bible.remnantofpromise.org`,
    });
    if (native.handled) {
      if (native.aborted) return { ok: false, aborted: true };
      if (native.ok) return { ok: true, transport: "share" };
      // native handled but failed — fall through.
    }
  } catch {
    // Dynamic import or unexpected throw — fall through.
  }

  // Path 1: navigator.share with files.
  if (typeof navigator !== "undefined" && typeof navigator.share === "function") {
    try {
      const file = await shareCardToFile(canvas, filename);
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
      // Otherwise: fall through to clipboard.
    }
  }

  // Path 2: clipboard.write image (ClipboardItem image/png).
  const hasClipboardWrite =
    typeof navigator !== "undefined" &&
    !!navigator.clipboard &&
    typeof (navigator.clipboard as unknown as { write?: unknown }).write ===
      "function" &&
    typeof (globalThis as unknown as { ClipboardItem?: unknown })
      .ClipboardItem !== "undefined";
  if (hasClipboardWrite) {
    try {
      const blob = await shareCardToBlob(canvas);
      const CtorRef = (globalThis as unknown as {
        ClipboardItem: new (items: Record<string, Blob>) => unknown;
      }).ClipboardItem;
      const item = new CtorRef({ "image/png": blob });
      await (
        navigator.clipboard as unknown as { write: (items: unknown[]) => Promise<void> }
      ).write([item]);
      return { ok: true, transport: "clipboard-image" };
    } catch {
      // Fall through to text-only fallback.
    }
  }

  // Path 3a: text-only clipboard + manual-download offer.
  if (
    typeof navigator !== "undefined" &&
    navigator.clipboard &&
    typeof navigator.clipboard.writeText === "function"
  ) {
    try {
      await navigator.clipboard.writeText(textFallback);
      // Best-effort: offer the PNG as a manual download. If the
      // download fails (rare — toDataURL works in any browser that
      // can render to canvas), we still return success on the text
      // path — partner has the text on their clipboard.
      void executeDownload(canvas, filename);
      return { ok: true, transport: "clipboard-text" };
    } catch {
      /* fall through */
    }
  }

  // Path 3b: bare download fallback.
  return executeDownload(canvas, filename);
}

/**
 * Trigger a synthesized <a download> click. Used by both executeShare
 * (path 3 fallback) and executeCopy (path 3b fallback + path 3a's
 * manual-download offer alongside the text-only clipboard write).
 */
function executeDownload(
  canvas: HTMLCanvasElement,
  filename: string
): TransportResult {
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
