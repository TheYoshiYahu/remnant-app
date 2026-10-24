/**
 * NewFeatures — S465. The full list of what has come into the app, newest
 * first. Opening the page clears the red dot on the menu.
 */
import { useEffect } from "react";
import { NEW_FEATURES, markFeaturesSeen } from "../data/newFeatures";

export default function NewFeatures() {
  useEffect(() => {
    markFeaturesSeen();
    const id = window.location.hash.slice(1);
    if (id) document.getElementById(id)?.scrollIntoView({ block: "start" });
  }, []);

  return (
    <main className="mx-auto w-full max-w-2xl px-4 py-8 sm:px-6">
      <header className="mb-6 border-b border-[var(--reader-rule)] pb-4">
        <a
          href="/"
          className="font-sans text-xs font-medium uppercase tracking-wider text-[var(--reader-accent)] hover:opacity-80"
        >
          ← Back to reading
        </a>
        <h1 className="mt-3 text-2xl font-semibold text-[var(--reader-text)]">New features</h1>
        <p className="mt-1 font-sans text-sm text-[var(--reader-muted)]">
          Everything that has come into the app, newest first. Have an idea of
          your own? The Suggestion Board in{" "}
          <a href="/settings#board" className="underline">Settings</a> is where
          partners send them and vote.
        </p>
      </header>

      <ol className="space-y-4">
        {NEW_FEATURES.map((f) => (
          <li
            key={f.id}
            id={f.id}
            className="scroll-mt-6 rounded-md border border-[var(--reader-rule)] bg-[var(--reader-surface)] px-4 py-4"
          >
            <div className="flex flex-wrap items-center gap-2 font-sans text-xs text-[var(--reader-muted)]">
              <time dateTime={f.date}>
                {new Date(f.date + "T12:00:00").toLocaleDateString(undefined, {
                  year: "numeric",
                  month: "long",
                  day: "numeric",
                })}
              </time>
              {f.tier && (
                <span className="rounded border border-[var(--reader-rule)] px-2 py-0.5">
                  {f.tier === "Partners" ? "For partners" : `${f.tier} tier`}
                </span>
              )}
            </div>
            <h2 className="mt-1 text-base font-semibold text-[var(--reader-text)]">{f.title}</h2>
            <p className="mt-1 text-sm leading-relaxed text-[var(--reader-text)]">{f.body}</p>
          </li>
        ))}
      </ol>
    </main>
  );
}
