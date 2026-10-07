/**
 * PlanNotes — notes on a plan day or a chapter (S442, YEAR_PLAN_STUDY_SPEC.md
 * step 3). Partner feature; stored on the account (/v1/plan-notes).
 *
 *   NoteComposer     — "Add a note" about the whole day or one of its
 *                      chapters, with an optional verse range
 *   NoteCard         — one note, editable in place
 * The notes hook + noteRef live in lib/reading-plan/plan-notes.ts.
 */

import { useState } from "react";
import type { CreatePlanNoteInput, PlanNote } from "../lib/api";
import { noteRef } from "../lib/reading-plan/plan-notes";
import type { DayReadingItem } from "../lib/reading-plan/pacing";
import { INPUT, SMALL_BTN } from "./PlanLock";

export function NoteComposer({
  dayNumber,
  dayDateISO,
  chapters,
  defaultChapterSeq,
  onSave,
  onClose,
}: {
  dayNumber?: number | null;
  dayDateISO?: string | null;
  chapters: DayReadingItem[];
  /** Pre-select a chapter (else "the whole day"). */
  defaultChapterSeq?: number | null;
  onSave: (input: CreatePlanNoteInput) => Promise<unknown>;
  onClose: () => void;
}) {
  const [about, setAbout] = useState<string>(
    defaultChapterSeq != null ? String(defaultChapterSeq) : "day",
  );
  const [body, setBody] = useState("");
  const [vs, setVs] = useState("");
  const [ve, setVe] = useState("");
  const [busy, setBusy] = useState(false);
  const [err, setErr] = useState<string | null>(null);

  const ch = chapters.find((c) => String(c.seq) === about) ?? null;

  const save = async () => {
    if (!body.trim()) return;
    setBusy(true);
    setErr(null);
    const a = parseInt(vs, 10);
    const b = parseInt(ve, 10);
    try {
      await onSave({
        body: body.trim(),
        plan_day: dayNumber ?? null,
        day_date: dayDateISO ?? null,
        book_slug: ch?.book_id ?? null,
        book_title: ch?.book_title ?? null,
        chapter: ch?.chapter ?? null,
        verse_start: ch && Number.isFinite(a) && a > 0 ? a : null,
        verse_end: ch && Number.isFinite(b) && b > 0 ? b : null,
      });
      onClose();
    } catch {
      setErr("That note didn't save. Check your connection and try again.");
    } finally {
      setBusy(false);
    }
  };

  return (
    <div className="mt-2 rounded border border-[var(--reader-rule)] bg-[var(--reader-bg)] p-3 font-sans text-sm">
      <div className="flex flex-wrap items-end gap-2">
        <label className="flex flex-col gap-0.5">
          <span className="text-xs text-[var(--reader-muted)]">About</span>
          <select value={about} onChange={(e) => setAbout(e.target.value)} className={INPUT}>
            <option value="day">
              {dayNumber ? `The whole day (Day ${dayNumber})` : "The whole day"}
            </option>
            {chapters.map((c) => (
              <option key={c.seq} value={String(c.seq)}>
                {c.book_title} {c.chapter}
              </option>
            ))}
          </select>
        </label>
        {ch && (
          <label className="flex flex-col gap-0.5">
            <span className="text-xs text-[var(--reader-muted)]">Verses (optional)</span>
            <span className="flex items-center gap-1">
              <input inputMode="numeric" value={vs} onChange={(e) => setVs(e.target.value.replace(/\D/g, ""))} placeholder="from" className={INPUT + " w-14"} />
              <span className="text-[var(--reader-muted)]">–</span>
              <input inputMode="numeric" value={ve} onChange={(e) => setVe(e.target.value.replace(/\D/g, ""))} placeholder="to" className={INPUT + " w-14"} />
            </span>
          </label>
        )}
      </div>
      <textarea
        value={body}
        onChange={(e) => setBody(e.target.value)}
        rows={4}
        autoFocus
        placeholder="What did you see here?"
        className={INPUT + " mt-2 w-full font-serif leading-relaxed"}
      />
      {err && <p className="mt-1 text-xs text-red-400">{err}</p>}
      <div className="mt-2 flex gap-2">
        <button type="button" disabled={busy || !body.trim()} onClick={save} className="chrome-metal chrome-metal-gold" style={{ padding: "0.3rem 0.8rem" }}>
          {busy ? "Saving…" : "Save note"}
        </button>
        <button type="button" onClick={onClose} className={SMALL_BTN}>
          Cancel
        </button>
      </div>
    </div>
  );
}

export function NoteCard({
  note,
  onEdit,
  onDelete,
  compact = false,
}: {
  note: PlanNote;
  onEdit: (id: string, body: string) => Promise<unknown>;
  onDelete: (id: string) => Promise<unknown>;
  compact?: boolean;
}) {
  const [editing, setEditing] = useState(false);
  const [body, setBody] = useState(note.body);
  const [confirmDelete, setConfirmDelete] = useState(false);
  const [busy, setBusy] = useState(false);

  const save = async () => {
    if (!body.trim()) return;
    setBusy(true);
    try {
      await onEdit(note.id, body.trim());
      setEditing(false);
    } finally {
      setBusy(false);
    }
  };

  return (
    <div className={"rounded border-l-2 border-[#B4A078] bg-[var(--reader-bg)] px-3 py-2 font-sans " + (compact ? "text-xs" : "text-sm")}>
      <div className="flex items-baseline justify-between gap-2">
        {note.book_slug && note.chapter ? (
          <a
            href={`/read?book=${encodeURIComponent(note.book_slug)}&chapter=${note.chapter}`}
            className="text-xs font-semibold text-[var(--reader-accent)] hover:underline"
          >
            {noteRef(note)}
          </a>
        ) : (
          <span className="text-xs font-semibold text-[var(--reader-muted)]">{noteRef(note)}</span>
        )}
        {!editing && (
          <span className="flex shrink-0 gap-2 text-xs">
            <button type="button" onClick={() => setEditing(true)} className="text-[var(--reader-accent)] hover:underline">
              Edit
            </button>
            {confirmDelete ? (
              <>
                <button type="button" onClick={() => void onDelete(note.id)} className="text-red-400 hover:underline">
                  Delete it
                </button>
                <button type="button" onClick={() => setConfirmDelete(false)} className="text-[var(--reader-muted)] hover:underline">
                  Keep
                </button>
              </>
            ) : (
              <button type="button" onClick={() => setConfirmDelete(true)} className="text-[var(--reader-muted)] hover:underline">
                Delete
              </button>
            )}
          </span>
        )}
      </div>
      {editing ? (
        <div className="mt-1">
          <textarea value={body} onChange={(e) => setBody(e.target.value)} rows={4} className={INPUT + " w-full font-serif"} />
          <div className="mt-1 flex gap-2">
            <button type="button" disabled={busy} onClick={save} className={SMALL_BTN}>
              {busy ? "Saving…" : "Save"}
            </button>
            <button
              type="button"
              onClick={() => {
                setBody(note.body);
                setEditing(false);
              }}
              className={SMALL_BTN}
            >
              Cancel
            </button>
          </div>
        </div>
      ) : (
        <p className="mt-0.5 whitespace-pre-wrap font-serif leading-relaxed text-[var(--reader-text)]">{note.body}</p>
      )}
    </div>
  );
}
