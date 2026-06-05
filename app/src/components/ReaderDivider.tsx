/**
 * ReaderDivider — S201 page-break ornaments for the reading surface.
 *
 * Two production divider assets (Grok Imagine originals, cropped + cleaned
 * at S201, committed in `app/public/dividers/`) wired into the reader:
 *
 *   - "botanical" — gold vine, white blossoms, olive, grapes, pomegranates,
 *     center menorah. Marks the chapter → apparatus seam (replaces the
 *     gold-diamond placeholder that was only ever a mock). Rendered at full
 *     column width per Yoshi's S201 sign-off ("C — full column width").
 *
 *   - "alephbet" — the 22 paleo-Hebrew letters (ʾaleph → taw) in a metallic
 *     spectrum. Marks a major section break (book-start in the reader).
 *
 * Both assets are built on a near-black field, so the `-transparent.png`
 * variants are used here and they sit cleanly on the pure-black dark reader.
 * Light-theme (parchment) variants are a later wheel; until they exist the
 * dividers are hidden in light mode via the `.reader-divider` rule in
 * index.css so the near-black artwork never lands on a parchment field.
 *
 * Purely decorative — `aria-hidden` + empty alt, with an optional visible
 * section label beneath the aleph-bet break for major divisions.
 */

interface ReaderDividerProps {
  variant: "botanical" | "alephbet";
  /** Optional section label rendered beneath the ornament (major breaks). */
  label?: string;
}

const SRC: Record<ReaderDividerProps["variant"], string> = {
  botanical: "/dividers/divider-botanical-transparent.png",
  alephbet: "/dividers/divider-alephbet-transparent.png",
};

export default function ReaderDivider({ variant, label }: ReaderDividerProps) {
  // Botanical sits at the chapter→apparatus seam; aleph-bet opens a major
  // section. Vertical rhythm tuned so each ornament gets its own breathing
  // room without doubling the surrounding block spacing.
  const wrapClass =
    variant === "botanical"
      ? "reader-divider my-8 text-center"
      : "reader-divider mt-2 mb-6 text-center";

  return (
    <div className={wrapClass} role="presentation">
      <img
        src={SRC[variant]}
        alt=""
        aria-hidden="true"
        loading="lazy"
        decoding="async"
        className="mx-auto block h-auto w-full max-w-full"
      />
      {label && (
        <p className="mt-1 font-sans text-[11px] font-medium uppercase tracking-[0.22em] text-[var(--reader-muted)]">
          {label}
        </p>
      )}
    </div>
  );
}
