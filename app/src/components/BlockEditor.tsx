/**
 * BlockEditor — builds a document from ordered blocks (S442). Used by
 * My Teachings (/my-teachings) and For Teachers (/teach).
 *
 *   teaching mode:   headings, writing, passages, notes pulled from the plan
 *   assignment mode: all of that + plan readings (this week / next week / a
 *                    date range), questions with an answer key, memory verses,
 *                    and a whole My Teaching dropped in
 *
 * Reordering is up/down (works the same on a phone as on a desktop).
 */

import { useMemo, useState } from "react";
import type { PlanNote, StudyDocSummary } from "../lib/api";
import { getMyTeaching } from "../lib/api";
import {
  newBlockId,
  passageHref,
  passageLabel,
  readingBlocksFromDays,
  type PassageRef,
  type StudyBlock,
} from "../lib/study-blocks";
import { noteRef } from "../lib/reading-plan/plan-notes";
import type { PacedPlan } from "../lib/reading-plan/paced";
import { addDaysISO, diffDaysISO, weekStartFor } from "../lib/reading-plan/paced";
import PassagePicker from "./PassagePicker";
import { CARD, INPUT, SMALL_BTN } from "./PlanLock";

type Adding = null | "passage" | "notes" | "readings" | "memory" | "teaching";

export interface PlanContext {
  startISO: string;
  todayISO: string;
  paced: PacedPlan;
}

const shortFmt = new Intl.DateTimeFormat(undefined, { month: "short", day: "numeric" });
function fmtShort(iso: string): string {
  const [y, m, d] = iso.split("-").map(Number);
  return shortFmt.format(new Date(y, m - 1, d));
}

const TYPE_LABEL: Record<StudyBlock["type"], string> = {
  heading: "Heading",
  text: "Writing",
  passage: "Passage",
  reading: "Readings",
  note: "Note",
  question: "Question",
  memory: "Memory verse",
};

export default function BlockEditor({
  blocks,
  onChange,
  mode,
  notes,
  plan,
  teachings,
}: {
  blocks: StudyBlock[];
  onChange: (next: StudyBlock[]) => void;
  mode: "teaching" | "assignment";
  notes: PlanNote[];
  plan?: PlanContext | null;
  teachings?: StudyDocSummary[];
}) {
  const [adding, setAdding] = useState<Adding>(null);

  const update = (id: string, patch: Partial<StudyBlock>) =>
    onChange(blocks.map((b) => (b.id === id ? ({ ...b, ...patch } as StudyBlock) : b)));
  const remove = (id: string) => onChange(blocks.filter((b) => b.id !== id));
  const move = (i: number, d: -1 | 1) => {
    const j = i + d;
    if (j < 0 || j >= blocks.length) return;
    const next = blocks.slice();
    [next[i], next[j]] = [next[j], next[i]];
    onChange(next);
  };
  const append = (...add: StudyBlock[]) => {
    onChange([...blocks, ...add]);
    setAdding(null);
  };

  const addBtn = (label: string, onClick: () => void, active = false) => (
    <button
      type="button"
      onClick={onClick}
      className={SMALL_BTN + (active ? " border-[var(--reader-accent)]" : "")}
    >
      + {label}
    </button>
  );

  return (
    <div className="font-sans">
      {blocks.length === 0 && (
        <p className="rounded border border-dashed border-[var(--reader-rule)] px-3 py-4 text-center text-sm text-[var(--reader-muted)]">
          {mode === "teaching"
            ? "Start with a heading, pull in your notes, add the passages, and write between them."
            : "Pick the readings, add questions and memory verses, and write the instructions."}
        </p>
      )}

      <ol className="space-y-2">
        {blocks.map((b, i) => (
          <li key={b.id} className="rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-2.5">
            <div className="mb-1.5 flex items-center justify-between gap-2">
              <span className="text-[10px] font-semibold uppercase tracking-wider text-[var(--reader-muted)]">
                {TYPE_LABEL[b.type]}
              </span>
              <span className="flex gap-1">
                <button type="button" aria-label="Move up" disabled={i === 0} onClick={() => move(i, -1)} className={SMALL_BTN}>
                  ↑
                </button>
                <button
                  type="button"
                  aria-label="Move down"
                  disabled={i === blocks.length - 1}
                  onClick={() => move(i, 1)}
                  className={SMALL_BTN}
                >
                  ↓
                </button>
                <button type="button" aria-label="Remove" onClick={() => remove(b.id)} className={SMALL_BTN}>
                  ✕
                </button>
              </span>
            </div>
            <BlockBody block={b} onPatch={(p) => update(b.id, p)} />
          </li>
        ))}
      </ol>

      <div className="mt-3 flex flex-wrap gap-1.5">
        {addBtn("Heading", () => append({ id: newBlockId(), type: "heading", text: "" }))}
        {addBtn("Writing", () => append({ id: newBlockId(), type: "text", text: "" }))}
        {addBtn("Passage", () => setAdding(adding === "passage" ? null : "passage"), adding === "passage")}
        {addBtn("From my notes", () => setAdding(adding === "notes" ? null : "notes"), adding === "notes")}
        {mode === "assignment" && (
          <>
            {addBtn("Plan readings", () => setAdding(adding === "readings" ? null : "readings"), adding === "readings")}
            {addBtn("Question", () => append({ id: newBlockId(), type: "question", text: "", answer: "", lines: 3 }))}
            {addBtn("Memory verse", () => setAdding(adding === "memory" ? null : "memory"), adding === "memory")}
            {teachings && teachings.length > 0 &&
              addBtn("One of my teachings", () => setAdding(adding === "teaching" ? null : "teaching"), adding === "teaching")}
          </>
        )}
      </div>

      {adding === "passage" && (
        <div className={CARD + " mt-2"}>
          <PassagePicker
            onAdd={(p) => append({ id: newBlockId(), type: "passage", ...p })}
            onCancel={() => setAdding(null)}
          />
        </div>
      )}
      {adding === "memory" && (
        <div className={CARD + " mt-2"}>
          <PassagePicker
            addLabel="Add memory verse"
            onAdd={(p) => append({ id: newBlockId(), type: "memory", ...p })}
            onCancel={() => setAdding(null)}
          />
        </div>
      )}
      {adding === "notes" && (
        <NotePicker
          notes={notes}
          onAdd={(picked) =>
            append(
              ...picked.flatMap<StudyBlock>((n) => {
                const out: StudyBlock[] = [];
                if (n.book_slug && n.chapter) {
                  const p: PassageRef = {
                    book_slug: n.book_slug,
                    book_title: n.book_title ?? n.book_slug,
                    chapter: n.chapter,
                    verse_start: n.verse_start,
                    verse_end: n.verse_end,
                  };
                  out.push({ id: newBlockId(), type: "passage", ...p });
                }
                out.push({ id: newBlockId(), type: "note", note_id: n.id, ref: noteRef(n), body: n.body });
                return out;
              }),
            )
          }
          onCancel={() => setAdding(null)}
        />
      )}
      {adding === "readings" && <ReadingsPicker plan={plan ?? null} onAdd={(bs) => append(...bs)} onCancel={() => setAdding(null)} />}
      {adding === "teaching" && teachings && (
        <TeachingPicker teachings={teachings} onAdd={(bs) => append(...bs)} onCancel={() => setAdding(null)} />
      )}
    </div>
  );
}

function BlockBody({ block: b, onPatch }: { block: StudyBlock; onPatch: (p: Partial<StudyBlock>) => void }) {
  switch (b.type) {
    case "heading":
      return (
        <input
          value={b.text}
          onChange={(e) => onPatch({ text: e.target.value })}
          placeholder="Section heading"
          className={INPUT + " w-full font-serif text-base font-semibold"}
        />
      );
    case "text":
      return (
        <textarea
          value={b.text}
          onChange={(e) => onPatch({ text: e.target.value })}
          rows={4}
          placeholder="Write here…"
          className={INPUT + " w-full font-serif leading-relaxed"}
        />
      );
    case "passage":
    case "memory":
      return (
        <div className="flex items-center justify-between gap-2 text-sm">
          <span className="font-serif font-semibold">{passageLabel(b)}</span>
          <a href={passageHref(b)} className="text-xs text-[var(--reader-accent)] hover:underline">
            Open in the reader ›
          </a>
        </div>
      );
    case "reading":
      return (
        <div className="text-sm">
          <input
            value={b.label}
            onChange={(e) => onPatch({ label: e.target.value })}
            className={INPUT + " w-full text-sm font-semibold"}
          />
          <div className="mt-1 flex flex-wrap gap-x-3 gap-y-0.5">
            {b.passages.map((p, i) => (
              <a key={i} href={passageHref(p)} className="text-[var(--reader-accent)] hover:underline">
                {passageLabel(p)}
              </a>
            ))}
          </div>
        </div>
      );
    case "note":
      return (
        <div className="text-sm">
          {b.ref && <div className="text-xs font-semibold text-[var(--reader-muted)]">{b.ref}</div>}
          <textarea
            value={b.body}
            onChange={(e) => onPatch({ body: e.target.value })}
            rows={3}
            className={INPUT + " mt-1 w-full font-serif leading-relaxed"}
          />
          <div className="text-[11px] text-[var(--reader-muted)]">
            Editing here changes this copy only; your original note stays as it was.
          </div>
        </div>
      );
    case "question":
      return (
        <div className="space-y-1.5 text-sm">
          <textarea
            value={b.text}
            onChange={(e) => onPatch({ text: e.target.value })}
            rows={2}
            placeholder="The question"
            className={INPUT + " w-full"}
          />
          <textarea
            value={b.answer ?? ""}
            onChange={(e) => onPatch({ answer: e.target.value })}
            rows={2}
            placeholder="Answer key (teacher copy only — optional)"
            className={INPUT + " w-full"}
          />
          <label className="flex items-center gap-2 text-xs text-[var(--reader-muted)]">
            Writing lines on the student copy
            <input
              type="number"
              min={1}
              max={20}
              value={b.lines ?? 3}
              onChange={(e) => onPatch({ lines: Math.max(1, Math.min(20, Math.floor(Number(e.target.value) || 1))) })}
              className={INPUT + " w-16 py-0.5 text-xs"}
            />
          </label>
        </div>
      );
  }
}

function NotePicker({
  notes,
  onAdd,
  onCancel,
}: {
  notes: PlanNote[];
  onAdd: (picked: PlanNote[]) => void;
  onCancel: () => void;
}) {
  const [q, setQ] = useState("");
  const [book, setBook] = useState("");
  const [day, setDay] = useState("");
  const [picked, setPicked] = useState<Set<string>>(() => new Set());
  const books = useMemo(
    () => Array.from(new Map(notes.filter((n) => n.book_slug).map((n) => [n.book_slug!, n.book_title ?? n.book_slug!]))),
    [notes],
  );
  const shown = notes.filter((n) => {
    if (book && n.book_slug !== book) return false;
    if (day && String(n.plan_day ?? "") !== day) return false;
    if (q.trim()) {
      const t = q.toLowerCase();
      if (!n.body.toLowerCase().includes(t) && !noteRef(n).toLowerCase().includes(t)) return false;
    }
    return true;
  });
  const toggle = (id: string) =>
    setPicked((prev) => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next;
    });

  return (
    <div className={CARD + " mt-2 text-sm"}>
      {notes.length === 0 ? (
        <p className="text-[var(--reader-muted)]">
          No plan notes yet. Add notes on any day in <a href="/plan" className="text-[var(--reader-accent)] hover:underline">the whole plan</a>, then gather them here.
        </p>
      ) : (
        <>
          <div className="flex flex-wrap gap-2">
            <input value={q} onChange={(e) => setQ(e.target.value)} placeholder="Search" className={INPUT + " flex-1"} />
            <select value={book} onChange={(e) => setBook(e.target.value)} className={INPUT}>
              <option value="">Every book</option>
              {books.map(([slug, title]) => (
                <option key={slug} value={slug}>
                  {title}
                </option>
              ))}
            </select>
            <input
              inputMode="numeric"
              value={day}
              onChange={(e) => setDay(e.target.value.replace(/\D/g, ""))}
              placeholder="Day #"
              className={INPUT + " w-20"}
            />
          </div>
          <ul className="mt-2 max-h-72 space-y-1 overflow-y-auto">
            {shown.map((n) => (
              <li key={n.id}>
                <label className="flex cursor-pointer gap-2 rounded px-1 py-1 hover:bg-[var(--reader-bg)]">
                  <input type="checkbox" checked={picked.has(n.id)} onChange={() => toggle(n.id)} className="mt-1" />
                  <span>
                    <span className="block text-xs font-semibold text-[var(--reader-muted)]">{noteRef(n)}</span>
                    <span className="line-clamp-2 font-serif">{n.body}</span>
                  </span>
                </label>
              </li>
            ))}
            {shown.length === 0 && <li className="text-xs text-[var(--reader-muted)]">No notes match.</li>}
          </ul>
        </>
      )}
      <div className="mt-2 flex gap-2">
        {notes.length > 0 && (
          <button
            type="button"
            disabled={picked.size === 0}
            onClick={() => onAdd(notes.filter((n) => picked.has(n.id)))}
            className="chrome-metal chrome-metal-gold"
            style={{ padding: "0.3rem 0.8rem" }}
          >
            Add {picked.size || ""} {picked.size === 1 ? "note" : "notes"}
          </button>
        )}
        <button type="button" onClick={onCancel} className={SMALL_BTN}>
          Cancel
        </button>
      </div>
    </div>
  );
}

function ReadingsPicker({
  plan,
  onAdd,
  onCancel,
}: {
  plan: PlanContext | null;
  onAdd: (blocks: StudyBlock[]) => void;
  onCancel: () => void;
}) {
  const [from, setFrom] = useState(plan?.todayISO ?? "");
  const [to, setTo] = useState(plan ? addDaysISO(plan.todayISO, 6) : "");
  if (!plan) {
    return (
      <div className={CARD + " mt-2 text-sm"}>
        <p className="text-[var(--reader-muted)]">
          Start the year plan (in <a href="/plan" className="text-[var(--reader-accent)] hover:underline">the whole plan</a>) to pull its readings — or add any passage with “+ Passage”.
        </p>
        <button type="button" onClick={onCancel} className={SMALL_BTN + " mt-2"}>
          Close
        </button>
      </div>
    );
  }
  const thisWeek = weekStartFor(plan.startISO, plan.todayISO);
  const nextWeek = addDaysISO(thisWeek, 7);
  const daysIn = (a: string, b: string) =>
    plan.paced.days.filter((d) => diffDaysISO(a, d.dateISO) >= 0 && diffDaysISO(d.dateISO, b) >= 0);
  const thisDays = daysIn(plan.todayISO, addDaysISO(thisWeek, 6));
  const nextDays = daysIn(nextWeek, addDaysISO(nextWeek, 6));
  const rangeDays = from && to ? daysIn(from, to) : [];
  const count = (ds: typeof thisDays) => ds.reduce((s, d) => s + d.items.length, 0);

  return (
    <div className={CARD + " mt-2 space-y-2 text-sm"}>
      <div className="flex flex-wrap gap-2">
        <button type="button" disabled={!thisDays.length} onClick={() => onAdd(readingBlocksFromDays(thisDays))} className={SMALL_BTN}>
          Rest of this week ({fmtShort(plan.todayISO)} – {fmtShort(addDaysISO(thisWeek, 6))} · {count(thisDays)} ch.)
        </button>
        <button type="button" disabled={!nextDays.length} onClick={() => onAdd(readingBlocksFromDays(nextDays))} className={SMALL_BTN}>
          Next week ({fmtShort(nextWeek)} – {fmtShort(addDaysISO(nextWeek, 6))} · {count(nextDays)} ch.)
        </button>
      </div>
      <div className="flex flex-wrap items-center gap-2">
        <span className="text-xs text-[var(--reader-muted)]">Or any dates:</span>
        <input type="date" value={from} min={plan.todayISO} onChange={(e) => setFrom(e.target.value)} className={INPUT} />
        <span className="text-[var(--reader-muted)]">to</span>
        <input type="date" value={to} min={from || plan.todayISO} onChange={(e) => setTo(e.target.value)} className={INPUT} />
        <button type="button" disabled={!rangeDays.length} onClick={() => onAdd(readingBlocksFromDays(rangeDays))} className={SMALL_BTN}>
          Add {rangeDays.length} days · {count(rangeDays)} ch.
        </button>
      </div>
      <p className="text-xs text-[var(--reader-muted)]">Readings follow your pace in the whole plan, from today on.</p>
      <button type="button" onClick={onCancel} className={SMALL_BTN}>
        Close
      </button>
    </div>
  );
}

function TeachingPicker({
  teachings,
  onAdd,
  onCancel,
}: {
  teachings: StudyDocSummary[];
  onAdd: (blocks: StudyBlock[]) => void;
  onCancel: () => void;
}) {
  const [busy, setBusy] = useState<string | null>(null);
  const [err, setErr] = useState<string | null>(null);
  const pick = async (id: string) => {
    setBusy(id);
    setErr(null);
    try {
      const t = await getMyTeaching(id);
      onAdd([
        { id: newBlockId(), type: "heading", text: t.title },
        ...t.blocks.map((b) => ({ ...b, id: newBlockId() }) as StudyBlock),
      ]);
    } catch {
      setErr("That teaching couldn't be loaded.");
    } finally {
      setBusy(null);
    }
  };
  return (
    <div className={CARD + " mt-2 text-sm"}>
      <ul className="space-y-1">
        {teachings.map((t) => (
          <li key={t.id}>
            <button type="button" disabled={!!busy} onClick={() => void pick(t.id)} className="text-left text-[var(--reader-accent)] hover:underline">
              {busy === t.id ? "Adding…" : t.title}
            </button>
          </li>
        ))}
      </ul>
      {err && <p className="mt-1 text-xs text-red-400">{err}</p>}
      <button type="button" onClick={onCancel} className={SMALL_BTN + " mt-2"}>
        Close
      </button>
    </div>
  );
}
