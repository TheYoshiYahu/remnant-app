/**
 * Suggestions — S465. The Suggestion Board's own page (Menu entry + Today
 * door). The suggestion box sits on top; the board below it.
 */
import SuggestionBox from "../components/SuggestionBox";
import SuggestionBoard from "../components/SuggestionBoard";

export default function Suggestions() {
  return (
    <main className="mx-auto w-full max-w-2xl px-4 py-8 sm:px-6">
      <header className="mb-6 border-b border-[var(--reader-rule)] pb-4">
        <a
          href="/"
          className="font-sans text-xs font-medium uppercase tracking-wider text-[var(--reader-accent)] hover:opacity-80"
        >
          ← Back to reading
        </a>
        <h1 className="mt-3 text-2xl font-semibold text-[var(--reader-text)]">Suggestion Board</h1>
        <p className="mt-1 font-sans text-sm text-[var(--reader-muted)]">
          Help shape this app. Send your idea, vote on others, and see what's
          planned and what's been built.
        </p>
      </header>
      <div className="space-y-5">
        <SuggestionBox />
        <SuggestionBoard />
      </div>
    </main>
  );
}
