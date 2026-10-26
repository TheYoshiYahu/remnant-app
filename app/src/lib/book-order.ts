/**
 * S475 (Yoshi) — two orders for the book picker.
 *
 *   canon — the picker as it was: the 66 books, then the extra-canonical
 *           library by section. One change: Acts 29 (the Sonnini
 *           manuscript) now sits right after Acts instead of at the end.
 *   story — our own order: each extra book sits beside the Scripture it
 *           belongs with, by the period it speaks of. Not Cepher's order,
 *           not strictly chronological; a reading order of our own.
 *
 * STORY_AFTER lists, for a canon book, the extra books that follow it.
 * Each entry is [edition_slug, slug]; "*" as the slug means every book of
 * that edition (Josephus). Extra books not placed here fall in at the end,
 * in their usual order, so nothing is ever lost from the menu.
 */
import type { BookSummary } from "./api";

export type BookOrder = "canon" | "story";
export const BOOK_ORDER_KEY = "rop_book_order_v1";
export const BOOK_ORDER_LABEL: Record<BookOrder, string> = {
  canon: "Canon order",
  story: "Story order",
};

export function loadBookOrder(): BookOrder {
  try {
    const v = window.localStorage.getItem(BOOK_ORDER_KEY);
    return v === "story" ? "story" : "canon";
  } catch {
    return "canon";
  }
}
export function saveBookOrder(o: BookOrder): void {
  try {
    window.localStorage.setItem(BOOK_ORDER_KEY, o);
  } catch {
    /* ignore */
  }
}

type Ref = [edition: string, slug: string];
const C = (slug: string): Ref => ["canon", slug];

/**
 * Story order — shelves of our own. Not the Cepher's shelves (it splits Paul and
 * moves John); ours keep the canon's own order inside each shelf and set the
 * extra books on the shelf they belong to. Anything not named here falls in
 * at the end under "More", so nothing is ever lost from the menu.
 */
export const STORY_SHELVES: Array<[label: string, books: Ref[]]> = [
  ["Torah", ["genesis", "exodus", "leviticus", "numbers", "deuteronomy"].map(C)],
  ["The Early Witnesses", [
    ["adam-eve-conflict", "1-adam-eve"], ["adam-eve-conflict", "2-adam-eve"], ["pseudepigrapha", "adam-eve"],
    ["enoch", "1-enoch"], ["pseudepigrapha", "2-enoch"], ["jubilees", "jubilees"], ["jasher", "jasher"],
    ["apocalypse-of-abraham", "apocalypse-of-abraham"], ["pseudepigrapha", "testaments-xii"],
  ]],
  ["History", [
    ...["joshua", "judges", "ruth", "1-samuel", "2-samuel", "1-kings", "2-kings", "1-chronicles", "2-chronicles",
        "ezra", "nehemiah", "esther"].map(C),
    ["apocrypha", "the-rest-of-esther"], ["apocrypha", "tobit"], ["apocrypha", "judith"],
    ["apocrypha", "1-esdras"], ["apocrypha", "the-prayer-of-manasseh"],
  ]],
  ["Writings", [
    ...["job", "psalms", "proverbs", "ecclesiastes", "song-of-solomon"].map(C),
    ["apocrypha", "the-wisdom-of-solomon"], ["apocrypha", "ecclesiasticus"],
  ]],
  ["Prophets", [
    ...["isaiah", "jeremiah", "lamentations", "ezekiel", "daniel", "hosea", "joel", "amos", "obadiah", "jonah",
        "micah", "nahum", "habakkuk", "zephaniah", "haggai", "zechariah", "malachi"].map(C),
    ["ascension-isaiah", "ascension-isaiah"], ["apocrypha", "baruch-with-the-letter-of-jeremiah"],
    ["pseudepigrapha", "2-baruch"], ["pseudepigrapha", "3-baruch"],
    ["apocrypha", "the-song-of-the-three-holy-children"], ["apocrypha", "the-history-of-susanna"],
    ["apocrypha", "bel-and-the-dragon"],
  ]],
  ["The Years Between", [
    ["apocrypha", "1-maccabees"], ["apocrypha", "2-maccabees"], ["apocrypha-charles-vol1", "3-maccabees"],
    ["pseudepigrapha", "4-maccabees"], ["apocrypha", "2-esdras"], ["josephus", "*"],
  ]],
  ["Gospels and Acts", [...["matthew", "mark", "luke", "john", "acts"].map(C), ["sonnini-acts-29", "sonnini-acts-29"]]],
  ["Letters", ["romans", "1-corinthians", "2-corinthians", "galatians", "ephesians", "philippians", "colossians",
    "1-thessalonians", "2-thessalonians", "1-timothy", "2-timothy", "titus", "philemon", "hebrews", "james",
    "1-peter", "2-peter", "1-john", "2-john", "3-john", "jude"].map(C)],
  ["Revelation", [C("revelation")]],
  ["The Early Assemblies", [
    ["lightfoot-apostolic-fathers", "didache"], ["lightfoot-apostolic-fathers", "1-clement"],
    ["lightfoot-apostolic-fathers", "2-clement"], ["lightfoot-apostolic-fathers", "ignatius-ephesians"],
    ["lightfoot-apostolic-fathers", "ignatius-magnesians"], ["lightfoot-apostolic-fathers", "ignatius-trallians"],
    ["lightfoot-apostolic-fathers", "ignatius-romans"], ["lightfoot-apostolic-fathers", "ignatius-philadelphians"],
    ["lightfoot-apostolic-fathers", "ignatius-smyrnaeans"], ["lightfoot-apostolic-fathers", "ignatius-polycarp"],
    ["lightfoot-apostolic-fathers", "martyrdom-polycarp"], ["lightfoot-apostolic-fathers", "hermas"],
  ]],
];

export function isActs29(b: BookSummary): boolean {
  return b.edition_slug === "sonnini-acts-29";
}

/** Story order as shelves: each shelf's books in the order named; unplaced books on a last shelf. */
export function storyShelves(books: BookSummary[]): Array<{ label: string; books: BookSummary[] }> {
  const used = new Set<number>();
  const byOrder = [...books].sort((a, b) => a.canonical_order - b.canonical_order);
  const find = ([ed, slug]: Ref): BookSummary[] => {
    const isCanon = ed === "canon";
    return byOrder.filter((b) => !used.has(b.id) &&
      (isCanon ? b.witness_category === "canon" && b.slug === slug
               : b.edition_slug === ed && (slug === "*" || b.slug === slug)));
  };
  const out: Array<{ label: string; books: BookSummary[] }> = [];
  for (const [label, refs] of STORY_SHELVES) {
    const list: BookSummary[] = [];
    for (const r of refs) for (const b of find(r)) { used.add(b.id); list.push(b); }
    if (list.length) out.push({ label, books: list });
  }
  const rest = byOrder.filter((b) => !used.has(b.id));
  if (rest.length) out.push({ label: "More", books: rest });
  return out;
}
