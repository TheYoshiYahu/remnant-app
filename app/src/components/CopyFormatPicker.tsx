import type { CopyFormat } from "../lib/copyFormat";

/**
 * S493 — the "How would you like this to be copied?" sheet (Yoshi,
 * Nov 6 2026). Opens on every Copy action before anything reaches the
 * clipboard. Three large tap targets; the question in big red letters.
 */
export default function CopyFormatPicker({
  onPick,
  onClose,
}: {
  onPick: (format: CopyFormat) => void;
  onClose: () => void;
}) {
  const options: { format: CopyFormat; title: string; example: string }[] = [
    {
      format: "english",
      title: "Without the sacred names",
      example: "In the beginning God created the heaven and the earth.",
    },
    {
      format: "both",
      title: "Sacred names with English",
      example: "In the beginning Elohim (God) created the heaven and the earth.",
    },
    {
      format: "hebrew",
      title: "Sacred names only",
      example: "In the beginning Elohim created the heaven and the earth.",
    },
  ];
  return (
    <div
      className="fixed inset-0 z-[110] flex items-end justify-center bg-black/50 p-4 sm:items-center"
      role="dialog"
      aria-modal="true"
      aria-labelledby="copy-format-title"
      onClick={onClose}
    >
      <div
        className="w-full max-w-md rounded-lg border border-[var(--reader-rule)] bg-[var(--reader-surface)] p-5 shadow-xl"
        onClick={(e) => e.stopPropagation()}
      >
        <h2
          id="copy-format-title"
          className="mb-4 text-center text-2xl font-bold uppercase tracking-wide text-red-600"
        >
          How would you like this to be copied?
        </h2>
        <div className="flex flex-col gap-3">
          {options.map((o) => (
            <button
              key={o.format}
              type="button"
              onClick={() => onPick(o.format)}
              className="w-full rounded-lg border-2 border-[var(--reader-rule)] px-4 py-4 text-left hover:border-red-600 focus:border-red-600 focus:outline-none"
            >
              <div className="text-lg font-semibold">{o.title}</div>
              <div className="mt-1 text-sm italic opacity-70">{o.example}</div>
            </button>
          ))}
        </div>
        <button
          type="button"
          onClick={onClose}
          className="mt-4 w-full py-2 text-sm opacity-60 hover:opacity-100"
        >
          Cancel
        </button>
      </div>
    </div>
  );
}
