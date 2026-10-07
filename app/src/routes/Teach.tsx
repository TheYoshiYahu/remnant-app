/**
 * Teach.tsx — "For Teachers" (S442, YEAR_PLAN_STUDY_SPEC.md step 5).
 * Top tier ("everything"; the 7-day trial is the top tier).
 *
 * `/teach` lists the teacher's assignments (plus a one-tap print of next
 * week's readings); `/teach/<id>` builds one:
 *   - pick any stretch: this week's / next week's plan readings, any dates,
 *     or any passage (canon or restored books)
 *   - instructions, a due date, questions with an optional answer key,
 *     memory verses, headings and writing, notes, whole My Teachings
 *   - print a student copy (blank lines, no answers, no teacher notes) or a
 *     teacher copy (answers + notes), with or without the chapter text;
 *     or download it as Markdown
 *   - copy an assignment to reuse it next time
 *
 * The server enforces the tier on every endpoint.
 */

import { useEffect, useMemo, useRef, useState } from "react";
import {
  createAssignment,
  deleteAssignment,
  getAssignment,
  listAssignments,
  listMyTeachings,
  saveAssignment,
  type AssignmentDoc,
  type AssignmentSummary,
  type StudyDocSummary,
} from "../lib/api";
import { useEntitlement } from "../lib/reading-plan/useEntitlement";
import { TEACHER_LOCK_MESSAGE, TEACHER_LOCK_TITLE } from "../lib/reading-plan/plan-lock";
import { usePlanNotes } from "../lib/reading-plan/plan-notes";
import { getYearPlanState, todayISO } from "../lib/reading-plan/plan-store";
import { pacedPlanFor } from "../lib/reading-plan/year-plan";
import { addDaysISO, weekStartFor } from "../lib/reading-plan/paced";
import {
  downloadBlocksMarkdown,
  printBlocks,
  readingBlocksFromDays,
  type PrintCopy,
  type StudyBlock,
} from "../lib/study-blocks";
import PlanLock, { CARD, GHOST_BTN, INPUT, PlanShell, SMALL_BTN } from "../components/PlanLock";
import BlockEditor, { type PlanContext } from "../components/BlockEditor";

function currentId(): string {
  const path = typeof window !== "undefined" ? window.location.pathname : "/teach";
  const m = /^\/teach\/?(.*)$/.exec(path);
  return m ? m[1].replace(/\/+$/, "") : "";
}

const dateFmt = new Intl.DateTimeFormat(undefined, { month: "short", day: "numeric", year: "numeric" });
function fmtISO(iso: string): string {
  const [y, m, d] = iso.split("-").map(Number);
  return dateFmt.format(new Date(y, m - 1, d));
}

function usePlanContext(): PlanContext | null {
  return useMemo(() => {
    const st = getYearPlanState();
    if (!st) return null;
    const today = todayISO();
    return { startISO: st.startDateISO, todayISO: today, paced: pacedPlanFor(st, today) };
  }, []);
}

export default function Teach() {
  const ent = useEntitlement();
  const id = currentId();
  return (
    <PlanShell back={id ? { href: "/teach", label: "← For Teachers" } : { href: "/plan", label: "← The whole plan" }}>
      {ent.loading && <p className="mt-6 text-sm text-[var(--reader-muted)]">Loading…</p>}
      {!ent.loading && !ent.teacher && (
        <>
          <h1 className="mt-4 font-serif text-2xl font-semibold">For Teachers</h1>
          <PlanLock title={TEACHER_LOCK_TITLE} message={TEACHER_LOCK_MESSAGE} tierName="Everything" signedIn={ent.signedIn} />
        </>
      )}
      {!ent.loading && ent.teacher && (id ? <AssignmentEditor id={id} /> : <AssignmentList />)}
    </PlanShell>
  );
}

// ───────────────────────────────────────────────────────────────────────

function AssignmentList() {
  const [items, setItems] = useState<AssignmentSummary[] | null>(null);
  const [err, setErr] = useState<string | null>(null);
  const [title, setTitle] = useState("");
  const [busy, setBusy] = useState(false);
  const plan = usePlanContext();

  useEffect(() => {
    listAssignments()
      .then((r) => setItems(r.assignments))
      .catch(() => setErr("Your assignments couldn't be loaded. Check your connection and try again."));
  }, []);

  const create = async (seed?: { title: string; blocks: StudyBlock[] }) => {
    const t = seed?.title ?? title.trim();
    if (!t) return;
    setBusy(true);
    try {
      const a = await createAssignment({
        title: t,
        instructions: "",
        due_date: null,
        include_text: false,
        blocks: seed?.blocks ?? [],
      });
      window.location.href = `/teach/${a.id}`;
    } catch {
      setErr("That assignment couldn't be created. Try again.");
      setBusy(false);
    }
  };

  const nextWeek = plan ? addDaysISO(weekStartFor(plan.startISO, plan.todayISO), 7) : null;
  const nextWeekDays = plan && nextWeek
    ? plan.paced.days.filter((d) => d.weekStartISO === nextWeek)
    : [];

  return (
    <>
      <h1 className="mt-4 font-serif text-2xl font-semibold">For Teachers</h1>
      <p className="mt-1 text-sm leading-relaxed text-[var(--reader-muted)]">
        Build assignments for a class, a congregation, or your family — any stretch of the plan or any passage,
        with questions, an answer key, and memory verses — and print student and teacher copies.
      </p>

      <div className={CARD + " mt-5"}>
        <label className="text-xs font-medium uppercase tracking-wider text-[var(--reader-muted)]" htmlFor="new-assignment">
          New assignment
        </label>
        <div className="mt-2 flex gap-2">
          <input
            id="new-assignment"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            onKeyDown={(e) => e.key === "Enter" && void create()}
            placeholder="e.g. Week 4 — Abraham's call"
            className={INPUT + " flex-1"}
          />
          <button type="button" disabled={busy || !title.trim()} onClick={() => void create()} className="chrome-metal chrome-metal-gold">
            {busy ? "Creating…" : "Create"}
          </button>
        </div>
        {nextWeek && nextWeekDays.length > 0 && (
          <div className="mt-3 flex flex-wrap gap-2">
            <button
              type="button"
              disabled={busy}
              onClick={() =>
                void create({
                  title: `Readings for the week of ${fmtISO(nextWeek)}`,
                  blocks: readingBlocksFromDays(nextWeekDays),
                })
              }
              className={GHOST_BTN}
            >
              Start one from next week&rsquo;s readings
            </button>
            <QuickPrintButton
              title={`Readings for the week of ${fmtISO(nextWeek)}`}
              blocks={readingBlocksFromDays(nextWeekDays)}
            />
          </div>
        )}
        {!plan && (
          <p className="mt-2 text-xs text-[var(--reader-muted)]">
            Start the year plan in <a href="/plan" className="text-[var(--reader-accent)] hover:underline">the whole plan</a> to pull its weekly readings in one tap. Any passage can still be added by hand.
          </p>
        )}
      </div>

      {err && <p className="mt-3 text-sm text-red-400">{err}</p>}
      <div className="mt-4 space-y-2">
        {items?.map((a) => (
          <a
            key={a.id}
            href={`/teach/${a.id}`}
            className="block rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4 transition-colors hover:border-[var(--reader-accent)]"
          >
            <div className="font-serif text-base font-semibold">{a.title}</div>
            <div className="mt-0.5 font-sans text-xs text-[var(--reader-muted)]">
              {a.due_date ? `Due ${fmtISO(a.due_date)} · ` : ""}Updated {dateFmt.format(new Date(a.updated_at))}
            </div>
          </a>
        ))}
        {items && items.length === 0 && (
          <p className="text-sm text-[var(--reader-muted)]">No assignments yet.</p>
        )}
      </div>
    </>
  );
}

function QuickPrintButton({ title, blocks }: { title: string; blocks: StudyBlock[] }) {
  const [open, setOpen] = useState(false);
  const [withText, setWithText] = useState(false);
  if (!open)
    return (
      <button type="button" onClick={() => setOpen(true)} className={GHOST_BTN}>
        Print next week&rsquo;s readings
      </button>
    );
  return (
    <span className="flex flex-wrap items-center gap-2 text-sm">
      <label className="flex items-center gap-1.5">
        <input type="checkbox" checked={withText} onChange={(e) => setWithText(e.target.checked)} />
        with the chapter text
      </label>
      <button type="button" onClick={() => void printBlocks(blocks, { title, includeText: withText })} className="chrome-metal chrome-metal-gold" style={{ padding: "0.3rem 0.8rem" }}>
        Print
      </button>
      <button type="button" onClick={() => setOpen(false)} className={SMALL_BTN}>
        Cancel
      </button>
    </span>
  );
}

// ───────────────────────────────────────────────────────────────────────

type SaveState = "saved" | "dirty" | "saving" | "error";

function AssignmentEditor({ id }: { id: string }) {
  const [doc, setDoc] = useState<AssignmentDoc | null>(null);
  const [title, setTitle] = useState("");
  const [instructions, setInstructions] = useState("");
  const [due, setDue] = useState<string>("");
  const [includeText, setIncludeText] = useState(false);
  const [blocks, setBlocks] = useState<StudyBlock[]>([]);
  const [loadErr, setLoadErr] = useState<string | null>(null);
  const [save, setSave] = useState<SaveState>("saved");
  const [copy, setCopy] = useState<PrintCopy>("student");
  const [teachings, setTeachings] = useState<StudyDocSummary[]>([]);
  const [confirmDelete, setConfirmDelete] = useState(false);
  const [dupBusy, setDupBusy] = useState(false);
  const notesApi = usePlanNotes(true);
  const plan = usePlanContext();
  const timer = useRef<ReturnType<typeof setTimeout> | null>(null);
  const latest = useRef({ title, instructions, due, includeText, blocks });
  useEffect(() => {
    latest.current = { title, instructions, due, includeText, blocks };
  }, [title, instructions, due, includeText, blocks]);

  useEffect(() => {
    getAssignment(id)
      .then((a) => {
        setDoc(a);
        setTitle(a.title);
        setInstructions(a.instructions);
        setDue(a.due_date ?? "");
        setIncludeText(a.include_text);
        setBlocks(a.blocks);
      })
      .catch(() => setLoadErr("This assignment couldn't be opened."));
    listMyTeachings()
      .then((r) => setTeachings(r.teachings))
      .catch(() => undefined);
  }, [id]);

  const payload = () => {
    const c = latest.current;
    return {
      title: c.title.trim() || "Untitled assignment",
      instructions: c.instructions,
      due_date: c.due || null,
      include_text: c.includeText,
      blocks: c.blocks,
    };
  };

  const flush = async () => {
    if (timer.current) {
      clearTimeout(timer.current);
      timer.current = null;
    }
    setSave("saving");
    try {
      await saveAssignment(id, payload());
      setSave("saved");
    } catch {
      setSave("error");
    }
  };

  const touch = () => {
    setSave("dirty");
    if (timer.current) clearTimeout(timer.current);
    timer.current = setTimeout(() => void flush(), 1500);
  };

  const duplicate = async () => {
    setDupBusy(true);
    try {
      await flush();
      const p = payload();
      const a = await createAssignment({ ...p, title: `${p.title} (copy)` });
      window.location.href = `/teach/${a.id}`;
    } catch {
      setDupBusy(false);
    }
  };

  if (loadErr) return <p className="mt-6 text-sm text-red-400">{loadErr}</p>;
  if (!doc) return <p className="mt-6 text-sm text-[var(--reader-muted)]">Loading…</p>;

  const printOpts = {
    title: title.trim() || "Assignment",
    meta: due ? `Due ${fmtISO(due)}` : undefined,
    instructions,
    copy,
    includeText,
  };

  return (
    <>
      <input
        value={title}
        onChange={(e) => {
          setTitle(e.target.value);
          touch();
        }}
        aria-label="Assignment title"
        className="mt-4 w-full border-b border-[var(--reader-rule)] bg-transparent pb-1 font-serif text-2xl font-semibold text-[var(--reader-text)] outline-none focus:border-[var(--reader-accent)]"
      />
      <div className="mt-1 flex items-center justify-between font-sans text-xs text-[var(--reader-muted)]">
        <span>For Teachers</span>
        <span>
          {save === "saved" && "Saved"}
          {save === "dirty" && "Unsaved changes…"}
          {save === "saving" && "Saving…"}
          {save === "error" && (
            <button type="button" onClick={() => void flush()} className="text-red-400 underline">
              Didn&rsquo;t save — try again
            </button>
          )}
        </span>
      </div>

      <div className={CARD + " mt-4 space-y-3"}>
        <label className="flex flex-wrap items-center gap-2 text-sm">
          <span className="text-[var(--reader-muted)]">Due</span>
          <input
            type="date"
            value={due}
            onChange={(e) => {
              setDue(e.target.value);
              touch();
            }}
            className={INPUT}
          />
          {due && (
            <button
              type="button"
              className={SMALL_BTN}
              onClick={() => {
                setDue("");
                touch();
              }}
            >
              No due date
            </button>
          )}
        </label>
        <label className="block text-sm">
          <span className="text-[var(--reader-muted)]">Instructions</span>
          <textarea
            value={instructions}
            onChange={(e) => {
              setInstructions(e.target.value);
              touch();
            }}
            rows={3}
            placeholder="e.g. Read the chapters below before Sabbath and answer the questions."
            className={INPUT + " mt-1 w-full"}
          />
        </label>
      </div>

      <div className="mt-4">
        <BlockEditor
          blocks={blocks}
          onChange={(b) => {
            setBlocks(b);
            touch();
          }}
          mode="assignment"
          notes={notesApi.notes}
          plan={plan}
          teachings={teachings}
        />
      </div>

      <div className={CARD + " mt-6"}>
        <div className="text-xs font-medium uppercase tracking-wider text-[var(--reader-muted)]">Print</div>
        <div role="group" aria-label="Which copy" className="mt-2 flex overflow-hidden rounded border border-[var(--reader-rule)] text-sm">
          {(
            [
              ["student", "Student copy"],
              ["teacher", "Teacher copy"],
              ["plain", "Plain"],
            ] as [PrintCopy, string][]
          ).map(([c, label]) => (
            <button
              key={c}
              type="button"
              aria-pressed={copy === c}
              onClick={() => setCopy(c)}
              className={
                "flex-1 px-3 py-1.5 font-medium " +
                (copy === c
                  ? "bg-[var(--reader-accent)] text-white"
                  : "bg-[var(--reader-surface)] text-[var(--reader-text)] hover:opacity-90")
              }
            >
              {label}
            </button>
          ))}
        </div>
        <p className="mt-1.5 text-xs text-[var(--reader-muted)]">
          {copy === "student"
            ? "Name line, writing lines under each question, no answers and none of your notes."
            : copy === "teacher"
              ? "Every question with its answer key, plus your notes."
              : "The assignment as written, without writing lines or answers."}
        </p>
        <label className="mt-2 flex items-center gap-2 text-sm">
          <input
            type="checkbox"
            checked={includeText}
            onChange={(e) => {
              setIncludeText(e.target.checked);
              touch();
            }}
          />
          Include the full chapter text
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button
            type="button"
            onClick={() => {
              void flush();
              void printBlocks(blocks, printOpts);
            }}
            className="chrome-metal chrome-metal-gold"
          >
            Print / save as PDF
          </button>
          <button
            type="button"
            onClick={() => {
              void flush();
              void downloadBlocksMarkdown(blocks, printOpts);
            }}
            className={GHOST_BTN}
          >
            Download (Markdown)
          </button>
        </div>
      </div>

      <div className="mt-6 flex flex-wrap items-center gap-3 font-sans text-sm">
        <button type="button" disabled={dupBusy} onClick={() => void duplicate()} className={GHOST_BTN}>
          {dupBusy ? "Copying…" : "Make a copy to reuse"}
        </button>
        {confirmDelete ? (
          <span className="flex items-center gap-2">
            Delete this assignment?
            <button
              type="button"
              onClick={async () => {
                await deleteAssignment(id).catch(() => undefined);
                window.location.href = "/teach";
              }}
              className={SMALL_BTN + " text-red-400"}
            >
              Delete it
            </button>
            <button type="button" onClick={() => setConfirmDelete(false)} className={SMALL_BTN}>
              Keep it
            </button>
          </span>
        ) : (
          <button type="button" onClick={() => setConfirmDelete(true)} className="text-xs text-[var(--reader-muted)] hover:underline">
            Delete
          </button>
        )}
      </div>
    </>
  );
}
