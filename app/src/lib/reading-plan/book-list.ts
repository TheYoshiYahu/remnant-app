/**
 * book-list.ts — every book in the woven reading order (canon + restored
 * extras) with its chapter count, for passage pickers (S442). Built from
 * chronological-reading.json so it needs no network. Canon in canonical
 * order first, then the restored books in the order they first appear.
 */

import { sequenceForScope } from "./pacing";
import { CANON_BOOK_ORDER } from "../book-source-class";

export interface PickerBook {
  slug: string;
  title: string;
  chapters: number;
  source: "canon" | "extra";
}

let cache: PickerBook[] | null = null;

export function pickerBooks(): PickerBook[] {
  if (cache) return cache;
  const map = new Map<string, PickerBook>();
  const firstSeen: string[] = [];
  for (const e of sequenceForScope("all")) {
    const b = map.get(e.book_id);
    if (b) b.chapters = Math.max(b.chapters, e.chapter);
    else {
      map.set(e.book_id, { slug: e.book_id, title: e.book_title, chapters: e.chapter, source: e.source });
      firstSeen.push(e.book_id);
    }
  }
  const canon = CANON_BOOK_ORDER.filter((s) => map.has(s)).map((s) => map.get(s)!);
  const extras = firstSeen.filter((s) => map.get(s)!.source === "extra").map((s) => map.get(s)!);
  cache = [...canon, ...extras];
  return cache;
}
