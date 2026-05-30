/**
 * S172 — book source-class classifier (shared helper).
 *
 * Lifted out of ChapterEndCard.tsx so the book-heading pill and the
 * cross-reference target pills draw from one source of truth. A book
 * slug maps to one of three source classes per COLOR_PALETTE.md §9:
 *
 *   - "tanakh"  — 39-book Hebrew canon (Genesis … Malachi)
 *   - "nt"      — 27-book Greek canon (Matthew … Revelation)
 *   - "extras"  — every restored library edition (apocrypha,
 *                 pseudepigrapha, 1 Enoch, Jubilees, Jasher, Adam-Eve,
 *                 Sonnini Acts 29, Apostolic Fathers, etc.)
 *
 * The chrome pill register for each class lines up with the S130
 * cross-reference target pill register:
 *
 *   tanakh → emerald gradient + #2EFFA1 border + #E6FFF2 text
 *   nt     → gold gradient + #FCECAF border + #FFF8E1 text
 *   extras → argaman gradient + #D4B0E0 border + #F5E6FA text
 *
 * The book-heading pill class names (`book-pill-{class}`) live in
 * `app/src/index.css` alongside the chrome-metal classes.
 */

const NT_BOOK_SLUGS = new Set<string>([
  "matthew", "mark", "luke", "john", "acts",
  "romans", "1-corinthians", "2-corinthians", "galatians", "ephesians",
  "philippians", "colossians", "1-thessalonians", "2-thessalonians",
  "1-timothy", "2-timothy", "titus", "philemon", "hebrews", "james",
  "1-peter", "2-peter", "1-john", "2-john", "3-john", "jude", "revelation",
]);

const OT_BOOK_SLUGS = new Set<string>([
  "genesis", "exodus", "leviticus", "numbers", "deuteronomy",
  "joshua", "judges", "ruth", "1-samuel", "2-samuel",
  "1-kings", "2-kings", "1-chronicles", "2-chronicles",
  "ezra", "nehemiah", "esther", "job", "psalms", "proverbs",
  "ecclesiastes", "song-of-solomon", "isaiah", "jeremiah",
  "lamentations", "ezekiel", "daniel", "hosea", "joel", "amos",
  "obadiah", "jonah", "micah", "nahum", "habakkuk", "zephaniah",
  "haggai", "zechariah", "malachi",
]);

export type BookSourceClass = "tanakh" | "nt" | "extras";

export function classifyBookSlug(slug: string): BookSourceClass {
  if (OT_BOOK_SLUGS.has(slug)) return "tanakh";
  if (NT_BOOK_SLUGS.has(slug)) return "nt";
  return "extras";
}

/**
 * Book-heading pill class name. Returns the CSS class string that
 * maps to the source-class metallic register. Pair with the base
 * `book-pill` class (provides sizing + padding + border-width).
 */
export function bookPillClassName(slug: string): string {
  const cls = classifyBookSlug(slug);
  switch (cls) {
    case "tanakh":
      return "book-pill book-pill-emerald";
    case "nt":
      return "book-pill book-pill-gold";
    case "extras":
      return "book-pill book-pill-argaman";
  }
}
