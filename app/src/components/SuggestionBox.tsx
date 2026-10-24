/**
 * SuggestionBox — S464. Partners tell us how to make the app better or what's
 * missing. Free and signed-out readers SEE the box, locked, with a plain note
 * that partners have a say — same consumption-only posture as
 * LockedPartnerPrompt (no purchase link on the native shells).
 *
 * S465 — the sender chooses whether the suggestion shows on the public
 * Suggestion Board (changeable later from the board). After sending, the
 * moderation note explains why a post waits for approval.
 */
import { useEffect, useState } from "react";
import {
  getSuggestionEligibility,
  sendSuggestion,
  type SuggestionKind,
} from "../lib/api";
import { isNativeShell } from "../lib/native-shell";

const KINDS: { value: SuggestionKind; label: string }[] = [
  { value: "feature", label: "Missing feature" },
  { value: "improvement", label: "Make it better" },
  { value: "problem", label: "Something's not working" },
];

export default function SuggestionBox() {
  const [state, setState] = useState<"loading" | "allowed" | "locked" | "signed-out">("loading");
  const [kind, setKind] = useState<SuggestionKind>("feature");
  const [body, setBody] = useState("");
  const [showOnBoard, setShowOnBoard] = useState(true);
  const [sending, setSending] = useState(false);
  const [sent, setSent] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    let alive = true;
    getSuggestionEligibility()
      .then((e) => {
        if (!alive) return;
        setState(e.allowed ? "allowed" : e.signed_in ? "locked" : "signed-out");
      })
      .catch(() => alive && setState("signed-out"));
    return () => { alive = false; };
  }, []);

  async function submit() {
    if (body.trim().length < 3 || sending) return;
    setSending(true);
    setError(null);
    try {
      await sendSuggestion(kind, body.trim(), showOnBoard);
      setSent(true);
      setBody("");
      window.dispatchEvent(new Event("rop-board-refresh"));
    } catch {
      setError("That didn't go through. Please try again in a moment.");
    } finally {
      setSending(false);
    }
  }

  const locked = state === "locked" || state === "signed-out";

  return (
    <section className="rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-4">
      <h2 className="text-base font-semibold text-[var(--reader-text)]">
        {locked ? "🔒 " : ""}Suggest an improvement
      </h2>
      <p className="mt-1 font-sans text-sm text-[var(--reader-muted)]">
        Partners help shape this app. Tell us what would make it better, or what
        you wish it had. Every suggestion is read.
      </p>

      {state === "loading" && (
        <p className="mt-3 font-sans text-xs italic text-[var(--reader-muted)]">Loading…</p>
      )}

      {locked && (
        <div className="mt-3">
          <textarea
            disabled
            rows={3}
            placeholder="Partners can send suggestions here."
            className="w-full rounded border border-[var(--reader-rule)] bg-transparent px-3 py-2 text-sm opacity-50"
          />
          <p className="mt-2 font-sans text-sm text-[var(--reader-muted)]">
            {state === "signed-out"
              ? "Sign in as a partner to have your say. Even one month of partnership gives you a voice in what gets built next."
              : "The suggestion box is for partners. Even one month of partnership gives you a voice in what gets built next."}
            {isNativeShell()
              ? " Partnership is managed from your account on the web at remnantofpromise.org."
              : null}
          </p>
          {!isNativeShell() && (
            <a
              href={state === "signed-out" ? "/sign-in" : "/pricing"}
              className="mt-2 inline-block font-sans text-sm font-medium text-[var(--reader-text)] underline"
            >
              {state === "signed-out" ? "Sign in" : "See partnership"}
            </a>
          )}
        </div>
      )}

      {state === "allowed" && (
        <div className="mt-3 space-y-3">
          <div className="flex flex-wrap gap-2">
            {KINDS.map((k) => (
              <button
                key={k.value}
                type="button"
                onClick={() => setKind(k.value)}
                aria-pressed={kind === k.value}
                className={
                  "rounded border px-3 py-1.5 font-sans text-sm " +
                  (kind === k.value
                    ? "border-[var(--reader-accent)] bg-[var(--reader-accent)] text-[var(--reader-bg)]"
                    : "border-[var(--reader-rule)] text-[var(--reader-text)]")
                }
              >
                {k.label}
              </button>
            ))}
          </div>
          <textarea
            value={body}
            onChange={(e) => { setBody(e.target.value); setSent(false); }}
            maxLength={4000}
            rows={5}
            placeholder="What would you like to see?"
            className="w-full rounded border border-[var(--reader-rule)] bg-transparent px-3 py-2 text-sm text-[var(--reader-text)]"
          />
          <label className="flex items-start gap-2 font-sans text-sm text-[var(--reader-text)]">
            <input
              type="checkbox"
              checked={showOnBoard}
              onChange={(e) => setShowOnBoard(e.target.checked)}
              className="mt-1"
            />
            <span>
              Show it on the Suggestion Board so other readers can see it and vote.
              No name is shown, and you can change this anytime.
            </span>
          </label>
          <button
            type="button"
            onClick={submit}
            disabled={sending || body.trim().length < 3}
            className="rounded border border-[var(--reader-accent)] bg-[var(--reader-accent)] px-4 py-2 font-sans text-sm font-medium text-[var(--reader-bg)] disabled:opacity-40"
          >
            {sending ? "Sending…" : "Send suggestion"}
          </button>
          {sent && (
            <div className="font-sans text-sm text-[var(--reader-text)]">
              <p className="font-medium">Thank you for your suggestion.</p>
              <p className="mt-1 text-[var(--reader-muted)]">
                The App Store and Google Play require every public board to be
                moderated, so each post is read before it goes up. I only check
                for obscene or profane words and posts that have nothing to do
                with app suggestions. Any honest suggestion for the app will be
                approved, whether I agree with it or not, and you can show or
                hide it on the board anytime.
              </p>
            </div>
          )}
          {error && <p className="font-sans text-sm text-red-500">{error}</p>}
        </div>
      )}
    </section>
  );
}
