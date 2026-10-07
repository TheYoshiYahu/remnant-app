/**
 * PassagePicker — choose a book (canon or restored), a chapter and an
 * optional verse range. Used by My Teachings and For Teachers (S442).
 */

import { useMemo, useState } from "react";
import { pickerBooks } from "../lib/reading-plan/book-list";
import type { PassageRef } from "../lib/study-blocks";
import { INPUT, SMALL_BTN } from "./PlanLock";

export default function PassagePicker({
  onAdd,
  onCancel,
  addLabel = "Add",
}: {
  onAdd: (p: PassageRef) => void;
  onCancel?: () => void;
  addLabel?: string;
}) {
  const books = useMemo(() => pickerBooks(), []);
  const [slug, setSlug] = useState(books[0]?.slug ?? "genesis");
  const book = books.find((b) => b.slug === slug) ?? books[0];
  const [chapter, setChapter] = useState(1);
  const [vs, setVs] = useState("");
  const [ve, setVe] = useState("");

  const add = () => {
    if (!book) return;
    const a = parseInt(vs, 10);
    const b = parseInt(ve, 10);
    const start = Number.isFinite(a) && a > 0 ? a : null;
    let end = Number.isFinite(b) && b > 0 ? b : null;
    if (start && end && end < start) end = start;
    onAdd({
      book_slug: book.slug,
      book_title: book.title,
      chapter: Math.min(Math.max(1, chapter), book.chapters),
      verse_start: start,
      verse_end: start ? end : null,
    });
  };

  const canon = books.filter((b) => b.source === "canon");
  const extras = books.filter((b) => b.source === "extra");

  return (
    <div className="flex flex-wrap items-end gap-2 font-sans text-sm">
      <label className="flex flex-col gap-0.5">
        <span className="text-xs text-[var(--reader-muted)]">Book</span>
        <select
          value={slug}
          onChange={(e) => {
            setSlug(e.target.value);
            setChapter(1);
          }}
          className={INPUT + " max-w-[12rem]"}
        >
          <optgroup label="The canon">
            {canon.map((b) => (
              <option key={b.slug} value={b.slug}>
                {b.title}
              </option>
            ))}
          </optgroup>
          <optgroup label="The restored books">
            {extras.map((b) => (
              <option key={b.slug} value={b.slug}>
                {b.title}
              </option>
            ))}
          </optgroup>
        </select>
      </label>
      <label className="flex flex-col gap-0.5">
        <span className="text-xs text-[var(--reader-muted)]">Chapter</span>
        <select
          value={chapter}
          onChange={(e) => setChapter(Number(e.target.value))}
          className={INPUT}
        >
          {Array.from({ length: book?.chapters ?? 1 }, (_, i) => i + 1).map((n) => (
            <option key={n} value={n}>
              {n}
            </option>
          ))}
        </select>
      </label>
      <label className="flex flex-col gap-0.5">
        <span className="text-xs text-[var(--reader-muted)]">Verses (optional)</span>
        <span className="flex items-center gap-1">
          <input
            inputMode="numeric"
            value={vs}
            onChange={(e) => setVs(e.target.value.replace(/\D/g, ""))}
            placeholder="from"
            className={INPUT + " w-14"}
          />
          <span className="text-[var(--reader-muted)]">–</span>
          <input
            inputMode="numeric"
            value={ve}
            onChange={(e) => setVe(e.target.value.replace(/\D/g, ""))}
            placeholder="to"
            className={INPUT + " w-14"}
          />
        </span>
      </label>
      <button type="button" onClick={add} className="chrome-metal chrome-metal-gold" style={{ padding: "0.3rem 0.7rem" }}>
        {addLabel}
      </button>
      {onCancel && (
        <button type="button" onClick={onCancel} className={SMALL_BTN}>
          Cancel
        </button>
      )}
    </div>
  );
}
