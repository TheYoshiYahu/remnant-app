/**
 * Journal — the Voice Journal surface.
 *
 * Speak (on-device dictation) or type → save → the entry is stored privately
 * and a curated Scripture + reflection is surfaced. Entries list below.
 *
 * Crisis-safety: after a save, the entry text is checked ON THE DEVICE
 * (lib/crisis-safety.ts) and, on a match, the CrisisCareScreen is offered. The
 * text is never sent anywhere for that check and no flag is stored. A standing
 * transparency line discloses this.
 *
 * Customization: background + text color, font family (incl. a cursive option),
 * and a free "section label" for the entry. Preferences persist in localStorage
 * (on-device). All of this is presentation-only.
 *
 * Auth: requires a session (entries are per-account). Anonymous users are shown
 * a sign-in nudge rather than the composer.
 */

import { useEffect, useMemo, useState } from "react";
import {
  type JournalEntry,
  type DevotionalReflection,
  listJournal,
  createJournal,
  deleteJournal,
  getDevotional,
} from "../lib/api";
import { hasJwtCookie } from "../lib/display-prefs-sync";
import { loadStoredNativeToken } from "../lib/native-auth";
import {
  createDictation,
  dictationSupported,
  type Dictation,
} from "../lib/journal-dictation";
import { entryNeedsCare } from "../lib/crisis-safety";
import CrisisCareScreen from "../components/CrisisCareScreen";

const PREFS_KEY = "rop_journal_prefs_v1";

interface JournalPrefs {
  bg: string;
  fg: string;
  font: string;
}

const FONT_OPTIONS: { label: string; value: string }[] = [
  { label: "Serif", value: "Georgia, 'Times New Roman', serif" },
  { label: "Sans", value: "system-ui, sans-serif" },
  { label: "Cursive", value: "'Snell Roundhand', 'Brush Script MT', cursive" },
  { label: "Mono", value: "ui-monospace, 'Courier New', monospace" },
];

const DEFAULT_PREFS: JournalPrefs = {
  bg: "#fbf7ee",
  fg: "#23201a",
  font: FONT_OPTIONS[0].value,
};

function loadPrefs(): JournalPrefs {
  try {
    const raw = localStorage.getItem(PREFS_KEY);
    if (raw) return { ...DEFAULT_PREFS, ...JSON.parse(raw) };
  } catch {
    /* ignore */
  }
  return DEFAULT_PREFS;
}

export default function Journal() {
  const [authChecked, setAuthChecked] = useState(false);
  const [authed, setAuthed] = useState(false);
  const [entries, setEntries] = useState<JournalEntry[]>([]);
  const [text, setText] = useState("");
  const [sectionLabel, setSectionLabel] = useState("");
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [reflection, setReflection] = useState<DevotionalReflection | null>(null);
  const [careOpen, setCareOpen] = useState(false);
  const [listening, setListening] = useState(false);
  const [prefs, setPrefs] = useState<JournalPrefs>(loadPrefs);
  const [dictation, setDictation] = useState<Dictation | null>(null);

  // Persist customization on-device.
  useEffect(() => {
    try {
      localStorage.setItem(PREFS_KEY, JSON.stringify(prefs));
    } catch {
      /* ignore */
    }
  }, [prefs]);

  // Resolve session (native token is async), then load entries.
  useEffect(() => {
    let cancelled = false;
    void loadStoredNativeToken().then(async () => {
      if (cancelled) return;
      const ok = hasJwtCookie();
      setAuthed(ok);
      setAuthChecked(true);
      if (ok) {
        try {
          const res = await listJournal();
          if (!cancelled) setEntries(res.entries);
        } catch (e) {
          if (!cancelled) setError(String(e));
        }
      }
    });
    return () => {
      cancelled = true;
    };
  }, []);

  const canDictate = useMemo(() => dictationSupported(), []);

  function toggleDictation() {
    if (listening) {
      dictation?.stop();
      setListening(false);
      return;
    }
    const base = text;
    const d = createDictation({
      onResult: (transcript) => {
        // Append the live transcript to whatever was already typed.
        setText((base ? base + " " : "") + transcript);
      },
      onError: () => setListening(false),
      onEnd: () => setListening(false),
    });
    if (!d.supported) return;
    setDictation(d);
    d.start();
    setListening(true);
  }

  async function handleSave() {
    const body = text.trim();
    if (!body || saving) return;
    setSaving(true);
    setError(null);
    if (listening) {
      dictation?.stop();
      setListening(false);
    }
    try {
      const entry = await createJournal({
        body,
        section_label: sectionLabel.trim() || null,
      });
      setEntries((prev) => [entry, ...prev]);
      setText("");
      // On-device crisis check on the just-written text — offer care if needed.
      if (entryNeedsCare(body)) {
        setCareOpen(true);
      }
      // Surface a curated reflection (best-effort; non-blocking).
      try {
        const dev = await getDevotional();
        const pool = dev.reflections;
        if (pool.length > 0) {
          setReflection(pool[Math.floor(Math.random() * pool.length)]);
        }
      } catch {
        /* reflection is a nicety — ignore failures */
      }
    } catch (e) {
      setError(String(e));
    } finally {
      setSaving(false);
    }
  }

  async function handleDelete(id: string) {
    try {
      await deleteJournal(id);
      setEntries((prev) => prev.filter((e) => e.id !== id));
    } catch (e) {
      setError(String(e));
    }
  }

  if (!authChecked) {
    return (
      <div className="mx-auto max-w-2xl px-6 py-8">
        <p className="text-sm text-[var(--reader-muted)]">Loading…</p>
      </div>
    );
  }

  if (!authed) {
    return (
      <div className="mx-auto max-w-2xl px-6 py-8">
        <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
          Journal
        </h1>
        <p className="mt-3 text-base text-[var(--reader-muted)]">
          Your journal is private to your account. Sign in to start — your
          entries save with your account and travel across your devices.
        </p>
        <a
          href="/sign-in"
          className="mt-4 inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-2 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90"
        >
          Sign in
        </a>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-2xl px-6 py-8">
      <header className="mb-4 flex items-center justify-between">
        <h1 className="text-2xl font-semibold tracking-tight text-[var(--reader-text)]">
          Journal
        </h1>
        <a href="/today" className="text-sm text-[var(--reader-muted)] hover:underline">
          ← back
        </a>
      </header>

      {/* Customization row */}
      <div className="mb-3 flex flex-wrap items-center gap-3 text-sm text-[var(--reader-muted)]">
        <label className="flex items-center gap-1">
          Page
          <input
            type="color"
            value={prefs.bg}
            onChange={(e) => setPrefs((p) => ({ ...p, bg: e.target.value }))}
            aria-label="Background color"
          />
        </label>
        <label className="flex items-center gap-1">
          Ink
          <input
            type="color"
            value={prefs.fg}
            onChange={(e) => setPrefs((p) => ({ ...p, fg: e.target.value }))}
            aria-label="Text color"
          />
        </label>
        <label className="flex items-center gap-1">
          Font
          <select
            value={prefs.font}
            onChange={(e) => setPrefs((p) => ({ ...p, font: e.target.value }))}
            className="rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-1 py-0.5"
          >
            {FONT_OPTIONS.map((f) => (
              <option key={f.label} value={f.value}>
                {f.label}
              </option>
            ))}
          </select>
        </label>
      </div>

      {/* Composer */}
      <div className="rounded-lg border border-[var(--reader-rule)] p-3">
        <input
          type="text"
          value={sectionLabel}
          onChange={(e) => setSectionLabel(e.target.value)}
          placeholder="Label this entry (optional) — e.g. Morning, Gratitude"
          className="mb-2 w-full rounded border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-2 py-1 text-sm text-[var(--reader-text)]"
        />
        <textarea
          value={text}
          onChange={(e) => setText(e.target.value)}
          placeholder="Speak or type what's on your heart…"
          rows={6}
          className="w-full rounded border border-[var(--reader-rule)] p-3 leading-relaxed focus:outline-none"
          style={{ backgroundColor: prefs.bg, color: prefs.fg, fontFamily: prefs.font }}
        />

        {/* Keyboard-dictation hint — the primary "speak" path. Works on every
            device with NO app permission and NO native plugin: the OS keyboard
            owns the microphone and types the transcription into the field. */}
        <p className="mt-2 flex items-center gap-1 text-xs text-[var(--reader-muted)]">
          <span aria-hidden="true">🎤</span>
          Want to speak it? Tap the microphone on your keyboard and talk — your
          phone types it into the journal for you. Or just type.
        </p>

        <div className="mt-2 flex items-center gap-3">
          {/* Optional progressive enhancement: in-browser dictation where the
              Web Speech API is available. NOT required — the keyboard mic above
              covers speaking everywhere. Hidden when unsupported. */}
          {canDictate && (
            <button
              type="button"
              onClick={toggleDictation}
              className={`inline-flex items-center justify-center rounded border px-3 py-1.5 text-sm font-medium ${
                listening
                  ? "border-red-400 text-red-700"
                  : "border-[var(--reader-text)] text-[var(--reader-text)]"
              }`}
            >
              {listening ? "● Listening… tap to stop" : "🎙 Dictate in-app (beta)"}
            </button>
          )}
          <button
            type="button"
            onClick={handleSave}
            disabled={saving || text.trim().length === 0}
            className="inline-flex items-center justify-center rounded border border-[var(--reader-text)] bg-[var(--reader-text)] px-4 py-1.5 text-sm font-medium text-[var(--reader-bg)] hover:opacity-90 disabled:opacity-50"
          >
            {saving ? "Saving…" : "Save entry"}
          </button>
        </div>
      </div>

      {/* Transparency disclosure (standing) */}
      <p className="mt-2 text-xs leading-relaxed text-[var(--reader-muted)]">
        Your journal is private. When you save, the app reads your words
        <em> on your device</em> to offer support if you seem to be in crisis —
        nothing about it is sent anywhere or recorded.
      </p>

      {error && <p className="mt-2 text-sm text-red-700">{error}</p>}

      {/* Curated reflection after a save */}
      {reflection && (
        <div className="mt-4 rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-3">
          <p className="font-sans text-xs font-semibold uppercase tracking-wide text-[var(--reader-muted)]">
            A word for you
          </p>
          <p className="mt-1 text-base font-semibold text-[var(--reader-text)]">
            {reflection.title}
          </p>
          {reflection.passage_text && (
            <blockquote className="mt-1 border-l-2 border-[var(--reader-accent)] pl-3 italic text-[var(--reader-text)]">
              {reflection.passage_text}
              {reflection.passage_ref ? ` (${reflection.passage_ref})` : ""}
            </blockquote>
          )}
          <p className="mt-2 text-sm text-[var(--reader-muted)]">
            {reflection.reflection}
          </p>
        </div>
      )}

      {/* Entries */}
      <div className="mt-6 space-y-3">
        {entries.map((e) => (
          <div
            key={e.id}
            className="rounded-lg border border-[var(--reader-rule)] px-4 py-3"
          >
            <div className="flex items-center justify-between">
              <span className="font-sans text-xs text-[var(--reader-muted)]">
                {e.section_label ? `${e.section_label} · ` : ""}
                {new Date(e.created_at).toLocaleString()}
              </span>
              <button
                type="button"
                onClick={() => handleDelete(e.id)}
                className="text-xs text-[var(--reader-muted)] hover:underline"
              >
                Delete
              </button>
            </div>
            <p
              className="mt-1 whitespace-pre-wrap leading-relaxed"
              style={{ fontFamily: prefs.font }}
            >
              {e.body}
            </p>
          </div>
        ))}
        {entries.length === 0 && (
          <p className="text-sm text-[var(--reader-muted)]">
            No entries yet. Your first one starts above.
          </p>
        )}
      </div>

      {careOpen && <CrisisCareScreen onClose={() => setCareOpen(false)} />}
    </div>
  );
}
