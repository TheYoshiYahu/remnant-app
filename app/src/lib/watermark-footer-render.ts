/**
 * watermark-footer-render.ts — Session 170, the shared 20% watermark
 * footer painter for §24 verse-share AND §30 study-share. Locked at
 * DESIGN_LANGUAGE.md §30 Watermark band specs (with the §24 back-edit
 * applied so verse-share and word-study-share carry consistent branding
 * scale).
 *
 * Single source of truth for the watermark composition. Both §24's
 * `share-card-render.ts` and §30's `study-share-render.ts` import
 * `paintWatermarkFooter` and call it with the canvas context + total
 * card dimensions. Footer math, hairline divider, brand-mark icon, and
 * wordmark stack typography all live here.
 *
 * ─── Spec recap (locked S169, applied at S170) ──────────────────────
 *
 *   • Footer band height        : 20% of total card height
 *   • Hairline divider          : 1px rgba(255,255,255,0.12) (dark) /
 *                                 rgba(0,0,0,0.12) (light), 6% inset
 *   • Brand-mark icon           : 120 × 120 px, 5% left inset,
 *                                 vertically centered in band.
 *                                 Auto-cropped (centered square) from
 *                                 the bundled 832×1248 v4 full mark —
 *                                 §170 decision: no separate 200×200
 *                                 asset file; the crop is computed at
 *                                 paint time so a future asset swap
 *                                 (drop the curated 200×200 in
 *                                 brand-assets/) requires zero code
 *                                 change beyond changing the import.
 *   • Wordmark stack (centered) : Three Lora lines, vertically centered
 *                                 in band:
 *                                   Line 1: "Remnant of Promise"
 *                                            36pt Lora 600
 *                                   Line 2: "Official Study Bible"
 *                                            24pt Lora 400 italic
 *                                   Line 3: "bible.remnantofpromise.org"
 *                                            22pt Lora 500, techelet
 *
 * Absolute pixel sizes (icon 120×120, fonts 36/24/22pt) are CONSTANT
 * across §24's 1080×1350 and §30's 1080×1920 cards. Brand reads
 * consistently at messaging-app thumbnail size regardless of source
 * surface — locked at S170 per Yoshi's wife's redline that
 * inconsistent watermark scale fractures brand recognition.
 *
 * ─── Pure-helper carve-out ──────────────────────────────────────────
 *
 * `computeFooterGeometry` is pure and node-testable — given total
 * card dimensions, returns the band rect, divider rect, icon rect,
 * and wordmark text positions. The canvas paint helper itself is
 * verified by live walk per the post-S121 W2/W3 forward standard.
 */

// We import the existing 832×1248 v4 full mark as the icon source.
// §170 decision (Yoshi): auto-crop is the permanent solution; no
// separate 200×200 curated asset will be produced. The full-mark
// import keeps render quality high (7× upsample headroom from the
// 832-tall source down to the 120-tall rendered icon).
import brandMarkFullUrl from "../../../brand-assets/brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png";

// ─────────────────────────────────────────────────────────────────────
// Constants — locked per DESIGN_LANGUAGE.md §30 watermark band specs
// ─────────────────────────────────────────────────────────────────────

/** Footer band height as a fraction of total card height. */
export const FOOTER_PCT = 0.20;

/** Brand-mark icon rendered dimensions. */
const ICON_SIZE = 120;
/** Left inset for the icon, as a fraction of card width. */
const ICON_LEFT_INSET_PCT = 0.05;

/** Hairline divider horizontal inset, as a fraction of card width. */
const DIVIDER_INSET_PCT = 0.06;

/** Wordmark stack line specs. Lora is the framework's serif body font,
 *  matching the reader chrome and the lexicon-source typography. */
const WORDMARK_LINE_1_SIZE = 36;
const WORDMARK_LINE_2_SIZE = 24;
const WORDMARK_LINE_3_SIZE = 22;

/** Gap between wordmark stack lines (px). */
const WORDMARK_LINE_GAP = 6;

/** §1 techelet — the wordmark URL line color. The brand-mark icon
 *  already carries techelet as its dominant register; the URL line
 *  repeats it as the call-to-action color. */
const TECHELET = "#1A6FE5";

/** Source-image native dimensions for the v4 full mark — used to
 *  compute the centered-square auto-crop. */
const SRC_W = 832;
const SRC_H = 1248;

// ─────────────────────────────────────────────────────────────────────
// Theme typing
// ─────────────────────────────────────────────────────────────────────

export type WatermarkTheme = "dark" | "light";

interface ThemeColors {
  /** Wordmark line 1 (product name) color. */
  primary: string;
  /** Wordmark line 2 (subtitle) color. */
  muted: string;
  /** Hairline divider color. */
  divider: string;
}

function colorsFor(theme: WatermarkTheme): ThemeColors {
  if (theme === "light") {
    return {
      primary: "#1A1A1A",
      muted: "rgba(26,26,26,0.55)",
      divider: "rgba(0,0,0,0.12)",
    };
  }
  return {
    primary: "#FFFFFF",
    muted: "rgba(255,255,255,0.62)",
    divider: "rgba(255,255,255,0.12)",
  };
}

// ─────────────────────────────────────────────────────────────────────
// Pure geometry helper — node-testable per S170 sanity rig.
// ─────────────────────────────────────────────────────────────────────

export interface FooterGeometry {
  /** Footer band top y-coordinate. */
  bandTop: number;
  /** Footer band height. */
  bandHeight: number;
  /** Hairline divider — horizontal line at bandTop. */
  divider: { x1: number; x2: number; y: number };
  /** Brand-mark icon destination rect. */
  iconRect: { x: number; y: number; w: number; h: number };
  /** Brand-mark icon source rect (centered square crop from full
   *  832×1248 mark). */
  iconSrcRect: { sx: number; sy: number; sw: number; sh: number };
  /** Wordmark text block — center anchor point + per-line y offsets.
   *  Text rendered at this x with textAlign="center" lands centered
   *  on the band. */
  wordmark: {
    centerX: number;
    line1Y: number;
    line2Y: number;
    line3Y: number;
  };
}

/**
 * Compute the footer band geometry for a card of the given total
 * dimensions. Pure function — no canvas, no Image, no DOM. Drives
 * both the paint helper AND the S170 sanity test rig.
 *
 * Brand-mark source crop is a centered square pulled from the
 * 832×1248 full v4 mark: source rect (0, 208, 832, 832). This
 * captures the central composition of the brand mark — olive
 * branches + menorah body — and skips the top/bottom margins that
 * the curated 240×360 watermark crop already discards in its
 * existing form.
 */
export function computeFooterGeometry(W: number, H: number): FooterGeometry {
  const bandHeight = H * FOOTER_PCT;
  const bandTop = H - bandHeight;
  const bandMidY = bandTop + bandHeight / 2;

  // Divider — 6% inset, sits exactly on the band-top line.
  const dividerInset = W * DIVIDER_INSET_PCT;
  const divider = {
    x1: dividerInset,
    x2: W - dividerInset,
    y: bandTop,
  };

  // Icon — 120×120, 5% left inset, vertically centered.
  const iconX = W * ICON_LEFT_INSET_PCT;
  const iconY = bandMidY - ICON_SIZE / 2;
  const iconRect = {
    x: iconX,
    y: iconY,
    w: ICON_SIZE,
    h: ICON_SIZE,
  };

  // Centered square crop from the 832×1248 full mark. The mark is
  // taller than wide; we keep the full width and crop top/bottom
  // equally to land on an 832×832 source square.
  const sCropTop = (SRC_H - SRC_W) / 2; // 208
  const iconSrcRect = {
    sx: 0,
    sy: sCropTop,
    sw: SRC_W,
    sh: SRC_W,
  };

  // Wordmark stack — three lines vertically centered in the band.
  // Total stack height = sum(line sizes) + 2 gaps. We compute the
  // baselines so the visual midline of the stack falls at bandMidY.
  const stackHeight =
    WORDMARK_LINE_1_SIZE +
    WORDMARK_LINE_GAP +
    WORDMARK_LINE_2_SIZE +
    WORDMARK_LINE_GAP +
    WORDMARK_LINE_3_SIZE;
  const stackTop = bandMidY - stackHeight / 2;
  const line1Y = stackTop + WORDMARK_LINE_1_SIZE; // baseline
  const line2Y = line1Y + WORDMARK_LINE_GAP + WORDMARK_LINE_2_SIZE;
  const line3Y = line2Y + WORDMARK_LINE_GAP + WORDMARK_LINE_3_SIZE;

  return {
    bandTop,
    bandHeight,
    divider,
    iconRect,
    iconSrcRect,
    wordmark: {
      centerX: W / 2,
      line1Y,
      line2Y,
      line3Y,
    },
  };
}

// ─────────────────────────────────────────────────────────────────────
// Brand-mark lazy loader — singleton, decoded once.
// ─────────────────────────────────────────────────────────────────────

let _brandMarkPromise: Promise<HTMLImageElement | null> | null = null;

/**
 * Load + decode the v4 full brand-mark asset. Singleton — subsequent
 * calls return the same Image. Returns null on failure; the painter
 * falls back to a text-only icon-slot (wordmark stack centered with
 * no icon) so the share is non-blocking on asset failure.
 */
export function preloadFooterBrandMark(): Promise<HTMLImageElement | null> {
  if (typeof window === "undefined" || typeof Image === "undefined") {
    return Promise.resolve(null);
  }
  if (_brandMarkPromise) return _brandMarkPromise;
  _brandMarkPromise = (async () => {
    try {
      const img = new Image();
      img.crossOrigin = "anonymous";
      img.src = brandMarkFullUrl;
      await img.decode();
      return img;
    } catch {
      _brandMarkPromise = null;
      return null;
    }
  })();
  return _brandMarkPromise;
}

// ─────────────────────────────────────────────────────────────────────
// Paint helper — the §170 single source of truth for the watermark.
// ─────────────────────────────────────────────────────────────────────

export interface PaintWatermarkOpts {
  /** Pre-loaded brand-mark Image (used by callers that want to
   *  preload-then-paint in two phases). When omitted, the helper
   *  awaits the lazy singleton load. */
  brandMark?: HTMLImageElement | null;
  /** Theme — "dark" (default) renders white wordmark on dark bg,
   *  "light" renders dark wordmark on light bg. Hairline divider
   *  flips opacity accordingly. */
  theme?: WatermarkTheme;
}

/**
 * Paint the 20% watermark footer onto an existing canvas context.
 * The caller is responsible for sizing the canvas (W, H) and painting
 * the upper 80% of the card before calling this helper.
 *
 * Composition (left to right):
 *
 *   ┌─────────────────────────────────────────────────────────────┐
 *   │ ──────  (hairline divider at top, 6% horizontal inset)      │
 *   │                                                             │
 *   │  [ICON]    Remnant of Promise           (36pt Lora 600)     │
 *   │  120×120   Official Study Bible         (24pt Lora 400 it.) │
 *   │            bible.remnantofpromise.org   (22pt Lora 500, blue)│
 *   │                                                             │
 *   └─────────────────────────────────────────────────────────────┘
 *
 * Icon falls back to no-icon (wordmark stack centered without left
 * icon) if the brand-mark Image is null — non-fatal asset failure.
 */
export async function paintWatermarkFooter(
  ctx: CanvasRenderingContext2D,
  W: number,
  H: number,
  opts: PaintWatermarkOpts = {}
): Promise<void> {
  const theme: WatermarkTheme = opts.theme ?? "dark";
  const colors = colorsFor(theme);
  const geom = computeFooterGeometry(W, H);
  const brandMark =
    opts.brandMark !== undefined ? opts.brandMark : await preloadFooterBrandMark();

  // 1. Hairline divider — 1px at band top, 6% horizontal inset.
  ctx.save();
  ctx.strokeStyle = colors.divider;
  ctx.lineWidth = 1;
  ctx.beginPath();
  ctx.moveTo(geom.divider.x1, geom.divider.y);
  ctx.lineTo(geom.divider.x2, geom.divider.y);
  ctx.stroke();
  ctx.restore();

  // 2. Brand-mark icon — centered square crop from the 832×1248
  //    full mark, drawn at 120×120 with 5% left inset.
  if (brandMark) {
    ctx.save();
    ctx.drawImage(
      brandMark,
      geom.iconSrcRect.sx,
      geom.iconSrcRect.sy,
      geom.iconSrcRect.sw,
      geom.iconSrcRect.sh,
      geom.iconRect.x,
      geom.iconRect.y,
      geom.iconRect.w,
      geom.iconRect.h
    );
    ctx.restore();
  }

  // 3. Wordmark stack — three Lora lines, centered horizontally.
  //    Line 1: 36pt Lora 600 white/black per theme.
  //    Line 2: 24pt Lora 400 italic muted.
  //    Line 3: 22pt Lora 500 techelet (#1A6FE5) — the CTA URL.
  ctx.save();
  ctx.textBaseline = "alphabetic";
  ctx.textAlign = "center";

  // Line 1 — product name.
  ctx.fillStyle = colors.primary;
  ctx.font = `600 ${WORDMARK_LINE_1_SIZE}px Lora, "Lora-Local", Georgia, "Times New Roman", serif`;
  ctx.fillText("Remnant of Promise", geom.wordmark.centerX, geom.wordmark.line1Y);

  // Line 2 — subtitle, italic, muted.
  ctx.fillStyle = colors.muted;
  ctx.font = `italic 400 ${WORDMARK_LINE_2_SIZE}px Lora, "Lora-Local", Georgia, "Times New Roman", serif`;
  ctx.fillText("Official Study Bible", geom.wordmark.centerX, geom.wordmark.line2Y);

  // Line 3 — URL CTA, techelet.
  ctx.fillStyle = TECHELET;
  ctx.font = `500 ${WORDMARK_LINE_3_SIZE}px Lora, "Lora-Local", Georgia, "Times New Roman", serif`;
  ctx.fillText(
    "bible.remnantofpromise.org",
    geom.wordmark.centerX,
    geom.wordmark.line3Y
  );

  ctx.restore();
}
