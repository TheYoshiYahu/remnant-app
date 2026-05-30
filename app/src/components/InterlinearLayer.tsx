/**
 * S168 — §28 Hebrew & Greek Interlinear render layer.
 *
 * Renders a single verse as a horizontal sequence of column-stack
 * units when the §28 toggle is ON for a Companion+ partner. Each
 * column has up to four rows above the English surface word:
 *
 *     ┌──────────────┐
 *     │   lemma      │   ← original script (SBL Hebrew / BibLit)
 *     │ translit.    │   ← romanized form
 *     │  morph short │   ← decoded morph tag (long-press swaps to expanded)
 *     │   gloss      │   ← single-phrase gloss from strong_entries
 *     │   surface    │   ← English word (the verse-text baseline)
 *     └──────────────┘
 *
 * Plain segments (parens, punctuation, supplied italics) render at the
 * baseline only — no column above. The whole row reads as a sentence
 * at the baseline; the interlinear stack lives above each Strong's-
 * tagged column.
 *
 * Per DESIGN_LANGUAGE.md §28:
 *  - Above-verse English-aligned column order (not native RTL/Greek order).
 *  - Hebrew lemma cell carries the Unicode FSI/PDI isolation already
 *    applied by `wrapHebrewBidi` inside buildInterlinearColumn — the
 *    within-cell rendering is RTL while the column flow stays LTR.
 *  - Morph register defaults to short; long-press on the morph row
 *    swaps to expanded for the duration of the press (hold-expand).
 *  - Surface word stays tappable + long-pressable as the existing §20
 *    word-tappable interaction — the InterlinearLayer is purely a
 *    render-shape change, no interaction-grammar change.
 *  - Verse-number superscript + bookmark glyph + S160 Strong's
 *    superscript still render alongside the surface word as before.
 *
 * Tier gate is upstream: this component is only mounted when the
 * partner is Companion+ AND the toggle is ON. Below-Companion partners
 * never reach this render path (the API also returns null for the four
 * interlinear fields below-tier; the component degrades to surface-
 * only columns if that happens).
 *
 * Performance: column-stack render is O(columns) per verse, same as
 * the inline segment render. Long-press handlers are attached per-
 * column with `useRef`-based timers; no re-render per pointer event.
 */

import { useRef, useState, type CSSProperties, type ReactNode } from "react";
import type { VerseWord } from "../lib/api";
import {
  buildInterlinearColumn,
  formatMorphology,
  selectInterlinearFontStack,
  wrapHebrewBidi,
  type InterlinearColumn,
  type InterlinearLanguage,
  type MorphologyRegister,
} from "../lib/interlinear-helpers";

// Long-press duration to swap morph short → expanded. Matches the
// §20 long-press detection (500ms) for muscle-memory continuity.
const LONG_PRESS_MS = 500;

export interface InterlinearWordHandlers {
  /** Quick-tap on a Strong's-tagged surface word — opens the §20
   *  StrongsLookup modal. Mirrors App.tsx handleWordQuickTap. */
  onWordTap: (
    word: { strong: string; surface: string },
    verseId: number,
  ) => void;
  /** Long-press / right-click on a verse — opens the §20 VerseActionMenu.
   *  Falls through to the surrounding verse handlers; this component
   *  does not own the action-menu state. */
  onWordPointerDown: (
    verseId: number,
    word: { strong: string; surface: string } | null,
  ) => void;
  onWordPointerCancel: () => void;
  onWordContextMenu: (
    verseId: number,
    e: React.MouseEvent,
    word: { strong: string; surface: string } | null,
  ) => void;
}

export interface InterlinearLayerProps {
  /** Verse id — passed to every handler. */
  verseId: number;
  /** Position-ordered VerseWord rows for this verse (server-extended
   *  S168 payload with morphology + lemma + transliteration +
   *  short_definition + language inlined). */
  verseWords: VerseWord[];
  /** §27 Strong's-superscript toggle — when ON, render the H/G number
   *  as a small sup after each surface word, same as the inline-render
   *  path. */
  showStrongsSuperscripts: boolean;
  /** Verse-tap / long-press handlers, passed through from App.tsx. */
  handlers: InterlinearWordHandlers;
  /** Optional leading content (verse-number sup, bookmark glyph) that
   *  precedes the first column at the baseline. Stays at the baseline
   *  alongside the surface words. */
  leadingBaseline?: ReactNode;
}

// CSS-variable container styles. Centralized so the column theming is
// one tweak away from the §3 register palette. The grid-like flex
// layout keeps columns inline-wrapping across the verse (long verses
// flow onto the next line at the column boundary, not mid-column).
const containerStyle: CSSProperties = {
  display: "inline",
};

const columnStyle: CSSProperties = {
  display: "inline-flex",
  flexDirection: "column",
  alignItems: "center",
  verticalAlign: "baseline",
  margin: "0 0.25rem 0.35rem 0.25rem",
  lineHeight: 1.15,
};

const cellMutedStyle: CSSProperties = {
  fontSize: "0.7rem",
  color: "var(--reader-muted)",
  maxWidth: "10rem",
  textAlign: "center",
  whiteSpace: "nowrap",
};

const cellLemmaStyle: CSSProperties = {
  fontSize: "1.05rem",
  color: "var(--reader-text)",
  maxWidth: "10rem",
  textAlign: "center",
  whiteSpace: "nowrap",
};

const cellTranslitStyle: CSSProperties = {
  ...cellMutedStyle,
  fontStyle: "italic",
};

const cellMorphStyle: CSSProperties = {
  ...cellMutedStyle,
  fontVariantCaps: "small-caps",
};

const cellGlossStyle: CSSProperties = {
  fontSize: "0.75rem",
  color: "var(--reader-muted)",
  maxWidth: "10rem",
  textAlign: "center",
  fontStyle: "italic",
};

const surfaceCellStyle: CSSProperties = {
  fontSize: "1rem",
  color: "var(--reader-text)",
  borderTop: "1px solid var(--reader-rule)",
  paddingTop: "0.1rem",
  marginTop: "0.15rem",
  textAlign: "center",
};

const strongsSupStyle: CSSProperties = {
  fontSize: "0.6rem",
  color: "#2EFFA1",
  marginLeft: "0.1rem",
  verticalAlign: "super",
  cursor: "pointer",
};

/**
 * One column of the interlinear stack. Encapsulates the long-press
 * morph-register swap so it doesn't bubble up to the App.tsx verse
 * action-menu handler (the morph cell's own pointerdown stops
 * propagation; tapping anywhere else in the column proxies to the
 * App-level word handlers per the existing §20 grammar).
 */
export function InterlinearColumnView(props: {
  column: InterlinearColumn;
  rawMorphology: string | null;
  language: InterlinearLanguage | null;
  strongNumber: string | null;
  verseId: number;
  showStrongsSuperscripts: boolean;
  handlers: InterlinearWordHandlers;
}): React.ReactElement {
  const {
    column,
    rawMorphology,
    language,
    strongNumber,
    verseId,
    showStrongsSuperscripts,
    handlers,
  } = props;
  const [morphRegister, setMorphRegister] =
    useState<MorphologyRegister>("short");
  const longPressTimerRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  const word = strongNumber
    ? { strong: strongNumber, surface: column.surface }
    : null;

  // Long-press on the MORPH ROW only swaps the register. Long-press
  // anywhere else (or on the surface row) flows through to the App's
  // verse action-menu handler. This split lets the partner long-press
  // the English word to open the §20 menu, OR long-press the morph
  // row to read the expanded form — two distinct intentions, two
  // distinct gesture targets.
  function morphPointerDown(e: React.PointerEvent) {
    e.stopPropagation();
    if (longPressTimerRef.current) {
      clearTimeout(longPressTimerRef.current);
    }
    longPressTimerRef.current = setTimeout(() => {
      setMorphRegister("expanded");
    }, LONG_PRESS_MS);
  }
  function morphPointerUp(e: React.PointerEvent) {
    e.stopPropagation();
    if (longPressTimerRef.current) {
      clearTimeout(longPressTimerRef.current);
      longPressTimerRef.current = null;
    }
    setMorphRegister("short");
  }

  const lemmaFontStack = column.fontStack;
  // Re-decode at render-time when the partner is holding the morph cell
  // (or use the cached short value). buildInterlinearColumn already
  // computed both registers; we just pick the right one here.
  const morphText = column.morphology
    ? morphRegister === "short"
      ? column.morphology.short
      : column.morphology.expanded
    : null;
  // Defensive fallback: if buildInterlinearColumn didn't see a morph
  // (no strong_entry joined), but the raw morphology + language exist
  // on the VerseWord, decode from raw. This branch shouldn't fire in
  // the Companion+ payload path but covers degraded inputs cleanly.
  const morphTextFallback =
    !morphText && rawMorphology
      ? formatMorphology(rawMorphology, language, morphRegister)
      : null;
  const morphDisplay = morphText || morphTextFallback;

  return (
    <span style={columnStyle} className="interlinear-column">
      {column.lemma && (
        <span
          style={{ ...cellLemmaStyle, fontFamily: lemmaFontStack }}
          lang={
            language === "greek"
              ? "el"
              : language === "aramaic"
                ? "arc"
                : language === "hebrew"
                  ? "he"
                  : undefined
          }
        >
          {column.lemma}
        </span>
      )}
      {column.transliteration && (
        <span style={cellTranslitStyle}>{column.transliteration}</span>
      )}
      {morphDisplay && (
        <span
          style={cellMorphStyle}
          onPointerDown={morphPointerDown}
          onPointerUp={morphPointerUp}
          onPointerCancel={morphPointerUp}
          onPointerLeave={morphPointerUp}
          aria-label={`Morphology: ${morphDisplay}. Long-press to expand.`}
          title="Long-press to expand the morphology code."
        >
          {morphDisplay}
        </span>
      )}
      {column.gloss && <span style={cellGlossStyle}>{column.gloss}</span>}
      <span
        style={surfaceCellStyle}
        className={word ? "word-tappable" : undefined}
        onPointerDown={(e) => {
          if (!word) return;
          e.stopPropagation();
          handlers.onWordPointerDown(verseId, word);
        }}
        onPointerUp={(e) => {
          if (!word) return;
          e.stopPropagation();
          handlers.onWordPointerCancel();
        }}
        onPointerCancel={() => handlers.onWordPointerCancel()}
        onPointerLeave={() => handlers.onWordPointerCancel()}
        onContextMenu={(e) => {
          if (!word) return;
          e.stopPropagation();
          handlers.onWordContextMenu(verseId, e, word);
        }}
        onClick={(e) => {
          if (!word) return;
          e.stopPropagation();
          handlers.onWordTap(word, verseId);
        }}
      >
        {column.surface}
        {showStrongsSuperscripts && strongNumber && (
          <sup
            style={strongsSupStyle}
            className="strongs-superscript"
            onClick={(e) => {
              if (!word) return;
              e.stopPropagation();
              handlers.onWordTap(word, verseId);
            }}
            aria-label={`Strong's ${strongNumber} — open lexicon entry`}
            title={`Strong's ${strongNumber} — tap to open the lexicon entry`}
          >
            {strongNumber}
          </sup>
        )}
      </span>
    </span>
  );
}

/**
 * Verse-scoped interlinear render. Maps each Strong's-tagged VerseWord
 * to a column-stack; un-tagged words (no strong_number) still render
 * as a surface-only column so the verse reads continuously at the
 * baseline.
 */
export function InterlinearLayer(
  props: InterlinearLayerProps,
): React.ReactElement {
  const {
    verseId,
    verseWords,
    showStrongsSuperscripts,
    handlers,
    leadingBaseline,
  } = props;

  // De-dup by position, last wins (mirrors groupVerseColumns'
  // defensive contract). Sorted ascending so the columns flow in
  // English-reading order.
  const byPosition = new Map<number, VerseWord>();
  for (const vw of verseWords) {
    byPosition.set(vw.position, vw);
  }
  const sorted = [...byPosition.values()].sort(
    (a, b) => a.position - b.position,
  );

  return (
    <span style={containerStyle} className="interlinear-verse">
      {leadingBaseline}
      {sorted.map((vw) => {
        const language: InterlinearLanguage | null =
          vw.language === "hebrew" ||
          vw.language === "greek" ||
          vw.language === "aramaic"
            ? vw.language
            : null;
        // Build a synthetic InterlinearColumn from the inline-extended
        // VerseWord. Reuses buildInterlinearColumn to keep the
        // bidi-isolation + morph-register decode + font-stack rules
        // sourced from the helpers module (single source of truth).
        const column = buildInterlinearColumn(
          {
            position: vw.position,
            surface: vw.surface,
            strong_number: vw.strong_number,
            morphology: vw.morphology ?? null,
          },
          vw.strong_number && language && vw.lemma && vw.transliteration
            ? {
                strong_number: vw.strong_number,
                language,
                lemma: vw.lemma,
                transliteration: vw.transliteration,
                short_definition: vw.short_definition ?? null,
              }
            : null,
        );
        return (
          <InterlinearColumnView
            key={`il-${verseId}-${vw.position}`}
            column={column}
            rawMorphology={vw.morphology ?? null}
            language={language}
            strongNumber={vw.strong_number}
            verseId={verseId}
            showStrongsSuperscripts={showStrongsSuperscripts}
            handlers={handlers}
          />
        );
      })}
    </span>
  );
}

/**
 * Conditionally preload the SBL Hebrew + SBL BibLit web fonts on
 * Companion+ partners so the lemma cells paint without a font-swap
 * flash. Called from a useEffect in App.tsx the first time
 * showInterlinear + partnerAtCompanion both flip to ON. Idempotent —
 * the duplicate-link guard short-circuits the second call.
 *
 * S169: woff2 files now bundled into `app/public/fonts/` (368KB
 * SBL_BLit + 94KB SBL_Hbrw, total ~462KB lazy-fetched on first
 * §28 toggle). `@font-face` declarations live in `index.css` with
 * ``font-display: swap`` so the system-fallback chain
 * (Ezra SIL / Cardo / Times New Roman) paints first while the woff2
 * fetches, then the bundled glyphs swap in. The preload below brings
 * the fetch forward to the moment the partner opts in, before the
 * first column renders — net effect is the bundled font is ready by
 * the time the column-stack hits the screen.
 */
export function preloadInterlinearFonts(): void {
  if (typeof document === "undefined") return;
  const fonts = [
    { href: "/fonts/SBL_Hbrw.woff2", type: "font/woff2" },
    { href: "/fonts/SBL_BLit.woff2", type: "font/woff2" },
  ];
  for (const f of fonts) {
    if (
      document.querySelector(`link[rel="preload"][href="${f.href}"]`)
    ) {
      continue;
    }
    const link = document.createElement("link");
    link.rel = "preload";
    link.as = "font";
    link.href = f.href;
    link.type = f.type;
    link.crossOrigin = "anonymous";
    document.head.appendChild(link);
  }
}

/**
 * Per-VerseWord column wrapper — the integration seam used by App.tsx's
 * segment loop to swap the inline tappable-word span for a column-stack
 * when the §28 toggle is ON for a Companion+ partner. Takes one
 * extended VerseWord (from the S168 API payload) + the handlers + the
 * verse_id, builds the InterlinearColumn via the shared helper, and
 * renders the column-stack. Use this when the surrounding render
 * already owns the per-segment loop and the per-word baseline; use
 * the verse-scoped `InterlinearLayer` instead when you want the full
 * verse rendered top-to-bottom from raw verseWords.
 */
export function InterlinearWordColumn(props: {
  verseWord: VerseWord;
  verseId: number;
  showStrongsSuperscripts: boolean;
  handlers: InterlinearWordHandlers;
  surfaceOverride?: string;
}): React.ReactElement {
  const { verseWord: vw, verseId, showStrongsSuperscripts, handlers, surfaceOverride } = props;
  const language: InterlinearLanguage | null =
    vw.language === "hebrew" ||
    vw.language === "greek" ||
    vw.language === "aramaic"
      ? vw.language
      : null;
  const column = buildInterlinearColumn(
    {
      position: vw.position,
      surface: surfaceOverride ?? vw.surface,
      strong_number: vw.strong_number,
      morphology: vw.morphology ?? null,
    },
    vw.strong_number && language && vw.lemma && vw.transliteration
      ? {
          strong_number: vw.strong_number,
          language,
          lemma: vw.lemma,
          transliteration: vw.transliteration,
          short_definition: vw.short_definition ?? null,
        }
      : null,
  );
  return (
    <InterlinearColumnView
      column={column}
      rawMorphology={vw.morphology ?? null}
      language={language}
      strongNumber={vw.strong_number}
      verseId={verseId}
      showStrongsSuperscripts={showStrongsSuperscripts}
      handlers={handlers}
    />
  );
}

// Re-export helpers callers might want without re-importing.
export { selectInterlinearFontStack, wrapHebrewBidi };
