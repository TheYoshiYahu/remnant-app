/**
 * devotional/types.ts — the data model for the daily devotional + prayer
 * content system that feeds the Today hub.
 *
 * Two content kinds, both delivered one-per-day by the calendar:
 *
 *   1. A THEME — a series of daily devotional entries on one frame (the
 *      appointed times, the restored Name, the regathering). The reader
 *      picks a theme; the hub surfaces the day's entry from it.
 *
 *   2. A daily PRAYER — a standalone prayer of the remnant, cycled by day.
 *
 * The shapes are deliberately plain and serialisable (no Date, no functions)
 * so this seed can move to a backend later without the hub changing: the
 * loader in index.ts is the only seam the UI knows about, and it can be
 * re-pointed at an API that returns these same shapes.
 */

/** One day's devotional reading inside a theme. */
export interface DevotionalEntry {
  /** Stable id within the theme (e.g. "sabbath"). */
  id: string;
  /** The day's heading ("The Seventh Day"). */
  title: string;
  /** A one-line frame shown under the title. */
  subtitle: string;
  /** Scripture reference for the passage ("Genesis 2:1-3"). */
  passageRef: string;
  /**
   * The passage quoted IN FULL — come-and-see: the verse stands on the page
   * so the reader doesn't have to leave it. Restored sacred names with
   * parenthetical equivalents, per the body-text convention.
   */
  passageText: string;
  /** The short reflection — the lie named, the Word laid plainly beside it. */
  reflection: string;
  /**
   * The turn of the heart. NOT a how-to program — an invitation home, per the
   * thesis-over-prescription rule. What the reader does next is between them
   * and the Father.
   */
  invitation: string;
  /** A closing line — a blessing or a verse fragment to carry into the day. */
  closing: string;
}

/** A devotional theme: an ordered series of daily entries on one frame. */
export interface DevotionalTheme {
  /** Stable id, persisted as the reader's chosen theme. */
  id: string;
  /** Display title ("The Appointed Times"). */
  title: string;
  /** A one-line description of the arc. */
  subtitle: string;
  /** A short paragraph framing the series, shown when choosing a theme. */
  description: string;
  /** Ordered entries; the hub cycles through these by day. */
  entries: DevotionalEntry[];
}

/** A standalone daily prayer of the remnant. */
export interface DailyPrayer {
  /** Stable id (e.g. "gathering"). */
  id: string;
  /** Display title ("For the Scattered to Be Gathered"). */
  title: string;
  /** A one-line frame shown under the title. */
  subtitle: string;
  /** The prayer body — first/second-person address to the Father. */
  body: string;
  /** A scripture the prayer leans on ("Jeremiah 31:10"). */
  scriptureAnchor: string;
}

/**
 * Whether the bundled content is a seed set (true) or has been replaced by a
 * fuller backend-delivered corpus (false). Read by the hub to mark the content
 * as "a starter set — more is coming."
 */
export const DEVOTIONAL_IS_SEED = true;
