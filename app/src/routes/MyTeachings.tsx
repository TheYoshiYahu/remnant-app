/**
 * MyTeachings.tsx — "My Teachings" (S442, YEAR_PLAN_STUDY_SPEC.md step 4).
 *
 * `/my-teachings` lists the reader's own teachings; `/my-teachings/<id>` is
 * the builder: a title, then headings, writing, passages and plan notes in
 * any order (up/down). Scripture references link back into the reader.
 * Print view and Markdown download reuse study-export.ts.
 *
 * Private to the reader — clearly separate from Yoshi's published /teachings.
 * Partner feature; the server enforces it.
 */

import { useEffect, useRef, useState } from "react";
import {
  createMyTeaching,
  deleteMyTeaching,
  getMyTeaching,
  listMyTeachings,
  saveMyTeaching,
  type MyTeachingDoc,
  type StudyDocSummary,
} from "../lib/api";
import { useEntitlement } from "../lib/reading-plan/useEntitlement";
import { PLAN_LOCK_MESSAGE, PLAN_LOCK_TITLE } from "../lib/reading-plan/plan-lock";
import { usePlanNotes } from "../lib/reading-plan/plan-notes";
import { downloadBlocksMarkdown, printBlocks, type StudyBlock } from "../lib/study-blocks";
import PlanLock, { CARD, GHOST_BTN, INPUT, PlanShell, SMALL_BTN } from "../components/PlanLock";
import BlockEditor from "../components/BlockEditor";

function currentId(): string {
  const path = typeof window !== "undefined" ? window.location.pathname : "/my-teachings";
  const m = /^\/my-teachings\/?(.*)$/.exec(path);
  return m ? m[1].replace(/\/+$/, "") : "";
}

const dateFmt = new Intl.DateTimeFormat(undefined, { month: "short", day: "numeric", year: "numeric" });

export default function MyTeachings() {
  const ent = useEntitlement();
  const id = currentId();
  return (
    <PlanShell back={id ? { href: "/my-teachings", label: "← My Teachings" } : { href: "/plan", label: "← The whole plan" }}>
      {ent.loading && <p className="mt-6 text-sm text-[var(--reader-muted)]">Loading…</p>}
      {!ent.loading && !ent.partner && (
        <>
          <h1 className="mt-4 font-serif text-2xl font-semibold">My Teachings</h1>
          <PlanLock title={PLAN_LOCK_TITLE} message={PLAN_LOCK_MESSAGE} tierName="Study Notes" signedIn={ent.signedIn} />
        </>
      )}
      {!ent.loading && ent.partner && (id ? <TeachingEditor id={id} /> : <TeachingList />)}
    </PlanShell>
  );
}

function TeachingList() {
  const [items, setItems] = useState<StudyDocSummary[] | null>(null);
  const [err, setErr] = useState<string | null>(null);
  const [title, setTitle] = useState("");
  const [busy, setBusy] = useState(false);

  useEffect(() => {
    listMyTeachings()
      .then((r) => setItems(r.teachings))
      .catch(() => setErr("Your teachings couldn't be loaded. Check your connection and try again."));
  }, []);

  const create = async () => {
    if (!title.trim()) return;
    setBusy(true);
    try {
      const t = await createMyTeaching({ title: title.trim(), blocks: [] });
      window.location.href = `/my-teachings/${t.id}`;
    } catch {
      setErr("That teaching couldn't be created. Try again.");
      setBusy(false);
    }
  };

  return (
    <>
      <h1 className="mt-4 font-serif text-2xl font-semibold">My Teachings</h1>
      <p className="mt-1 text-sm leading-relaxed text-[var(--reader-muted)]">
        Your own teachings, gathered from your notes on the plan — private to you, and separate from the
        published Teachings tab. Print them or download them to share.
      </p>

      <div className={CARD + " mt-5"}>
        <label className="text-xs font-medium uppercase tracking-wider text-[var(--reader-muted)]" htmlFor="new-teaching">
          Start a new teaching
        </label>
        <div className="mt-2 flex gap-2">
          <input
            id="new-teaching"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            onKeyDown={(e) => e.key === "Enter" && void create()}
            placeholder="Title"
            className={INPUT + " flex-1"}
          />
          <button type="button" disabled={busy || !title.trim()} onClick={() => void create()} className="chrome-metal chrome-metal-gold">
            {busy ? "Creating…" : "Create"}
          </button>
        </div>
      </div>

      {err && <p className="mt-3 text-sm text-red-400">{err}</p>}
      <div className="mt-4 space-y-2">
        {items?.map((t) => (
          <a
            key={t.id}
            href={`/my-teachings/${t.id}`}
            className="block rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-4 transition-colors hover:border-[var(--reader-accent)]"
          >
            <div className="font-serif text-base font-semibold">{t.title}</div>
            <div className="mt-0.5 font-sans text-xs text-[var(--reader-muted)]">
              Updated {dateFmt.format(new Date(t.updated_at))}
            </div>
          </a>
        ))}
        {items && items.length === 0 && (
          <p className="text-sm text-[var(--reader-muted)]">No teachings yet. Give your first one a title above.</p>
        )}
      </div>
    </>
  );
}

type SaveState = "saved" | "dirty" | "saving" | "error";

function TeachingEditor({ id }: { id: string }) {
  const [doc, setDoc] = useState<MyTeachingDoc | null>(null);
  const [title, setTitle] = useState("");
  const [blocks, setBlocks] = useState<StudyBlock[]>([]);
  const [loadErr, setLoadErr] = useState<string | null>(null);
  const [save, setSave] = useState<SaveState>("saved");
  const [withText, setWithText] = useState(false);
  const [confirmDelete, setConfirmDelete] = useState(false);
  const notesApi = usePlanNotes(true);
  const timer = useRef<ReturnType<typeof setTimeout> | null>(null);
  const latest = useRef({ title, blocks });
  useEffect(() => {
    latest.current = { title, blocks };
  }, [title, blocks]);

  useEffect(() => {
    getMyTeaching(id)
      .then((t) => {
        setDoc(t);
        setTitle(t.title);
        setBlocks(t.blocks);
      })
      .catch(() => setLoadErr("This teaching couldn't be opened."));
  }, [id]);

  const flush = async () => {
    if (timer.current) {
      clearTimeout(timer.current);
      timer.current = null;
    }
    const { title: t, blocks: b } = latest.current;
    if (!t.trim()) return;
    setSave("saving");
    try {
      await saveMyTeaching(id, { title: t.trim(), blocks: b });
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

  useEffect(() => {
    const warn = (e: BeforeUnloadEvent) => {
      if (timer.current) {
        e.preventDefault();
      }
    };
    window.addEventListener("beforeunload", warn);
    return () => window.removeEventListener("beforeunload", warn);
  }, []);

  if (loadErr) return <p className="mt-6 text-sm text-red-400">{loadErr}</p>;
  if (!doc) return <p className="mt-6 text-sm text-[var(--reader-muted)]">Loading…</p>;

  const opts = { title: title.trim() || "My teaching", meta: "My Teachings", includeText: withText };

  return (
    <>
      <input
        value={title}
        onChange={(e) => {
          setTitle(e.target.value);
          touch();
        }}
        aria-label="Teaching title"
        className="mt-4 w-full border-b border-[var(--reader-rule)] bg-transparent pb-1 font-serif text-2xl font-semibold text-[var(--reader-text)] outline-none focus:border-[var(--reader-accent)]"
      />
      <div className="mt-1 flex items-center justify-between font-sans text-xs text-[var(--reader-muted)]">
        <span>My Teachings · private to you</span>
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

      <div className="mt-4">
        <BlockEditor
          blocks={blocks}
          onChange={(b) => {
            setBlocks(b);
            touch();
          }}
          mode="teaching"
          notes={notesApi.notes}
        />
      </div>

      <div className={CARD + " mt-6"}>
        <div className="text-xs font-medium uppercase tracking-wider text-[var(--reader-muted)]">Print or share</div>
        <label className="mt-2 flex items-center gap-2 text-sm">
          <input type="checkbox" checked={withText} onChange={(e) => setWithText(e.target.checked)} />
          Include the text of each passage
        </label>
        <div className="mt-3 flex flex-wrap gap-2">
          <button
            type="button"
            onClick={() => {
              void flush();
              void printBlocks(blocks, opts);
            }}
            className="chrome-metal chrome-metal-gold"
          >
            Print / save as PDF
          </button>
          <button
            type="button"
            onClick={() => {
              void flush();
              void downloadBlocksMarkdown(blocks, opts);
            }}
            className={GHOST_BTN}
          >
            Download (Markdown)
          </button>
        </div>
      </div>

      <div className="mt-6 font-sans text-sm">
        {confirmDelete ? (
          <span className="flex items-center gap-2">
            Delete this teaching?
            <button
              type="button"
              onClick={async () => {
                await deleteMyTeaching(id).catch(() => undefined);
                window.location.href = "/my-teachings";
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
            Delete this teaching
          </button>
        )}
      </div>
    </>
  );
}
