/**
 * plan-notes.ts — the reader's plan notes (S442 step 3): a small hook over
 * /v1/plan-notes plus the human reference label for a note.
 */

import { useCallback, useEffect, useState } from "react";
import {
  createPlanNote,
  deletePlanNote,
  listPlanNotes,
  updatePlanNote,
  type CreatePlanNoteInput,
  type PlanNote,
} from "../api";

const dayFmt = new Intl.DateTimeFormat(undefined, { weekday: "short", month: "short", day: "numeric" });

function isoToDate(iso: string): Date {
  const [y, m, d] = iso.split("-").map(Number);
  return new Date(y, m - 1, d);
}

/** "Genesis 23:4–7" for a chapter note, "Day 17 · Wed, Oct 7" for a day note. */
export function noteRef(n: Pick<PlanNote, "book_title" | "chapter" | "verse_start" | "verse_end" | "plan_day" | "day_date">): string {
  if (n.book_title && n.chapter) {
    let s = `${n.book_title} ${n.chapter}`;
    if (n.verse_start) {
      s += `:${n.verse_start}`;
      if (n.verse_end && n.verse_end !== n.verse_start) s += `–${n.verse_end}`;
    }
    return s;
  }
  const parts: string[] = [];
  if (n.plan_day) parts.push(`Day ${n.plan_day}`);
  if (n.day_date) parts.push(dayFmt.format(isoToDate(n.day_date)));
  return parts.join(" · ") || "Note";
}

/** The reader's notes + create / edit / delete (enabled = entitled). */
export function usePlanNotes(enabled: boolean) {
  const [notes, setNotes] = useState<PlanNote[]>([]);
  const [loaded, setLoaded] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (!enabled) return;
    let cancelled = false;
    listPlanNotes()
      .then((r) => {
        if (!cancelled) {
          setNotes(r.notes);
          setLoaded(true);
        }
      })
      .catch(() => {
        if (!cancelled) {
          setError("Your notes couldn't be loaded. Check your connection and try again.");
          setLoaded(true);
        }
      });
    return () => {
      cancelled = true;
    };
  }, [enabled]);

  const add = useCallback(async (input: CreatePlanNoteInput) => {
    const n = await createPlanNote(input);
    setNotes((prev) => [...prev, n]);
    return n;
  }, []);

  const edit = useCallback(async (id: string, body: string) => {
    const n = await updatePlanNote(id, { body });
    setNotes((prev) => prev.map((x) => (x.id === id ? n : x)));
  }, []);

  const remove = useCallback(async (id: string) => {
    await deletePlanNote(id);
    setNotes((prev) => prev.filter((x) => x.id !== id));
  }, []);

  return { notes, loaded, error, add, edit, remove };
}

